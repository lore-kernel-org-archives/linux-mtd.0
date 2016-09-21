Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmcnB-00021a-BZ
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 08:22:10 +0000
Date: Wed, 21 Sep 2016 10:21:37 +0200
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
Subject: Re: [PATCH] mtd: spi-nor: Add support for S3AN spi-nor devices
Message-ID: <20160921102137.6ff58bc7@bbrezillon>
In-Reply-To: <CAPybu_1f924DvgT1hSPyEMyD7tTN8Cng=mkq5ydDBBbZqpUtuw@mail.gmail.com>
References: <20160920154551.3494-1-ricardo.ribalda@gmail.com>
 <20160921090704.2cfebfc8@bbrezillon>
 <CAPybu_0S0juNTNO1eQUbxyvcDR8o8W-69+oK5G_i42Z8CHS+FA@mail.gmail.com>
 <20160921101420.7ea87f2d@bbrezillon>
 <CAPybu_1f924DvgT1hSPyEMyD7tTN8Cng=mkq5ydDBBbZqpUtuw@mail.gmail.com>
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

On Wed, 21 Sep 2016 10:19:10 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> Hi Boris
> 
> On Wed, Sep 21, 2016 at 10:14 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Wait. If you really want to manipulate an loff_t variable, you can do
> >
> >         offset = do_div(addr, nor->page_size);
> >
> >
> >  
> that leads to:
> 
>   CC      drivers/mtd/spi-nor/spi-nor.o
> drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_s3an_addr_convert':
> drivers/mtd/spi-nor/spi-nor.c:359:11: warning: comparison of distinct
> pointer types lacks a cast [enabled by default]
> 
> 
> and if I do the casting
> 
> offset = do_div((uint64_t)addr, nor->page_size);
> 
> 
> drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_s3an_addr_convert':
> drivers/mtd/spi-nor/spi-nor.c:359:11: error: lvalue required as left
> operand of assignment
> drivers/mtd/spi-nor/spi-nor.c:359:11: error: lvalue required as left
> operand of assignment
> drivers/mtd/spi-nor/spi-nor.c:359:11: error: lvalue required as left
> operand of assignment
> drivers/mtd/spi-nor/spi-nor.c:359:11: error: lvalue required as unary
> '&' operand
> scr
> 
> Unsinged long is more than enough for s3an. I think v7 is ok.

Then, why did you change the spi_nor_s3an_addr_convert() prototype? 
