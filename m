Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VaFU-0004vn-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2003 16:37:12 +0000
From: "" <simon@baydel.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Date: Mon, 6 Jan 2003 17:04:15 -0000
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: JFFS2 and bad blocks
CC: tglx@linutronix.de
Message-ID: <3E19B70F.1851.32F407@localhost>
References: <3DEC8633.25166.12C6FD@localhost>
In-reply-to: <200212031403.42061.tglx@linutronix.de>
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

I download the CVS stuff mid December and again today. The 
hardware ran ok before and could use jffs2 without errors but as I 
added files it was slow and I could not make file systems on 
partitions which contained bad blocks.

The new CVS code seems to be much quicker and I can erase, 
mount and copy files to my new filesystem without error. I have set 
up the specific driver to do soft ecc. I noticed that when I reboot the 
system and the filesystem gets mounted I get errors. The more 
writes that occur the more errors I seem to get. I ran a test for a 
week or so over the break which generated log files. A reboot after 
this produced thousands of errors but the filesystem seemed ok. 

The errors are something like

Empty flash at 0x00469ffcb ends at 0x0046a000

or

jffs2_scan_dirent_node(): Node CRC failed on node at 0x0046a7f0 
read 0xffffffff calculated 0xdec8161b

I was wondering if any of you could shed any light on this.


On 3 Dec 2002, at 14:03, Thomas Gleixner wrote:

> On Tuesday 03 December 2002 11:23, simon@baydel.com wrote:
> > I am using an SMC via the MTD layer. On one of the partitions I
> > would like to put a JFFS2 filesystem. Normally I erase the partition
> > and then mount it JFFS2. The problem is that if the partition has a
> > bad block I cannot erase or mount it. Does the bad block handling
> > have to be in the vendor specific nand driver ?
> 
> Please use latest MTD-CVS code.
> Read http://www.linux-mtd.infradead.org/tech/nand.html
> 
> -- 
> Thomas
> ____________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de


__________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
