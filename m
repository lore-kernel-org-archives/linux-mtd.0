Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiaZb-0005Cz-1Q
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 23:48:47 +0000
Message-ID: <4F04E558.7000002@freescale.com>
Date: Wed, 4 Jan 2012 17:48:40 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: GPMI-NAND: Wrong ECC size in driver
References: <201201040148.32847.marek.vasut@gmail.com>
 <201201042232.26781.marek.vasut@gmail.com> <4F04C93C.2090308@freescale.com>
 <201201050038.39448.marek.vasut@gmail.com>
In-Reply-To: <201201050038.39448.marek.vasut@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/04/2012 05:38 PM, Marek Vasut wrote:
> Scott Wood wrote:
>> On 01/04/2012 03:32 PM, Marek Vasut wrote:
>>> Scott Wood wrote:
>>>> Can we just get rid of NAND_CHIPOPTIONS_MSK and trust that drivers won't
>>>> set options that aren't appropriate?  Possibly replace it with
>>>> documentation about which options are for chips, which are for drivers,
>>>> and which (such as NAND_NO_SUBPAGE_WRITE) can be set by either.
>>>
>>> Rather let's just adjust the mask?
>>
>> The way the mask is used means that any given option can only be chip or
>> driver, not both.  Though, I don't see anywhere this option is set by a
>> chip -- maybe we can just renumber it to be in the controller half.
> 
> I suspect this was meant to allow controllers where one chip can do subpage-
> write and the other can not.

What I mean is I don't see any place where this is actually used --
gpmi-nand is the only place I see this flag being set (though it belongs
on at least elbc as well).

>> I still don't see a whole lot of value in the mask, though -- seems to
>> be just causing problems, especially given that bits set by the "wrong"
>> component are silently discarded.
> 
> Yes. Patch is welcome to remove it and separate these two ;-)

Do they need to be separated?  Just OR them with no mask.  If either the
controller or the chip set the flag, then it's set, and subpage writes
are disallowed.  Obviously you can only do this for certain types of
options -- for others, just don't set the flag in an inappropriate context.

-Scott
