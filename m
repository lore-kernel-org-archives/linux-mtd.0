Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1Ykr1v-0001Nm-HS
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2015 09:33:16 +0000
Date: Wed, 22 Apr 2015 11:32:48 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: i.MX25 NFC with 8 bit ecc strength
Message-ID: <20150422093248.GE23758@pengutronix.de>
References: <20150420045614.GC5428@tarshish>
 <20150420073702.GA2552@pengutronix.de>
 <20150420091130.GD5428@tarshish>
 <20150420154818.GE2552@pengutronix.de>
 <20150421062428.GJ5428@tarshish>
 <20150421073936.GI2552@pengutronix.de>
 <20150422092043.GA5428@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150422092043.GA5428@tarshish>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 22, 2015 at 12:20:43PM +0300, Baruch Siach wrote:
> Hi Uwe,
> 
> On Tue, Apr 21, 2015 at 09:39:36AM +0200, Uwe Kleine-König wrote:
> > While understanding the problem I produced the following (untested)
> > patch:
> 
> I intend to use this patch as part of a series fixing the large oob issue. Can 
> you add your SoB please?
You can even get a commit log :-)

	mtd: nand: mxc_nand: cleanup copy_spare function

	To give people without the reference manual at hand a chance to
	understand the spare are handling of the i.MX nand controller,
	improve commenting, naming of variables and coding style.

	No functional change intended.

	Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

> > -	j = (mtd->oobsize / n >> 1) << 1;
> > +	/* size of oob chunk for all but possibly the last one */
> > +	oob_chunk_size = (mtd->oobsize / num_chunks >> 1) << 1;
BTW, I considered to change this to:

	oob_chunk_size = (mtd->oobsize / num_chunks) & ~1;

which is IMHO still clearer. Feel free to squash this in my patch if you
agree.

Best regards and thanks for feeding back your results
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
