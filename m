Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9VBT-0003sl-Cg
 for linux-mtd@lists.infradead.org; Thu, 17 Dec 2015 09:49:19 +0000
Subject: Re: [PATCH v4 2/5] mtd: nand: Qualcomm NAND controller driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-3-git-send-email-architt@codeaurora.org>
 <20151216101547.74c77bdd@bbrezillon> <567151BC.7010508@codeaurora.org>
 <20151216151856.0315214c@bbrezillon>
Cc: dehrenberg@google.com, cernekee@gmail.com, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, computersforpeace@gmail.com,
 agross@codeaurora.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <567284FE.1000504@codeaurora.org>
Date: Thu, 17 Dec 2015 15:18:46 +0530
MIME-Version: 1.0
In-Reply-To: <20151216151856.0315214c@bbrezillon>
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



On 12/16/2015 07:48 PM, Boris Brezillon wrote:
> On Wed, 16 Dec 2015 17:27:48 +0530
> Archit Taneja <architt@codeaurora.org> wrote:
>
>>>> +/*
>>>> + * NAND controller page layout info
>>>> + *
>>>> + * |-----------------------|	  |---------------------------------|
>>>> + * |		xx.......xx|	  |		*********xx.......xx|
>>>> + * |	DATA	xx..ECC..xx|	  |	DATA	**SPARE**xx..ECC..xx|
>>>> + * |   (516)	xx.......xx|	  |  (516-n*4)	**(n*4)**xx.......xx|
>>>> + * |		xx.......xx|	  |		*********xx.......xx|
>>>> + * |-----------------------|	  |---------------------------------|
>>>> + *     codeword 1,2..n-1			codeword n
>>>> + *  <---(528/532 Bytes)---->	   <-------(528/532 Bytes)---------->
>>>> + *
>>>> + * n = number of codewords in the page
>>>> + * . = ECC bytes
>>>> + * * = spare bytes
>>>> + * x = unused/reserved bytes
>>>> + *
>>>> + * 2K page: n = 4, spare = 16 bytes
>>>> + * 4K page: n = 8, spare = 32 bytes
>>>> + * 8K page: n = 16, spare = 64 bytes
>>>
>>> Is there a reason not to use the following layout?
>>>
>>> (
>>> n x (
>>> 	data = 512 bytes
>>> 	protected OOB data = 4 bytes
>>> 	ECC bytes = 12 or 16
>>> )
>>>
>>> +
>>>
>>> remaining unprotected OOB bytes
>>> )
>>>
>>> This way the ECC layout definition would be easier to define, and
>>> you'll have something that is closer to what a NAND chip expect (ECC
>>> block/step size of 512 or 1024).
>>>
>>> I know this is also dependent on the bootloader, hence my question.
>>
>> I tried to figure this out looking at documentation and the downstream
>> drivers. What I understood was that all the OOB was intentionally kept
>> in the last step, so that things are faster when we only want to access
>> OOB. In that case, the controller will need to write to only one
>> step/codeword.
>
> Well, I don't think sending a column change command is that costly
> compared to a page retrieval command or ECC calculation.

Yeah, that's probably true. Although, for this controller, we have
a fixed behavior: if you read a step within a page, the controller
reads the entire 516 bytes into its internal buffer. In other words, the 
controller would need to read the entire page for just 16 bytes
of free OOB if we have the standard ECC layout.



>
>>
>> The bootloaders also use the same layout.
>
> Ok, then I guess we'll have to live with that (but it complicates a lot
> the driver logic :-/)

Yeah, it does :/

The controller does support a mode (where free OOB isn't protected by 
ECC). In that case, the flash layout is similar to the one you
mentioned. But again, if the bootloaders use the weird layout, then
we don't have much choice.

>
>>
>>>
>>>> + *
>>>> + * the qcom nand controller operates at a sub page/codeword level. each
>>>> + * codeword is 528 and 532 bytes for 4 bit and 8 bit ECC modes respectively.
>>>> + * the number of ECC bytes vary based on the ECC strength and the bus width.
>>>> + *
>>>> + * the first n - 1 codewords contains 516 bytes of user data, the remaining
>>>> + * 12/16 bytes consist of ECC and reserved data. The nth codeword contains
>>>> + * both user data and spare(oobavail) bytes that sum up to 516 bytes.
>>>> + *
>>>> + * the layout described above is used by the controller when the ECC block is
>>>> + * enabled. When we read a page with ECC enabled, the unused/reserved bytes are
>>>> + * skipped and not copied to our internal buffer. therefore, the nand_ecclayout
>>>> + * layouts defined below doesn't consider the positions occupied by the reserved
>>>> + * bytes
>>>
>>> You could just read this portion with the ECC engine disabled when
>>> you're asked for OOB data.
>>
>> Yes, but there are ecc ops (like ecc->read_page/ecc->write_page) that
>> have an argument called 'oob_required'. We need to have ECC enabled when
>> running these ops.
>>
>> In order to read this additional portion, I'll need to read/write each
>> step again with ECC disabled, which would really slow things down.
>
> Nowadays, MTD FS are not using the OOB area, and oob_required is only
> passed if the MTD user asked for OOB data, so that can be an acceptable
> penalty. Anyway, that's not really important if we loose a few OOB
> bytes.

Ah, okay.

>
>>
>>>
>>>> + *
>>>> + * when the ECC block is disabled, one unused byte (or two for 16 bit bus width)
>>>> + * in the last codeword is the position of bad block marker. the bad block
>>>> + * marker cannot be accessed when ECC is enabled.
>>>
>>> So, you're switching the BBM with the data at the BBM position
>>> (possibly some in-band data), right?
>>
>> Yes. When ECC isn't enabled, the BBM byte lies within the in-band data
>> of the last step. In fact, there are dummy BBM bytes in the previous
>> steps at the same offset.
>>
>> With ECC enabled, the controller just skips that position (and the
>> dummy BBM bytes in previous steps) altogether.
>
> Okay.
>
>>
>>>
>>>> + *
>>>> + */
>>>> +
>>>> +/*
>>>> + * Layouts for different page sizes and ecc modes. We skip the eccpos field
>>>> + * since it isn't needed for this driver
>>>> + */
>>>
>>> If you know where they are stored, please specify them, even if they
>>> are not used by the upper layers (this helps analyzing raw nand dumps).
>>>
>>>> +
>>>> +/* 2K page, 4 bit ECC */
>>>> +static struct nand_ecclayout layout_oob_64 = {
>>>> +	.eccbytes	= 40,
>>>> +	.oobfree	= {
>>>> +				{ 30, 16 },
>>>> +			  },
>>>> +};
>>>
>>> According to your description it should either be eccbytes = 48 (if
>>> you're considering reserved bytes as ECC bytes) or 32 (if you're not
>>> counting reserved bytes).
>>
>> Each step is 528 bytes in total. The first 3 steps contain 516 bytes
>> of data, 10 bytes of ECC and 2 bytes of resrved data. The last step
>> contains 500 bytes of data, 16 bytes of OOB, 10 bytes of ECC and 2
>> reserved bytes.
>>
>> If I don't count the reserved bytes as part of ECC, I get 40. If I
>> do count it as part of ECC, I get 48. In the way I described
>> layouts, I ignored the ECC parts. How did you get 32?
>
>  From the ecc.bytes value you're filling in qcom_nandc_pre_init(). Just
> multiplied it by 4 (the number of ECC steps).

