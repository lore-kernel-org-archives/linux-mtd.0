Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R4RfP-0008Ax-VM
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2011 06:12:53 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: How to distinguish MLC and SLC NANDs?
Date: Fri, 16 Sep 2011 08:12:58 +0200
References: <201109151333.48684.jbe@pengutronix.de>
	<CAN8TOE9YctZ8hO7UTM9k7f8SBaWPzyBHyEgtK96Su5MRCrMjPA@mail.gmail.com>
In-Reply-To: <CAN8TOE9YctZ8hO7UTM9k7f8SBaWPzyBHyEgtK96Su5MRCrMjPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201109160812.58260.jbe@pengutronix.de>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Brian Norris wrote:
> On Thu, Sep 15, 2011 at 7:33 AM, Juergen Beisert <jbe@pengutronix.de> wrote:
> > Is there a unique pattern for MLC
> > or SLC in the mtd structure available after calling nand_scan_ident() to
> > select what correction sum type should be used for the attached NAND?
>
> Actually, there isn't anything available in struct mtd_info. This
> belongs in struct nand_chip, actually, since it's a NAND-specific
> feature. In fact, there is some data available there. As you can see
> in nand_get_flash_type() in nand_base.c, we fill in the
> `chip->cellinfo' field, then later use a mask on it like this:
>
> chip->cellinfo & NAND_CI_CELLTYPE_MSK
>
> According to the data sheets for *most* NAND parts, this is a safe way
> of determining SLC vs. MLC (non-zero => MLC; zero => SLC), and we use
> it for certain detection code paths.

Hmm, *most* means this information is not reliable? Would it be better to give 
the driver a hint what kind of NAND it should expect via the platform_data?

> Note that if the chip uses ONFI, you supply your own ID table, or the chip
> uses some of the older ID codes, nand_base.c won't set chip->cellinfo for
> you; but it will default to SLC I think, which is the correct option for old
> parts. 

BTW: Is there a known disadvantage or incompatibility if I protect the data of 
an SLC with the more stronger ECC sums intended for MLCs (beside the effect 
the OOB area is more filled than required)?

> But it's up to you to determine your own reliance on this method. I
> don't know of any users who rely on `chip->cellinfo &
> NAND_CI_CELLTYPE_MSK' for this type of information.

I was in the hope of a perfect world and the MTD framework detects the NAND 
type reliable ;-). Now I tend more to use user's info from the platform_data.

Thanks for your answer.

Juergen

-- 
Pengutronix e.K.                              | Juergen Beisert             |
Linux Solutions for Science and Industry      | http://www.pengutronix.de/  |
