Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14NOGa-0003em-00
	for mtd-list@infradead.org; Tue, 30 Jan 2001 00:03:24 +0000
Received: from brand.scrye.com
	([207.174.18.194] helo=scrye.com ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14NOGT-0003e1-00
	for mtd@infradead.org; Tue, 30 Jan 2001 00:03:19 +0000
Message-ID: <20010130000249.18053.qmail@scrye.com>
Date: Mon, 29 Jan 2001 17:02:49 -0700 (MST)
From: Kevin Fenzi <kevin@scrye.com>
To: mtd@infradead.org
Subject: compile problem with mtd-patch-2.2.18-20001218-2230GMT
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hi there. 

Trying to get a DOC2000 working with the 2.2.18 kernel here. 
When I patch the sources and compile, I get:

cc -D__KERNEL__ -I/usr/src/redhat/BUILD/linux/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m486 -DCPU=486   -c -o doc2000.o doc2000.c
doc2000.c: In function `init_doc2000':
doc2000.c:1090: warning: implicit declaration of function `inter_module_register'
doc2000.c: At top level:
doc2000.c:1094: parse error before `cleanup_doc2000'
doc2000.c:1095: warning: return-type defaults to `int'
doc2000.c: In function `cleanup_doc2000':
doc2000.c:1109: warning: implicit declaration of function `inter_module_unregister'
doc2000.c:1110: warning: control reaches end of non-void function
doc2000.c: At top level:
doc2000.c:1112: warning: initialization from incompatible pointer type
make[3]: *** [doc2000.o] Error 1
make[3]: Leaving directory `/usr/src/redhat/BUILD/linux/drivers/mtd'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/redhat/BUILD/linux/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/usr/src/redhat/BUILD/linux/drivers'
make: *** [_dir_drivers] Error 2

the code snip looks like: 

static void __exit cleanup_doc2000(void)
{
       struct mtd_info *mtd;
       struct DiskOnChip *this;

any ideas? This is on a redhat 6.2 box, with egcs-1.1.2-30 compiler. 
is this a compiler issue? I am going to try and compile on a rh7 box
in a few, but I thought I would check with the list to see if this is
a known problem? 

thanks, 

kevin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
