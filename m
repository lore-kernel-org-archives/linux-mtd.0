Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13582c-0004yk-00
	for mtd-list@infradead.org; Thu, 22 Jun 2000 15:33:14 +0100
Received: from maverick.techno.spb.ru ([195.5.142.101])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13582a-0004ye-00
	for mtd@infradead.org; Thu, 22 Jun 2000 15:33:12 +0100
Received: from techno.spb.ru (localhost [127.0.0.1])
	by maverick.techno.spb.ru (8.9.3/8.9.3) with ESMTP id SAA01515
	for <mtd@infradead.org>; Thu, 22 Jun 2000 18:39:14 +0400
Message-ID: <39522510.394D649C@techno.spb.ru>
Date: Thu, 22 Jun 2000 18:39:12 +0400
From: Nick Maximov <maxs@techno.spb.ru>
Reply-To: maxs@techno.spb.ru
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Compilation errors on 2.2.14 kernel
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

What version of kernel should I use to get success?

Now I have 2.2.14 and got compilation errors.
What wrong I do? How to prepare my system to compilation
(what symlinks needed?)

In file included from mtdcore.c:24:
/usr/src/linux-2.2.14/include/linux/mtd/compatmac.h:20:
linux/compatmac.h: No such fil
e or directory
mtdcore.c:77: warning: type defaults to `int' in declaration of
`DECLARE_MUTEX'
mtdcore.c:77: warning: parameter names (without types) in function
declaration
mtdcore.c: In function `add_mtd_device_Rfbb9999f':
mtdcore.c:88: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c:88: (Each undeclared identifier is reported only once
mtdcore.c:88: for each function it appears in.)
mtdcore.c: In function `del_mtd_device_Re489bb75':
mtdcore.c:116: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c: In function `register_mtd_user_R5077437e':
mtdcore.c:143: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c: In function `unregister_mtd_user_R014d06d1':
mtdcore.c:163: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c: In function `__get_mtd_device_R53d645b3':
mtdcore.c:197: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c: In function `mtd_read_proc':
mtdcore.c:250: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c: At top level:
mtdcore.c:77: warning: `DECLARE_MUTEX' declared `static' but never
defined
make[2]: *** [mtdcore.o] Error 1
make[2]: Leaving directory `/root/mtd/kernel'
make[1]: *** [_mod_/root/mtd/kernel] Error 2
make[1]: Leaving directory `/usr/src/linux-2.2.14'
make: *** [all] Error 2


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
