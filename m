Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Vc0Q-00058G-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2003 18:29:46 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8B009KR3G6KY@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 06 Jan 2003 20:00:06 +0100 (MET)
Date: Mon, 06 Jan 2003 19:59:08 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: JFFS2 and bad blocks
In-reply-to: <3E19B70F.1851.32F407@localhost>
To: simon@baydel.com, MTD mailing list <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200301061959.09010.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <3DEC8633.25166.12C6FD@localhost> <3E19B70F.1851.32F407@localhost>
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

On Monday 06 January 2003 18:04, simon@baydel.com wrote:
> I download the CVS stuff mid December and again today. The
> hardware ran ok before and could use jffs2 without errors but as I
> added files it was slow and I could not make file systems on
> partitions which contained bad blocks.
>
> The new CVS code seems to be much quicker and I can erase,
> mount and copy files to my new filesystem without error. I have set
> up the specific driver to do soft ecc. I noticed that when I reboot the
> system and the filesystem gets mounted I get errors. The more
> writes that occur the more errors I seem to get. I ran a test for a
> week or so over the break which generated log files. A reboot after
> this produced thousands of errors but the filesystem seemed ok.
>
> The errors are something like
>
> Empty flash at 0x00469ffcb ends at 0x0046a000
This happens due to NAND specific timed buffer flushing. JFFS2 fills up the 
write buffer to a full page boundary with 0xff and writes out the buffer to 
the chip, if you have no consecutive write within 2 seconds. This is done to 
ensure, that data is written to FLASH. This fill looks like empty FLASH on 
mount. So JFFS2 is wondering why there is data after the "empty" FLASH.
No reason to worry.

> or
>
> jffs2_scan_dirent_node(): Node CRC failed on node at 0x0046a7f0
> read 0xffffffff calculated 0xdec8161b
This happens, if the write buffer is not written to FLASH before you power 
down your system without umount. Then the write buffer is lost and you get 
this error on mount. This indicates, that you may have lost data.

> I was wondering if any of you could shed any light on this.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
