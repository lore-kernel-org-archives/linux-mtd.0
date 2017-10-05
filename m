Received: from mo1501.tsb.2iij.net ([210.149.48.173] helo=mo.tsb.2iij.net)
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e00WZ-0002DW-St
 for linux-mtd@lists.infradead.org; Thu, 05 Oct 2017 07:24:53 +0000
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Subject: Re: [PATCH -next v2] mtd: nand: Add support for Toshiba BENAND
 (Built-in ECC NAND)
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
References: <1505971922-4994-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <20170921092849.6f1ba4b8@bbrezillon>
 <34d612f6-a479-21e7-f0aa-734e647d5942@toshiba.co.jp>
 <20170926231549.40c09c5d@bbrezillon>
Message-ID: <fa307950-6085-acf9-aae3-725b9c2a60af@toshiba.co.jp>
Date: Thu, 5 Oct 2017 16:24:08 +0900
MIME-Version: 1.0
In-Reply-To: <20170926231549.40c09c5d@bbrezillon>
Content-Type: text/plain; charset=utf-8
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

On 2017/09/27 6:15, Boris Brezillon wrote:
> On Tue, 26 Sep 2017 18:18:04 +0900
> KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:
> 
>> On 2017/09/21 16:28, Boris Brezillon wrote:
>>> On Thu, 21 Sep 2017 14:32:02 +0900
>>> KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:
>>>   
>>>> This patch enables support for Toshiba BENAND.
>>>> The current implementation does not support vondor specific command  
>>>
>>> 					       ^ vendor
>>>   
>>>> TOSHIBA_NAND_CMD_ECC_STATUS. I would like to add the command, when
>>>> the exec_op() [1] infrastructure is implemented.  
>>>
>>> It's not a good idea to reference a branch that is likely to disappear
>>> in a commit message. Just say that you can't properly support the
>>> TOSHIBA_NAND_CMD_ECC_STATUS operation right and that it might be
>>> addressed in the future.  
>>
>> Thanks. I'll change the comment.
>>
>>>> +	 */
>>>> +	if (status & NAND_STATUS_FAIL) {
>>>> +		/* uncorrectable */
>>>> +		mtd->ecc_stats.failed++;
>>>> +	} else if (status & TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED) {
>>>> +		/* correctable */
>>>> +		max_bitflips = mtd->bitflip_threshold;
>>>> +		mtd->ecc_stats.corrected += max_bitflips;
>>>> +	}  
>>>
>>> Is this working correctly when you read more than one ECC chunk? The
>>> ECC step size is 512 bytes and the page is bigger than that, which means
>>> you have more than one ECC chunk per page. What happens to the
>>> NAND_STATUS_FAIL flag if the first chunk is uncorrectable but
>>> following ones are correctable (or do not contain bitflips at all)?   
>>
>> As you mentioned, the ECC step size is 512 byte. But when 0x70 command is used
>> a simplified ECC status per page is generated.
> 
> I'm fine with that as long as uncorrectable errors are detected
> correctly and TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED is set as soon as
> one of the ECC chunk exposes too many bitflips.
> 
>> In case the first chunk is uncorrectable but the following ones are correctable,
>> the 0x70 command can only check the status of the uncorrectable one.
> 
> Sounds good.
> 
>> Each ECC chunk status can be checked by using the 0x7A command.
>>
>>>> @@ -39,9 +105,43 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
>>>>  
>>>>  static int toshiba_nand_init(struct nand_chip *chip)
>>>>  {
>>>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>>>> +
>>>>  	if (nand_is_slc(chip))
>>>>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
>>>>  
>>>> +	if (nand_is_slc(chip) && (chip->id.data[4] & 0x80)) {
>>>> +		/* BENAND */
>>>> +
>>>> +		/*
>>>> +		 * We can't disable the internal ECC engine, the user
>>>> +		 * has to use on-die ECC, there is no alternative.
>>>> +		 */
>>>> +		if (chip->ecc.mode != NAND_ECC_ON_DIE) {
>>>> +			pr_err("On-die ECC should be selected.\n");
>>>> +			return -EINVAL;
>>>> +		}  
>>>
>>> According to your previous explanation that's not exactly true. Since
>>> ECC bytes are stored in a separate area, the user can decide to use
>>> another mode without trouble. Just skip the BENAND initialization when
>>> mode != NAND_ECC_ON_DIE and we should be good, or am I missing something?  
>>
>> I am asking to product department to confirm it.
> 
> I'm almost sure this is the case ;-).

According to the command sequence written in BENAND's datasheet, the status
of the internal ECC must be checked after reading. To do that, ecc.mode has been
set to NAND_ECC_ON_DIE and the status of the internal ECC is checked through 
the 0x70 or 0x7A command. That's the reason we are returning EINVAL here.

-- Yoshi
