Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vbotp-00044R-5i
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 09:50:46 +0000
Message-ID: <527227D5.6070809@ti.com>
Date: Thu, 31 Oct 2013 15:20:13 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 4/5] mtd: m25p80: remove M25PXX_USE_FAST_READ Kconfig
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <201310271732.42518.marex@denx.de>
 <20131030233809.GE20059@norris.computersforpeace.net>
 <201310311021.42620.marex@denx.de>
In-Reply-To: <201310311021.42620.marex@denx.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 31 October 2013 02:51 PM, Marek Vasut wrote:
> Dear Brian Norris,
>
>> I see I never responded to this one.
>>
>> On Sun, Oct 27, 2013 at 05:32:42PM +0100, Marek Vasut wrote:
>>> Hi Brian,
>>>
>>>> Remove the compile-time option for FAST_READ, since we have run-time
>>>> support for detecting it.
>>>>
>>>> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
>>>> ---
>>>>
>>>>   drivers/mtd/devices/Kconfig  |  7 -------
>>>>   drivers/mtd/devices/m25p80.c | 11 ++++++-----
>>>>   2 files changed, 6 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
>>>> index 74ab4b7..0128138 100644
>>>> --- a/drivers/mtd/devices/Kconfig
>>>> +++ b/drivers/mtd/devices/Kconfig
>>>> @@ -95,13 +95,6 @@ config MTD_M25P80
>>>>
>>>>   	  if you want to specify device partitioning or to use a device which
>>>>   	  doesn't support the JEDEC ID instruction.
>>>>
>>>> -config M25PXX_USE_FAST_READ
>>>> -	bool "Use FAST_READ OPCode allowing SPI CLK>= 50MHz"
>>>> -	depends on MTD_M25P80
>>>> -	default y
>>>> -	help
>>>> -	  This option enables FAST_READ access supported by ST M25Pxx.
>>>> -
>>>>
>>>>   config MTD_SPEAR_SMI
>>>>
>>>>   	tristate "SPEAR MTD NOR Support through SMI controller"
>>>>   	depends on PLAT_SPEAR
>>>>
>>>> diff --git a/drivers/mtd/devices/m25p80.c
>>>> b/drivers/mtd/devices/m25p80.c index 7e3ec7a..d6c5c57 100644
>>>> --- a/drivers/mtd/devices/m25p80.c
>>>> +++ b/drivers/mtd/devices/m25p80.c
>>>> @@ -1055,13 +1055,14 @@ static int m25p_probe(struct spi_device *spi)
>>>>
>>>>   	flash->page_size = info->page_size;
>>>>   	flash->mtd.writebufsize = flash->page_size;
>>>>
>>>> -	flash->fast_read = false;
>>>> -	if (np&&  of_property_read_bool(np, "m25p,fast-read"))
>>>> +	if (np)
>>>> +		/* If we were instantiated by DT, use it */
>>>> +		flash->fast_read = of_property_read_bool(np, "m25p,fast-read");
>>>> +	else
>>>> +		/* If we weren't instantiated by DT, default to fast-read */
>>>>
>>>>   		flash->fast_read = true;
>>> We should default to FALSE , unless explicitly requested by DT, am I
>>> wrong? Otherwise this might break the old chips.
>> I believe my patch is simply a refactoring of the existing code with the
>> assumption that M25PXX_USE_FAST_READ=y. (In my experience, everyone has
>> it set to y. Perhaps I'm wrong.)
> OK, this is where we diverged. I always set FAST_READ to =n and only enabled it
> via this DT prop if I was dead sure the chip could do it.
>
>> Now, it's unclear to me what this Kconfig was used for. It's the wrong
>> approach for controlling fast read on a per-controller or
>> per-flash-device basis, as it provides a blunt hammer to disable it for
>> ALL systems which might use the same kernel (think multiplatform
>> kernels). And now we have a better alternative: the M25P_NO_FR flag for
>> flash which do not support fast-read.
> This Kconfig was entirely wrong. I suspect it was there from the old times to
> force-enable the fast read and was meant for simple systems with one SPI NOR.
> Multiplatform kernels weren't taken into consideration here, the thing was added
> 5 years ago.
>
> commit 2230b76b3838a37167f80487c694d8691248da9f
> Date:   Fri Apr 25 12:07:32 2008 +0800
>
>      [MTD] m25p80: add FAST_READ access support to M25Pxx
>
I tried to work around this in my quad patch, where based on some
check, I have tried to assign opcode to quad or fast read. By default, I 
have
kept the command to NORMAL read.
>> However, if we come across SPI controllers which can't handle this, then
>> we might have a problem. Such a situation would really suggest that we
>> need to identify whether a SPI controller supports fast-read, not just
>> the flash device.
> The FAST_READ is entirely flash-device thing, it has nothing to do with the
> controller. I wonder why there's this 50 MHz limit in the kernel config at all.
> My understanding of FAST_READ is that after you send FAST_READ opcode, you can
> read all you want until CS is toggled, only then you can send another opcode.
> The "slow" READ opcode on the other hand has to be sent for each block.
>
I dont think resending commands after each block comes into picture for
slow read. What differnece I see between NORMAL(slow) ad fast read is
just the dummy bytes.
>> (Side note: IMO, given the fact that we have to have an ID table for
>> these flash anyway, the DT property simply provides redundant
>> information.
> Side note: I wonder how we should handle exotic chips like the N25Q256A which
> recycle the ID for different chips with different capabilities though. We might
> need to have some DT props.
>
>> In the case of the quad-read patch, we were able to
>> identify this early to avoid an unnecessary DT binding. But in this
>> case, we also have an indication of controller support for quad I/O...)
> Yes. I see your point why the fast-read might be redundant.
>
>> If you still object to this patch, I can drop the patch from l2-mtd.git
>> for now. Then Sourav will need to rebase his patch again.
>>
>> Brian
