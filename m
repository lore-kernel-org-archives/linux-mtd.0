Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8nxK-0004Xj-52
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2018 14:21:15 +0000
Date: Wed, 18 Apr 2018 16:20:53 +0200
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
Subject: Re: [PATCH v2 02/10] spi: Expose spi_{map,unmap}_buf() for internal
 use
Message-ID: <20180418162053.22d47152@bbrezillon>
In-Reply-To: <20180416121127.GC20726@sirena.org.uk>
References: <20180410224439.9260-1-boris.brezillon@bootlin.com>
 <20180410224439.9260-3-boris.brezillon@bootlin.com>
 <20180416121127.GC20726@sirena.org.uk>
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

On Mon, 16 Apr 2018 13:11:27 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Wed, Apr 11, 2018 at 12:44:31AM +0200, Boris Brezillon wrote:
> 
> > 2/ we create a new header (drivers/spi/internals.h?) for all
> >    definitions that are meant for internal use (shared between spi.c
> >    and spi-mem.c)  
> 
> > I personally prefer #2 as it provides a better separation between spi
> > and spi-mem code.
> > ---
> >  drivers/spi/spi.c       | 23 +++++------------------
> >  include/linux/spi/spi.h | 26 ++++++++++++++++++++++++++
> >  2 files changed, 31 insertions(+), 18 deletions(-)  
> 
> I prefer that too (if you prefer it you should go with it so it's the
> option on the table!).

I hesitated for long and went for the solution I didn't like, mainly
because everything is already put in a single header file so I thought
you would prefer that approach.

> I'd go with drivers/spi/internals.h though so
> that it's even more obvious if something is being silly trying to use
> it when they shouldn't.

Okay, I'll move those definitions to drivers/spi/internals.h.

Thanks,

Boris
