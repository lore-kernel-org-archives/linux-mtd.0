Received: from 4.mo178.mail-out.ovh.net ([46.105.49.171])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cP8Gn-0003uw-UZ
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2017 13:39:57 +0000
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id CF4D3CE8E
 for <linux-mtd@lists.infradead.org>; Thu,  5 Jan 2017 14:39:28 +0100 (CET)
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-2-git-send-email-clg@kaod.org>
 <5566c62d-cc72-f207-e1dd-5a59e6947c24@wedev4u.fr>
 <a7cb781c-a4a8-f0f7-e7db-5cd9f19da0aa@kaod.org>
 <2bec1e91-a196-b894-fb66-590b8f4f35c3@atmel.com>
 <645db8c4-7f3c-f8bf-ddd9-3f513ce2ed14@kaod.org>
 <4c5cf674-06f9-ad6b-05bf-a1d39aaa7ed5@atmel.com>
 <20170104185005.7fcafd2d@bbrezillon>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4c0b4498-12c7-303d-c8f8-4f27a02d6c12@kaod.org>
Date: Thu, 5 Jan 2017 14:39:14 +0100
MIME-Version: 1.0
In-Reply-To: <20170104185005.7fcafd2d@bbrezillon>
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

Hello Cyrille, Boris 

On 01/04/2017 06:50 PM, Boris Brezillon wrote:
> Cyrille, Cédric,
> 
> On Wed, 4 Jan 2017 15:52:07 +0100
> Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
> 
>>>   
>>>> Anyway, since the review is done now, on my side I won't ask you to remove
>>>> or split the support of the 'Command' mode in a separated patch.
>>>> I let you do as you want, if it help you to introduce some part of the
>>>> support of this 'Command' mode now even if not completed yet, no problem on
>>>> my side :)
>>>>
>>>> I was just giving you some pieces of advice for the next time if you want
>>>> to speed up the review of another patch introducing new features.
>>>>
>>>> However, I will just ask you one more version handling the dummy cycles
>>>> properly as it would help us for the global maintenance of the spi-nor
>>>> subsystem. This is the only mandatory modification I ask you, after that I
>>>> think it would be ok for me and since Marek has already reviewed your
>>>> driver, it would be ready to be merged into the spi-nor tree.  
>>>
>>> Sending a v5 which should address your comments. 
>>>
>>> I have removed the label property and will start a new thread in the 
>>> topic. Any hints on which binding we could add this label prop ?  
>>>  
>>
>> Here I will provide just few thoughts about this new DT property. I don't
>> pretend this is what should be done. I still think other mtd maintainers
>> should be involved to discuss this topic.
>>
>> First the DT property name "label" sounds good to me: it is consistent with
>> "label" DT property used to name mtd partitions. However, I don't think it
>> should be documented in jedec,spi-nor.txt but *maybe* in partition.txt as
>> the purpose of this new DT property seems very close to the "label"
>> property of partition nodes: let's think about some hard-disk device
>> (/dev/sda) and its partition devices (/dev/sdaX).

yes this is very similar. I first looked at introducing a name to 
an overall containing partition but the partition binding is not 
designed for that. There are constraints on the start address and
the size which does not fit the purpose.

> Hm, partition.txt may not be appropriate here. We're not documenting
> the MTD partition binding, but the MTD device one. Maybe we should
> create mtd.txt and put all generic MTD dev properties here.
>>
>> Besides, the concept of this memory label is not limited to SPI NOR but
>> could also apply to NAND memories or any other MTD handled memories.
> 
> Definitely. Actually I think I'll need that for the Atmel NAND
> controller driver rework I'm currently working on, to keep mtdparts
> parser happy even after changing the NAND device naming scheme.
> 
>> Hence the DT property might be handled by drivers/mtd/ofpart.c instead of
>> being handled by spi-nor.c or by each SPI NOR memory controller driver.
> 
> Actually, that could be done at the mtdcore level in
> mtd_set_dev_defaults() [1].

that would be perfect.

>> Finally, I guess we should take time to discuss and all agree what should
>> be done precisely before introducing a new DT property because one general
>> rule with DTB files is that users should be able to update their kernel
>> image (zImage, uImage, ...) without changing their DTB: device trees should
>> be backward compatible. Hence if we make a wrong choice today, we are
>> likely to have to live with it and keep supporting that bad choice.
> 
> Rob already acked the patch, so, if all MTD maintainers agree that this
> new property is acceptable, we should be fine ;-).

yes but we would need to move the binding property to another file. 
What I sent applied to "jedec,spi-nor" and we want to generalize the 
property to other devices.

>> Anyway, maybe you could describe a little bit your use case; what you
>> intend to do with this label from you userspace application.
>
> Here is mine: I want the mtdparts parser to work correctly with
> existing bootloaders even after changing the NAND device naming scheme
> to allow one NAND controller to expose multiple devices.
> 
> Current naming scheme: NAND device name is always atmel_nand
> New naming sheme: atmel-nand.%d where %d is replaced by the CS line
> number the NAND device is connected too.
> 
> Also note that it's easier to refer to a flash device by it's purpose
> (like System-firmware in Cedric's example) rather than the controller
> CS line this device is connected to.

Yes this is what we use. There are possibly other ways but adding
a label property at the flash device level is a practical solution [1]

So here's our need. Systems can have multiple chips for different
purposes : 

 - BMC Firmware 
 - BMC Firmware golden image
 - Host Firmware
 - Video Firmware
 - etc

The goal is to simplify the identification of a specific chip for 
userspace tools or daemons which need to select the appropriate 
mtd device. 
	
Thanks, 

C.

[1] https://github.com/openbmc/linux/blob/dev-4.7/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L36

> Regards,
> 
> Boris
> 
> [1]http://code.bulix.org/p019ah-107877
> 
