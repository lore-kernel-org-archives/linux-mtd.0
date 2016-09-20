Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmNcq-0005Yu-F0
 for linux-mtd@lists.infradead.org; Tue, 20 Sep 2016 16:10:32 +0000
Date: Tue, 20 Sep 2016 18:09:49 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Javier
 Martinez Canillas <javier@osg.samsung.com>, Stephen Warren
 <swarren@nvidia.com>, Jagan Teki <jteki@openedev.com>, Vignesh R
 <vigneshr@ti.com>, Marek Vasut <marex@denx.de>, Ezequiel =?UTF-8?B?R2Fy?=
 =?UTF-8?B?Y8OtYQ==?= <ezequiel@vanguardiasur.com.ar>, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <zajec5@gmail.com>, Furquan Shaikh
 <furquan@google.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] mtd: spi-nor: Add support for S3AN spi-nor devices
Message-ID: <20160920180949.1bd3d48c@bbrezillon>
In-Reply-To: <CAPybu_2DNM5gLmTza_v-Xob_9rGQ69c8EVbuuRGg5pZHL3hgLA@mail.gmail.com>
References: <1474054432-29124-1-git-send-email-ricardo.ribalda@gmail.com>
 <20160920132104.1159d960@bbrezillon>
 <CAPybu_2DNM5gLmTza_v-Xob_9rGQ69c8EVbuuRGg5pZHL3hgLA@mail.gmail.com>
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

On Tue, 20 Sep 2016 17:45:55 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> Hi Boris
> 
> Thanks for your review.
> 
> On Tue, Sep 20, 2016 at 1:21 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> >>       int sr, fsr;
> >> -     sr = spi_nor_sr_ready(nor);
> >> +
> >> +     sr = nor->flags & SNOR_F_READY_XSR_RDY ? s3an_sr_ready(nor) :
> >> +                                              spi_nor_sr_ready(nor);  
> >
> > Nit: I find
> >
> >         if (nor->flags & SNOR_F_READY_XSR_RDY)
> >                 sr = s3an_sr_ready(nor);
> >         else
> >                 sr = spi_nor_sr_ready(nor);  
> 
> Fixed in v6
> 
> 
> >> +static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
> >> +{
> >> +     unsigned int offset;
> >> +
> >> +     offset = (nor->page_size == 264) ? (addr % 264) : (addr % 528);  
> >
> > Why not just
> >
> >         offset = addr % nor->page_size;
> >  
> 
> Because kbuild test robot does not like it ;)
> 
>         make.cross ARCH=blackfin
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/built-in.o: In function `spi_nor_write':
> >> drivers/mtd/spi-nor/spi-nor.c:1050: undefined reference to `__moddi3'  
> 
> vim +1050 drivers/mtd/spi-nor/spi-nor.c

Hm, that's weird, I would expect that if you were manipulating a 64 bit
type, but that's not the case here.

Are you sure you didn't change the type of the addr parameter at some
point?
