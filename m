Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0dOS-0007kh-D2
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 05:23:53 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: kyungmin.park@samsung.com
In-Reply-To: <0IBW007DGC0POU@mmp1.samsung.com>
References: <0IBW007DGC0POU@mmp1.samsung.com>
Content-Type: text/plain
Date: Mon, 14 Feb 2005 11:23:50 +0100
Message-Id: <1108376630.16612.294.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: RE: [RFC] adding support for OneNAND flash memory
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

can you please fix your mail client to prepend the original text with ">
" ? It's hard to distiguish the original text and your answers.

On Mon, 2005-02-14 at 19:05 +0900, kyungmin park wrote:
> I wonder is the bad block handling the same in case of OneNAND?
> 
> => Yes, It's the same as NAND. With regard to bad block handling, IMHO, I
> think it would be better to use Bad Block Management (replace based scheme)
> instead of Bad Block Table (skip based scheme). However, it's another issue
> (from this OneNAND thread).

We use skip based scheme to allow filesystems to use the lowest level
and do their own management. It's no problem to add a replace based
scheme on top as the FLASH translation layers already do.

> May be it makes sense to put it to drivers/mtd/nand/onenand if some
> parts of the existing code (like BBT, etc) may be reused? Possibly,
> you'll need to split the existing code on what is NAND-specific and what
> is OK for both OneNAND and NAND.
> 
> => As I said before, it's difficult to modify/extend current nand directory
> to support OneNAND. That's why I suggested to add onenand directory.

It's not hard to extend. Just add onenand.c to it, if thats all what is
needed. The question is whether the bad block table code can be shared
or not. I agree that nand_base.c can not be tweaked for OneNAND.

> And one more offer: the AG-AND support has been added directly to the
> nand, but seems it would be nice to separate it and put to
> drivers/mtd/nand/ag-and/ stuff - because ASFAICS, some of AG-AND code
> doesn't fit nicely to NAND stuff.
> 
> => I agree, but it's another issue.

I don't see a point to touch AG-AND support. AG-AND is NAND with some
extra features. As I said already it shares >90% of the NAND code.

It is more interesting whether OneNAND and superAND could share a fair
amount of code.

tglx
