Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDiDw-0005sP-8T
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2015 00:33:12 +0000
Subject: Re: Adding OTP-only device to MTD or CHAR subsystem?
To: Arnd Bergmann <arnd@arndb.de>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Maxime Ripard
 <maxime.ripard@free-electrons.com>
References: <5681C3E4.4090506@broadcom.com> <3668194.4jROlECW6L@wuerfel>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Brian Norris
 <computersforpeace@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
From: Scott Branden <sbranden@broadcom.com>
Message-ID: <5681D4B0.3040804@broadcom.com>
Date: Mon, 28 Dec 2015 16:32:48 -0800
MIME-Version: 1.0
In-Reply-To: <3668194.4jROlECW6L@wuerfel>
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

+Srinivas/Maxime

On 15-12-28 03:38 PM, Arnd Bergmann wrote:
> On Monday 28 December 2015 15:21:08 Scott Branden wrote:
>> Greg/Brian/Arnd,
>>
>> We have OTP device drivers for accessing OTP memory in our SoCs.
>>
>> I looking for the right place and model to place such OTP device drivers.
>>
>> 1) Should we follow the bfin-otp model in drivers/char?  This doesn't
>> seem like the right place to put it although following the bfin example
>> is quite simple to implement.  We actually had a custom set of Ioctl's
>> that I changed to use the standard file access model used by the bfin
>> driver.  But a custom util is still needed to issue an OTPLOCK command.
>>    I'm guess mtd-utils has such abilities (or should).
>>
>> 2) Instead, should we start adding OTP-only drivers into the MTD
>> subsystem?  Onenand and CFI based MTD devices already have OTP
>> programmable regions.  If we created a new OTP device type in the MTD
>> subsystem this looks like a good thing to do.  mtd-utils could/should be
>> used to access the OTP device then along with standard fileio operations.
>>
>> 3) Or some other suggestion of where to place OTP device drivers?
>
> I think drivers/nvmem is now the right place for this.
Thanks for the pointer Arnd.  Too bad an extension wasn't added in MTD 
but at least there is some sort of a model in place now.  The mtd-abi.h 
would have been a good thing to use for OTPLOCK as well as the remainder 
of the functionality in MTD OTP.  The mapping of nvmem to properties to 
user settings seems like a useful feature though.

Hi Srinivas/Maxime,
The nvmem drivers don't seem to support row unlocking of OTP.  Having 
raw write access to the OTP is not a desirable feature.  Are there plans 
in place to add any additional functionality to the nvm driver model 
right now?
>
> 	Arnd
>
Regards,
  Scott
