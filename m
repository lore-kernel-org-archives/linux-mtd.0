Received: from fllnx210.ext.ti.com ([198.47.19.17])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctEFx-0002Nx-C3
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 14:07:27 +0000
Subject: Re: Passing NAND mtdparts to OMAP2+ Kernel
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Adam Ford
 <aford173@gmail.com>
References: <CAHCN7xJoVF+3HjHwaS_U=jDqmU_Yv201KJSQ2s8N0gSNVR8pdQ@mail.gmail.com>
 <20170328215705.438d7af8@bbrezillon>
 <CAHCN7xKhRub4k8BpkPPjPFhjJU5c2xRd_VKPMfVOc88ZaTUmGQ@mail.gmail.com>
 <04afe149-24b2-daec-5ef0-2d662ed79040@ti.com>
 <20170329151002.26203f2c@bbrezillon> <20170329151837.509c15c6@bbrezillon>
CC: "Leto, Enrico" <enrico.leto@siemens.com>, <linux-omap@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <89e42bf8-4a69-1e99-59e8-94dc44889849@ti.com>
Date: Wed, 29 Mar 2017 17:06:58 +0300
MIME-Version: 1.0
In-Reply-To: <20170329151837.509c15c6@bbrezillon>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29/03/17 16:18, Boris Brezillon wrote:
> On Wed, 29 Mar 2017 15:10:02 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
>> On Wed, 29 Mar 2017 15:41:07 +0300
>> Roger Quadros <rogerq@ti.com> wrote:
>>
>>> Adam,
>>>
>>> On 29/03/17 14:39, Adam Ford wrote:  
>>>> On Tue, Mar 28, 2017 at 2:57 PM, Boris Brezillon
>>>> <boris.brezillon@free-electrons.com> wrote:    
>>>>> +Roger and Enrico
>>>>>
>>>>> On Tue, 28 Mar 2017 10:43:01 -0500
>>>>> Adam Ford <aford173@gmail.com> wrote:
>>>>>    
>>>>>> I posted this on the linux-omap list, and I was asked to post this on
>>>>>> the linux-mtd list:
>>>>>>
>>>>>>
>>>>>> I tried to remove the MTD partitions from the Linux device tree, and I
>>>>>> noticed that there was no partition information being pushed anymore
>>>>>> unless I changed the mtdparts name in U-Boot.
>>>>>>
>>>>>> It appears as if the MTD drivers have changed a bit.  I found a few
>>>>>> e-mails floating around that attempt to fix this
>>>>>>
>>>>>> Commit f7a8e38f07a17be907585 ("mtd: nand: assign reasonable default
>>>>>> name for NAND drivers") attempts to address this, and someone over at
>>>>>> https://patchwork.ozlabs.org/patch/707065/ attempted to address it as
>>>>>> well in a slightly different way.    
>>>>>
>>>>> Can you test the patch and let me know if solves the problem. If it
>>>>> does, I'll send a clean version of the patch and queue it for 4.12.
>>>>>    
>>>>
>>>> I tried to apply the patch directly, but it failed.  I then manually
>>>> copy-pasted it into the proper place, but it fails to compile.
>>>>
>>>> drivers/mtd/nand/omap2.c: In function ‘omap_nand_probe’:
>>>> drivers/mtd/nand/omap2.c:1859:14: error: implicit declaration of
>>>> function ‘devm_kasprinf’ [-Werror=implicit-function-declaration]
>>>>   mtd->name = devm_kasprinf(&pdev->dev, "omap2-nand.%d", info->gpmc_cs);
>>>>               ^~~~~~~~~~~~~
>>>> drivers/mtd/nand/omap2.c:1859:12: warning: assignment makes pointer
>>>> from integer without a cast [-Wint-conversion]
>>>>   mtd->name = devm_kasprinf(&pdev->dev, "omap2-nand.%d", info->gpmc_cs);
>>>>             ^
>>>> cc1: some warnings being treated as errors
>>>>
>>>> I use buildroot to build my toolchain and I am using gcc version 6.3.0
>>>> with glibc 2.24.  Is there supposed to be an include somewhere?  I am
>>>> not familiar with devm_kasprinf.  
>>
>> It's a typo: s/devm_kasprinf/devm_kasprintf/.
>>
>>>>
>>>>     
>>>
>>> Does the below patch work for you?  
>>
>> Should work indeed.
>>
>> I had a closer look and it seems that the bug was actually introduced
>> by c9711ec5250b mtd: nand: omap: Clean up device tree
>> support.
>> The parent device name has changed when switching to the new DT
>> representation: omap2-nand.0 (where 0 is the controller instance) became
>> 30000000.nand (where 30000000 is the base reg address in the physical
>> address space). Which means my proposal was incorrect (0 is not the CS
>> line, it's the NAND controller instance number), so we'd better
>> statically set it to "omap2-nand.0".
> 
> Changing my mind (again :)). According to [1], the instance id is
> related to the CS line, so devm_kasprintf() is the right solution.
> 
> Sorry for the noise.
> 
>>
>>>
>>> cheers,
>>> -roger
>>>
>>> ---
>>>  drivers/mtd/nand/omap2.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>>> index 2a52101..f693b8d 100644
>>> --- a/drivers/mtd/nand/omap2.c
>>> +++ b/drivers/mtd/nand/omap2.c
>>> @@ -1856,6 +1856,13 @@ static int omap_nand_probe(struct platform_device *pdev)
>>>  	nand_chip->ecc.priv	= NULL;
>>>  	nand_set_flash_node(nand_chip, dev->of_node);
>>>    
>>
>> nand_set_flash_node() is now taking the "label" DT property into account
>> and assigning mtd->name to this value if present. I'd recommend doing
>>
>> 	if (!mtd->name)
>> 		mtd->name = "omap2-nand.0";
> 
> This comment still stands, except it should be:
> 
> 	if (!mtd->name)
> 		mtd->name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
> 					   "omap2-nand.%d", info->gpmc_cs);
> 
> 	if (!mtd->name) {
> 		dev_err(&pdev->dev, "Failed to set MTD name\n");
> 		return -ENOMEM;
> 	}
> 
> Regards,
> 
> Boris
> 
> [1]http://lxr.free-electrons.com/source/arch/arm/mach-omap2/gpmc-nand.c?v=4.6#L133
> 

OK. Here is the updated patch. I'll send an proper patch by tomorrow.

Adam, please test it on your board if possible. Thanks.

---
 drivers/mtd/nand/omap2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 2a52101..1b3d7cc 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1856,6 +1856,15 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_chip->ecc.priv	= NULL;
 	nand_set_flash_node(nand_chip, dev->of_node);
 
+	if (!mtd->name) {
+		mtd->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "omap2-nand.%d",
+					   info->gpmc_cs);
+		if (!mtd->name) {
+			dev_err(&pdev->dev, "Failed to set MTD name\n");
+			return -ENOMEM;
+		}
+	}
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	nand_chip->IO_ADDR_R = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(nand_chip->IO_ADDR_R))
-- 
2.7.4
