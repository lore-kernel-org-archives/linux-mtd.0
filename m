Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Spjss-0007p2-2z
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 17:42:30 +0000
Message-ID: <50005DF0.4070508@freescale.com>
Date: Fri, 13 Jul 2012 12:42:08 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set from
 driver
References: <1342196904-13850-1-git-send-email-computersforpeace@gmail.com>
 <5000589B.3010808@freescale.com>
 <CAN8TOE_MXc7CfSFekJP_ApiOTH6aYS=LaKKk2s80dVqpsJOwaw@mail.gmail.com>
 <201207131935.29169.marex@denx.de>
In-Reply-To: <201207131935.29169.marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie8@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/13/2012 12:35 PM, Marek Vasut wrote:
> Dear Brian Norris,
> 
>> On Fri, Jul 13, 2012 at 10:19 AM, Scott Wood <scottwood@freescale.com> wrote:
>>> On 07/13/2012 12:12 PM, Marek Vasut wrote:
>>>>> The NAND_CHIPOPTIONS_MSK has limited utility and is causing real bugs.
>>>>> It silently masks off at least one flag that might be set by the
>>>>> driver (NAND_NO_SUBPAGE_WRITE). This breaks the GPMI NAND driver and
>>>>> possibly others.
>>>>>
>>>>> Really, as long as driver writers exercise a small amount of care with
>>>>> NAND_* options, this mask is not necessary at all; it was only here to
>>>>> prevent certain options from accidentally being set by the driver. But
>>>>> the original thought turns out to be a bad idea occasionally. Thus,
>>>>> kill it.
>>>>>
>>>>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>>>>> Cc: Huang Shijie <shijie8@gmail.com>
>>>>> Cc: Marek Vasut <marex@denx.de>
>>>>
>>>> [...]
>>>>
>>>> Maybe we should simply split it into two sets of flags to make it clear
>>>> -- chip ones and controller ones ?
>>>
>>> Isn't that what we're trying to get rid of?
> 
> Sure, but aren't there controller specific properties and chip-specific 
> properties?

Yes, but there are some properties than can be specified by either one.
 If you're proposing three sets of options (chip, controller, or both),
or duplicating certain options between the sets and then checking both
everywhere, I don't see how that's an improvement.

> And than even chip-specific state?

Not sure what you mean here.

-Scott
