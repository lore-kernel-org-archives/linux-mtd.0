Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YsQSX-00017Y-SJ
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 06:48:02 +0000
Date: Wed, 13 May 2015 08:47:34 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v2 3/4] mtd: mxc_nand: fix truncate of unaligned oob
 copying
Message-ID: <20150513064734.GF28888@pengutronix.de>
References: <cover.1430636819.git.baruch@tkos.co.il>
 <ff526c6b889682e36e7d086dd5e6dec8936f86d9.1430636819.git.baruch@tkos.co.il>
 <20150508072432.GJ12671@pengutronix.de>
 <20150513051202.GI2558@tarshish>
 <20150513063903.GC28888@pengutronix.de>
 <20150513064404.GM2558@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150513064404.GM2558@tarshish>
Cc: Fabio Estevam <Fabio.Estevam@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>,
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

On Wed, May 13, 2015 at 09:44:04AM +0300, Baruch Siach wrote:
> > I thought we could get rid of the memcpy32 variants. Where do we need
> > memcpy32_* where memcpy16 wouldn't work?
> 
> memcpy16 should work, but would take twice as much IO/memory accesses. That 
> would definitely affect performance, as this is the flash data read/write hot 
> path. I didn't test, though.
> 
> Are you sure we want to do that?
no, I'm not sure. But I think it's worth to test how much performance
degrades.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
