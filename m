Received: from 216.184.14.34.unused.swcp.com ([216.184.14.34]
	helo=scone.biscuit.swcp.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AopGW-0004BP-3F
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2004 19:34:20 +0000
Received: from scone.biscuit.swcp.com (localhost [127.0.0.1])
	id i15Jap36012837
	for <linux-mtd@lists.infradead.org>; Thu, 5 Feb 2004 12:36:51 -0700
Received: from localhost (bill@localhost)i15JapWH012834
	for <linux-mtd@lists.infradead.org>; Thu, 5 Feb 2004 12:36:51 -0700
Date: Thu, 5 Feb 2004 12:36:51 -0700 (MST)
From: Bill Mann <bill@biscuit.swcp.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.58.0402041528310.2191@scone.biscuit.swcp.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: kernel 2.6.x support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm using kernel 2.6.0 with a dropin tree from SourceForge supporting the
SuperH processor series and I'd like to apply the latest mtd suport
provided by the cvs.infradead.org CVS tree.  I've read the instructions 
regarding the use of patchin.sh which states "The script works for kernels 
>= 2.4"

Does this work for kernel 2.6.0?

I'm getting errors after doing the following:
- untaring kernel 2.6.0
- applying SourceForge's linuxsh dropin tree
- configuring, building & booting kernel
- applying linux-mtd from cvs.infradead.org via patchin.sh

Errors:

  CC      drivers/mtd/mtdchar.o
drivers/mtd/mtdchar.c:28: syntax error before "devfs_dir_handle"
drivers/mtd/mtdchar.c:28: warning: type defaults to `int' in declaration 
of `devfs_dir_handle'
drivers/mtd/mtdchar.c:28: warning: data definition has no type or storage 
class
drivers/mtd/mtdchar.c:29: syntax error before "devfs_rw_handle"
drivers/mtd/mtdchar.c:29: warning: type defaults to `int' in declaration 
of `devfs_rw_handle'
drivers/mtd/mtdchar.c:29: warning: data definition has no type or storage 
class
drivers/mtd/mtdchar.c:30: syntax error before "devfs_ro_handle"
drivers/mtd/mtdchar.c:30: warning: type defaults to `int' in declaration 
of `devfs_ro_handle'
drivers/mtd/mtdchar.c:30: warning: data definition has no type or storage 
class
drivers/mtd/mtdchar.c: In function `mtd_notify_add':
drivers/mtd/mtdchar.c:486: warning: implicit declaration of function 
`devfs_register'
drivers/mtd/mtdchar.c:487: `DEVFS_FL_DEFAULT' undeclared (first use in 
this function)
drivers/mtd/mtdchar.c:487: (Each undeclared identifier is reported only 
once
drivers/mtd/mtdchar.c:487: for each function it appears in.)
drivers/mtd/mtdchar.c: In function `mtd_notify_remove':
drivers/mtd/mtdchar.c:503: warning: implicit declaration of function 
`devfs_unregister'
drivers/mtd/mtdchar.c: In function `init_mtdchar':
drivers/mtd/mtdchar.c:518: warning: null format string
drivers/mtd/mtdchar.c:518: warning: too many arguments for format
make[2]: *** [drivers/mtd/mtdchar.o] Error 1


- Bill
