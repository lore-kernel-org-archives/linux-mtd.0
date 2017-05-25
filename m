Received: from hauke-m.de ([2001:41d0:8:b27b::1] helo=mail.hauke-m.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDxPS-0004QV-FZ
 for linux-mtd@lists.infradead.org; Thu, 25 May 2017 18:22:56 +0000
Subject: Re: [PATCH v2 07/15] MIPS: lantiq: Convert the xbar driver to a
 platform_driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20170521130918.27446-1-hauke@hauke-m.de>
 <20170521130918.27446-8-hauke@hauke-m.de>
 <CAHp75VeQgekiWc+YxP5sDFBB4fvmRs1=heFcdYS6mAgqPACW7g@mail.gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>,
 Linux MIPS Mailing List <linux-mips@linux-mips.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 martin.blumenstingl@googlemail.com, john@phrozen.org,
 linux-spi <linux-spi@vger.kernel.org>, hauke.mehrtens@intel.com,
 Rob Herring <robh@kernel.org>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <aa0f9259-b96f-f072-93d4-a42e05fadc82@hauke-m.de>
Date: Thu, 25 May 2017 20:22:26 +0200
MIME-Version: 1.0
In-Reply-To: <CAHp75VeQgekiWc+YxP5sDFBB4fvmRs1=heFcdYS6mAgqPACW7g@mail.gmail.com>
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

On 05/22/2017 08:05 AM, Andy Shevchenko wrote:
> On Sun, May 21, 2017 at 4:09 PM, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> This allows using the xbar driver on ARX300 based SoCs which require the
>> same xbar setup as the xRX200 chipsets because the xbar driver
>> initialization is not guarded by an xRX200 specific
>> of_machine_is_compatible condition anymore. Additionally the new driver
>> takes a syscon phandle to configure the XBAR endianness bits in RCU
>> (before this was done in arch/mips/lantiq/xway/reset.c and also
>> guarded by an VRX200 specific if-statement).
> 
>> +#include <linux/ioport.h>
> 
> I'm not sure you need this.
> 
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
> 
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_address.h>
> 
> And these lines are under question, see below.

I will remove them they look unneeded.

>> +#include <linux/regmap.h>
>> +
> 
>> +#include <lantiq_soc.h>
> 
> This rather should be "lantiq_soc.h"

lantiq_soc.h is located here:
arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h
I do not think that #include "lantiq_soc.h" would work.
It is only needed for ltq_w32_mask(), I will probably inline this and
then this include is not needed any more.

>> +static int ltq_xbar_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *np = dev->of_node;
>> +       struct resource res_xbar;
>> +       struct regmap *rcu_regmap;
>> +       void __iomem *xbar_membase;
>> +       u32 rcu_ahb_endianness_reg_offset;
>> +       u32 rcu_ahb_endianness_val;
>> +       int ret;
>> +
> 
>> +       ret = of_address_to_resource(np, 0, &res_xbar);
>> +       if (ret) {
>> +               dev_err(dev, "Failed to get xbar resources");
>> +               return ret;
>> +       }
>> +
>> +       if (!devm_request_mem_region(dev, res_xbar.start,
>> +                                    resource_size(&res_xbar),
>> +               res_xbar.name)) {
>> +               dev_err(dev, "Failed to get xbar resources");
>> +               return -ENODEV;
>> +       }
>> +
>> +       xbar_membase = devm_ioremap_nocache(dev, res_xbar.start,
>> +                                               resource_size(&res_xbar));
>> +       if (!xbar_membase) {
>> +               dev_err(dev, "Failed to remap xbar resources");
>> +               return -ENODEV;
>> +       }
> 
> And what's wrong with traditional pattern
> 
> y = platform_get_resource(IOMEM);
> x = devm_ioremap_resource(y);
> if (IS_ERR(x))
>  return PTR_ERR(x);
> 
> ?

Your suggestion looks better, I will change it.

>> +
>> +       /* RCU configuration is optional */
>> +       rcu_regmap = syscon_regmap_lookup_by_phandle(np, "lantiq,rcu-syscon");
>> +       if (!IS_ERR_OR_NULL(rcu_regmap)) {
> 
>> +               if (of_property_read_u32_index(np, "lantiq,rcu-syscon", 1,
>> +                       &rcu_ahb_endianness_reg_offset)) {
> 
> device_property_*() ?

The device tree property looks like this:
lantiq,rcu-syscon = <&rcu0 0x4c>;

This would would probably return a pointer to phandle and not to 0x4c. I
would use an array here, and access it at [1], but I do not think that
is better.
device_property_read_u32(dev, "lantiq,rcu-syscon",
			  &rcu_ahb_endianness_reg_offset);

>> +                       dev_err(&pdev->dev, "Failed to get RCU reg offset\n");
>> +                       return -EINVAL;
>> +               }
>> +
>> +               if (of_device_is_big_endian(np))
> 
> Do we have common helper for this (I mean resource provider agnostic one)?

I am not aware of any. This will check for this device tree property:
big-endian;

> 
>> +                       rcu_ahb_endianness_val = RCU_VR9_BE_AHB1S;
>> +               else
>> +                       rcu_ahb_endianness_val = 0;
>> +
>> +               if (regmap_update_bits(rcu_regmap,
>> +                                       rcu_ahb_endianness_reg_offset,
>> +                                       RCU_VR9_BE_AHB1S,
>> +                                       rcu_ahb_endianness_val))
>> +                       dev_warn(&pdev->dev,
>> +                               "Failed to configure RCU AHB endianness\n");
>> +       }
>> +
>> +       /* disable fpi burst */
>> +       ltq_w32_mask(XBAR_FPI_BURST_EN, 0,
>> +                    xbar_membase + XBAR_ALWAYS_LAST);
>> +
>> +       return 0;
>> +}
> 
>> +builtin_platform_driver(xbar_driver);
> 
> Why it can't be module?

Currently this is used to load it early. This sets the AHB bus system
which connects the USB and the PCIe controllers to the system to big
Endian mode, this is needed for at least some accesses to these
components. It would be better to have a dependency in device tree to
reflect this.
Should I use a phandle to connect them?

Hauke
