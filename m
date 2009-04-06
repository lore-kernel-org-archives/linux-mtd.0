Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LqxnP-0008Sl-C1
	for linux-mtd@lists.infradead.org; Mon, 06 Apr 2009 23:00:13 +0000
Date: Tue, 7 Apr 2009 00:59:52 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] MTD-NAND: Changes to read_page APIs to support
	NAND_ECC_HW_SYNDROME mode on TI DaVinci DM355
In-Reply-To: <200904051556.05368.david-b@pacbell.net>
Message-ID: <alpine.LFD.2.00.0904070042300.21577@localhost.localdomain>
References: <1238601784-9563-1-git-send-email-nsnehaprabha@ti.com>
	<200904051556.05368.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com,
	nsnehaprabha@ti.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David, Sneha,

I'm answering both mails in one go.

On Sun, 5 Apr 2009, David Brownell wrote:

> On Wednesday 01 April 2009, nsnehaprabha@ti.com wrote:
> > From: Sneha Narnakaje <nsnehaprabha@ti.com>
> > 
> > The NAND controller on TI DaVinci DM355 supports NAND devices
> > with large page size (2K and 4K), but the HW ECC is handled
> > for every 512byte read/write chunks. The current HW_SYNDROME
> > read_page/write_page APIs in the NAND core (nand_base) use the
> > "infix OOB" scheme.

For a damned good reason. If you want to use HW_SYNDROME mode then you
better have the syndrome right after the data.

data - ecc - data - ecc ...

That's how HW_SYNDROME generators work. It's not about the write side,
It's about the read side. You read n bytes of data and m btes of ecc
in _ONE_ go and the hardware will tell you whether there is a bit flip
or not. You can even do full hardware error correction this way. And
it has been done.
 
See also: http://linux-mtd.infradead.org/tech/mtdnand/x111.html#AEN140

> Makes me wonder if there should be a new NAND_ECC_HW_* mode,
> which doesn't use "infix OOB" ... since that's the problem.
> 
> Given bugs recently uncovered in that area, it seems that
> these DaVinci chips may be the first to use ECC_HW_SYNDROME
> in multi-chunk mode (and thus "infix OOB" in its full glory,
> rather than single-chunk subset which matches traditional
> layout with OOB at the end).

Sorry, HW_SYNDROME was used in multi chunk mode from the very
beginning. See above.
 
If your device does not do that or you do not want to utilize it for
whatever reasons then just use the NAND_ECC_HW mode which lets you
place your ECC data where ever you want.

> > The core APIs overwrite NAND manufacturer's bad block meta
> > data, thus complicating the jobs of non-Linux NAND programmers
> > (end equipment manufacturering). These APIs also imply ECC
> > protection for the prepad bytes, causing nand raw_write
> > operations to fail.
> 
> All of those seem like reasons to avoid NAND_ECC_HW_SYNDROME
> unless the ECC chunksize matches the page size ... that is,
> to only use it when "infix OOB" won't apply.

Wrong, see above
 
> I particularly dislike clobbering the bad block data, since
> once that's done it can't easily be recovered.  Preferable
> to leave those markers in place, so that the chip can still
> be re-initialized cleanly.

And how do you utilize the "data-ecc-data-ecc..." scheme _WITHOUT_
clobbering the bad block marker bytes ??? That's why we have the bad
block table mechanism. And this is not a Linux kernel hackers oddity,
just have a look at DiskOnChip devices which do exactly the same. It's
dictated by the hardware and there is nothing you can do about it -
aside of falling back to software ECC and giving up the HW
acceleration.

This patch is utter nonsense. The whole functionality is already
there. Just use the correct mode: NAND_ECC_HW. Place your ECC data
where you want or where your commercial counterparts want them to show
up. Using NAND_ECC_HW_SYNDROME for your case is just plain wrong.

Thanks,

	tglx
