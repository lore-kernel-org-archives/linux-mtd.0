Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmcky-0000SJ-6E
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 08:19:52 +0000
Received: by mail-wm0-x242.google.com with SMTP id w84so7221037wmg.0
 for <linux-mtd@lists.infradead.org>; Wed, 21 Sep 2016 01:19:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160921101420.7ea87f2d@bbrezillon>
References: <20160920154551.3494-1-ricardo.ribalda@gmail.com>
 <20160921090704.2cfebfc8@bbrezillon>
 <CAPybu_0S0juNTNO1eQUbxyvcDR8o8W-69+oK5G_i42Z8CHS+FA@mail.gmail.com>
 <20160921101420.7ea87f2d@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 21 Sep 2016 10:19:10 +0200
Message-ID: <CAPybu_1f924DvgT1hSPyEMyD7tTN8Cng=mkq5ydDBBbZqpUtuw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for S3AN spi-nor devices
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

On Wed, Sep 21, 2016 at 10:14 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Wait. If you really want to manipulate an loff_t variable, you can do
>
>         offset = do_div(addr, nor->page_size);
>
>
>
that leads to:

  CC      drivers/mtd/spi-nor/spi-nor.o
drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_s3an_addr_convert':
drivers/mtd/spi-nor/spi-nor.c:359:11: warning: comparison of distinct
pointer types lacks a cast [enabled by default]


and if I do the casting

offset = do_div((uint64_t)addr, nor->page_size);


drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_s3an_addr_convert':
drivers/mtd/spi-nor/spi-nor.c:359:11: error: lvalue required as left
operand of assignment
drivers/mtd/spi-nor/spi-nor.c:359:11: error: lvalue required as left
operand of assignment
drivers/mtd/spi-nor/spi-nor.c:359:11: error: lvalue required as left
operand of assignment
drivers/mtd/spi-nor/spi-nor.c:359:11: error: lvalue required as unary
'&' operand
scr

Unsinged long is more than enough for s3an. I think v7 is ok.


-- 
Ricardo Ribalda
