Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Kl2N-00026w-00
	for mtd-list@infradead.org; Fri, 04 Aug 2000 18:13:35 +0100
Received: from web5302.mail.yahoo.com ([216.115.106.111])
	by infradead.org with smtp (Exim 3.03 #1)
	id 13Kl2M-00026q-00
	for mtd@infradead.org; Fri, 04 Aug 2000 18:13:34 +0100
Message-ID: <20000804171302.3195.qmail@web5302.mail.yahoo.com>
Date: Fri, 4 Aug 2000 13:13:02 -0400 (EDT)
From: Juan Gonzo <kayemmess@yahoo.ca>
Subject: compile errors - missing .h?
To: MTD Mailing List <mtd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I updated via CVS my linux source tree today.  When I compile
I get the following errors:

================
intrep.o intrep.c
intrep.c: In function `jffs_create_control':
intrep.c:443: structure has no member named `delete_list'
intrep.c: In function `jffs_cleanup_control':
intrep.c:470: structure has no member named `delete_list'
intrep.c:472: structure has no member named `delete_list'
intrep.c:473: structure has no member named `delete_list'
intrep.c:473: structure has no member named `delete_list'
intrep.c: In function `jffs_build_fs':
intrep.c:556: structure has no member named `delete_list'
intrep.c:560: structure has no member named `delete_list'
intrep.c:563: structure has no member named `delete_list'
intrep.c:564: structure has no member named `delete_list'
intrep.c:564: structure has no member named `delete_list'
intrep.c: In function `jffs_scan_flash':
intrep.c:891: sizeof applied to an incomplete type
intrep.c:900: dereferencing pointer to incomplete type
intrep.c:901: dereferencing pointer to incomplete type
intrep.c:901: structure has no member named `delete_list'
intrep.c:902: structure has no member named `delete_list'
intrep.c: In function `thread_should_wake':
intrep.c:2769: `MIN_FREE_BYTES' undeclared (first use in this function)
intrep.c:2769: (Each undeclared identifier is reported only once
intrep.c:2769: for each function it appears in.)
intrep.c:2770: `MAX_DIRTY_BYTES' undeclared (first use in this
function)
intrep.c:2771: warning: control reaches end of non-void function
make[3]: *** [intrep.o] Error 1
make[3]: Leaving directory `/home/kelly/armbuild/jinux/fs/jffs'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/home/kelly/armbuild/jinux/fs/jffs'
make[1]: *** [_subdir_jffs] Error 2
make[1]: Leaving directory `/home/kelly/armbuild/jinux/fs'
make: *** [_dir_fs] Error 2
=================

I remember a while back David saying that a person might
miss updates to include/linux/jffs.h using CVS cause he 
uses a symlink farm for this file.  I suspect this is why my
compile is failing.

If this is the case, how can someone get 'jffs.h'?

Thanks,
   -- kelly


_______________________________________________________
Do You Yahoo!?
Get your free @yahoo.ca address at http://mail.yahoo.ca


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
