Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae0pg-0001of-Ul
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 13:40:53 +0000
Subject: Re: [PATCH v3 1/6] memory: omap-gpmc: Store handle to GPMC dev
To: Roger Quadros <rogerq@ti.com>, <nsekhar@ti.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <tony@atomide.com>,
 <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <1457582861-20619-1-git-send-email-fcooper@ti.com>
 <1457582861-20619-2-git-send-email-fcooper@ti.com> <56E16B20.5070001@ti.com>
From: "Franklin S Cooper Jr." <fcooper@ti.com>
Message-ID: <56E17932.6090304@ti.com>
Date: Thu, 10 Mar 2016 07:40:02 -0600
MIME-Version: 1.0
In-Reply-To: <56E16B20.5070001@ti.com>
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



On 03/10/2016 06:40 AM, Roger Quadros wrote:
> Franklin,
>
> On 10/03/16 06:07, Franklin S Cooper Jr wrote:
>> The dma channel information is located within the GPMC node. The NAND
>> driver requires a handle to the GPMC's dev to properly parse the DMA
>> properties. Therefore, store a handle to the dev so it can be referenced
>> within the NAND driver.
>>
>> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
>> ---
>>  drivers/memory/omap-gpmc.c                   | 1 +
>>  include/linux/platform_data/mtd-nand-omap2.h | 2 ++
>>  2 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>> index 6515dfc..2932d13 100644
>> --- a/drivers/memory/omap-gpmc.c
>> +++ b/drivers/memory/omap-gpmc.c
>> @@ -1796,6 +1796,7 @@ static int gpmc_probe_nand_child(struct platform_device *pdev,
>>  
>>  	gpmc_nand_data->cs = val;
>>  	gpmc_nand_data->of_node = child;
>> +	gpmc_nand_data->gpmc_dev = &pdev->dev;
>>  
>>  	/* Detect availability of ELM module */
>>  	gpmc_nand_data->elm_of_node = of_parse_phandle(child, "ti,elm-id", 0);
>> diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linux/platform_data/mtd-nand-omap2.h
>> index 090bbab..534b984 100644
>> --- a/include/linux/platform_data/mtd-nand-omap2.h
>> +++ b/include/linux/platform_data/mtd-nand-omap2.h
>> @@ -80,5 +80,7 @@ struct omap_nand_platform_data {
>>  	/* for passing the partitions */
>>  	struct device_node	*of_node;
>>  	struct device_node	*elm_of_node;
>> +
>> +	struct device		*gpmc_dev;
>>  };
>>  #endif
>>
> Why do you need this? Can't we just use dev->parent in the omap2-nand driver?

The omap2-nand platform_device is created by
platform_device_alloc. The created platform_device dev
parent isn't by default set to the GPMC dev. I didn't think
this was the right approach to manually set the parent
property. However, taking a look at other usages of
platform_device_alloc it seems this is actually pretty
common. If your ok with this then I can go that route.
>
> cheers,
> -roger