Oh, sorry, I didn't point that earlier, but this controller only 
supports Reed Solomon for 4 bit ECC. That requires 10 bytes per step.

>
> And here is where weird things happen: you're setting ecc.size to 512
> and ecc.strength to 4. But in reality, what you have is 4bits/516bytes
> for the first 3 blocks, and 4bits/500bytes for the last one.
> You're not only fooling the MTD user when faking a 4bits/512byte
> strength, you're also sightly modifying the logic supposed to detect
> the maximum number of bitflips found in a page.
>
> This being said, I understand your constraints, just trying to explain
> why we're trying to use the symmetric ECC block size.

You're right. The lack of symmetry does cause complications. I can try
to report this for the future, so that the people deciding the layouts
keep this in mind.

>
>>
>>>
>>> BTW, is the oobfree portion really starting at offset 30?
>>
>> I thought the offsets mentioned here also had to incorporate positions
>> taken by ECC bytes? If I strip all the the in-band data (real data)
>> from each step, we get:
>>
>> ECC(10 bytes).ECC(10 bytes).ECC(10 bytes).OOB(16 bytes).ECC(10 bytes)
>>
>> Wouldn't this result in the offset as 30?
>
> Yep, as I said I thought it was 32 because of what you put in ecc.size.
> And, you're putting OOB bytes before the last chunk of ECC bytes,
> because they are protected, right?

Yes.

>
> Note that you could put the oobfree area at the end of the OOB area,
> since this 10-10-10-16-10 representation is already a virtual
> representation of the OOB area (ECC bytes are actually interleaved with
> in-band data on the flash).

But, when I read from the controller's internal buffer via DMA, I first
get the oobfree area, and only then the last step's ECC bytes. So, the 
content in chip->oob_poi is in the same order as mentioned
above (10-10-10-16-10).

If the upper layers uses MTD_OPS_AUTO_OOB, and if I have a different
layout as what it is in the oob_poi buffer, then it'll end up
reading/writing the wrong bytes in nand_transfer_oob/nand_fill_oob.

Are you suggesting that I modify the contents of oob_poi by hand such
that it has a cleaner 10-10-10-10-16 representation?

>
>>
>> We are still only taking into account 56 bytes out of the 64 bytes
>> in the chip's OOB. This is because I'm discaring the 2 bytes from
>> each step (summing up to 8) which aren't accessible when ECC is
>> enabled.
>
> Okay. As said above, those two bytes could be exposed without two much
> overhead for most operations, but that's your call to make.

When I read the oob regions into a buffer via DMA, I get a total of 56
bytes. For the extra 8 bytes, I will have to insert 2 dummy bytes 
manually for each step by hand. If I don't, then I'll end up messing
what I read/write to oob.

