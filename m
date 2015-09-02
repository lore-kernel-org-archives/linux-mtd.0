Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXEgS-00081F-Fi
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 20:31:04 +0000
Received: by pacfv12 with SMTP id fv12so22444253pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 13:30:43 -0700 (PDT)
Date: Wed, 2 Sep 2015 13:30:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 07/10] mtd: spi-nor: add mtd_is_locked() support
Message-ID: <20150902203041.GC21475@google.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
 <1441137435-52862-8-git-send-email-computersforpeace@gmail.com>
 <201509021101.49731.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201509021101.49731.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 02, 2015 at 11:01:49AM +0200, Marek Vasut wrote:
> On Tuesday, September 01, 2015 at 09:57:12 PM, Brian Norris wrote:
> > This enables ioctl(MEMISLOCKED). Status can now be reported in the
> > mtdinfo or flash_lock utilities found in mtd-utils.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 37 ++++++++++++++++++++++++++++++++++++-
> >  include/linux/mtd/spi-nor.h   |  3 +++
> >  2 files changed, 39 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 62fa1b4ff3c0..c4fb1205f1d3 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
...
> > @@ -549,6 +567,21 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t
> > ofs, uint64_t len) return ret;
> >  }
> > 
> > +static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t
> > len) +{
> > +	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> > +	int ret;
> > +
> > +	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = nor->flash_is_locked(nor, ofs, len);
> 
> Is nor->flash_is_locked () always available or should you check this here ?

spi_nor_is_locked() is only used when all 3 of
flash_{lock,unlock,is_locked} are available:

	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
		mtd->_lock = spi_nor_lock;
		mtd->_unlock = spi_nor_unlock;
		mtd->_is_locked = spi_nor_is_locked;
	}

I think it's a reasonable condition to enforce, that we only provide
lock/unlock support if your flash also implements is_locked.

> > +
> > +	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
> > +	return ret;
> > +}
> > +
> [...]

Brian
