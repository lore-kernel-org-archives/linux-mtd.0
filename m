Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4Mu9-00005c-TA
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2015 05:58:10 +0000
Subject: Re: [PATCH v4 11/27] mtd: nand: omap: Clean up device tree support
To: Brian Norris <computersforpeace@gmail.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
 <1442588029-13769-12-git-send-email-rogerq@ti.com> <5613A404.9010106@ti.com>
 <20151203042954.GB120110@google.com>
CC: <tony@atomide.com>, <dwmw2@infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <javier@dowhile0.org>, <fcooper@ti.com>, <nsekhar@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <565FD9B9.3030202@ti.com>
Date: Thu, 3 Dec 2015 11:27:13 +0530
MIME-Version: 1.0
In-Reply-To: <20151203042954.GB120110@google.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On 03/12/15 09:59, Brian Norris wrote:
> Hi Roger,
> 
> On Tue, Oct 06, 2015 at 01:35:48PM +0300, Roger Quadros wrote:
>> Move NAND specific device tree parsing to NAND driver.
>>
>> The NAND controller node must have a compatible id, register space
>> resource and interrupt resource.
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
> 
> This one's going to need rebased, as there are some conflicting of_node
> changes in l2-mtd.git.

Al right. I'll rebase on top of l2-mtd.git
> 
>> ---
>> v4: Warn if using older incompatible DT i.e. compatible property not present
>> in nand node.
>>
>>  arch/arm/mach-omap2/gpmc-nand.c              |   5 +-
>>  drivers/memory/omap-gpmc.c                   | 143 +++++++--------------------
>>  drivers/mtd/nand/omap2.c                     | 136 +++++++++++++++++++++----
>>  include/linux/platform_data/mtd-nand-omap2.h |   3 +-
>>  4 files changed, 155 insertions(+), 132 deletions(-)
> 
> Also, this is going to be hard to manage across trees, as you touch
> three drivers all at once. Is it not possible to split any of this apart
> better?

Will need some more effort and I can do it. Butm if we're going to start
an with immutable branch with everything in, is it worth the effort?
> 
>>
>> diff --git a/arch/arm/mach-omap2/gpmc-nand.c b/arch/arm/mach-omap2/gpmc-nand.c
>> index ffe646a..e07ca27 100644
>> --- a/arch/arm/mach-omap2/gpmc-nand.c
>> +++ b/arch/arm/mach-omap2/gpmc-nand.c
>> @@ -95,10 +95,7 @@ int gpmc_nand_init(struct omap_nand_platform_data *gpmc_nand_data,
>>  	gpmc_nand_res[1].start = gpmc_get_irq();
>>  
>>  	memset(&s, 0, sizeof(struct gpmc_settings));
>> -	if (gpmc_nand_data->of_node)
>> -		gpmc_read_settings_dt(gpmc_nand_data->of_node, &s);
>> -	else
>> -		gpmc_set_legacy(gpmc_nand_data, &s);
>> +	gpmc_set_legacy(gpmc_nand_data, &s);
>>  
>>  	s.device_nand = true;
>>  
>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>> index e75226d..318c187 100644
>> --- a/drivers/memory/omap-gpmc.c
>> +++ b/drivers/memory/omap-gpmc.c
>> @@ -29,7 +29,6 @@
>>  #include <linux/of_device.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/omap-gpmc.h>
>> -#include <linux/mtd/nand.h>
>>  #include <linux/pm_runtime.h>
>>  

<snip>

>>  
>> -	ppdata.of_node = pdata->of_node;
>> -	mtd_device_parse_register(mtd, NULL, &ppdata, pdata->parts,
>> -				  pdata->nr_parts);
>> +	if (dev->of_node) {
>> +		ppdata.of_node = dev->of_node;
> 
> The latest l2-mtd.git changed how the partitions' of_node is passed. Now
> this is handled by nand_set_flash_node().

OK.
> 
>> +		mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
>> +
>> +	} else {
>> +		mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
>> +	}
>>  
>>  	platform_set_drvdata(pdev, mtd);
>>  
>> @@ -2083,11 +2173,17 @@ static int omap_nand_remove(struct platform_device *pdev)
>>  	return 0;
>>  }
>>  
>> +static const struct of_device_id omap_nand_ids[] = {
>> +	{ .compatible = "ti,omap2-nand", },
>> +	{},
>> +};
>> +
>>  static struct platform_driver omap_nand_driver = {
>>  	.probe		= omap_nand_probe,
>>  	.remove		= omap_nand_remove,
>>  	.driver		= {
>>  		.name	= DRIVER_NAME,
>> +		.of_match_table = of_match_ptr(omap_nand_ids),
>>  	},
>>  };
>>  
>> diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linux/platform_data/mtd-nand-omap2.h
>> index a067f58..ff27e5a 100644
>> --- a/include/linux/platform_data/mtd-nand-omap2.h
>> +++ b/include/linux/platform_data/mtd-nand-omap2.h
>> @@ -76,11 +76,10 @@ struct omap_nand_platform_data {
>>  	int			devsize;
>>  	enum omap_ecc           ecc_opt;
>>  
>> -	/* for passing the partitions */
>> -	struct device_node	*of_node;
>>  	struct device_node	*elm_of_node;
>>  
>>  	/* deprecated */
>>  	struct gpmc_nand_regs	reg;
>> +	struct device_node	*of_node;
> 
> I'm a little confused here. Do you have a mixed platform data / device
> tree setup here? That's odd. (It also seems if that was really
> necessary, you could have the board file set pdev->dev.of_node before
> registering it, then you don't need this field.) But really, if you're
> partly using device tree, can't you just convert completely? Or is this
> a two-phase process, and you're planning to convert omap2 to full device
> tree?

The existing device tree implementation for omap2-nand was like this:
omap-gpmc.c driver was creating a platform device for the nand device and
passing the device node via platform data.

After this series we no longer do this and that's why of_node is marked
deprecated in platform data. I might as well could just get rid of it
but wasn't sure of how we're going to integrate the changes into the
subsystem trees so just marked it deprecated.

cheers,
-roger
