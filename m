Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsLgL-0007Rp-LN
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 02:14:14 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: provide default erase_sector
 implementation
Date: Sat, 31 Oct 2015 03:13:46 +0100
Cc: linux-mtd@lists.infradead.org,
 Bayi Cheng <bayi.cheng@mediatek.com>
References: <1446168261-4102-1-git-send-email-computersforpeace@gmail.com>
 <20151030210533.GK13239@google.com>
In-Reply-To: <20151030210533.GK13239@google.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201510310313.46676.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, October 30, 2015 at 10:05:33 PM, Brian Norris wrote:
> On Thu, Oct 29, 2015 at 06:24:20PM -0700, Brian Norris wrote:
> > Some spi-nor drivers perform sector erase by duplicating their
> > write_reg() command. Let's not require that the driver fill this out,
> > and provide a default instead.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> > 
> >  drivers/mtd/spi-nor/spi-nor.c | 30 ++++++++++++++++++++++++++----
> >  include/linux/mtd/spi-nor.h   |  3 ++-
> >  2 files changed, 28 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > b/drivers/mtd/spi-nor/spi-nor.c index 49883905a434..58a435372be7 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -313,6 +313,29 @@ static void spi_nor_unlock_and_unprep(struct spi_nor
> > *nor, enum spi_nor_ops ops)
> > 
> >  }
> >  
> >  /*
> > 
> > + * Initiate the erasure of a single sector
> > + */
> > +static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
> > +{
> > +	u8 buf[nor->addr_width];
> 
> Hmm, I see some warnings about variable length arrays here. Probably
> better to just set a MAX macro with the value of 4, since the extra byte
> really doesn't matter that much.

Hm yeah, this dynamic allocation is not great. You might want to put some
sort of assertion in place, to check whether addr_width isn't > MAX .

> I'll send v2.
> 
> Brian

Best regards,
Marek Vasut
