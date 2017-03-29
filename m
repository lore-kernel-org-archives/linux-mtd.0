Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctJRJ-00064z-NA
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 19:39:31 +0000
Date: Wed, 29 Mar 2017 21:39:03 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Simon Baatz <gmbnomis@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 jason@lakedaemon.net, andrew@lunn.ch, dan.carpenter@oracle.com
Subject: Re: [PATCH v2 1/2] mtd: nand: orion: fix clk handling
Message-ID: <20170329193903.u2wmutwz3bodholp@pengutronix.de>
References: <20170327180208.13414-1-gmbnomis@gmail.com>
 <20170327181949.isafnqsnxkzed5nv@pengutronix.de>
 <20170329193607.GA24737@gandalf>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170329193607.GA24737@gandalf>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 29, 2017 at 09:36:08PM +0200, Simon Baatz wrote:
> On Mon, Mar 27, 2017 at 08:19:49PM +0200, Uwe Kleine-König wrote:
> > you could to the following here instead:
> > 
> > 	info->clk = devm_clk_get(&pdev->dev, NULL);
> > 	if (IS_ERR(info->clk))
> > 		/*
> > 		 * We ignore all errors here, that's wrong but only for
> > 		 * one commit.
> > 		 */
> > 		info->clk = NULL;
> > 
> > 	ret = clk_prepare_enable(info->clk);
> > 	if (ret) ...
> > 
> 
> Makes sense.  I don't think we should have such a comment, though. 

Yes I agree, I just wanted to prevent people thinking I suggest this
code snipet for optional clock handling and so wanted to write a big
No-No-No onto it.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
