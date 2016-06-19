Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEkA9-0001Ay-7h
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 21:21:50 +0000
Subject: Re: [PATCH 2/2] ubi: open volumes define in device tree
To: Daniel Golle <daniel@makrotopia.org>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <1466277476-14853-2-git-send-email-hauke@hauke-m.de>
 <20160618233654.GC29476@makrotopia.org>
Cc: richard@nod.at, dwmw2@infradead.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, dedekind1@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <cce72bd2-ec28-0654-c1d0-fa6e3b76eb71@hauke-m.de>
Date: Sun, 19 Jun 2016 23:21:23 +0200
MIME-Version: 1.0
In-Reply-To: <20160618233654.GC29476@makrotopia.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/19/2016 01:36 AM, Daniel Golle wrote:
> On Sat, Jun 18, 2016 at 09:17:56PM +0200, Hauke Mehrtens wrote:
>> This makes it possible to define a volume to open in device tree. This
>> is helpful when a root file system is on a ubi layer. Without this
>> patch it is only possible to device with with kernel command line
>> parameters.
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> 
> The example in the documentation doesn't belong to that patch, see
> below. Apart from this single [PATCH 2/2]:
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> 
>> ---
>>  Documentation/devicetree/bindings/mtd/ubi.txt | 22 +++++++++++++++++
>>  drivers/mtd/ubi/build.c                       | 34 +++++++++++++++++++++++++++
>>  2 files changed, 56 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/ubi.txt b/Documentation/devicetree/bindings/mtd/ubi.txt
>> index 5fcd47e..f87a7d8 100644
>> --- a/Documentation/devicetree/bindings/mtd/ubi.txt
>> +++ b/Documentation/devicetree/bindings/mtd/ubi.txt
>> @@ -13,6 +13,16 @@ Describe of a UBI layer in device tree.
>>   			which have to be assigned to the newly created UBI
>>   			device (assigned automatically by default)
>>  
>> +Partitions on a UBI layer can be defined:
>> +
>> + - compatible: 		"ubi,volume"
>> + - name:		name of the ubi volume to open
>> + - ubi-mode:		mode of the ubi volume to open value:
>> + 			UBI_READONLY:	1
>> + 			UBI_READWRITE:	2
>> + 			UBI_EXCLUSIVE:	3
>> + 			UBI_METAONLY:	4
>> +
>>  Example:
>>  
>>  partitions {
>> @@ -29,5 +39,17 @@ partitions {
>>  		label = "system_sw";
>>  		reg = <0x1c0000 0xc800000>;
>>  		compatible = "ubi,device";
>> +
>> +		rootfsA@0 {
>> +			compatible = "ubi,volume";
>> +			name = "rootfsA";
>> +			ubi-mode = <1>;
>> +		};
>> +
>> +		data_vol@0 {
>> +			compatible = "ubi,volume";
>> +			name = "data_vol";
>> +			ubi-mode = <2>;
>> +		};
> 
> This is an example for the 'ubi,volume' while the patch introduces
> support for 'ubi,device'.

Sorry this documentation should be for the code added in the previous
patch and vise versa.

>>  	};
>>  };
>> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
>> index 16baeb5..1c22533 100644
>> --- a/drivers/mtd/ubi/build.c
>> +++ b/drivers/mtd/ubi/build.c
>> @@ -1,6 +1,7 @@
>>  /*
>>   * Copyright (c) International Business Machines Corp., 2006
>>   * Copyright (c) Nokia Corporation, 2007
>> + * Copyright (c) 2016 Hauke Mehrtens <hauke@hauke-m.de>
>>   *
>>   * This program is free software; you can redistribute it and/or modify
>>   * it under the terms of the GNU General Public License as published by
>> @@ -33,6 +34,7 @@
>>  #include <linux/module.h>
>>  #include <linux/moduleparam.h>
>>  #include <linux/stringify.h>
>> +#include <linux/of.h>
>>  #include <linux/namei.h>
>>  #include <linux/stat.h>
>>  #include <linux/miscdevice.h>
>> @@ -43,6 +45,7 @@
>>  #include <linux/slab.h>
>>  #include <linux/major.h>
>>  #include "ubi.h"
>> +#include "../mtdcore.h"
>>  
>>  /* Maximum length of the 'mtd=' parameter */
>>  #define MTD_PARAM_LEN_MAX 64
>> @@ -1205,6 +1208,7 @@ static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
>>  static int __init ubi_init(void)
>>  {
>>  	int err, i, k;
>> +	struct mtd_info *mtd_it;
>>  
>>  	/* Ensure that EC and VID headers have correct size */
>>  	BUILD_BUG_ON(sizeof(struct ubi_ec_hdr) != 64);
>> @@ -1285,6 +1289,36 @@ static int __init ubi_init(void)
>>  		}
>>  	}
>>  
>> +	mtd_for_each_device(mtd_it) {
>> +		struct mtd_info *mtd;
>> +		u32 ubi_num = 0;
>> +		u32 vid_hdr_offs = 0;
>> +		u32 max_beb_per1024 = CONFIG_MTD_UBI_BEB_LIMIT;
>> +
>> +		mtd = get_mtd_device(mtd_it, -1);
>> +
>> +		if (!of_device_is_compatible(mtd->dev.of_node, "ubi,device")) {
>> +			put_mtd_device(mtd);
>> +			continue;
>> +		}
>> +
>> +		of_property_read_u32(mtd->dev.of_node, "vid_hdr_offs",
>> +				     &vid_hdr_offs);
>> +		of_property_read_u32(mtd->dev.of_node, "max_beb_per1024",
>> +				     &max_beb_per1024);
>> +		of_property_read_u32(mtd->dev.of_node, "ubi_num", &ubi_num);
>> +
>> +		mutex_lock(&ubi_devices_mutex);
>> +		err = ubi_attach_mtd_dev(mtd, ubi_num, vid_hdr_offs,
>> +					 max_beb_per1024);
>> +		mutex_unlock(&ubi_devices_mutex);
>> +		if (err < 0) {
>> +			pr_err("UBI error: cannot attach mtd%d",
>> +			       mtd->index);
>> +		}
>> +		put_mtd_device(mtd);
>> +	}
>> +
>>  	err = ubiblock_init();
>>  	if (err) {
>>  		pr_err("UBI error: block: cannot initialize, error %d", err);
>> -- 
>> 2.8.1
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
