Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJTYn-0002zv-Es
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2016 22:06:34 +0000
Subject: Re: Adding OTP-only device to MTD or CHAR subsystem?
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Ripard <maxime.ripard@free-electrons.com>
References: <5681C3E4.4090506@broadcom.com> <3668194.4jROlECW6L@wuerfel>
 <5681D4B0.3040804@broadcom.com> <5690EB4D.3080002@linaro.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Brian Norris
 <computersforpeace@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
From: Scott Branden <sbranden@broadcom.com>
Message-ID: <5696CA42.1020903@broadcom.com>
Date: Wed, 13 Jan 2016 14:05:54 -0800
MIME-Version: 1.0
In-Reply-To: <5690EB4D.3080002@linaro.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Srini,

On 16-01-09 03:13 AM, Srinivas Kandagatla wrote:
> Hi Scott,
>
> Sorry for long delay in replying.. :-)
> On 29/12/15 00:32, Scott Branden wrote:
>> +Srinivas/Maxime
>>
>> On 15-12-28 03:38 PM, Arnd Bergmann wrote:
>>> On Monday 28 December 2015 15:21:08 Scott Branden wrote:
>>>> Greg/Brian/Arnd,
>>>>
>>>> We have OTP device drivers for accessing OTP memory in our SoCs.
>>>>
>>>> I looking for the right place and model to place such OTP device
>>>> drivers.
>>>>
>>>> 1) Should we follow the bfin-otp model in drivers/char?  This doesn't
>>>> seem like the right place to put it although following the bfin example
>>>> is quite simple to implement.  We actually had a custom set of Ioctl's
>>>> that I changed to use the standard file access model used by the bfin
>>>> driver.  But a custom util is still needed to issue an OTPLOCK command.
>>>>    I'm guess mtd-utils has such abilities (or should).
>>>>
>>>> 2) Instead, should we start adding OTP-only drivers into the MTD
>>>> subsystem?  Onenand and CFI based MTD devices already have OTP
>>>> programmable regions.  If we created a new OTP device type in the MTD
>>>> subsystem this looks like a good thing to do.  mtd-utils
>>>> could/should be
>>>> used to access the OTP device then along with standard fileio
>>>> operations.
>>>>
>>>> 3) Or some other suggestion of where to place OTP device drivers?
>>>
>>> I think drivers/nvmem is now the right place for this.
>> Thanks for the pointer Arnd.  Too bad an extension wasn't added in MTD
>> but at least there is some sort of a model in place now.  The mtd-abi.h
>> would have been a good thing to use for OTPLOCK as well as the remainder
>> of the functionality in MTD OTP.  The mapping of nvmem to properties to
>> user settings seems like a useful feature though.
>>
>> Hi Srinivas/Maxime,
>> The nvmem drivers don't seem to support row unlocking of OTP.  Having
>> raw write access to the OTP is not a desirable feature.  Are there plans
>> in place to add any additional functionality to the nvm driver model
>> right now?
> NVMEM was started to be simple interface based on regmap, As of today we
> did not have any users which wanted lock feature, but Am open for more
> discussion on this if we want to get this feature via nvmem.
>
> Any ideas and patches are welcome.
Yes, as I move to the nvmem model we will need to look at adding lock 
feature.
>
> Few ideas from my side though,
>  From Kernel side: introduce nvmem_lock()/nvmem_unlock() apis which
> would set the ranges as required, and the providers can use regmap
> callbacks writeable_reg()/readable_reg() in regmap configs to enforce
> the lock range
The bfin-otp in drivers/char already solves this problem and I think we 
should move that functionality over?
>
>  From userspace side, As of today nvmem only provides an binary file
> interface, which we could probably extend to device based and provide
> userspace abi.
The bfin-otp in drivers/char already solves this problem and I think we 
should move that functionality over?

>
> Lets continue discussion !!
>
> --srini
>
>
>
>>>
>>>     Arnd
>>>
>> Regards,
>>   Scott
>
