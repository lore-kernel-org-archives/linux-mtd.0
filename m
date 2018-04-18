Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8o1L-0006Na-Iv
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2018 14:25:31 +0000
Date: Wed, 18 Apr 2018 16:25:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-spi@vger.kernel.org, Peter Pan <peterpansjtu@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>, Yogesh
 Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar
 <sourav.poddar@ti.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH v2 00/10] spi: Extend the framework to generically
 support memory devices
Message-ID: <20180418162503.764f4761@bbrezillon>
In-Reply-To: <20180417105713.GC8973@sirena.org.uk>
References: <20180410224439.9260-1-boris.brezillon@bootlin.com>
 <20180417105713.GC8973@sirena.org.uk>
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

On Tue, 17 Apr 2018 11:57:13 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Wed, Apr 11, 2018 at 12:44:29AM +0200, Boris Brezillon wrote:
> 
> > In this v2, I think I addressed all the comments I had except the
> > advanced direct memory mapping stuff mentioned by Cyrille, but I don't
> > think any of the work done in this series prevents us from adding this
> > feature later on.  
> 
> I'm pretty much OK with this, there's a few small bits to be addressed
> it seems but it looks good overall.

Okay, cool. I'll send a v3 addressing the few issues pointed by
reviewers.

Thanks,

Boris
