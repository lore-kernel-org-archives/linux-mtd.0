Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13McjY-0001Q7-00
	for mtd-list@infradead.org; Wed, 09 Aug 2000 21:45:52 +0100
Received: from web5304.mail.yahoo.com ([216.115.106.113])
	by infradead.org with smtp (Exim 3.03 #1)
	id 13McjW-0001Q1-00
	for mtd@infradead.org; Wed, 09 Aug 2000 21:45:50 +0100
Message-ID: <20000809204516.24763.qmail@web5304.mail.yahoo.com>
Date: Wed, 9 Aug 2000 16:45:16 -0400 (EDT)
From: Juan Gonzo <kayemmess@yahoo.ca>
Subject: Re: compile errors - missing .h?
To: MTD Mailing List <mtd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David,

I am not sure if I followed you instructions correctly,
but I can't get the latest CVS code for JFFS to compile.

I did a complete CVS checkout of the MTD tree, and used
the 'make' command you suggested.  I still get the same
errors.  Isn't this something to do with jffs.h?  It
seems to be missing some struct elements, specifically
"delete_list" from "struct jffs_control".

Here's the results of my make:
==============
[1081 ~/armbuild/mtd/mtd/fs/jffs]$ !1058
make -C ~/armbuild/linux SUBDIRS=`pwd` modules
make: Entering directory `/home/kelly/armbuild/linux'
make -C  /home/kelly/armbuild/mtd/mtd/fs/jffs CFLAGS="-Wall
-Wstrict-prototypes -O2  -fno-strict-aliasing -pipe -g
-mshort-load-bytes -msoft-float -march=armv4 -mtune=strongarm110
-DMODULE" MAKING_MODULES=1 modules
make[1]: Entering directory `/home/kelly/armbuild/mtd/mtd/fs/jffs'
arm-linux-gcc -D__KERNEL__ -I/home/kelly/armbuild/linux/include -Wall
-Wstrict-prototypes -O2  -fno-strict-aliasing -pipe -g
-mshort-load-bytes -msoft-float -march=armv4 -mtune=strongarm110
-DMODULE   -c -o jffs_fm.o jffs_fm.c
arm-linux-gcc -D__KERNEL__ -I/home/kelly/armbuild/linux/include -Wall
-Wstrict-prototypes -O2  -fno-strict-aliasing -pipe -g
-mshort-load-bytes -msoft-float -march=armv4 -mtune=strongarm110
-DMODULE   -c -o intrep.o intrep.c
intrep.c: In function `jffs_create_control':
intrep.c:436: structure has no member named `delete_list'
intrep.c: In function `jffs_cleanup_control':
intrep.c:463: structure has no member named `delete_list'
intrep.c:465: structure has no member named `delete_list'
intrep.c:466: structure has no member named `delete_list'
intrep.c:466: structure has no member named `delete_list'
intrep.c: In function `jffs_build_fs':
intrep.c:547: structure has no member named `delete_list'
intrep.c:551: structure has no member named `delete_list'
intrep.c:554: structure has no member named `delete_list'
intrep.c:555: structure has no member named `delete_list'
intrep.c:555: structure has no member named `delete_list'
intrep.c: In function `jffs_scan_flash':
intrep.c:848: sizeof applied to an incomplete type
intrep.c:857: dereferencing pointer to incomplete type
intrep.c:858: dereferencing pointer to incomplete type
intrep.c:858: structure has no member named `delete_list'
intrep.c:859: structure has no member named `delete_list'
intrep.c: In function `thread_should_wake':
intrep.c:2779: structure has no member named `gc_minfree_threshold'
intrep.c:2783: structure has no member named `gc_maxdirty_threshold'
intrep.c: In function `jffs_garbage_collect_trigger':
intrep.c:2798: structure has no member named `gc_task'
intrep.c:2799: structure has no member named `gc_task'
intrep.c: In function `jffs_garbage_collect_thread':
intrep.c:2815: structure has no member named `gc_task'
intrep.c:2818: structure has no member named `gc_task'
intrep.c:2822: warning: implicit declaration of function
`init_MUTEX_LOCKED'
intrep.c:2822: structure has no member named `gc_thread_sem'
intrep.c:2866: structure has no member named `gc_task'
intrep.c:2867: structure has no member named `gc_thread_sem'
make[1]: *** [intrep.o] Error 1
make[1]: Leaving directory `/home/kelly/armbuild/mtd/mtd/fs/jffs'
make: *** [_mod_/home/kelly/armbuild/mtd/mtd/fs/jffs] Error 2
make: Leaving directory `/home/kelly/armbuild/linux'
[1082 ~/armbuild/mtd/mtd/fs/jffs]$ 
==============

Thanks for any help,
   -- kelly



--- David Woodhouse <dwmw2@infradead.org> wrote:
> On Fri, 4 Aug 2000, Juan Gonzo wrote:
> 
> > I updated via CVS my linux source tree today.  When I compile
> > I get the following errors:
> > 
> > I remember a while back David saying that a person might
> > miss updates to include/linux/jffs.h using CVS cause he 
> > uses a symlink farm for this file.  I suspect this is why my
> > compile is failing.
> > 
> > If this is the case, how can someone get 'jffs.h'?
> 
> The most reliable way to build JFFS is outside the kernel tree. Make
> sure
> you don't have a 'jffs.h' in /usr/src/linux/include/linux.
> 
> Then go into the MTD CVS tree, in the 'fs/jffs/' directory, and type:
>  make -C /usr/src/linux SUBDIRS=`pwd` modules
> 
> You may need to swap the comments on the following two lines in the
> Makefile, depending on which kernel you're building against:
> 
> 	#INODE_O := inode-v22.o
> 	INODE_O := inode-v23.o
> 
> 
> -- 
> dwmw2
> 
> 
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


_______________________________________________________
Do You Yahoo!?
Get your free @yahoo.ca address at http://mail.yahoo.ca


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
