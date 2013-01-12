Received: from outbound-mail02.westnet.com.au ([203.10.1.243])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TtzTc-000767-Cv
 for linux-mtd@lists.infradead.org; Sat, 12 Jan 2013 11:42:18 +0000
Message-ID: <50F14C11.5050401@westnet.com.au>
Date: Sat, 12 Jan 2013 21:42:09 +1000
From: Greg Ungerer <gregungerer@westnet.com.au>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2 v3] mtd/uclinux: support ROM and allow passing the
 base address
References: <1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <50F01599.30309@westnet.com.au> <20130111140222.GJ14860@pengutronix.de>
In-Reply-To: <20130111140222.GJ14860@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>,
 kernel@pengutronix.de, Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/12/2013 12:02 AM, Uwe Kleine-König wrote:
> Hello Greg,
>
> On Fri, Jan 11, 2013 at 11:37:29PM +1000, Greg Ungerer wrote:
>> On 01/11/2013 02:31 AM, Uwe Kleine-König wrote:
>>> This allows to put the filesystem at a defined address in ROM allowing
>>> to save more precious RAM.
>>>
>>> I think it's safe to default to ROM because the intention of using the
>>> uclinux map is to use a romfs and so mtd-ram doesn't give you anything
>>> that mtd-rom doesn't.
>>>
>>> Just in case I missed something a warning is added if the driver has to
>>> fall back to the RAM mapping.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>> ---
>>> Changes since v2, id:1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de:
>>>
>>>   - drop a few "ram"s from printks instead of making them "ram/rom"
>>>   - fix a typo in the commit log and add rational for the introduced warning.
>>>
>>> Who is responsible for taking (or not) these two patches? David? Artem?
>>>
>>> Best regards
>>> Uwe
>>>
>>> ---
>>>   drivers/mtd/maps/Kconfig   |    2 +-
>>>   drivers/mtd/maps/uclinux.c |   26 +++++++++++++++++++++-----
>>>   2 files changed, 22 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
>>> index 2e47c2e..0dc86fc 100644
>>> --- a/drivers/mtd/maps/Kconfig
>>> +++ b/drivers/mtd/maps/Kconfig
>>> @@ -443,7 +443,7 @@ config MTD_GPIO_ADDR
>>>
>>>   config MTD_UCLINUX
>>>   	bool "Generic uClinux RAM/ROM filesystem support"
>>> -	depends on MTD_RAM=y && (!MMU || COLDFIRE)
>>> +	depends on (MTD_RAM=y || MTD_ROM=y) && (!MMU || COLDFIRE)
>>>   	help
>>>   	  Map driver to support image based filesystems for uClinux.
>>>
>>> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
>>> index 299bf88..b3a9c54 100644
>>> --- a/drivers/mtd/maps/uclinux.c
>>> +++ b/drivers/mtd/maps/uclinux.c
>>> @@ -24,11 +24,12 @@
>>>   /****************************************************************************/
>>>
>>>   struct map_info uclinux_ram_map = {
>>> -	.name = "RAM",
>>> -	.phys = (unsigned long)__bss_stop,
>>>   	.size = 0,
>>>   };
>>>
>>> +static unsigned long physaddr = -1;
>>> +module_param(physaddr, ulong, S_IRUGO);
>>> +
>>>   static struct mtd_info *uclinux_ram_mtdinfo;
>>>
>>>   /****************************************************************************/
>>> @@ -60,11 +61,17 @@ static int __init uclinux_mtd_init(void)
>>>   	struct map_info *mapp;
>>>
>>>   	mapp = &uclinux_ram_map;
>>> +
>>> +	if (physaddr == -1)
>>> +		mapp->phys = (resource_size_t)__bss_stop;
>>> +	else
>>> +		mapp->phys = physaddr;
>>> +
>>>   	if (!mapp->size)
>>>   		mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
>>>   	mapp->bankwidth = 4;
>>>
>>> -	printk("uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
>>> +	printk("uclinux[mtd]: probe address=0x%x size=0x%x\n",
>>>   	       	(int) mapp->phys, (int) mapp->size);
>>>
>>>   	/*
>>> @@ -82,7 +89,16 @@ static int __init uclinux_mtd_init(void)
>>>
>>>   	simple_map_init(mapp);
>>>
>>> -	mtd = do_map_probe("map_ram", mapp);
>>> +	mapp->name = "ROM";
>>> +	mtd = do_map_probe("map_rom", mapp);
>>> +	if (!mtd) {
>>> +		/* fall back to ram probing for compatibility reasons */
>>> +		mapp->name = "RAM";
>>> +		mtd = do_map_probe("map_ram", mapp);
>>> +		if (mtd && IS_ENABLED(CONFIG_MTD_ROM))
>>> +			pr_err("Failed to map rom, but ram succeeded. Please report this issue!\n");
>>
>> I still don't like this, as per:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2012-October/044612.html
> I remember your concerns, but as you didn't write back on my last try to
> explain why I consider the warning useful, I resent.
 >
> You wrote:
>
>   The message is only printed if both ROM and RAM mappings are enabled.
>   Many of the configs I use only have RAM mappings enabled.
>
> Yeah, so the warning will not trigger for you. And this is correct,
> because the only thing I want to catch is map_rom not being able to
> provide everything needed when map_ram does.

But why?
I still don't see how this is a useful runtime message.


> I don't know what you would prefer. Just drop the warning? Force the
> usage of map_rom by depending on (or selecting) MTD_ROM?

I would suggest dropping the message. And yes making the use map_rom
depend on CONFIG_MAP_ROM being enabled would seem to make sense to me.

Regards
Greg
