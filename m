Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18UkQq-00064P-00
	for <linux-mtd@lists.infradead.org>; Sat, 04 Jan 2003 09:17:28 +0000
Date: Sat, 4 Jan 2003 09:48:12 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Taeil Um <tium@mail.palmpalm.com>
cc: linux-mtd@lists.infradead.org
In-Reply-To: <BDEDIOGGNJEEPBHLJLFGCEANCFAA.tium@palmpalm.com>
Message-ID: <Pine.LNX.4.44.0301040946350.16481-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Subject: Re: JFFS2-MTD-NAND
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sat, 4 Jan 2003, Taeil Um wrote:

> Hi all ! Happy New Year!
> 
> I used jffs2 for My Board which has 16M SAMSUNG nand flash chip.
> I succeeded to port JFFS2-MTD-NAND layer in order to use NAND flash.
> 
> But sometimes (not always) if i mount NAND chip, the kernel die with following "KERNEL OOPS!"
> 
> --------------------------------------------------------------------------------------------------
> Checked all inodes but still 0x1dc bytes of unchecked space?

Please compile with CONFIG_JFFS2_FS_DEBUG=2 and log all the messages 
during the mount. There'll be lots -- use a serial console and log them 
directly to a file. They'll be at KERN_DEBUG loglevel too, so if it's your 
root file system then edit kernel/printk.c to make sure they actually get 
printed (change DEFAULT_CONSOLE_LOGLEVEL to 9).

Then compress them and send them to me directly.

-- 
dwmw2
