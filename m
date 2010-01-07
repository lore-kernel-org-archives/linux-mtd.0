Received: from [2001:6f8:1178:4:290:27ff:fe1d:cc33]
	(helo=metis.ext.pengutronix.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSnsn-0007Ue-IA
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 08:38:18 +0000
Date: Thu, 7 Jan 2010 09:37:29 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: Re: [PATCH] mtd/nand: Fix build failure caused by typo
Message-ID: <20100107083729.GB7413@pengutronix.de>
References: <201001070301.58260.PeterHuewe@gmx.de>
	<BD79186B4FD85F4B8E60E381CAEE1909020894AF@mi8nycmail19.Mi8.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909020894AF@mi8nycmail19.Mi8.com>
Cc: Nicolas Pitre <nico@marvell.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Peter =?iso-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

> > This patch fixes a build failure[1] introduced by the patch
> >     mtd: orion_nand.c: add error handling and use resource_size()
> >     by H Hartley Sweeten [2]
> > The patch assigns something to a undeclared variable 'err', whereas the
> > rest of the code uses 'ret' for this task.
> > 
> > This patch fixes this typo and thus removes the build failure.
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

-- 
Pengutronix e.K.                              | Uwe Kleine-König            |
Industrial Linux Solutions                    | http://www.pengutronix.de/  |
