Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CANs4-00082H-MB
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 03:18:29 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Wookey <wookey@aleph1.co.uk>
In-Reply-To: <20040923004331.GA24050@xios>
References: <20040923004331.GA24050@xios>
Content-Type: text/plain
Message-Id: <1095923456.2925.55.camel@thomas>
Mime-Version: 1.0
Date: Thu, 23 Sep 2004 09:10:56 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Finding which block 'contains' a missing inode
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-09-23 at 02:43, Wookey wrote:
> Hello people, I have a JFFS2 NAND rootfs which is giving a single 
> 'Eep. Child "gpe-filemanager.desktop" (ino #3324) of dir ino #3035 doesn't
> exist!' error.
> 
> I'd like to know if there is a way of finding out either form the live fs or
> from the jffs2 image file which block the offending inode/file should have
> been on?

Get a binary image from the chip and process it with 
jffs2dump -vc binimg >img.dmp

The dump should tell you where which node/fragment resides

> Background: The kernel indicated one 'bad erase block' that is under this
> fs, but flasheraseall found no problem, and nandwrite did not skip that
> block. I worry that the block in question doesn't actually have the right
> data in it - if it corresponded to the above inode then I'd be sure I had
> located the problem.

What do you mean ? "kernel indicated one 'bad erase block'". 
How is it indicated ?

> There is also a 'normal' bad block (which gives an IO error when
> flasheraseall tries to erase it) - this _is_ skipped by nandwrite as expected.

Are you using current MTD code ?

The code checks the device for bad blocks when nand_scan is called. It
usually prints the bad block information. Is this your 'normal' bad
block ?

tglx
