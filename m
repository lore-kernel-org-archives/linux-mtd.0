Received: from web20721.mail.yahoo.com ([216.136.226.73])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AtxaV-0004xf-7H
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2004 23:28:11 +0000
Message-ID: <20040219232807.54442.qmail@web20721.mail.yahoo.com>
Date: Thu, 19 Feb 2004 15:28:07 -0800 (PST)
From: Shawn Jin <shawnxtech@yahoo.com>
To: David Vrabel <dvrabel@arcom.com>
In-Reply-To: <40348A59.1000401@arcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
cc: linuxmtd <linux-mtd@lists.infradead.org>
Subject: Re: Help: Error on mounting JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > The version of cfi_cmdset_0002.c is 1.94, which is almost up-to-date
> > without David Vrabel's patches. I have some questions on the debugging
> > messages shown below.
> > [...]
> > MTD do_write_oneword(): WRITE 0x00780000(0xc03bdd84)
> > MTD do_write_oneword(): Check 0xffffffff 0xffffffff
> > MTD do_write_oneword(): Check 0xffffffff 0xffffffff
> 
> This looks like you're not write-enabling the flash device or the 
> sectors are write protected so nothing ever gets written.  I'm a bit 
> surprised the write didn't fail with an error though.  The datasheet I 
> have here for the AM29LV128M doesn't say what the chip is supposed to do 
> when you try to erase/program protected sectors.

Thank you very much for your hints.

Before I forgot to disable write protection (WP#) and the mtd driver even
couldn't probe the chip. After WP# is disabled, which is controled by a bit
of an internal register of the board, the flash Am29PL320D
(http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/24075.pdf)
is found, which, I think, verifies that the flash device is write enabled.
Right?

The device is shipped with all sectors unprotected and I'v verified this by
manually issuing the Sector-Protect-Verify command sequence through a BDI.

This device is obviously not writable on linux. But why? Each factor I've
found with the help from this mailing list indicates contrarily that the
device be writable. What else will cause a device unwritable?
 
> The reason the latest CVS appears to work better is because it no longer 
> checks the flash to see if the data actually got written -- it assumes 
> the status reported by the chip is correct.

This explains why the files are gone after the system reboot. Thanks.

-Shawn.

__________________________________
Do you Yahoo!?
Yahoo! Mail SpamGuard - Read only the mail you want.
http://antispam.yahoo.com/tools
