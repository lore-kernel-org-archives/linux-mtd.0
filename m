Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCLI0-000405-6B
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 04:14:56 +0000
Received: by mail-pd0-f177.google.com with SMTP id p10so753095pdj.22
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jul 2014 21:14:34 -0700 (PDT)
Date: Tue, 29 Jul 2014 21:14:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mtd: spi-nor: Correct device-id for n25q512a device
Message-ID: <20140730041431.GD11952@brian-ubuntu>
References: <1404795285-2929-1-git-send-email-Priyanka.Jain@freescale.com>
 <CAMuHMdV52qwThCezu=4NCpVBwbM2AjSK4cKXA+BdO=v_Yy2sBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV52qwThCezu=4NCpVBwbM2AjSK4cKXA+BdO=v_Yy2sBQ@mail.gmail.com>
Cc: Priyanka Jain <Priyanka.Jain@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Priyanka,

On Tue, Jul 08, 2014 at 09:38:19AM +0200, Geert Uytterhoeven wrote:
> CC linux-mtd

(Thanks for forwarding, Geert)

> On Tue, Jul 8, 2014 at 6:54 AM, Priyanka Jain
> <Priyanka.Jain@freescale.com> wrote:
> > Signed-off-by: Priyanka Jain <Priyanka.Jain@freescale.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index c713c86..148bb51d 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -487,7 +487,7 @@ const struct spi_device_id spi_nor_ids[] = {
> >         { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },
> >         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
> >         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
> > -       { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> > +       { "n25q512a",    INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K) },

We can't just change the ID, as this would break other devices.
Apparently there are multiple similar devices with at least two
different IDs. And we already have this patch queued up in l2-mtd.git
(also in linux-next):

commit c14deddec1fbd8c9757c53a49dbfd2dc83265f21
Author: grmoore@altera.com <grmoore@altera.com>
Date:   Tue Apr 29 10:29:51 2014 -0500

    mtd: spi-nor: add support for flag status register on Micron chips

Feel free to test!

> >
> >         /* PMC */
> >         { "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },

Brian
