Received: from 5.mo2.mail-out.ovh.net ([87.98.181.248])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPROD-0000h5-Ny
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 10:04:52 +0000
Received: from player728.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id AAE6516AE8
 for <linux-mtd@lists.infradead.org>; Fri,  6 Jan 2017 11:04:26 +0100 (CET)
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-2-git-send-email-clg@kaod.org>
 <5566c62d-cc72-f207-e1dd-5a59e6947c24@wedev4u.fr>
 <a7cb781c-a4a8-f0f7-e7db-5cd9f19da0aa@kaod.org>
 <2bec1e91-a196-b894-fb66-590b8f4f35c3@atmel.com>
 <645db8c4-7f3c-f8bf-ddd9-3f513ce2ed14@kaod.org>
 <4c5cf674-06f9-ad6b-05bf-a1d39aaa7ed5@atmel.com>
 <20170104185005.7fcafd2d@bbrezillon>
 <4c0b4498-12c7-303d-c8f8-4f27a02d6c12@kaod.org>
 <20170106094930.0f579dca@bbrezillon>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5017c983-e619-b3db-404c-8eab45bdd1f8@kaod.org>
Date: Fri, 6 Jan 2017 11:04:12 +0100
MIME-Version: 1.0
In-Reply-To: <20170106094930.0f579dca@bbrezillon>
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

Hello Boris,

On 01/06/2017 09:49 AM, Boris Brezillon wrote:
> Hi Cédric,
> 
> On Thu, 5 Jan 2017 14:39:14 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> Hello Cyrille, Boris 
>>
>> On 01/04/2017 06:50 PM, Boris Brezillon wrote:
>>> Cyrille, Cédric,
>>>
>>> On Wed, 4 Jan 2017 15:52:07 +0100
>>> Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
>>>   
>>>>>     
>>>>>> Anyway, since the review is done now, on my side I won't ask you to remove
>>>>>> or split the support of the 'Command' mode in a separated patch.
>>>>>> I let you do as you want, if it help you to introduce some part of the
>>>>>> support of this 'Command' mode now even if not completed yet, no problem on
>>>>>> my side :)
>>>>>>
>>>>>> I was just giving you some pieces of advice for the next time if you want
>>>>>> to speed up the review of another patch introducing new features.
>>>>>>
>>>>>> However, I will just ask you one more version handling the dummy cycles
>>>>>> properly as it would help us for the global maintenance of the spi-nor
>>>>>> subsystem. This is the only mandatory modification I ask you, after that I
>>>>>> think it would be ok for me and since Marek has already reviewed your
>>>>>> driver, it would be ready to be merged into the spi-nor tree.    
>>>>>
>>>>> Sending a v5 which should address your comments. 
>>>>>
>>>>> I have removed the label property and will start a new thread in the 
>>>>> topic. Any hints on which binding we could add this label prop ?  
>>>>>    
>>>>
>>>> Here I will provide just few thoughts about this new DT property. I don't
>>>> pretend this is what should be done. I still think other mtd maintainers
>>>> should be involved to discuss this topic.
>>>>
>>>> First the DT property name "label" sounds good to me: it is consistent with
>>>> "label" DT property used to name mtd partitions. However, I don't think it
>>>> should be documented in jedec,spi-nor.txt but *maybe* in partition.txt as
>>>> the purpose of this new DT property seems very close to the "label"
>>>> property of partition nodes: let's think about some hard-disk device
>>>> (/dev/sda) and its partition devices (/dev/sdaX).  
>>
>> yes this is very similar. I first looked at introducing a name to 
>> an overall containing partition but the partition binding is not 
>> designed for that. There are constraints on the start address and
>> the size which does not fit the purpose.
>>
>>> Hm, partition.txt may not be appropriate here. We're not documenting
>>> the MTD partition binding, but the MTD device one. Maybe we should
>>> create mtd.txt and put all generic MTD dev properties here.  
>>>>
>>>> Besides, the concept of this memory label is not limited to SPI NOR but
>>>> could also apply to NAND memories or any other MTD handled memories.  
>>>
>>> Definitely. Actually I think I'll need that for the Atmel NAND
>>> controller driver rework I'm currently working on, to keep mtdparts
>>> parser happy even after changing the NAND device naming scheme.
>>>   
>>>> Hence the DT property might be handled by drivers/mtd/ofpart.c instead of
>>>> being handled by spi-nor.c or by each SPI NOR memory controller driver.  
>>>
>>> Actually, that could be done at the mtdcore level in
>>> mtd_set_dev_defaults() [1].  
>>
>> that would be perfect.
>>
>>>> Finally, I guess we should take time to discuss and all agree what should
>>>> be done precisely before introducing a new DT property because one general
>>>> rule with DTB files is that users should be able to update their kernel
>>>> image (zImage, uImage, ...) without changing their DTB: device trees should
>>>> be backward compatible. Hence if we make a wrong choice today, we are
>>>> likely to have to live with it and keep supporting that bad choice.  
>>>
>>> Rob already acked the patch, so, if all MTD maintainers agree that this
>>> new property is acceptable, we should be fine ;-).  
>>
>> yes but we would need to move the binding property to another file. 
>> What I sent applied to "jedec,spi-nor" and we want to generalize the 
>> property to other devices.
> 
> We could create an new file under
> Documentation/devicetree/bindings/mtd/, or we could rename
> partition.txt into something else (generic.txt or common.txt) and
> document more than the partition binding.

OK. 

I guess that creating a new file for a single property is a little 
overkill or do we expect more common properties at the device level ? 
In that case, may be we could keep the partition.txt file and add  
a common.txt file. If not, common.txt seems to be a good name. 
Waiting a little for others to chime in.   


> Can you take care of that (in a separate patch series of course)?

sure, and will you send : 

	http://code.bulix.org/p019ah-107877

in a separate patch ? 

Thanks,

C.
