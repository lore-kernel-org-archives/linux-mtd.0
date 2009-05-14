Received: from smtp128.sbc.mail.sp1.yahoo.com ([69.147.65.187])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4fLm-0000JK-Vy
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 18:08:23 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCH 1/5] mtd: nand: move layout structure into nand_ecc_ctrl
Date: Thu, 14 May 2009 11:08:07 -0700
References: <> <200905132142.29697.david-b@pacbell.net>
	<4A0C5A8F.10908@boundarydevices.com>
In-Reply-To: <4A0C5A8F.10908@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905141108.08113.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 14 May 2009, Troy Kisky wrote:
> David Brownell wrote:
> > On Wednesday 13 May 2009, Troy Kisky wrote:
> >> +static const struct nand_ecclayout atmel_oobinfo_large __initdata = {
> > 
> > Doesn't this give you section warnings?  __initconst is what
> > I usually end up needing in such cases...
> 
> Only if the same file has a non const __initdata variable.
> Is __initconst the preferred method ?

Yes; it will always work, but __initdata won't always work.


> > Also, for the davinci_nand driver this is going to need to
> > switch away from the ecclayout struct in the driver-private
> > area ... that's in a patch that (still) hasn't merged into
> > the MTD tree, but was stored there for the same reason that
> > you're submitting this patch:  the original code, using the
> > annoying ECC_HW_SYNDROME support, computed the layout.
> > 
> > - Dave
> 
> Is ECC_HW_SYNDROME only needed because the eccpos array is too small??

No; it uses different algorithms to read/write, which
completely ignore ecclayout.  AFAICT ECC_HW_SYNDROME is
largely unused/untested except for single-chunk mode.

The size issue is that a 4-bit ECC code producing 10 bytes
of ECC per 512 bytes of data needs 80 bytes with 4K pages,
which obviously can't fit into the 64 bytes in ecclayout.

- Dave


> I'll have to review that prepad  and ECC_HW_SYNDROME
> Thanks
> 
> Troy
> 
> 
