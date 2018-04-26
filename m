Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBfn0-0003bI-EY
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 12:14:20 +0000
Date: Thu, 26 Apr 2018 14:14:01 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, Vignesh R <vigneshr@ti.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org, Peter
 Pan <peterpansjtu@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, =?UTF-8?B?UmFmYcWCIE1pxYJl?=
 =?UTF-8?B?Y2tp?= <rafal@milecki.pl>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: Applied "spi: Check presence the of ->transfer[_xxx]() before
 registering a controller" to the spi tree
Message-ID: <20180426141401.26748b74@bbrezillon>
In-Reply-To: <E1f830e-0001Lz-Vf@debutante>
References: <20180410224439.9260-2-boris.brezillon@bootlin.com>
 <E1f830e-0001Lz-Vf@debutante>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

On Mon, 16 Apr 2018 13:13:24 +0100
Mark Brown <broonie@kernel.org> wrote:

> The patch
> 
>    spi: Check presence the of ->transfer[_xxx]() before registering a controller
> 
> has been applied to the spi tree at
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 
> 

I can't find this patch in any of your spi branches. Has it been
intentionally dropped, and if it was, do you remember why?

Regards,

Boris
