Received: from 4.mo178.mail-out.ovh.net ([46.105.49.171])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDQAZ-0000ZU-Uv
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 08:30:11 +0000
Received: from player758.ha.ovh.net (unknown [10.109.160.25])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id A39E13859C
 for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2018 10:29:51 +0200 (CEST)
Subject: Re: [PATCH 1/2] mtd: spi-nor: Make SFDP-based 4B_OPCODE support
 detection works correctly
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Cyrille Pitchen - M19942 <cyrille.pitchen@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20181017144424.17554-1-boris.brezillon@bootlin.com>
 <166fc7d5-695f-5c60-be07-c819736a123d@microchip.com>
 <20181019100533.4f8ac8d4@bbrezillon>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <974234d5-3f56-8d6e-557a-42f46948ae75@wedev4u.fr>
Date: Fri, 19 Oct 2018 10:29:38 +0200
MIME-Version: 1.0
In-Reply-To: <20181019100533.4f8ac8d4@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Le 19/10/2018 à 10:05, Boris Brezillon a écrit :
> On Fri, 19 Oct 2018 09:50:31 +0200
> Cyrille Pitchen - M19942 <cyrille.pitchen@microchip.com> wrote:
> 
>> Hi Boris,
>>
>> looks good, just a small remark below:
>>
>> Le 17/10/2018 à 16:44, Boris Brezillon a écrit :
>>> Some flash_info entries have the SPI_NOR_4B_OPCODES to let the core
>>> know that the flash supports 4B opcode. While this solution works fine
>>> for id-based caps detection, it doesn't work that well when relying on
>>> SFDP-based caps detection. Let's add an SNOR_F_4B_OPCODES flag so that
>>> spi_nor_parse_bfpt() can add it when the BFPT_DWORD1_ADDRESS_BYTES
>>> field is set to BFPT_DWORD1_ADDRESS_BYTES_4_ONLY.
>>>
>>> Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 11 ++++++++---
>>>  include/linux/mtd/spi-nor.h   |  1 +
>>>  2 files changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index 9407ca5f9443..85e57e9ea1b5 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -2643,6 +2643,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>>  		break;
>>>  
>>>  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
>>> +		nor->flags |= SNOR_F_4B_OPCODES;  
>>
>> if spi_nor_parse_sdfp() fails, there is a kind of roll-back operation done
>> in spi_nor_init_params() to set the struct spi_nor *nor back to its previous
>> state.
>>
>> 		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
>> 			nor->addr_width = 0;
>> 			nor->mtd.erasesize = 0;
>> 		} else {
>> 			[...]
>>
>> maybe "nor->flags &= ~SNOR_F_4B_OPCODES;" should be added there.
> 
> Actually, it should be
> 
> 	if (!(info->flags & SPI_NOR_4B_OPCODES))
> 		nor->flags &= ~SNOR_F_4B_OPCODES;
> 
> but yes, this is missing. I'll fix that in v3.
> 
>> If this roll-back block grows too much, maybe we could introduce a
>> void spi_nor_roll_back_sfdp(struct spi_nor *nor) function.
>> Also it would make the roll back operation more explicit.
> 
> I'm wondering why we revert everything when a single bit is bit
> reported as inconsistent in the SFDP table? I mean, it's not unusual
> for NOR vendors to make mistake, and we should probably allow
> vendor/chip specific code to fix the SFDP table at runtime instead of
> discarding all the useful information we might have extracted.
>

I tend to agree with you: it would have been better to keep as much
settings as possible. The correct settings of course. The question was
how to decide which settings are correct and which are wrong.
Some might be wrong even if they're semantically correct.

However since we could now use a new fixup mechanism, we can try to statically
fix known issues in SFDP table. For unknown issue dynamically found during
the parsing, maybe we should keep the roll-back mechanism. When the 
fix-up is introduced later for the faulty memory part, we can keep the
relevant settings and discard wrong settings.
Without an explicit fixup, I guess it's hard to know which settings could
be kept, so maybe a roll-back operation is more straight forward solution.

We just have to cross the fingers and pray for faulty SFDP tables not to be
so likely. You know how much I believe in SPI NOR memory manufacturer ;)
 
> Note that we recently introduced such a ->fixup() hook for the ONFI
> param page in the raw NAND framework [1]. 
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mtd/nand/raw?h=v4.19-rc8&id=00ce4e039ad5bded462931606c3063ff691964b7
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
