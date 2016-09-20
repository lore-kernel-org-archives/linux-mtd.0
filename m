Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmNFm-0001gz-PX
 for linux-mtd@lists.infradead.org; Tue, 20 Sep 2016 15:46:42 +0000
Received: by mail-wm0-x243.google.com with SMTP id w84so4119142wmg.0
 for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2016 08:46:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160920132104.1159d960@bbrezillon>
References: <1474054432-29124-1-git-send-email-ricardo.ribalda@gmail.com>
 <20160920132104.1159d960@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 20 Sep 2016 17:45:55 +0200
Message-ID: <CAPybu_2DNM5gLmTza_v-Xob_9rGQ69c8EVbuuRGg5pZHL3hgLA@mail.gmail.com>
Subject: Re: [PATCH v5] mtd: spi-nor: Add support for S3AN spi-nor devices
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Stephen Warren <swarren@nvidia.com>,
 Jagan Teki <jteki@openedev.com>, Vignesh R <vigneshr@ti.com>,
 Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Ezequiel_Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Furquan Shaikh <furquan@google.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris

Thanks for your review.

On Tue, Sep 20, 2016 at 1:21 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
>>       int sr, fsr;
>> -     sr = spi_nor_sr_ready(nor);
>> +
>> +     sr = nor->flags & SNOR_F_READY_XSR_RDY ? s3an_sr_ready(nor) :
>> +                                              spi_nor_sr_ready(nor);
>
> Nit: I find
>
>         if (nor->flags & SNOR_F_READY_XSR_RDY)
>                 sr = s3an_sr_ready(nor);
>         else
>                 sr = spi_nor_sr_ready(nor);

Fixed in v6


>> +static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
>> +{
>> +     unsigned int offset;
>> +
>> +     offset = (nor->page_size == 264) ? (addr % 264) : (addr % 528);
>
> Why not just
>
>         offset = addr % nor->page_size;
>

Because kbuild test robot does not like it ;)

        make.cross ARCH=blackfin

All errors (new ones prefixed by >>):

   drivers/built-in.o: In function `spi_nor_write':
>> drivers/mtd/spi-nor/spi-nor.c:1050: undefined reference to `__moddi3'

vim +1050 drivers/mtd/spi-nor/spi-nor.c



Thanks!
-- 
Ricardo Ribalda
