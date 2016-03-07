Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acr4v-0007D3-Dv
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 09:03:50 +0000
Subject: Re: [PATCH v5 09/26] mtd: nand: omap: Clean up device tree support
To: Brian Norris <computersforpeace@gmail.com>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
 <1455916548-3441-10-git-send-email-rogerq@ti.com>
 <20160305022823.GO55664@google.com>
CC: <tony@atomide.com>, <dwmw2@infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <javier@dowhile0.org>, <fcooper@ti.com>, <nsekhar@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <56DD43C2.2080406@ti.com>
Date: Mon, 7 Mar 2016 11:02:58 +0200
MIME-Version: 1.0
In-Reply-To: <20160305022823.GO55664@google.com>
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

On 05/03/16 04:28, Brian Norris wrote:
> Sorry, another small thing I noticed.
> 
> On Fri, Feb 19, 2016 at 11:15:31PM +0200, Roger Quadros wrote:
>> Move NAND specific device tree parsing to NAND driver.
>>
>> The NAND controller node must have a compatible id, register space
>> resource and interrupt resource.
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> ---
> [...]
> 
>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>> index 9e99199..0a637c4 100644
>> --- a/drivers/mtd/nand/omap2.c
>> +++ b/drivers/mtd/nand/omap2.c
>> @@ -24,6 +24,7 @@
>>  #include <linux/slab.h>
>>  #include <linux/of.h>
>>  #include <linux/of_device.h>
>> +#include <linux/of_mtd.h>
>>  
>>  #include <linux/mtd/nand_bch.h>
>>  #include <linux/platform_data/elm.h>
>> @@ -177,10 +178,11 @@ struct omap_nand_info {
>>  	struct gpmc_nand_regs		reg;
>>  	struct gpmc_nand_ops		*ops;
>>  	/* generated at runtime depending on ECC algorithm and layout selected */
> 
> ^^^ I don't think that comment describes the following line. You
> probably meant to delete this one?

Yes. I'll remove that. Was my bad on cherry-pick conflict resolution.

> 
>> +	bool				flash_bbt;
>> +	/* generated at runtime depending on ECC algorithm and layout */
>>  	struct nand_ecclayout		oobinfo;
>>  	/* fields specific for BCHx_HW ECC scheme */
>>  	struct device			*elm_dev;
>> -	struct device_node		*of_node;
>>  };
>>  
>>  static inline struct omap_nand_info *mtd_to_omap(struct mtd_info *mtd)
> 
> [...]
> 

cheers,
-roger
