Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6N2j-0002oy-78
 for linux-mtd@lists.infradead.org; Wed, 31 Dec 2014 17:26:46 +0000
Date: Wed, 31 Dec 2014 18:26:21 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 1/3] mtd: nand: add asm9260 NFC driver
Message-ID: <20141231182621.5503459c@bbrezillon>
In-Reply-To: <20141231174859.232875d0@bbrezillon>
References: <20141230200946.277c56c0@bbrezillon>
 <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
 <20141231174859.232875d0@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 Oleksij Rempel <linux@rempel-privat.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 Dec 2014 17:48:59 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Oleksij,
> 
> You should really add a cover letter containing a changelog (updated at
> each new version of your cover letter) so that reviewers can easily
> identify what has changed.
> 
> While you're at it, can you add your mtd test results to the cover
> letter ?
> 
> On Wed, 31 Dec 2014 13:58:51 +0100
> Oleksij Rempel <linux@rempel-privat.de> wrote:
> 
> > Add driver for Nand Flash Controller used on Alphascales ASM9260 chips.
> > The IP core of this controller has some similarities with
> > Evatronix NANDFLASH-CTRL IP (unknown revision), so probably it can be reused
> > by some other SoCs.
> > 
> > Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> > ---
> >  drivers/mtd/nand/Kconfig        |   7 +
> >  drivers/mtd/nand/Makefile       |   1 +

[...]

> > +
> > +static void asm9260_nand_set_addr(struct asm9260_nand_priv *priv,
> > +		u32 row_addr, u32 column)
> > +{
> > +	u32 addr[2];
> > +
> > +	addr[0] = (column & 0xffff) | (0xffff0000 & (row_addr << 16));
> > +	addr[1] = (row_addr >> 16) & 0xff;
> 
> Another nit: will this always work (especially on big endian
> kernels) ?
> 

Forget that one, it will work just fine (sorry for the brainfart).


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
