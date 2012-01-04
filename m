Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
 helo=DB3EHSOBE003.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiYhg-0002kX-6y
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 21:49:01 +0000
Message-ID: <4F04C93C.2090308@freescale.com>
Date: Wed, 4 Jan 2012 15:48:44 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: GPMI-NAND: Wrong ECC size in driver
References: <201201040148.32847.marek.vasut@gmail.com>
 <4F03EA83.9030503@freescale.com> <4F048C99.2010302@freescale.com>
 <201201042232.26781.marek.vasut@gmail.com>
In-Reply-To: <201201042232.26781.marek.vasut@gmail.com>
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

On 01/04/2012 03:32 PM, Marek Vasut wrote:
>> On 01/03/2012 11:58 PM, Huang Shijie wrote:
>>> Hi Marek:
>>>> Hi,
>>>>
>>>> the gpmi-nand.c driver apparently has misconfigured ecc.size field:
>>>>
>>>> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:
>>>> ---------->8 ----------
>>>> 1493         chip->ecc.mode          = NAND_ECC_HW;
>>>> 1494         chip->ecc.size          = 1;
>>>> 1495         chip->ecc.layout        =&gpmi_hw_ecclayout;
>>>> ---------- 8<  ----------
>>
>> [snip]
>>
>>> The gpmi driver does not support the subpage read/write.
>>> I will be happy if the driver works only by setting the
>>> NAND_NO_SUBPAGE_WRITE, without setting the ecc.size.
>>
>> Can we just get rid of NAND_CHIPOPTIONS_MSK and trust that drivers won't
>> set options that aren't appropriate?  Possibly replace it with
>> documentation about which options are for chips, which are for drivers,
>> and which (such as NAND_NO_SUBPAGE_WRITE) can be set by either.
> 
> Rather let's just adjust the mask?

The way the mask is used means that any given option can only be chip or
driver, not both.  Though, I don't see anywhere this option is set by a
chip -- maybe we can just renumber it to be in the controller half.

I still don't see a whole lot of value in the mask, though -- seems to
be just causing problems, especially given that bits set by the "wrong"
component are silently discarded.

-Scott
