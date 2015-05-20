Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvCnA-0005uK-M6
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 22:48:49 +0000
Message-ID: <555D0F37.3010609@broadcom.com>
Date: Wed, 20 May 2015 15:48:23 -0700
From: Ray Jui <rjui@broadcom.com>
MIME-Version: 1.0
To: Hauke Mehrtens <hauke@hauke-m.de>, Brian Norris
 <computersforpeace@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
Subject: Re: [PATCH 5/7] mtd: brcmnand: add bcma driver
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
 <1431877266-28566-6-git-send-email-hauke@hauke-m.de>
 <20150520003402.GC11598@ld-irv-0074>
 <CACna6rzBn3yzzER56aAmk+VPNiMh9ikA3B1YZmMesF=3DWdq+A@mail.gmail.com>
 <20150520184028.GF11598@ld-irv-0074> <555D066C.6080200@hauke-m.de>
In-Reply-To: <555D066C.6080200@hauke-m.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Florian
 Fainelli <f.fainelli@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hauke,

On 5/20/2015 3:10 PM, Hauke Mehrtens wrote:
> On 05/20/2015 08:40 PM, Brian Norris wrote:
>> On Wed, May 20, 2015 at 08:39:06AM +0200, Rafał Miłecki wrote:
>>> On 20 May 2015 at 02:34, Brian Norris <computersforpeace@gmail.com> wrote:
>>>> On Sun, May 17, 2015 at 05:41:04PM +0200, Hauke Mehrtens wrote:
>>>>> This driver registers at the bcma bus and drives the NAND core if it
>>>>> was found on this bus. The bcma bus with this NAND core is used on the
>>>>> bcm53xx and bcm47xx Northstar SoC with ARM CPU cores. The memory ranges
>>>>> are automatically detected by bcma and the irq numbers read from device
>>>>> tree by bcma bus driver.
>>>>
>>>> If you're going to use device tree for part of it (IRQs) why not the
>>>> whole thing?
>>>>
>>>>> This is based on the iproc driver.
>>>>
>>>> This looks like you could probably get by with just using iproc_nand.c
>>>> as-is. The main NAND core is apparently MMIO-accessible on your chips,
>>>> so aren't the BCMA bits you're touching also?
> 
> I will try this, I do not know if I have to reset or active the core
> before using it, at least the vendor driver does so and I added it also.
> 
>>> That's right, in case of SoCs cores are MMIO-accessible, however I see
>>> few reasons for writing this driver as bcma based:
>>> 1) MMIO access isn't available for bcma bus /hosted/ on PCIe devices.
>>> By using bcma layer we write generic drivers.
>>
>> I strongly doubt that this NAND core is ever put on a PCIe endpoint.
> 
> Me too and then my driver would not work, because I am forwarding the
> memory directly to the driver and nothing would change the active core.
> 
>>> 2) bcma detects cores and their MMIO addresses automatically, if we
>>> are a bit lazy, it's easier to use it rather than keep hardcoding all
>>> addresses
>>
>> Laziness is a pretty bad excuse. You already have to do 60% of the work
>> by putting the IRQs and base NAND register range into the device tree.
>> Finding those remaining two register addresses is not so hard.
>>
>>> 3) There are some dependencies in cores initialization, e.g.
>>> ChipCommon core usually has to be initialized first
>>
>> Are you aware of any important dependencies? Isn't it safe to assume
>> that the ChipCommon core would have to be initialized way before any
>> peripherals?
> 
> I think ChipCommon is less important on ARM, I do not came up with an
> dependencies.
> 
>>
>>> 4) bcma provides some helpers like bcma_core_enable so we don't have
>>> to duplicate it in driver code
>>
>> I don't see why we need to reset/re-enable the NAND core in the kernel
>> at all, but if we do, this is touching the exact same registers as
>> iproc_nand.c is already. So it makes sense to *share* that code, and do
>> the same thing on both Cygnus and Northstar, etc. (And no, Cygnus can't
>> convert to BCMA, so we can't do 100% sharing either way.)
> 
> Will this Broadcom plugin to the AXI bus which bcma uses be removed from
> all newer SoCs or just from some SoC lines? If it will not be there in
> any more recent SoC then we should also go for the older arm SoCs to a
> more device tree only approach. Is Cygnus related to Northstar Plus or
> Northstar 2?

I don't think I can give you a certain answer on this. But to my best
knowledge, I don't think we have BCMA for several of our next gen ARMv8
based SoCs.

A set of peripherals (e.g., NAND, PCIe RC, I2C, etc) are shared between
Cygnus, NS+, and NS2.

Thanks,

Ray
