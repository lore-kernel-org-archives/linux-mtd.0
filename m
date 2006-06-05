Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FnADc-00061Z-24
	for linux-mtd@lists.infradead.org; Mon, 05 Jun 2006 09:13:49 +0100
Subject: Re: NAND OOB Questions...
From: Thomas Gleixner <tglx@linutronix.de>
To: Steve Finney <saf76@earthlink.net>
In-Reply-To: <32905508.1149179928067.JavaMail.root@elwamui-karabash.atl.sa.earthlink.net>
References: <32905508.1149179928067.JavaMail.root@elwamui-karabash.atl.sa.earthlink.net>
Content-Type: text/plain
Date: Mon, 05 Jun 2006 10:14:24 +0200
Message-Id: <1149495264.11983.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-06-01 at 09:38 -0700, Steve Finney wrote:
> 1) The Samsung K9F56* NAND chip allows doing more than one write
> to the OOB area of a page without an erase; the second write
> may zero bits that were set to 1 by the first write. Is the Samsung

Bits can not be set to 1 by the first write. FLASH cells are set to 1 by
erasing and programming can set bits to 0.

> chip unusual in this, or is this normal NAND behavior? (I believe
> this would be normal for NOR flash).

On NOR you can do this almost unlimited. NAND is much more restricted
vs. write ordering.

> 2) In nand_base.c:nand_write_page(), OOB data is written even when
> NAND_ECC_NONE is set. Under what circumstances is this useful?
> (The issue with this is that, in conjunction with (1), this may
> overwrite OOB in a circumstance where you're trying to write it
> yourself from user space; pernaps this is something that's only relevant
> for diagnostics/debugging).

The buffer is usually 0xff except when a caller provides content.

> 3) nand_prepare_oobbuf() makes a point of setting the internal oobbuf
> to 0xFF if it's had ECC bytes written to it (based on the this->oobdirty
> flag). However, the default case (which includes hardware ECC) in
> nand_write_page() can write the internal oobbuf without setting
> this->oobdirty, and thus not triggering the later reset to 0xFF. Is
> there a rationale for this? (The OOB issue induced by 1 & 2 would be
> benign if oobbuf was cleared to 0xFF).

Well, if you use ECC then ECC is always at the same offset in the buffer
so there is no point in setting it back to 0xff all them time.

Please be aware that the NAND driver has been refactored and some of the
algorithms have been changed. 
See: http://git.infradead.org/?p=mtd-2.6.git;a=summary
These changes will hit mainline in the 2.6.18 merge window.

	tglx
