Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aePAr-0001HP-N0
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2016 15:40:22 +0000
Subject: Re: [PATCH v4 1/7] ARM: OMAP2+: gpmc-nand: Set omap2-nand's parent
 dev to GPMC dev
To: Roger Quadros <rogerq@ti.com>, <nsekhar@ti.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <tony@atomide.com>,
 <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
 <1457654203-20856-2-git-send-email-fcooper@ti.com> <56E2CDB7.2080306@ti.com>
From: "Franklin S Cooper Jr." <fcooper@ti.com>
Message-ID: <56E2E6B0.5050507@ti.com>
Date: Fri, 11 Mar 2016 09:39:28 -0600
MIME-Version: 1.0
In-Reply-To: <56E2CDB7.2080306@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 03/11/2016 07:52 AM, Roger Quadros wrote:
> Franklin,
>
> On 11/03/16 01:56, Franklin S Cooper Jr wrote:
>> The dma channel information is located within the GPMC node which is the
>> NAND's parent node. The NAND driver requires a handle to the GPMC's dev
>> to properly parse the DMA properties. Therefore, set the NAND's parent dev
>> to the GPMC's dev so it can be referenced within the driver.
>>
>> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
>> ---
>> Version 4 changes:
>> Instead of storing the GPMC dev in a new property simply grab a reference
>> to it and set omap2-nand's dev.parent to it.
>>
>>  arch/arm/mach-omap2/gpmc-nand.c | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-omap2/gpmc-nand.c b/arch/arm/mach-omap2/gpmc-nand.c
>> index 72918c4..77e453c 100644
>> --- a/arch/arm/mach-omap2/gpmc-nand.c
>> +++ b/arch/arm/mach-omap2/gpmc-nand.c
>> @@ -15,6 +15,7 @@
>>  #include <linux/omap-gpmc.h>
>>  #include <linux/mtd/nand.h>
>>  #include <linux/platform_data/mtd-nand-omap2.h>
>> +#include <linux/of_platform.h>
>>  
>>  #include <asm/mach/flash.h>
>>  
>> @@ -77,6 +78,9 @@ int gpmc_nand_init(struct omap_nand_platform_data *gpmc_nand_data,
>>  	int err	= 0;
>>  	struct gpmc_settings s;
>>  	struct platform_device *pdev;
>> +	struct platform_device *gpmc_dev;
>> +	struct device_node *gpmc_node;
>> +
>>  	struct resource gpmc_nand_res[] = {
>>  		{ .flags = IORESOURCE_MEM, },
>>  		{ .flags = IORESOURCE_IRQ, },
>> @@ -134,8 +138,18 @@ int gpmc_nand_init(struct omap_nand_platform_data *gpmc_nand_data,
>>  	if (pdev) {
>>  		err = platform_device_add_resources(pdev, gpmc_nand_res,
>>  						    ARRAY_SIZE(gpmc_nand_res));
>> -		if (!err)
>> +		if (!err) {
>>  			pdev->dev.platform_data = gpmc_nand_data;
>> +
>> +			gpmc_node = of_get_parent(gpmc_nand_data->of_node);
> I'm afraid that we can't use this method as we want to restrict
> gpmc_nand_init() to non-DT boots.

The only users of the parent GPMC driver are already using
DT. The gpmc_probe_nand_child function in the GPMC driver
which calls gpmc_nand_init is already DT only.

The only other caller to gpmc_nand_init is board-flash.c.
The driver doesn't utilize xfer_type to even switch to any
other modes including DMA prefetch mode.  Looking at it
closer there isn't a dev from some kind of parent for me to
pass along. Board_nand_init which calls gpmc_nand_init just
takes raw NAND values with no relation to its parent.


With that being said are you ok with leaving it as is?
>
>> +
>> +			if (gpmc_node) {
>> +				gpmc_dev = of_find_device_by_node(gpmc_node);
>> +
>> +				if (gpmc_dev)
>> +					pdev->dev.parent = &gpmc_dev->dev;
>> +			}
>> +		}
>>  	} else {
>>  		err = -ENOMEM;
>>  	}
>>
> cheers,
> -roger
