OPENRESTY_PREFIX=/usr/local/Cellar/openresty-debug/1.15.8.2

PREFIX ?=          /usr/local/Cellar/openresty-debug/1.15.8.2/lualib
LUA_INCLUDE_DIR ?= $(PREFIX)/include
LUA_LIB_DIR ?=     $(PREFIX)
INSTALL ?= install

.PHONY: all test install

all: ;

install: all
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/resty/nsq
	$(INSTALL) lib/resty/nsq/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/nsq/

test: all
	PATH=$(OPENRESTY_PREFIX)/nginx/sbin:$$PATH prove -I../test-nginx/lib -r t