Are you suggesting I do that? It will make the code slightly more messy,
but as you said, at least give a more clearer description of the layout.

>
>>
>>
>>> I'd say that in the 2K page, 4 bit ECC you don't have any oobfree bytes
>>> (528 * 4 == 2048 + 64).
>>
>> 528 contains both oob and in-band data. If you ignore the weird layout
>> and assume we have at an average 512 bytes for each step, we get:
>>
>> 512 * 4 == 2048 bytes of data, and 64 bytes of OOB (16 bytes free, 40
>> ECC, and 8 reserved/unused).
>
> Okay. Still think the ECC block asymmetry is not a good idea, but I get
> your point ;-).

haha yeah, I don't think it's a good idea either :p. Sadly, we're stuck
with it.

>
>>
>>>
>>>> +
>>>> +/* 4K page, 4 bit ECC, 8/16 bit bus width */
>>>> +static struct nand_ecclayout layout_oob_128 = {
>>>> +	.eccbytes	= 80,
>>>> +	.oobfree	= {
>>>> +				{ 70, 32 },
>>>> +			  },
>>>> +};
>>>> +
>>>> +/* 4K page, 8 bit ECC, 8 bit bus width */
>>>> +static struct nand_ecclayout layout_oob_224_x8 = {
>>>> +	.eccbytes	= 104,
>>>> +	.oobfree	= {
>>>> +				{ 91, 32 },
>>>> +			  },
>>>> +};
>>>> +
>>>> +/* 4K page, 8 bit ECC, 16 bit bus width */
>>>> +static struct nand_ecclayout layout_oob_224_x16 = {
>>>> +	.eccbytes	= 112,
>>>> +	.oobfree	= {
>>>> +				{ 98, 32 },
>>>> +			  },
>>>> +};
>>>> +
>>>> +/* 8K page, 4 bit ECC, 8/16 bit bus width */
>>>> +static struct nand_ecclayout layout_oob_256 = {
>>>> +	.eccbytes	= 160,
>>>> +	.oobfree	= {
>>>> +				{ 151, 64 },
>>>> +			  },
>>>> +};
>>>
>>> Those ECC layout definitions could probably be dynamically created
>>> based on the detected ECC strength, bus-width and page size, instead of
>>> defining a new one for each new combination.
>>
>> That's true. I can try that out.
>
> Cool.
>
>>
>>>
>>>> +
>>>> +/*
>>>> + * this is called before scan_ident, we do some minimal configurations so
>>>> + * that reading ID and ONFI params work
>>>> + */
>>>> +static void qcom_nandc_pre_init(struct qcom_nandc_data *this)
>>>> +{
>>>> +	/* kill onenand */
>>>> +	nandc_write(this, SFLASHC_BURST_CFG, 0);
>>>> +
>>>> +	/* enable ADM DMA */
>>>> +	nandc_write(this, NAND_FLASH_CHIP_SELECT, DM_EN);
>>>> +
>>>> +	/* save the original values of these registers */
>>>> +	this->cmd1 = nandc_read(this, NAND_DEV_CMD1);
>>>> +	this->vld = nandc_read(this, NAND_DEV_CMD_VLD);
>>>> +
>>>> +	/* initial status value */
>>>> +	this->status = NAND_STATUS_READY | NAND_STATUS_WP;
>>>> +}
>>>> +
>>>> +static int qcom_nandc_ecc_init(struct qcom_nandc_data *this)
>>>> +{
>>>> +	struct mtd_info *mtd = &this->mtd;
>>>> +	struct nand_chip *chip = &this->chip;
>>>
>>> 	struct nand_chip *chip = &this->chip;
>>> 	struct mtd_info *mtd = nand_to_mtd(chip);
>>>
>>>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>>>> +	int cwperpage;
>>>> +	bool wide_bus;
>>>> +
>>>> +	/* the nand controller fetches codewords/chunks of 512 bytes */
>>>> +	cwperpage = mtd->writesize >> 9;
>>>> +
>>>> +	ecc->strength = this->ecc_strength;
>>>> +
>>>> +	wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
>>>> +
>>>> +	if (ecc->strength >= 8) {
>>>> +		/* 8 bit ECC defaults to BCH ECC on all platforms */
>>>> +		ecc->bytes = wide_bus ? 14 : 13;
>>>
>>> Maybe you'd better consider that reserved bytes (after the ECC bytes)
>>> are actually ECC bytes. So, according to your description you would
>>> always have 16 here.
>>
>> The thing is that if I consider the reserved bytes as a part of the ECC
>> bytes, and if I use this bigger value when configuring the controller
>> and dma, I will get bad results; becase the hardware doesn't touch these
>> when ECC is enabled.
>
> You should at least be consistent with what you put in your ECC layout.
> Choose one solution and stick to it. Since reserved bytes are not
> accessible I would suggest to count them in the number of ECC bytes.
>
>>
>> I could set the ecc->bytes to '16' and still use the actual values when
>> configuring the controller. Do you think that will help in any way?
>
> You can have you own private field(s) to store you controller config,
> if that helps, or create a function which would convert ecc.bytes into
> something appropriate.

Right. Got it.

Thanks,
Archit

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
