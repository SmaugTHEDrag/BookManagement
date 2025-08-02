package com.example.BookManagement.controller;

import com.example.BookManagement.dto.BookDTO;
import com.example.BookManagement.dto.BookRequestDTO;
import com.example.BookManagement.entity.Book;
import com.example.BookManagement.service.IBookService;
import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/books")
public class BookController {
    @Autowired
    private IBookService bookService;

    @Autowired
    private ModelMapper modelMapper;

    @GetMapping
    public ResponseEntity<List<BookDTO>> getAllBooks(){
        List<Book> books = bookService.getAllBooks();
        return ResponseEntity.ok(modelMapper.map(books, new TypeToken<List<BookDTO>>(){}.getType()));
    }

    @GetMapping("{id}")
    public ResponseEntity<BookDTO> getBookById(@PathVariable int id){
        Book book = bookService.getBookById(id);
        BookDTO bookDTO=modelMapper.map(book,BookDTO.class);
        return ResponseEntity.ok(bookDTO);
    }

    @PostMapping
    public ResponseEntity<BookDTO> createBook(@RequestBody @Valid BookRequestDTO bookRequestDTO){
        BookDTO bookDTO = bookService.createBook(bookRequestDTO);
        return new ResponseEntity<>(bookDTO,HttpStatus.CREATED);
    }
}
