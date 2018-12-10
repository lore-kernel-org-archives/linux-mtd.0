Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWH4k-0006nO-Fr
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2018 08:38:03 +0000
Date: Mon, 10 Dec 2018 09:37:41 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Vignesh R <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Marek Vasut
 <marek.vasut@gmail.com>, Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 09/34] mtd: spi-nor: Add a flag to skip spi_nor_setup()
Message-ID: <20181210093741.76fd0234@bbrezillon>
In-Reply-To: <b87690f8-b793-4500-b97c-ded302c97964@ti.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
 <20181207092637.18687-10-boris.brezillon@bootlin.com>
 <b87690f8-b793-4500-b97c-ded302c97964@ti.com>
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

On Mon, 10 Dec 2018 14:00:59 +0530
Vignesh R <vigneshr@ti.com> wrote:

> On 07/12/18 2:56 PM, Boris Brezillon wrote:
> > Some manufacturers select the opcode to use in their fixups()
> > method, and they don't want the generic selection logic to override
> > their values. Add a flag to allow that.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 7 +++++++
> >  include/linux/mtd/spi-nor.h   | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index f6b1c9b8079a..30dbddabec74 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -3502,6 +3502,13 @@ static int spi_nor_setup(struct spi_nor *nor,
> >  	u32 ignored_mask, shared_mask;
> >  	int err;
> >  
> > +	/*
> > +	 * Some manufacturers select the opcode to use in their fixups()
> > +	 * method, and explicitly ask to skip the generic selection logic.
> > +	 */
> > +	if (nor->flags & SNOR_F_SKIP_SETUP)
> > +		return 0;
> > +  
> 
> Nit, I would suggest moving above check to the place where
> spi_nor_setup() is called in spi_nor_scan(). That way, its easier to
> know that setup is skipped when SNOR_F_SKIP_SETUP is set when reading
> spi_nor_scan() code.

I agree. Will change that in v2.
