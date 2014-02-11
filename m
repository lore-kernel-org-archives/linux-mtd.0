Message-ID: <52FA7D1A.8090408@ti.com>
Date: Tue, 11 Feb 2014 21:42:18 +0200
From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 15/28] Remove TI_AEMIF
References: <1391971686-9517-1-git-send-email-richard@nod.at>
 <1391971686-9517-16-git-send-email-richard@nod.at>
 <1391979242.25855.37.camel@x220> <20140211190404.GI18440@ld-irv-0074>
In-Reply-To: <20140211190404.GI18440@ld-irv-0074>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 Santosh Shilimkar <santosh.shilimkar@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/11/2014 09:04 PM, Brian Norris wrote:
> + Ivan, others
>
> On Sun, Feb 09, 2014 at 09:54:02PM +0100, Paul Bolle wrote:
>> On Sun, 2014-02-09 at 19:47 +0100, Richard Weinberger wrote:
>>> The symbol is an orphan, get rid of it.
>>>
>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>> ---
>>>   drivers/mtd/nand/Kconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>>> index 90ff447..a195d57 100644
>>> --- a/drivers/mtd/nand/Kconfig
>>> +++ b/drivers/mtd/nand/Kconfig
>>> @@ -465,7 +465,7 @@ config MTD_NAND_SH_FLCTL
>>>   
>>>   config MTD_NAND_DAVINCI
>>>           tristate "Support NAND on DaVinci/Keystone SoC"
>>> -        depends on ARCH_DAVINCI || (ARCH_KEYSTONE && TI_AEMIF)
>>> +        depends on ARCH_DAVINCI || ARCH_KEYSTONE
>>>           help
>>>   	  Enable the driver for NAND flash chips on Texas Instruments
>>>   	  DaVinci/Keystone processors.
>> What's strange about the current dependency is that the only aemif code
>> I could find lives at arch/arm/mach-davinci/aemif.c. Is that reachable
>> for code in arch/arm/mach-keystone?
> It looks like I merged this code before the supporting aemif driver [1] was
> merged. I think this is harmless, and so I plan to leave it as-is for
> now. Or if Ivan prefers, I can drop the Keystone dependency entirely
> until it is ready.
>
> https://lkml.org/lkml/2013/11/20/283
>
> Brian

It is harmless.

For Keystone NAND depends on AEMIF.
AEMIF is responsible to set timings.

In case of Davinci the timings are set by arch/arm/mach-davinci/aemif.c.
In case of Keystone the timings are going to be set by AEMIF driver.

AEMIF is going to be merged I hope. That's plan.

So you can leave it.

-- 
Regards,
Ivan Khoronzhuk
