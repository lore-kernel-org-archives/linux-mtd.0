Received: from [207.152.29.75] (helo=server3.toshibatv.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160sca-0006sL-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2001 22:53:36 +0000
Message-ID: <7DF7BFDC95ECD411B4010090278A44CA1B73DC@ATVX>
From: "Siders, Keith" <keith_siders@toshibatv.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: MTD files MIA, and strange permission failure
Date: Mon, 5 Nov 2001 17:01:34 -0600 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

-> > make[4]: Entering directory `/usr/src/linux/drivers/mtd/chips'
-> > touch: /usr/src/include/linux/mtd/compatmac.h: Operation 
-> not permitted
-> > make[4]: *** [/usr/src/linux/include/linux/mtd/compatmac.h] Error 1
-> 
Found that even though a root owned file and path are set for full access by
anyone, touch still won't work. Did chgrp and chown, and that part now
compiles. But now that I'm in fs/jffs I'm getting the following:
----------------------------------------------------------------------------
-------------
In file included from jffs_fm.c:22:
/home/sidersk/Boreal/Work/Software/Code/kernel/linux_2.4.6/include/linux/jff
s.h:24: linux/comp
letion.h: No such file or directory
In file included from jffs_fm.c:22:
/home/sidersk/Boreal/Work/Software/Code/kernel/linux_2.4.6/include/linux/jff
s.h:191: field `gc
_thread_comp' has incomplete type
make[3]: *** [jffs_fm.o] Error 1
make[2]: *** [first_rule] Error 2
make[1]: *** [_subdir_jffs] Error 2
make: *** [_dir_fs] Error 2
----------------------------------------------------------------------------
-------------

Files that were previously reported as missing ( cfi_jedec.c and mapped.h )
didn't seem to effect the mtd compilation. But now that we're in the fs we
get the above. Can't find a linux/completion.h anywhere. Is this particular
to a distribution? We appear to be using a MIPS port of RedHat 7.0. Console
comes up showing:

Red Hat Linux release 7.0 (MIPS)
Kernel 2.4.6 on a mips

Any pointers appreciated...

Keith Siders
Software Engineer
 Toshiba America Consumer Products, Inc.
Advanced Television Technology Center
801 Royal Parkway, Suite 100
Nashville, Tennessee 37214
Phone: (615) 257-4050
Fax:   (615) 453-7880
