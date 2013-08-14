haddock-aas
===========

Simple password-generating service using haddock gem.

Examples
--------

**Generate password with default length (12)**

```
$ curl http://generate-password.herokuapp.com/password
Nan's5>skims
```

**Generate password with custom length (23)**

```
$ curl http://generate-password.herokuapp.com/password/23
mastodons8;percolator's
```

Length must be in 8..31 range, otherwise you get a 400 Bad Request.

