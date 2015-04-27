Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1Ymcyq-0000sF-Fd
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2015 06:57:25 +0000
Date: Mon, 27 Apr 2015 08:56:57 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 3/4] mtd: mxc_nand: fix truncate of unaligned oob copying
Message-ID: <20150427065657.GD19431@pengutronix.de>
References: <cover.1430034929.git.baruch@tkos.co.il>
 <1f8e85fd8e75170e1005473c075942cb3d4479fe.1430034929.git.baruch@tkos.co.il>
 <20150426195211.GB19431@pengutronix.de>
 <20150427044618.GS2258@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150427044618.GS2258@tarshish>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <sha@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Baruch,

On Mon, Apr 27, 2015 at 07:46:18AM +0300, Baruch Siach wrote:
> On Sun, Apr 26, 2015 at 09:52:11PM +0200, Uwe Kleine-König wrote:
> > On Sun, Apr 26, 2015 at 11:16:50AM +0300, Baruch Siach wrote:
> > > diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> > > index c650f0950b20..c05f5e8fef17 100644
> > > --- a/drivers/mtd/nand/mxc_nand.c
> > > +++ b/drivers/mtd/nand/mxc_nand.c
> > > @@ -840,22 +840,22 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
> > >  		for (i = 0; i < num_chunks - 1; i++)
> > >  			memcpy32_fromio(d + i * oob_chunk_size,
> > >  					s + i * sparebuf_size,
> > > -					oob_chunk_size);
> > > +					ALIGN(oob_chunk_size, 4));
> > If oob_chunk_size isn't 32-bit-aligned, d + i * oob_chunk_size isn't
> > either for uneven i. That's not nice. I suggest to use memcpy16_fromio.
> 
> memcpy32_fromio() was introduced by Sascha in 096bcc231fd2 (mtd: mxc_nand: use 
> 32bit copy functions, 2012-05-29), replacing memcpy_fromio() to force 32bit io 
> access. Are you sure the hypothetical memcpy16_fromio() would work?
according to the reference manual you can use 16-bit or 32-bit accesses.
And giving that in some cases the amount of valid data (in bytes) is ≡ 2
(mod 4) 16-bit access seem to be the obvious thing. Also Sascha only
wrote about byte accesses being problematic in 096bcc231fd2. So I'm
expecting that 16-bit operators should be fine.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
