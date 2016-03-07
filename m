Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acr8p-0001ZK-D9
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 09:07:52 +0000
Subject: Re: [PATCH v5 09/26] mtd: nand: omap: Clean up device tree support
To: Brian Norris <computersforpeace@gmail.com>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
 <1455916548-3441-10-git-send-email-rogerq@ti.com>
 <20160305021035.GM55664@google.com>
CC: <tony@atomide.com>, <dwmw2@infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <javier@dowhile0.org>, <fcooper@ti.com>, <nsekhar@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <56DD44B2.9030402@ti.com>
Date: Mon, 7 Mar 2016 11:06:58 +0200
MIME-Version: 1.0
In-Reply-To: <20160305021035.GM55664@google.com>
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

On 05/03/16 04:10, Brian Norris wrote:
> A couple of sparse warnings.
> 
> On Fri, Feb 19, 2016 at 11:15:31PM +0200, Roger Quadros wrote:
>> Move NAND specific device tree parsing to NAND driver.
>>
>> The NAND controller node must have a compatible id, register space
>> resource and interrupt resource.
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> ---
>>  arch/arm/mach-omap2/gpmc-nand.c              |   5 +-
>>  drivers/memory/omap-gpmc.c                   | 143 +++++++--------------------
>>  drivers/mtd/nand/omap2.c                     | 133 +++++++++++++++++++++----
>>  include/linux/platform_data/mtd-nand-omap2.h |   3 +-
>>  4 files changed, 152 insertions(+), 132 deletions(-)
>>
>> diff --git a/arch/arm/mach-omap2/gpmc-nand.c b/arch/arm/mach-omap2/gpmc-nand.c
>> index 04e6998..f6ac027 100644
>> --- a/arch/arm/mach-omap2/gpmc-nand.c
>> +++ b/arch/arm/mach-omap2/gpmc-nand.c
> 
> [...]
> 
>> @@ -2039,9 +1939,42 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>>  		goto err;
>>  	}
>>  
>> -	ret = of_property_read_u32(child, "bank-width", &gpmc_s.device_width);
>> -	if (ret < 0)
>> -		goto err;
>> +	if (of_node_cmp(child->name, "nand") == 0) {
>> +		/* NAND specific setup */
>> +		u32 val;
> 
> drivers/memory/omap-gpmc.c:1952:13: originally declared here [sparse]
> drivers/memory/omap-gpmc.c:2029:21: warning: symbol 'val' shadows an earlier one [sparse]

I'll get rid of this duplicate val.
> 
>> +
>> +		/* Warn about older DT blobs with no compatible property */
>> +		if (!of_property_read_bool(child, "compatible")) {
>> +			dev_warn(&pdev->dev,
>> +				 "Incompatible NAND node: missing compatible");
>> +			ret = -EINVAL;
>> +			goto err;
>> +		}
>> +
> 
> [...]
> 
>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>> index 9e99199..0a637c4 100644
>> --- a/drivers/mtd/nand/omap2.c
>> +++ b/drivers/mtd/nand/omap2.c
> 
> [...]
> 
>> +static int omap_get_dt_info(struct device *dev, struct omap_nand_info *info)
>> +{
>> +	struct device_node *child = dev->of_node;
>> +	int i;
>> +	const char *s;
>> +
>> +	/* In old bindings, CS num is embedded in reg property */
>> +	if (of_property_read_u32(child, "reg", &info->gpmc_cs) < 0) {
> 
> Sparse doesn't like this one:
> 
> drivers/mtd/nand/omap2.c:1660:49: warning: incorrect type in argument 3 (different signedness) [sparse]
> drivers/mtd/nand/omap2.c:1660:49:    expected unsigned int [usertype] *out_value [sparse]
> drivers/mtd/nand/omap2.c:1660:49:    got int *<noident> [sparse]

I'll use a temporary unsigned int variable instead.

> 
>> +		dev_err(dev, "reg not found in DT\n");
>> +		return -EINVAL;
>> +	}
>> +
> 
> [...]
> 

cheers,
-roger
