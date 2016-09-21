Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmcPt-0003eJ-Sj
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 07:58:09 +0000
Received: by mail-wm0-x244.google.com with SMTP id w84so7132700wmg.0
 for <linux-mtd@lists.infradead.org>; Wed, 21 Sep 2016 00:57:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160921090704.2cfebfc8@bbrezillon>
References: <20160920154551.3494-1-ricardo.ribalda@gmail.com>
 <20160921090704.2cfebfc8@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 21 Sep 2016 09:57:23 +0200
Message-ID: <CAPybu_0S0juNTNO1eQUbxyvcDR8o8W-69+oK5G_i42Z8CHS+FA@mail.gmail.com>
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

On Wed, Sep 21, 2016 at 9:07 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Ricardo,
>
> Please try to pass the version in your subject prefix (pass
> --subject-prefix="PATCH vX" to git format-patch).
>

Sorry about that.


> On Tue, 20 Sep 2016 17:45:51 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

>>  /*
>> + * This code converts an address to the Default Address Mode, that has non
>> + * power of two page sizes. We must support this mode because it is the default
>> + * mode supported by Xilinx tools, it can access the whole flash area and
>> + * changing over to the Power-of-two mode is irreversible and corrupts the
>> + * original data.
>> + */
>> +static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
>> +{
>> +     unsigned int offset;
>> +
>> +     offset = (nor->page_size == 264) ? (addr % 264) : (addr % 528);
>
> Can you send a new version with
>
>         offset = addr % nor->page_size;
>
> to see if kbuild test robot still complains.
>

This code:

static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, loff_t addr)
{
unsigned int offset;

offset = addr % nor->page_size;

return ((addr - offset) << 1) | offset;
}


When built like:

   wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross
-O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=blackfin

Produces this error:


drivers/built-in.o: In function `spi_nor_write':
drivers/mtd/spi-nor/spi-nor.c:(.text+0xfeb8): undefined reference to `__moddi3'
drivers/built-in.o: In function `spi_nor_read':
drivers/mtd/spi-nor/spi-nor.c:(.text+0x10248): undefined reference to `__moddi3'
drivers/built-in.o: In function `spi_nor_erase':
drivers/mtd/spi-nor/spi-nor.c:(.text+0x1034e): undefined reference to `__moddi3'
Makefile:956: recipe for target 'vmlinux' failed


But I think I found the right combination:


static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, loff_t addr)
{
unsigned int offset = addr;

offset %= nor->page_size;

return ((addr - offset) << 1) | offset;
}


This one works fine on x86 and blackfin

Sending v7


Thanks!


-- 
Ricardo Ribalda
