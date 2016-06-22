Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFbjk-0007nf-G3
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 06:34:09 +0000
Date: Wed, 22 Jun 2016 08:33:41 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Han Xu <xhnjupt@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Han Xu <han.xu@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: gpmi: Fix ecc strength calculation
Message-ID: <20160622063341.GA4750@pengutronix.de>
References: <1466519749-7729-1-git-send-email-s.hauer@pengutronix.de>
 <20160621164639.23fde5d6@bbrezillon>
 <CA+EcR21O9NZLKWiJXjXA4H9Lbo-gyKR3yiCNFBKUJwrYR1gSHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EcR21O9NZLKWiJXjXA4H9Lbo-gyKR3yiCNFBKUJwrYR1gSHg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 21, 2016 at 10:52:09AM -0500, Han Xu wrote:
> On Tue, Jun 21, 2016 at 9:46 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Tue, 21 Jun 2016 16:35:49 +0200
> > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >
> >> BCH ECC correction works in chunks of 512 bytes, so a 2k page size nand
> >> is divided into 4 chunks. Hardware requires that each chunk has a full
> >> number of bytes, so when we need 9 bits per chunk we must round up to
> >> two bytes. The current code misses that and calculates a ECC strength
> >> of 18 for a 2048+128 byte page size NAND. ECC strength of 18 requires
> >> 30 bytes per chunk, so a total of 4 * (512 + 30) + 10 = 2178 bytes when
> >> the device only has a page size of 2176 bytes.
> >
> > AFAIR, the GPMI/ECC engine operates at the bit level (which is a pain
> > to deal with BTW), and is only requiring a byte alignment on the total
> > number of ECC bits. So here, DIV_ROUND_UP(18 * 13 * 4, 8) = 117, which
> > fits in the 118 bytes (128 bytes - 10 bytes of 'metadata').
> >
> > Han, can you confirm that?
> 
> Correct, BCH module works at bit level, 18bit ECC won't exceed the oob size.

I see, only subpage reads fail here in my case. The driver does only subpage
reads when the ECC size is byte aligned. This completely disables the subpage
read feature on certain Nand types. Is that really what we want?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
