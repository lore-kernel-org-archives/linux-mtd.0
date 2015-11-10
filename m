Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zw1FP-0000Vj-8r
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 05:13:36 +0000
Subject: Re: [PATCH v4 1/5] mtd: nand: Create a BBT flag to access bad block
 markers in raw mode
To: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-2-git-send-email-architt@codeaurora.org>
 <20151002024434.GC107187@google.com> <20151002082738.1b325860@bbrezillon>
 <20151011200321.GC3696@localhost>
Cc: dehrenberg@google.com, cernekee@gmail.com, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Andrea Scian <andrea.scian@dave.eu>,
 agross@codeaurora.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <56417CE3.9060305@codeaurora.org>
Date: Tue, 10 Nov 2015 10:43:07 +0530
MIME-Version: 1.0
In-Reply-To: <20151011200321.GC3696@localhost>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

On 10/12/2015 01:33 AM, Brian Norris wrote:
> Hi Boris,
>
> On Fri, Oct 02, 2015 at 08:27:38AM +0200, Boris Brezillon wrote:
>> Brian, Archit,
>>
>> On Thu, 1 Oct 2015 19:44:34 -0700
>> Brian Norris <computersforpeace@gmail.com> wrote:
>>
>>> On Wed, Aug 19, 2015 at 10:19:02AM +0530, Archit Taneja wrote:
>>>> Some controllers can access the factory bad block marker from OOB only
>>>> when they read it in raw mode. When ECC is enabled, these controllers
>>>> discard reading/writing bad block markers, preventing access to them
>>>> altogether.
>>>>
>>>> The bbt driver assumes MTD_OPS_PLACE_OOB when scanning for bad blocks.
>>>> This results in the nand driver's ecc->read_oob() op to be called, which
>>>> works with ECC enabled.
>>>>
>>>> Create a new BBT option flag that tells nand_bbt to force the mode to
>>>> MTD_OPS_RAW. This would result in the correct op being called for the
>>>> underlying nand controller driver.
>>
>> Actually I have the same kind of patch in my local tree (for a
>> different reason though: the HW randomizer can mess up with the BBM
>> byte if it's not disabled, and the only way to disable it in my current
>> implementation is to switch to raw mode).
>>
>>>
>>> MTD_OPS_RAW is probably the best way to do this, and we should switch
>>> back to it for all users (rather than a new flag).
>>
>> I'm fine with this solution, but will that be acceptable for everybody?
>> I mean, some NAND controllers are able to protect some OOB bytes, and
>> the BBM might fall in those OOB bytes. In this case, shouldn't we rely
>> on the ECC protection instead of reading the OOB in raw mode?
>
> I think ECC is kind of misused a bit here. It's not really meant for
> protecting BBMs, and it's also really not sufficient, esp. given
> bitflips in erased areas.
>
>>> But to do this, we
>>> need to fix up some things. Particularly, we need to extend
>>> 'badblockbits' support so that it is applied consistently in all places
>>> (I recall there is one code path in which bad block scanning does take
>>> this into account, and one that doesn't.)
>>
>> Yes, IIRC Andrea has posted a patch addressing that problem [1].
>> Another problem I see is that badblockbits is currently assigned a
>> fixed value by the NAND controller driver (or a default value of 8).
>> There's no specific logic to correlate it to the required ECC strength.
>> IMO, we should not let each NAND controller driver decide what is the
>> appropriate value for each chip but rather implement the logic in
>> nand_base.c based on ecc->strength and ecc->size, and IIRC this was
>> the question Andrea asked when he posted his proposal.
>>
>>>
>>> About badblockbits: it allows us to do a relaxed heuristic on matching
>>> bad block markers, where we say the BBM is "bad" if more than fewer than
>>> N bits are '1'. Right now, we just say that if there are any 0 bits in
>>> the Bad Block Marker (BBM) region, then the block is bad. But this is
>>> problematic for pages that have been worn down and might have bitflips.
>>> So right now, part of a (bad) solution is to read with ECC, so worn
>>> blocks that have data won't be later interpreted as bad blocks if we
>>> rescan the BBMs (ECC will correct the bitflips, if the OOB is
>>> protected).
>>>
>>> But that solution is not really good, since ECC is not really a panacea
>>> for misinterpreted BBMs. And HW like yours apparently won't work like
>>> this.
>>
>> Okay, I see you gave pretty much the same explanation, which makes mine
>> useless :-).
>>
>>>
>>> So in summary: if we can consistently make BBM checks look for 6 or 7
>>> "one" bits (rather than a full 8 bits, i.e. BBM == 0xff), then we can
>>> just unconditionally switch to RAW rather than PLACE_OOB. And we don't
>>> need a flag like this pach introduces.
>>
>> I guess it all depends whether we want to let NAND controllers that can
>> protect their BBM keep doing it (which IMO is not such a bad idea).
>
> I think I was the only one consciously trying to do this. (Though I
> guess it's possible some people discreetly hacked it in by not
> supporting raw mode properly.) And for my cases, I'm pretty sure a
> properly-improved raw mode BBM scan would be just as good, or actually
> better. So I'm not sure anyone would really notice if we switched back
> and properly accounted for flips.

Was there any progress on the badblockbits work? I'd seen a thread on
linux-mtd but that had sort of died too.

Brian,

Could we get this driver merged for now without BBT support? In my next
revision, I could populate chip->block_bad and chip->block_markbad
and add NAND_SKIP_BBTSCAN to chip->options. I can remove this once
we have badblockbits support.

Thanks,
Archit

>
> Brian
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
