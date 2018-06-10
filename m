Received: from botnar.kaiser.cx ([176.28.20.183])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fS0DT-0005ot-VI
 for linux-mtd@lists.infradead.org; Sun, 10 Jun 2018 13:17:10 +0000
Date: Sun, 10 Jun 2018 15:14:40 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: mxc: set spare area size register explicitly
Message-ID: <20180610131440.GA10544@botnar.kaiser.cx>
References: <1528025495-14443-1-git-send-email-martin@kaiser.cx>
 <20180607171911.7a7ee649@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180607171911.7a7ee649@xps13>
Sender: Martin Kaiser <martin@botnar.kaiser.cx>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

Thus wrote Miquel Raynal (miquel.raynal@bootlin.com):

> > Usually, this register is updated from settings in the IIM fuses when
> > the system is booting from nand flash. For other boot media, however,

> s/nand/NAND

ok

> > +	/* spare area size in 16bit words */

> I thought I understood the problem with your commit message but
> then I don't get this comment. What's the link between 16-bit buses? Is
> this preset valid for both 8 and 16-bit bus width?

The register value is unrelated to the bus width.

> > +	writew(mtd->oobsize >> 1, NFC_V21_RSLTSPARE_AREA);
> > +

> If this is for dividing per two oobsize value,

That's exactly what I wanted to do: mtd->oobsize is in bytes, the
register value must be in 16bit words (the specification uses the term
half-words, I'll update the comment while at it).

> I would really prefer a '/ 2' and let the compiler optimize things.
> Unless the spec is explicit about some shifting of course.

Ok, I'll  use / 2 and resend the patch shortly.

Best regards,
Martin
