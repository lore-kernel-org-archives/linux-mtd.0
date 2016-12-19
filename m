Received: from lelnx194.ext.ti.com ([198.47.27.80])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cIzra-0001MY-T7
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 15:28:32 +0000
Subject: Re: mtd, nand, omap2: how to pass the NAND device name to mtdparts ?
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <87CEE11E4E15344BAFE0FAC01C1671FB244857@DEFTHW99EI1MSX.ww902.siemens.net>
 <093f00e2-cd63-eee0-59a7-1548bc9ec723@ti.com>
 <20161219134620.199cfbb7@bbrezillon> <20161219135722.72c619b7@bbrezillon>
CC: "Leto, Enrico" <enrico.leto@siemens.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <d80b2a80-c89c-6b5f-8640-f8d361c11ef9@ti.com>
Date: Mon, 19 Dec 2016 17:28:03 +0200
MIME-Version: 1.0
In-Reply-To: <20161219135722.72c619b7@bbrezillon>
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

Hi,

On 19/12/16 14:57, Boris Brezillon wrote:
> On Mon, 19 Dec 2016 13:46:20 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
>> Roger, Enrico,
>>
>> On Mon, 19 Dec 2016 13:11:48 +0200
>> Roger Quadros <rogerq@ti.com> wrote:
>>
>>> Hi,
>>>
>>> On 19/12/16 11:30, Leto, Enrico wrote:
>>>> Hello All,
>>>>
>>>> I'm trying to port some projects to kernel 4.4. It crashes because the driver name given by mtdparts (omap2-nand.0) is no more accepted. It's running fine if I replace it with the device name (e.g. S34ML04G1).  
>>>
>>> What crashes? Is it a user space application?
>>
>> IIUC, Enrico complains about the mtdparts vs in-kernel device name
>> mismatch which prevents partition creation. Indeed, the first
>> information passed through the mtdparts parameter is the MTD device
>> name, and this name is usually defined by the NAND controller driver.
>> If the controller driver does not set the name, then the core assign
>> one based on the NAND model name.
>> But, in this case, if the MTD device name, does not match the mtdparts
>> one, then the cmdline partition parser will never creates the
>> partitions.
>>
>>> If it is then it shouldn't be
>>> depending on the platform device name for anything.
>>
>> I agree, but that's how it currently works. I remember having a
>> discussion with Brian regarding a standardized naming scheme, but it's
>> not been implemented yet.
>>
>> Usually, on a given board, NAND devices are identified by the
>> controller and the CS line they are connected to. I guess this is what
>> omap2-nand.0 means: omap2-nand controller, CS0 line.
>>
>>>
>>> The mtd_dev_info has the mtd device name but I don't think it contains
>>> the chip name. Rather it will contain MTD type and partition name.
>>
>> Actually, for partitions, it will contain the partition name, not the
>> chip name. But here the problem is not on the partition, but on the
>> device itself (which is used by the cmdline partition parser to
>> identify whether partitions should be created for a specific device or
>> not). 
>>
>>>
>>> The chip names are cryptic and mean nothing to user space. Why do you
>>> want user space to depend on chip names?
>>
>> I don't think that's what Enrico asked for, but I might be wrong.
>>
>>>
>>>>
>>>> We use different NANDs from different manufacturers. I'm searching for a convenient solution to pass the device name to mtdparts.
>>>>
>>>> Should I read the device name from u-boot and to pass it to mtdparts?  
>>
>> No, please don't do that.
>>
>>>
>>> Kernel can also read the chip model so we don't need to depend on u-boot.
>>>
>>>> Or some other suggestion or recommendation how to do that ?  
>>>
>>> As the kernel mtd driver (nand/spi/etc) already knows this information, it is
>>> a matter of just providing it to userspace. Maybe adding another sysfs parameter
>>> like modelname or something will do.
>>
>> The MTD device name is already exported (/sys/class/mtd/mtdX/name). We
>> could export the model/part name, but again I'm not sure this is what
>> Enrico wants here.
>>
>>>
>>> But as this was not yet done there might be a good reason why the model name was
>>> not provided to user space. Maybe Brian/Boris can comment.
>>
>> No good reason AFAIK, except no-one ever needed it. Usually, userspace
>> libs/apps need to know about the device capabilities/specificities, and
>> this is already provided in a generic way.
>>
>> Regarding Enrico's problem, I think the omap2-nand driver should
>> explicitly set the mtd->name field (see below), as is done in many other
>> NAND controller drivers. 
>>
> 
> Just for the record, the commit introducing the regression is
> 853f1c58c4b2 ("mtd: nand: omap2: show parent device structure in
> sysfs").

Thanks for this info and the patch Boris. I can give it a try.

Enrico, is the patch good enough for you?

cheers,
-roger
