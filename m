Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHKvJ-0001TO-OG
	for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2003 10:30:01 +0000
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AHKu5-0002xT-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2003 11:28:45 +0100
To: linux-mtd@lists.infradead.org
From: Miernik <miernik@ctnet.pl>
Date: Wed, 5 Nov 2003 11:28:46 +0100
Message-ID: <slrnbqhk6u.2rl.miernik@tarnica.ctnet.pl>
References: <slrnbqgacq.1t2.miernik@tarnica.ctnet.pl>
Sender: news <news@sea.gmane.org>
Subject: Re: in CVS: drivers/mtd/mtdchar.c:65: called object is not a
	function
Reply-To: Miernik <miernik@ctnet.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2003-11-04, Miernik <miernik@ctnet.pl> wrote:
> I tried patching 2.6.0-test9 kernel with CVS code fetched today at ~ 
> 22:30 CET, and I ended with this:

After I took the original mtdchar.c from kernel-source, it compiled 
OK, but I got another problem:

  CC [M]  drivers/mtd/mtdchar.o
  CC [M]  drivers/mtd/mtdblock.o
  CC [M]  drivers/mtd/mtd_blkdevs.o
In file included from drivers/mtd/mtd_blkdevs.c:18:
include/linux/blk.h:1: warning: #warning this file is obsolete, please use <linux/blkdev.h> instead
drivers/mtd/mtd_blkdevs.c: In function `register_mtd_blktrans':
drivers/mtd/mtd_blkdevs.c:396: warning: passing arg 1 of `blk_init_queue' from incompatible pointer type
drivers/mtd/mtd_blkdevs.c:396: warning: passing arg 2 of `blk_init_queue' from incompatible pointer type
drivers/mtd/mtd_blkdevs.c:396: too many arguments to function `blk_init_queue'
make[3]: *** [drivers/mtd/mtd_blkdevs.o] Error 1
make[2]: *** [drivers/mtd] Error 2
make[1]: *** [drivers] Error 2
make[1]: Leaving directory `/usr/src/kernel-source-2.6.0-test9'
make: *** [stamp-build] Error 2
miernik@debina:/usr/src/kernel-source-2.6.0-test9$

-- 
    Miernik         ________________________ jabber:miernik@amessage.info
___________________/__ tel: +48608233394 __/      mailto:miernik@ctnet.pl
Learn about crime done by George W. Bush in Iraq, and related to 9/11
http://www.whatreallyhappened.com/
