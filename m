Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPuke-0008D9-Ka
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 17:58:14 +0000
Received: by mail-wm0-x242.google.com with SMTP id p204so2372133wmg.1
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 10:57:51 -0700 (PDT)
Subject: Re: [PATCH 2/3] mtd: spi-nor: core code for the Altera Quadspi Flash
 Controller v2
To: matthew.gerlach@linux.intel.com
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-3-git-send-email-matthew.gerlach@linux.intel.com>
 <852b819d-ea7a-4854-cae1-3857cf92930d@gmail.com>
 <alpine.DEB.2.20.1706270737120.8058@mgerlach-VirtualBox>
 <0cb464ef-eeb8-ebc9-fde9-b6d42bf03877@gmail.com>
 <alpine.DEB.2.20.1706271019140.8058@mgerlach-VirtualBox>
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <9ca626e3-fc80-2b50-85aa-5db102dc9b7f@gmail.com>
Date: Tue, 27 Jun 2017 19:55:36 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1706271019140.8058@mgerlach-VirtualBox>
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

On 06/27/2017 07:26 PM, matthew.gerlach@linux.intel.com wrote:

[...]

>>>>> +#ifndef __ALTERA_QUADSPI_H
>>>>> +#define __ALTERA_QUADSPI_H
>>>>> +
>>>>> +#include <linux/device.h>
>>>>> +
>>>>> +#define ALTERA_QUADSPI_FL_BITREV_READ BIT(0)
>>>>> +#define ALTERA_QUADSPI_FL_BITREV_WRITE BIT(1)
>>>>> +
>>>>> +#define ALTERA_QUADSPI_MAX_NUM_FLASH_CHIP 3
>>>>> +
>>>>> +int altera_quadspi_create(struct device *dev, void __iomem *csr_base,
>>>>> +              void __iomem *data_base, void __iomem *window_reg,
>>>>> +              size_t window_size, u32 flags);
>>>>> +
>>>>> +int altera_qspi_add_bank(struct device *dev,
>>>>> +             u32 bank, struct device_node *np);
>>>>> +
>>>>> +int altera_quadspi_remove_banks(struct device *dev);
>>>>
>>>> Why is this header needed at all ?
>>>
>>> This header is needed because of the very different ways
>>> FPGAs can be used with a processor running Linux.  In the case of a
>>> soft processor in the FPGA or an ARM connected to a FPGA, this header
>>> is not necessary because device trees are used to probe the driver.
>>> However, if the FPGA is on a PCIe card connected to an x86, device trees
>>> are not generally used, and the pcie driver must enumerate the
>>> "sub-driver".
>>
>> But we don't support that later part, do we ?
> 
> There is currently v2 patch set for the intel-fpga PCIe driver being
> reviewed where I am adding support for version 2 of the Altera Quadspi
> controller.

It'd be real nice to mention that in the cover letter with a link to
that patchset , otherwise it's real hard to understand why you did this.

> This technique of separating core driver code from platform/device tree
> code has been reviewed and accepted for the Altera Partial
> Reconfiguration IP, Altera Freeze Bridge, and the fpga region.

-- 
Best regards,
Marek Vasut
