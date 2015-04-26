Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YmSbW-0008Cy-FT
 for linux-mtd@lists.infradead.org; Sun, 26 Apr 2015 19:52:39 +0000
Date: Sun, 26 Apr 2015 21:52:11 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 3/4] mtd: mxc_nand: fix truncate of unaligned oob copying
Message-ID: <20150426195211.GB19431@pengutronix.de>
References: <cover.1430034929.git.baruch@tkos.co.il>
 <1f8e85fd8e75170e1005473c075942cb3d4479fe.1430034929.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f8e85fd8e75170e1005473c075942cb3d4479fe.1430034929.git.baruch@tkos.co.il>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Baruch,

On Sun, Apr 26, 2015 at 11:16:50AM +0300, Baruch Siach wrote:
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index c650f0950b20..c05f5e8fef17 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -840,22 +840,22 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
>  		for (i = 0; i < num_chunks - 1; i++)
>  			memcpy32_fromio(d + i * oob_chunk_size,
>  					s + i * sparebuf_size,
> -					oob_chunk_size);
> +					ALIGN(oob_chunk_size, 4));
If oob_chunk_size isn't 32-bit-aligned, d + i * oob_chunk_size isn't
either for uneven i. That's not nice. I suggest to use memcpy16_fromio.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
