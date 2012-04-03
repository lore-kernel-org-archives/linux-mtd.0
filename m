Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SEyij-0005iS-0J
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2012 08:04:05 +0000
Date: Tue, 3 Apr 2012 10:03:54 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 2/4] MTD: flash drivers set ecc strength
Message-ID: <20120403080354.GA6767@parrot.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-3-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_BxgTMJb0beyDC17jcmavmuz0WGvLw3NbJRCiuvB4VnA@mail.gmail.com>
 <4F79E314.609@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4F79E314.609@newsguy.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 02, 2012 at 06:34:12PM +0100, Mike Dunn wrote:
> On 03/29/2012 10:24 AM, Brian Norris wrote:
> >>
> >>        case NAND_ECC_SOFT_BCH:
> >> @@ -3384,6 +3385,8 @@ int nand_scan_tail(struct mtd_info *mtd)
> >>                        pr_warn("BCH ECC initialization failed!\n");
> >>                        BUG();
> >>                }
> >> +               chip->ecc.strength =
> >> +                       chip->ecc.bytes*8 / fls(8*chip->ecc.size);
> > 
> > Isn't this spacing against coding style? I'd suggest spaces around the
> > '*'. Also, after a few minutes, I have no idea where this calculation
> > comes from. But I'm not familiar with SOFT_BCH. Maybe a comment is in
> > order?
> 
> 
> I'm no bch expert myself (ping, Ivan), but I believe this is correct, and it is
> consistant with the equations used to determine the 't' parameter (i.e.,
> ecc_strength) from nand_bch_init() in drivers/mtd/nand/nand_bch.c.

Yes you are correct. Quoting nand_bch.c:

	m = fls(1+8*eccsize);
	t = (eccbytes*8)/m;

The first line computes the smallest 'm' such that
    2^m-1 > number_of_bits_in_ecc_block
hence
    m = fls(1+8*eccsize)

In practice, adding 1 to 8*eccsize has no effect on the fls() result (unless
eccsize is 0 :-), but I left it for consistency with nand_bch_init() doc.

Arguably it would have been less confusing to pass 'm' and 't' directly to nand_bch_init(),
but the present solution had the advantage of providing enough information, without
requiring any additional redundant field in mtd structures.

BR,
--
Ivan
