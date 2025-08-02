package com.example.BookManagement.dto;

import lombok.Data;

@Data
public class FavoriteRequestDTO {
    private Integer userId;
    private Integer bookId;
}
