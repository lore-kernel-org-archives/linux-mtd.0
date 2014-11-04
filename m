Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlk9q-0003ni-Jp
 for linux-mtd@lists.infradead.org; Tue, 04 Nov 2014 19:52:51 +0000
Received: by mail-pd0-f177.google.com with SMTP id v10so14157191pde.22
 for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2014 11:52:29 -0800 (PST)
Date: Tue, 4 Nov 2014 11:52:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: add support for s25fl128s
Message-ID: <20141104195226.GK23619@ld-irv-0074>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
 <1407804896-1808-3-git-send-email-shijie.huang@intel.com>
 <CAOMZO5DdkB1VeSpO0S+Fos1Ct31GqC7CTD7C350BW3xBSH_jhw@mail.gmail.com>
 <CAOMZO5BggK+QvcXOmjTYQgNPxMFxg8-SarbR03gmwhuzxHwRJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5BggK+QvcXOmjTYQgNPxMFxg8-SarbR03gmwhuzxHwRJA@mail.gmail.com>
Cc: Huang Shijie <shijie.huang@intel.com>,
 Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>, zajec5@gmail.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 04, 2014 at 05:39:07PM -0200, Fabio Estevam wrote:
> Hi Huang/Brian,
> 
> On Fri, Oct 17, 2014 at 3:42 PM, Fabio Estevam <festevam@gmail.com> wrote:
> > Hi Brian,
> >
> > On Mon, Aug 11, 2014 at 9:54 PM, Huang Shijie <shijie.huang@intel.com> wrote:
> >> We need to store the six bytes ID for s25fl128s, since it shares the same
> >> five bytes with s25fl129p1.
> >>
> >> This patch adds a macro INFO6 which is used for the six bytes ID flash, and adds
> >> a new item for the s25fl128s.
> >>
> >> Signed-off-by: Huang Shijie <shijie.huang@intel.com>
> >> ---
> >>  drivers/mtd/spi-nor/spi-nor.c |   18 ++++++++++++++++++
> >>  1 files changed, 18 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> >> index a0923b0..c130bf7 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -471,6 +471,23 @@ err:
> >>                 .flags = (_flags),                                      \
> >>         })
> >>
> >> +#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)    \
> >> +       ((kernel_ulong_t)&(struct flash_info) {                         \
> >> +               .id = {                                                 \
> >> +                       ((_jedec_id) >> 16) & 0xff,                     \
> >> +                       ((_jedec_id) >> 8) & 0xff,                      \
> >> +                       (_jedec_id) & 0xff,                             \
> >> +                       ((_ext_id) >> 16) & 0xff,                       \
> >> +                       ((_ext_id) >> 8) & 0xff,                        \
> >> +                       (_ext_id) & 0xff,                               \
> >> +                       },                                              \
> >> +               .id_len = 6,                                            \
> >> +               .sector_size = (_sector_size),                          \
> >> +               .n_sectors = (_n_sectors),                              \
> >> +               .page_size = 256,                                       \
> >> +               .flags = (_flags),                                      \
> >> +       })
> >> +
> >>  #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width, _flags)  \
> >>         ((kernel_ulong_t)&(struct flash_info) {                         \
> >>                 .sector_size = (_sector_size),                          \
> >> @@ -565,6 +582,7 @@ const struct spi_device_id spi_nor_ids[] = {
> >>         { "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
> >>         { "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
> >>         { "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> >> +       { "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_QUAD_READ) },
> >>         { "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
> >>         { "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
> >>         { "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
> >
> > We have a s25fl128s flash on imx6sx-sdb board and this patch would be helpful.
> >
> > Do you see any issues with it?
> 
> Is there still issues preventing this patch to be merged?

Two things:

(1) My time (I'll get to it)

(2) The spi_nor_ids[] table is still not in great shape. We haven't
    fully agreed on the fallout of this change, and how people should be
    binding against the m25p80 driver in the future:

      commit a5b7616c55e188fe3d6ef686bef402d4703ecb62
      Author: Ben Hutchings <ben@decadent.org.uk>
      Date:   Tue Sep 30 03:14:55 2014 +0100

          mtd: m25p80,spi-nor: Fix module aliases for m25p80

    In the meantime, I'm not too keen on modifying this table. But I'll
    probably merge patches soon anyway.

Brian
