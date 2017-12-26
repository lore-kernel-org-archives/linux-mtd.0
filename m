Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eTplC-0006HD-Nh
 for linux-mtd@lists.infradead.org; Tue, 26 Dec 2017 13:59:16 +0000
Subject: Re: [PATCH 1/3] mtd: spi-nor: add optional DMA-safe bounce buffer for
 data transfer
To: Vignesh R <vigneshr@ti.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org, richard@nod.at, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, broonie@kernel.org,
 linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org, nicolas.ferre@microchip.com,
 radu.pirea@microchip.com
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <fc2440c6f52877f28286d89691049e5cba10e6a7.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <1126731d-cbf7-8fbf-34ab-8ccf1cc8241f@ti.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <ae977280-28b4-d746-da4b-0f807dad609d@wedev4u.fr>
Date: Tue, 26 Dec 2017 14:59:00 +0100
MIME-Version: 1.0
In-Reply-To: <1126731d-cbf7-8fbf-34ab-8ccf1cc8241f@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vignesh

Le 26/12/2017 à 14:42, Vignesh R a écrit :
> Hi Cyrille,
> 
> Thanks for doing this series! One comment below.
> 
> On 24-Dec-17 10:06 AM, Cyrille Pitchen wrote:
> [...]
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 8bafd462f0ae..59f9fbd45234 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -14,8 +14,10 @@
>>  #include <linux/errno.h>
>>  #include <linux/module.h>
>>  #include <linux/device.h>
>> +#include <linux/highmem.h>
>>  #include <linux/mutex.h>
>>  #include <linux/math64.h>
>> +#include <linux/mm.h>
>>  #include <linux/sizes.h>
>>  #include <linux/slab.h>
>>  
>> @@ -1232,6 +1234,56 @@ static const struct flash_info spi_nor_ids[] = {
>>  	{ },
>>  };
>>  
>> +static bool spi_nor_is_dma_safe(const void *buf)
>> +{
>> +	if (is_vmalloc_addr(buf))
>> +		return false;
>> +
>> +#ifdef CONFIG_HIGHMEM
>> +	if ((unsigned long)buf >= PKMAP_BASE &&
>> +	    (unsigned long)buf < (PKMAP_BASE + (LAST_PKMAP * PAGE_SIZE)))
>> +		return false;
>> +#endif
>> +
>> +	return true;
>> +}
>> +
> 
> Better way would be to use virt_addr_valid():
> static bool spi_nor_is_dma_safe(const void *buf)
> {
> 	return virt_addr_valid(buf);
> }
> 
> Regards
> Vignesh
> 

Thanks for the advice :)

https://patchwork.kernel.org/patch/9768341/
Maybe I could check both virt_addr_valid() and object_is_on_stack() too ?

Best regards,

Cyrille
