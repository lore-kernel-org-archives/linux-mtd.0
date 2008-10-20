Received: from smtp125.sbc.mail.sp1.yahoo.com ([69.147.65.184])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Krq48-0003M2-AZ
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 08:24:40 +0000
From: David Brownell <david-b@pacbell.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: goofy mtd m25p80 patches in GIT ...
Date: Mon, 20 Oct 2008 01:24:38 -0700
References: <200810191535.05617.david-b@pacbell.net>
	<C3C4D3116BA1F84989E53FCF1F505187166DCB@zch01exm21.fsl.freescale.net>
	<1224489768.6770.1527.camel@macbook.infradead.org>
In-Reply-To: <1224489768.6770.1527.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200810200124.38256.david-b@pacbell.net>
Cc: Chen Gong-B11801 <G.Chen@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 20 October 2008, David Woodhouse wrote:
> I think the interface is fine -- if you ask it to erase the whole chip
> (start == 0, len == size), then it'll use a chip erase command if it has
> one, or fall back to erasing individual blocks.
> 
> I think David just wanted a cleanup to the nomenclature -- renaming
> 'erase_block' to 'erase_chip', perhaps, and changing the #define for the
> command?

Exactly.  Since the existing erase block calls are not
doing whole-chip erasure ... and since chip-erase is
a *VERY* different operation.

The MTD interface just says "erase this stuff", and
that patch just added a special case "if <stuff> is
the whole chip, use this operation instead of the
existing iterate-over-blocks logic".

- Dave
