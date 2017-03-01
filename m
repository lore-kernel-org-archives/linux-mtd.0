Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cj2HV-00045A-84
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 11:18:54 +0000
Received: by mail-wr0-x22a.google.com with SMTP id u108so27798960wrb.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2017 03:18:32 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] mtd: spi-nor: Introduce bounce buffer to handle
 vmalloc'd buffers
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170227120839.16545-1-vigneshr@ti.com>
 <20170227120839.16545-2-vigneshr@ti.com>
 <8e441369-5c15-d711-1789-b55eadf33c8f@nod.at>
 <65b4a156-f2a8-4c5e-4399-2024a147d5ec@atmel.com>
 <20170301111805.0eb23b76@bbrezillon>
Cc: Richard Weinberger <richard@nod.at>, Vignesh R <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-spi@vger.kernel.org
From: Frode Isaksen <fisaksen@baylibre.com>
Message-ID: <595ab823-cf40-3b27-55ec-3573cecb456b@baylibre.com>
Date: Wed, 1 Mar 2017 12:18:30 +0100
MIME-Version: 1.0
In-Reply-To: <20170301111805.0eb23b76@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 01/03/2017 11:18, Boris Brezillon wrote:
> On Wed, 1 Mar 2017 11:09:57 +0100
> Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
>
>> Le 28/02/2017 à 22:39, Richard Weinberger a écrit :
>>> Vignesh,
>>>
>>> Am 27.02.2017 um 13:08 schrieb Vignesh R:  
>>>> Filesystems like UBIFS may pass vmalloc'd buffers to SPI NOR layer which
>>>> will end up in SPI layer. SPI core does try to handle such buffers (see
>>>> spi_map_buf()) by doing vmalloc_to_page() and creating scatterlist. But,
>>>> its known that this does not work well with VIVT/aliasing cache
>>>> architectures.
>>>> This also fails when buffers are addressed using LPAE (buffers in region
>>>> higher than 32 bit addressable region), if DMA is 32bit only.
>>>>
>>>> Introduce bounce buffers support in SPI NOR framework to handle
>>>> vmalloc'd buffers. Use a pre-allocated per flash bounce buffer equal to
>>>> the sector size of the flash. Flash drivers can enable this feature by
>>>> setting SNOR_F_USE_BOUNCE_BUFFER flag.
>>>> This would also enable SPI NOR drivers to safely use DMA in their
>>>> read/write callbacks.
>>>>
>>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/spi-nor.c | 30 +++++++++++++++++++++++++++---
>>>>  include/linux/mtd/spi-nor.h   |  4 ++++
>>>>  2 files changed, 31 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>>> index 747645c74134..c241fefa5aff 100644
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -17,6 +17,7 @@
>>>>  #include <linux/mutex.h>
>>>>  #include <linux/math64.h>
>>>>  #include <linux/sizes.h>
>>>> +#include <linux/mm.h>
>>>>  
>>>>  #include <linux/mtd/mtd.h>
>>>>  #include <linux/of_platform.h>
>>>> @@ -1205,11 +1206,21 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>>>>  
>>>>  	while (len) {
>>>>  		loff_t addr = from;
>>>> +		bool use_bb = false;
>>>> +		u_char *dst_buf = buf;
>>>> +		size_t buf_len = len;
>>>>  
>>>>  		if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
>>>>  			addr = spi_nor_s3an_addr_convert(nor, addr);
>>>>  
>>>> -		ret = nor->read(nor, addr, len, buf);
>>>> +		if (!virt_addr_valid(buf) && nor->bounce_buf) {  
>> Should we use is_vmalloc_addr() instead of virt_addr_valid() ?
>>
>> I guess virt_addr_valid() returns true even for kmalloc'ed buffers
>> however the copy into the bounce buffer should be avoided for kmalloc'ed
>> memory.
> The test is !virt_addr_valid(), so we won't use the bounce buffer for
> kmalloc-ed regions. I don't remember why we use virt_addr_valid()
> instead of is_vmalloc_addr() in the NAND framework, but there was a
> good reason (virt_addr_valid() is more restrictive, but I don't
> remember why it's safer :))
I think virt_addr_valid() picks up both kmap'ed and vmalloc'ed pages as not valid...

Frode
>
>
>
