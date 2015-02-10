Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL20d-0003vZ-7P
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 04:01:12 +0000
Date: Tue, 10 Feb 2015 11:58:33 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] m25p80, spi-nor: Update id list of Macronix chips
Message-ID: <20150210035833.GA19195@hsj.sh.intel.com>
References: <1423161845-24282-1-git-send-email-jimtingkuo@gmail.com>
 <1423161845-24282-2-git-send-email-jimtingkuo@gmail.com>
 <20150206011857.GC30781@ld-irv-0074>
 <CAHgCKdUq8o3hc0FeShtn6JPSk7U59Y1Hy-Tsq4MnRbNEhgv3dA@mail.gmail.com>
 <20150206190950.GN18140@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150206190950.GN18140@ld-irv-0074>
Cc: Marek Vasut <marex@denx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ben Hutchings <ben@decadent.org.uk>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 06, 2015 at 11:09:50AM -0800, Brian Norris wrote:
> (fixed Huang's current email)
> 
> Hi,
> 
> On Fri, Feb 06, 2015 at 10:33:29PM +0800, Jim-Ting Kuo wrote:
> > On Fri, Feb 6, 2015 at 9:18 AM, Brian Norris
> > <computersforpeace@gmail.com> wrote:
> > > On Fri, Feb 06, 2015 at 02:44:04AM +0800, Jim Kuo wrote:
> > >> --- a/drivers/mtd/devices/m25p80.c
> > >> +++ b/drivers/mtd/devices/m25p80.c
> > >> @@ -170,6 +170,74 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
> > >>       return 0;
> > >>  }
> > >>
> > >> +static int m25p80_write_xfer(struct spi_nor *nor,
> > >> +             struct spi_nor_xfer_cfg *cfg, u8 *buf, size_t len)
> > >> +{
> ...
> > >> +}
> > >> +
> > >> +static int m25p80_read_xfer(struct spi_nor *nor,
> > >> +             struct spi_nor_xfer_cfg *cfg, u8 *buf, size_t len)
> > >> +{
> ...
> > >> +}
> > >> +
> > >
> > > All of the above is pointless. The write_xfer/read_xfer functions are
> > > not even used. (They should probably just be dropped, since they're
> > > doing nothing as-is.)
> > >
> > >>  /*
> > >>   * board specific setup should have ensured the SPI clock used here
> > >>   * matches what the READ command supports, at least until this driver
> > >> @@ -199,6 +267,8 @@ static int m25p_probe(struct spi_device *spi)
> > >>       nor->erase = m25p80_erase;
> > >>       nor->write_reg = m25p80_write_reg;
> > >>       nor->read_reg = m25p80_read_reg;
> > >> +     nor->write_xfer = m25p80_write_xfer;
> > >> +     nor->read_xfer = m25p80_read_xfer;
> > >>
> > >>       nor->dev = &spi->dev;
> > >>       nor->mtd = &flash->mtd;
> > >> @@ -261,10 +331,15 @@ static const struct spi_device_id m25p_ids[] = {
> > >>       {"mr25h256"},   {"mr25h10"},
> > >>       {"gd25q32"},    {"gd25q64"},
> > >>       {"160s33b"},    {"320s33b"},    {"640s33b"},
> > >> -     {"mx25l2005a"}, {"mx25l4005a"}, {"mx25l8005"},  {"mx25l1606e"},
> > >> -     {"mx25l3205d"}, {"mx25l3255e"}, {"mx25l6405d"}, {"mx25l12805d"},
> > >> -     {"mx25l12855e"},{"mx25l25635e"},{"mx25l25655e"},{"mx66l51235l"},
> > >> -     {"mx66l1g55g"},
> > >> +     {"mx25l512e"},  {"mx25l5121e"}, {"mx25l1006e"}, {"mx25l1021e"},
> > >> +     {"mx25l2006e"}, {"mx25l4006e"}, {"mx25u4035"},  {"mx25v4035"},
> > >> +     {"mx25l8006e"}, {"mx25u8035"},  {"mx25v8035"},  {"mx25l1606e"},
> > >> +     {"mx25l1633e"}, {"mx25l1635e"}, {"mx25u1635e"}, {"mx25l3206e"},
> > >> +     {"mx25l3239e"}, {"mx25l3225d"}, {"mx25l3255e"}, {"mx25l6406e"},
> > >> +     {"mx25l6439e"}, {"mx25l12839f"},        {"mx25l12855e"},
> > >> +     {"mx25u12835f"},        {"mx25l25635e"},        {"mx25l25655e"},
> > >> +     {"mx25u25635f"},        {"mx66l51235f"},        {"mx66u51235f"},
> > >> +     {"mx66l1g45g"}, {"mx66l1g55g"},
> > >>       {"n25q064"},    {"n25q128a11"}, {"n25q128a13"}, {"n25q256a"},
> > >>       {"n25q512a"},   {"n25q512ax3"}, {"n25q00"},
> > >>       {"pm25lv512"},  {"pm25lv010"},  {"pm25lq032"},
> > >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > >> index 0f8ec3c..a6c7337 100644
> > >> --- a/drivers/mtd/spi-nor/spi-nor.c
> > >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> > >> @@ -545,19 +545,37 @@ static const struct spi_device_id spi_nor_ids[] = {
> > >>       { "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
> > >>
> > >>       /* Macronix */
> > >> -     { "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
> > >
> > > Nak.
> > >
> > >> -     { "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
> > >
> > > Nak.
> > >
> > >> -     { "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
> > >
> > > Nak.
> > >
> > > (you get the picture)
> > >
> [...]
> > >
> > > You need to do a lot better job of documenting your patches (i.e.,
> > > describe why you're doing these things) if you want me to take them.
> > >
> > > What's more, the SFDP support you're trying to add should be done in a
> > > way where you *don't* need to muck with the ID table every time. With
> > > SFDP you can get most/all this information anyway, and devices should
> > > just be able to bind to this driver using a generic name like
> > > "spi-nor,sfdp" or something like that, instead of having to expand this
> > > table.
> > 
> > The write_xfer/read_xfer functions actually are used in patch 2.
> >  - read_xfer:  for macronix_block_lock function.
> >  - write_xfer:  for sfdp_read, macronix_read_lock_status function.
> > Original read/write fcuntions can only support one type transfer I/O (such as
> > FAST_READ, DUAL_READ or QUAD_READ which was detected at begin),
> > and they also only support fixed cycle of dummy (bind with transfer command).
> > So the commands not related to data transfer, such as sfdp read, lock/unlock
> > are hard to use original read/write. That's why I built these two of functions.
> > I thought they are suitable for this condition.
> 
> OK, I suppose that's a little more reasonable. But I want to make sure
> this is actually necessary. I suppose we can't get this functionality
> with the existing read_reg()/write_reg() ops, can we?
> 
> I'm not actually sure the exact purpose of the read_xfer()/write_xfer()
> functions as originally defined. They obviously weren't used yet.
> Perhaps Huang can comment here?
The read_xfer()/write_xfer() are designed for the strange spi-nor
controllers which has special optimizations for some operations, such as
combine several operations into one operation.

I am not familiar with SFDP, but I think it will be okay if the SFDP implements the
read_xfer()/write_xfer() if it really can not be implemented by the
read/write/read_reg/write_reg.


please see:
http://lists.infradead.org/pipermail/linux-mtd/2013-November/050492.html

Please split these patch into small patches, and document it well. :)

thanks
Huang Shijie
