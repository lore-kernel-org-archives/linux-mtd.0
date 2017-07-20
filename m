Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dY7kc-00032m-1v
 for linux-mtd@lists.infradead.org; Thu, 20 Jul 2017 09:28:08 +0000
Message-ID: <1500542849.2354.28.camel@pengutronix.de>
Subject: Re: [PATCH 042/102] mtd: nand: sunxi: explicitly request exclusive
 reset control
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>,  Maxime Ripard
 <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org
Date: Thu, 20 Jul 2017 11:27:29 +0200
In-Reply-To: <20170720090046.3991a18b@bbrezillon>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
 <20170719152646.25903-43-p.zabel@pengutronix.de>
 <20170720090046.3991a18b@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2017-07-20 at 09:00 +0200, Boris Brezillon wrote:
> Hi Philipp,
> 
> On Wed, 19 Jul 2017 17:25:46 +0200
> Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
> > reset lines") started to transition the reset control request API calls
> > to explicitly state whether the driver needs exclusive or shared reset
> > control behavior. Convert all drivers requesting exclusive resets to the
> > explicit API call so the temporary transition helpers can be removed.
> > 
> > No functional changes.
> 
> If you don't mind, I'd like to take this patch in the nand tree, just in
> case we have other modifications on sunxi_nand.c for this cycle.

Absolutely, I'd like to only to apply the last two patches myself,
eventually.

regards
Philipp
