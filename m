Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136wFx-0002fd-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 15:22:29 +0100
Received: from ncc1.infomail.es ([194.224.53.134] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 136wFv-0002er-00
	for mtd@infradead.org; Tue, 27 Jun 2000 15:22:28 +0100
Date: Tue, 27 Jun 2000 16:23:18 CEST
From: Rodrigo Moya <rmoya@tsai.es>
To: mtd@infradead.org
Subject: problems compiling
Reply-To: rmoya@tsai.es
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <E136wFv-0002er-00@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



Hi all!

I just updated my local copy of mtd from CVS (after a long time without
doing so), and now, I get the following errors when compiling:

make[5]: Circular /usr/src/linux-2.2.12/include/linux/compatmac.h <-
/usr/src/linux-2.2.12/include/linux/compatmac.h dependency dropped.
gcc -D__KERNEL__ -I/usr/src/linux-2.2.12/include -Wall -Wstrict-prototypes
-O2 -fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
-m386 -DCPU=386   -DEXPORT_SYMTAB -c mtdcore.c
mtdcore.c:77: warning: type defaults to `int' in declaration of
`DECLARE_MUTEX'
mtdcore.c:77: warning: parameter names (without types) in function
declaration
mtdcore.c: In function `add_mtd_device':
mtdcore.c:88: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c:88: (Each undeclared identifier is reported only once
mtdcore.c:88: for each function it appears in.)
mtdcore.c: In function `del_mtd_device':
mtdcore.c:117: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c: In function `register_mtd_user':
mtdcore.c:145: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c: In function `unregister_mtd_user':
mtdcore.c:167: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c: In function `__get_mtd_device':
mtdcore.c:203: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c: In function `mtd_read_proc':
mtdcore.c:256: `mtd_table_mutex' undeclared (first use in this function)
mtdcore.c: At top level:
mtdcore.c:77: warning: `DECLARE_MUTEX' declared `static' but never defined
make[5]: *** [mtdcore.o] Error 1
make[5]: Leaving directory `/usr/src/linux-2.2.12/drivers/block/mtd'
make[4]: *** [first_rule] Error 2
make[4]: Leaving directory `/usr/src/linux-2.2.12/drivers/block/mtd'
make[3]: *** [_subdir_mtd] Error 2
make[3]: Leaving directory `/usr/src/linux-2.2.12/drivers/block'
make[2]: *** [_subdir_block] Error 2
make[2]: Leaving directory `/usr/src/linux-2.2.12/drivers'
make[1]: *** [_dir_drivers] Error 2
make[1]: Leaving directory `/usr/src/linux-2.2.12'

Looking at the sources, I've seen that the DECLARE_MUTEX is declared in the
sysdep-2.2.h file, but into a:

#if LINUX_VERSION_CODE < KERNEL_VERSION(2,2,0)
...
#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,0)
...
#endif
#endif

I've been looking at the kernel sources to see which LINUX_VERSION_CODE was
defined, but haven't found nothing I could understand, so please help me.
It seems to me that an incorrect LINUX_VERSION_CODE is being defined, so
the compilation never reaches the line where the DECLARE_MUTEX is defined.

I'm using kernel 2.2.12 (the one shipped with RH 6.1)

Thanks


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
