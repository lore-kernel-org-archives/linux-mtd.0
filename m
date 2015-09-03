Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXR3O-0001ua-SR
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 09:43:35 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 07/10] mtd: spi-nor: add mtd_is_locked() support
Date: Thu, 3 Sep 2015 11:43:09 +0200
Cc: linux-mtd@lists.infradead.org
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
 <201509021101.49731.marex@denx.de> <20150902203041.GC21475@google.com>
In-Reply-To: <20150902203041.GC21475@google.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201509031143.09714.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, September 02, 2015 at 10:30:41 PM, Brian Norris wrote:
> On Wed, Sep 02, 2015 at 11:01:49AM +0200, Marek Vasut wrote:
> > On Tuesday, September 01, 2015 at 09:57:12 PM, Brian Norris wrote:
> > > This enables ioctl(MEMISLOCKED). Status can now be reported in the
> > > mtdinfo or flash_lock utilities found in mtd-utils.
> > > 
> > > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > > ---
> > > 
> > >  drivers/mtd/spi-nor/spi-nor.c | 37
> > >  ++++++++++++++++++++++++++++++++++++- include/linux/mtd/spi-nor.h   |
> > >   3 +++
> > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > > b/drivers/mtd/spi-nor/spi-nor.c index 62fa1b4ff3c0..c4fb1205f1d3
> > > 100644
> > > --- a/drivers/mtd/spi-nor/spi-nor.c
> > > +++ b/drivers/mtd/spi-nor/spi-nor.c
> 
> ...
> 
> > > @@ -549,6 +567,21 @@ static int spi_nor_unlock(struct mtd_info *mtd,
> > > loff_t ofs, uint64_t len) return ret;
> > > 
> > >  }
> > > 
> > > +static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs,
> > > uint64_t len) +{
> > > +	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> > > +	int ret;
> > > +
> > > +	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = nor->flash_is_locked(nor, ofs, len);
> > 
> > Is nor->flash_is_locked () always available or should you check this here
> > ?
> 
> spi_nor_is_locked() is only used when all 3 of
> flash_{lock,unlock,is_locked} are available:
> 
> 	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
> 		mtd->_lock = spi_nor_lock;
> 		mtd->_unlock = spi_nor_unlock;
> 		mtd->_is_locked = spi_nor_is_locked;
> 	}
> 
> I think it's a reasonable condition to enforce, that we only provide
> lock/unlock support if your flash also implements is_locked.

Yes, you're right. At least until some sort of flash which can only be locked
and not unlocked (like OTP) comes around. But we shouldn't overengineer things
from the getgo.

Thanks for clarifying.

Best regards,
Marek Vasut
