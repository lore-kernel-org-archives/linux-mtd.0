Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14RViz-0007FY-00
	for mtd-list@infradead.org; Sat, 10 Feb 2001 08:49:45 +0000
Received: from n731p014.adsl.highway.telekom.at ([62.47.35.78] helo=kanga.hofr.at)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14RViw-0007FS-00
	for mtd@infradead.org; Sat, 10 Feb 2001 08:49:43 +0000
Received: (from hofrat@localhost)
	by kanga.hofr.at (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) id f1A8okh25390
	for mtd@infradead.org; Sat, 10 Feb 2001 09:50:46 +0100
From: Der Herr Hofrat <der.herr@hofr.at>
Message-Id: <200102100850.f1A8okh25390@kanga.hofr.at>
Subject: error with 2.2.18 ?
To: mtd@infradead.org
Date: Sat, 10 Feb 2001 09:50:46 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hi !

 pulled the latest version off cvs and got the folowing error with compiling
 against 2.2.18 , did I screw it up or are otheres seeing the same problem ?

make[2]: Leaving directory `/usr/src/linux/drivers/video'
make -C mtd modules
make[2]: Entering directory `/usr/src/linux/drivers/mtd'
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__ -pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2 -malign-functions=2 -DCPU=686 -DMODULE   -DEXPORT_SYMTAB -c mtdcore.c
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__ -pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2 -malign-functions=2 -DCPU=686 -DMODULE   -c -o doc1000.o doc1000.c
doc1000.c:87: warning: #warning This is definitely not SMP safe. Lock the paging mechanism.
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__ -pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2 -malign-functions=2 -DCPU=686 -DMODULE   -c -o doc2000.o doc2000.c
doc2000.c:1090: parse error before `cleanup_doc2000'
doc2000.c:1091: warning: return-type defaults to `int'
doc2000.c: In function `cleanup_doc2000':
doc2000.c:1106: warning: control reaches end of non-void function
doc2000.c: In function `__cleanup_module_inline':
doc2000.c:1108: warning: return from incompatible pointer type
doc2000.c: At top level:
doc2000.c:1110: warning: type defaults to `int' in declaration of `cleanup_module'
doc2000.c:1110: warning: parameter names (without types) in function declaration
doc2000.c:1110: conflicting types for `cleanup_module'
doc2000.c:1108: previous declaration of `cleanup_module'
doc2000.c:1110: warning: data definition has no type or storage class
doc2000.c:1111: warning: type defaults to `int' in declaration of `init_module'
doc2000.c:1111: warning: parameter names (without types) in function declaration
doc2000.c:1111: warning: data definition has no type or storage class
make[2]: *** [doc2000.o] Error 1
make[2]: Leaving directory `/usr/src/linux/drivers/mtd'
make[1]: *** [_modsubdir_mtd] Error 2
make[1]: Leaving directory `/usr/src/linux/drivers'
make: *** [_mod_drivers] Error 2



thx !
hofrat


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
