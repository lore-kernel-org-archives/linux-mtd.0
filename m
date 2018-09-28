Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5nR0-0007TA-QK
 for linux-mtd@lists.infradead.org; Fri, 28 Sep 2018 07:43:36 +0000
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20180927071751.21513-1-daniel@zonque.org>
 <20180927101145.4c2d1159@xps13> <20180927105630.19fc1ff8@bbrezillon>
 <de6fbe4af7904d6db23e42bf3e4e2565@svr-chch-ex1.atlnz.lc>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <9b32fe67-c6fb-5f8c-d97a-4419557e6768@zonque.org>
Date: Fri, 28 Sep 2018 09:43:18 +0200
MIME-Version: 1.0
In-Reply-To: <de6fbe4af7904d6db23e42bf3e4e2565@svr-chch-ex1.atlnz.lc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Chris,

On 27/9/2018 11:55 PM, Chris Packham wrote:
> On 27/09/18 20:56, Boris Brezillon wrote:
>> On Thu, 27 Sep 2018 10:11:45 +0200
>> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>>
>>> Hi Daniel,
>>>
>>> Daniel Mack <daniel@zonque.org> wrote on Thu, 27 Sep 2018 09:17:51
>>> +0200:
>>>
>>>> At least on PXA3xx platforms, enabling RDY interrupts in the NDCR register
>>>> will only cause the IRQ to latch when the RDY lanes are changing, and not
>>>> in case they are already asserted.
>>>>
>>>> This means that if the controller finished the command in flight before
>>>> marvell_nfc_wait_op() is called, that function will wait for a change in
>>>> the bit that can't ever happen as it is already set.
>>>>
>>>> To address this race, check for the RDY bits after the IRQ was enabled,
>>>> and complete the completion immediately if the condition is already met.
>>>>
>>>> This fixes a bug that was observed with a NAND chip that holds a UBIFS
>>>> parition on which file system stress tests were executed. When
>>>> marvell_nfc_wait_op() reports an error, UBI/UBIFS will eventually mount
>>>> the filesystem read-only, reporting lots of warnings along the way.
>>>>
>>>> Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller driver
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>>>> ---
>>>
>>> Sorry I haven't had the time to check on my Armada, but you figured it
>>> out, and the fix looks good to me!
>>>
>>> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>>
>>> Boris, do you plan to send another fixes PR of can I take it into
>>> the nand/next branch?
>>
>> Queued to mtd/master.
> 
> After fixing my R/B configuration I get a new error with this patch when
> running stress_1 from mtd-utils-2.0.0. I don't see this without the patch.

That's strange. So your controller sets the RDY bits before it is ready? 
Could you check whether only checking for NDSR_RDY(0) changes anything? 
Not sure about the handling of NDSR_RDY(1) in this driver anyway ...

Also, does my .EALREADY approach (v1) make any difference?


Thanks,
Daniel
