-- blacklist.lua
return {
    blacklistedUsers = {
        { userId = 12345678, expiration = os.time() + 3600 },  -- Expira em 1 hora
        { userId = 87654321, expiration = os.time() + 7200 }   -- Expira em 2 horas
    }
}
