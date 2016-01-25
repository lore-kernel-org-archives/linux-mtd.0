Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNbox-0000oF-CG
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 07:44:21 +0000
Subject: Re: [PATCH v7 2/3] mtd: nand: Qualcomm NAND controller driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1453110634-25995-1-git-send-email-architt@codeaurora.org>
 <1453360399-32029-1-git-send-email-architt@codeaurora.org>
 <1453360399-32029-3-git-send-email-architt@codeaurora.org>
 <20160121095117.3ee2e741@bbrezillon> <56A0AA67.3000407@codeaurora.org>
 <20160121111358.22b65d4a@bbrezillon> <56A0BA60.4010701@codeaurora.org>
 <20160121133632.31dfbcb5@bbrezillon> <56A0D835.7010601@codeaurora.org>
 <20160121142509.03628b04@bbrezillon>
Cc: dehrenberg@google.com, cernekee@gmail.com, sboyd@codeaurora.org,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, computersforpeace@gmail.com
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <56A5D236.4010609@codeaurora.org>
Date: Mon, 25 Jan 2016 13:13:50 +0530
MIME-Version: 1.0
In-Reply-To: <20160121142509.03628b04@bbrezillon>
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



On 1/21/2016 6:55 PM, Boris Brezillon wrote:
> On Thu, 21 Jan 2016 18:38:05 +0530
> Archit Taneja <architt@codeaurora.org> wrote:
>
>>
>>
>> On 01/21/2016 06:06 PM, Boris Brezillon wrote:
>>> On Thu, 21 Jan 2016 16:30:48 +0530
>>> Archit Taneja <architt@codeaurora.org> wrote:
>>>
>>>>
>>>>
>>>> On 01/21/2016 03:43 PM, Boris Brezillon wrote:
>>>>> On Thu, 21 Jan 2016 15:22:39 +0530
>>>>> Archit Taneja <architt@codeaurora.org> wrote:
>>>>>
>>>>>>
>>>>>>
>>>>>> On 01/21/2016 02:21 PM, Boris Brezillon wrote:
>>>>>>> Hi Archit,
>>>>>>>
>>>>>>> On Thu, 21 Jan 2016 12:43:18 +0530
>>>>>>> Archit Taneja <architt@codeaurora.org> wrote:
>>>>>>>
>>>>>>>> The Qualcomm NAND controller is found in SoCs like IPQ806x, MSM7xx,
>>>>>>>> MDM9x15 series.
>>>>>>>>
>>>>>>>> It exists as a sub block inside the IPs EBI2 (External Bus Interface 2)
>>>>>>>> and QPIC (Qualcomm Parallel Interface Controller). These IPs provide a
>>>>>>>> broader interface for external slow peripheral devices such as LCD and
>>>>>>>> NAND/NOR flash memory or SRAM like interfaces.
>>>>>>>>
>>>>>>>> We add support for the NAND controller found within EBI2. For the SoCs
>>>>>>>> of our interest, we only use the NAND controller within EBI2. Therefore,
>>>>>>>> it's safe for us to assume that the NAND controller is a standalone block
>>>>>>>> within the SoC.
>>>>>>>>
>>>>>>>> The controller supports 512B, 2kB, 4kB and 8kB page 8-bit and 16-bit NAND
>>>>>>>> flash devices. It contains a HW ECC block that supports BCH ECC (4, 8 and
>>>>>>>> 16 bit correction/step) and RS ECC(4 bit correction/step) that covers main
>>>>>>>> and spare data. The controller contains an internal 512 byte page buffer
>>>>>>>> to which we read/write via DMA. The EBI2 type NAND controller uses ADM DMA
>>>>>>>> for register read/write and data transfers. The controller performs page
>>>>>>>> reads and writes at a codeword/step level of 512 bytes. It can support up
>>>>>>>> to 2 external chips of different configurations.
>>>>>>>>
>>>>>>>> The driver prepares register read and write configuration descriptors for
>>>>>>>> each codeword, followed by data descriptors to read or write data from the
>>>>>>>> controller's internal buffer. It uses a single ADM DMA channel that we get
>>>>>>>> via dmaengine API. The controller requires 2 ADM CRCIs for command and
>>>>>>>> data flow control. These are passed via DT.
>>>>>>>>
>>>>>>>> The ecc layout used by the controller is syndrome like, but we can't use
>>>>>>>> the standard syndrome ecc ops because of several reasons. First, the amount
>>>>>>>> of data bytes covered by ecc isn't same in each step. Second, writing to
>>>>>>>> free oob space requires us writing to the entire step in which the oob
>>>>>>>> lies. This forces us to create our own ecc ops.
>>>>>>>>
>>>>>>>> One more difference is how the controller accesses the bad block marker.
>>>>>>>> The controller ignores reading the marker when ECC is enabled. ECC needs
>>>>>>>> to be explicity disabled to read or write to the bad block marker. The
>>>>>>>> nand_bbt helpers library hence can't access BBMs for the controller.
>>>>>>>> For now, we skip the creation of BBT and populate chip->block_bad and
>>>>>>>> chip->block_markbad helpers instead.
>>>>>>>>
>>>>>>>> Reviewed-by: Andy Gross <agross@codeaurora.org>
>>>>>>>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>>>>>>>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>>>>>>>
>>>>>>> Sorry, I noticed one more thing in your "bitflips in erased pages"
>>>>>>> handling. Once this is addressed (or explained) you can add my
>>>>>>>
>>>>>>> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>>>>>
>>>>>> Thanks! I've given an explanation below.
>>>>>>
>>>>>>>
>>>>>>>> ---
>>>>>>>> v7:
>>>>>>>>       - Incorporated missing/new comments by Boris
>>>>>>>>       - Cleaned up some strict checkpatch warnings
>>>>>>>>
>>>>>>>> v6:
>>>>>>>>       - Fix up erased page parsing. Use nand_check_erased_ecc_chunk to
>>>>>>>>         return corrected bitflips in an erased page.
>>>>>>>>       - Fix whitespace issues
>>>>>>>>       - Update compatible tring to something more specific
>>>>>>>>
>>>>>>>> v5:
>>>>>>>>       - split chip/controller structs
>>>>>>>>       - simplify layout by considering reserved bytes as part of ECC
>>>>>>>>       - create ecc layouts automatically
>>>>>>>>       - implement block_bad and block_markbad chip ops instead of
>>>>>>>>       - read_oob_raw/write_oob_raw ecc ops to access BBMs.
>>>>>>>>       - Add NAND_SKIP_BBTSCAN flag until we get badblockbits support.
>>>>>>>>       - misc clean ups
>>>>>>>>
>>>>>>>> v4:
>>>>>>>>       - Shrink submit_descs
>>>>>>>>       - add desc list node at the end of dma_prep_desc
>>>>>>>>       - Endianness and warning fixes
>>>>>>>>       - Add Stephen's Signed-off since he provided a patch to fix
>>>>>>>>         endianness problems
>>>>>>>>
>>>>>>>> v3:
>>>>>>>>       - Refactor dma functions for maximum reuse
>>>>>>>>       - Use dma_slave_confing on stack
>>>>>>>>       - optimize and clean upempty_page_fixup using memchr_inv
>>>>>>>>       - ensure portability with dma register reads using le32_* funcs
>>>>>>>>       - use NAND_USE_BOUNCE_BUFFER instead of doing it ourselves
>>>>>>>>       - fix handling of return values of dmaengine funcs
>>>>>>>>       - constify wherever possible
>>>>>>>>       - Remove dependency on ADM DMA in Kconfig
>>>>>>>>       - Misc fixes and clean ups
>>>>>>>>
>>>>>>>> v2:
>>>>>>>>       - Use new BBT flag that allows us to read BBM in raw mode
>>>>>>>>       - reduce memcpy-s in the driver
>>>>>>>>       - some refactor and clean ups because of above changes
>>>>>>>>
>>>>>>>>      drivers/mtd/nand/Kconfig      |    7 +
>>>>>>>>      drivers/mtd/nand/Makefile     |    1 +
>>>>>>>>      drivers/mtd/nand/qcom_nandc.c | 2024 +++++++++++++++++++++++++++++++++++++++++
>>>>>>>>      3 files changed, 2032 insertions(+)
>>>>>>>>      create mode 100644 drivers/mtd/nand/qcom_nandc.c
>>>>>>>>
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000..269d388
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/drivers/mtd/nand/qcom_nandc.c
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +/*
>>>>>>>> + * when using BCH ECC, the HW flags an error in NAND_FLASH_STATUS if it read
>>>>>>>> + * an erased CW, and reports an erased CW in NAND_ERASED_CW_DETECT_STATUS.
>>>>>>>> + *
>>>>>>>> + * when using RS ECC, the HW reports the same erros when reading an erased CW,
>>>>>>>> + * but it notifies that it is an erased CW by placing special characters at
>>>>>>>> + * certain offsets in the buffer.
>>>>>>>> + *
>>>>>>>> + * verify if the page is erased or not, and fix up the page for RS ECC by
>>>>>>>> + * replacing the special characters with 0xff
>>>>>>>> + */
>>>>>>>> +static bool empty_page_fixup(struct qcom_nand_host *host, u8 *data_buf)
>>>>>>>> +{
>>>>>>>> +	struct nand_chip *chip = &host->chip;
>>>>>>>> +	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
>>>>>>>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>>>>>>>> +	struct read_stats *buf;
>>>>>>>> +	int i;
>>>>>>>> +
>>>>>>>> +	buf = (struct read_stats *)nandc->reg_read_buf;
>>>>>>>> +
>>>>>>>> +	for (i = 0; i < ecc->steps; i++, buf++) {
>>>>>>>> +		u32 flash, erased_cw;
>>>>>>>> +		u8 empty1, empty2;
>>>>>>>> +
>>>>>>>> +		flash = le32_to_cpu(buf->flash);
>>>>>>>> +		erased_cw = le32_to_cpu(buf->erased_cw);
>>>>>>>> +
>>>>>>>> +		/*
>>>>>>>> +		 * an erased page flags an error in NAND_FLASH_STATUS, if there
>>>>>>>> +		 * isn't any error, bail out early and report a non-erased
>>>>>>>> +		 * page
>>>>>>>> +		 */
>>>>>>>> +		if (!(flash & FS_OP_ERR))
>>>>>>>> +			break;
>>>>>>>> +
>>>>>>>> +		/*
>>>>>>>> +		 * if BCH is enabled, HW will take care of detecting erased
>>>>>>>> +		 * pages
>>>>>>>> +		 */
>>>>>>>> +		if (host->bch_enabled) {
>>>>>>>> +			/* bail out if we didn't detect an erased CW */
>>>>>>>> +			if ((erased_cw & ERASED_CW) != ERASED_CW)
>>>>>>>> +				break;
>>>>>>>> +		} else {
>>>>>>>> +			/*
>>>>>>>> +			 * if RS ECC is enabled, check if the CW is erased by
>>>>>>>> +			 * looking for 0x54s at offsets 3 and 175
>>>>>>>> +			 */
>>>>>>>> +			empty1 = data_buf[3 + i * host->cw_data];
>>>>>>>> +			empty2 = data_buf[175 + i * host->cw_data];
>>>>>>>> +
>>>>>>>> +			/* bail out if the CW isn't erased */
>>>>>>>> +			if (!(empty1 == 0x54 && empty2 == 0xff) &&
>>>>>>>> +			    !(empty1 == 0xff && empty2 == 0x54))
>>>>>>>> +				break;
>>>>>>>> +		}
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	if (i < ecc->steps)
>>>>>>>> +		return false;
>>>>>>>> +
>>>>>>>> +	if (!host->bch_enabled) {
>>>>>>>> +		/*
>>>>>>>> +		 * fix up the buffer by replacing the magic offsets with
>>>>>>>> +		 * 0xff
>>>>>>>> +		 */
>>>>>>>> +		for (i = 0; i < ecc->steps; i++) {
>>>>>>>> +			data_buf[3 + i * host->cw_data] = 0xff;
>>>>>>>> +			data_buf[175 + i * host->cw_data] = 0xff;
>>>>>>>> +		}
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	return true;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +/*
>>>>>>>> + * reads back status registers set by the controller to notify page read
>>>>>>>> + * errors. this is equivalent to what 'ecc->correct()' would do.
>>>>>>>> + */
>>>>>>>> +static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
>>>>>>>> +			     u8 *oob_buf, bool erased_page)
>>>>>>>> +{
>>>>>>>> +	struct nand_chip *chip = &host->chip;
>>>>>>>> +	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
>>>>>>>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>>>>>>>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>>>>>>>> +	unsigned int max_bitflips = 0;
>>>>>>>> +	struct read_stats *buf;
>>>>>>>> +	int i;
>>>>>>>> +
>>>>>>>> +	buf = (struct read_stats *)nandc->reg_read_buf;
>>>>>>>> +
>>>>>>>> +	for (i = 0; i < ecc->steps; i++, buf++) {
>>>>>>>> +		u32 flash, buffer;
>>>>>>>> +		int data_len, oob_len;
>>>>>>>> +
>>>>>>>> +		if (i == (ecc->steps - 1)) {
>>>>>>>> +			data_len = ecc->size - ((ecc->steps - 1) << 2);
>>>>>>>> +			oob_len = ecc->steps << 2;
>>>>>>>> +		} else {
>>>>>>>> +			data_len = host->cw_data;
>>>>>>>> +			oob_len = 0;
>>>>>>>> +		}
>>>>>>>> +
>>>>>>>> +		flash = le32_to_cpu(buf->flash);
>>>>>>>> +		buffer = le32_to_cpu(buf->buffer);
>>>>>>>> +
>>>>>>>> +		if (flash & (FS_OP_ERR | FS_MPU_ERR)) {
>>>>>>>> +			if (erased_page) {
>>>>>>>> +				int ret, ecclen, extraooblen;
>>>>>>>> +				void *eccbuf;
>>>>>>>> +
>>>>>>>> +				eccbuf = oob_buf ? oob_buf + oob_len : NULL;
>>>>>>>> +				ecclen = oob_buf ? host->ecc_bytes_hw : 0;
>>>>>>>> +				extraooblen = oob_buf ? oob_len : 0;
>>>>>>>> +
>>>>>>>> +				ret = nand_check_erased_ecc_chunk(data_buf,
>>>>>>>> +					data_len, eccbuf, ecclen, oob_buf,
>>>>>>>> +					extraooblen, ecc->strength);
>>>>>>>
>>>>>>> IIUC, the erased_page info is returned by empty_page_fixup() and is
>>>>>>> only set if the page is detected as empty (filled with ff).
>>>>>>> If that's the case, then you don't have to use
>>>>>>> nand_check_erased_ecc_chunk() to check it again...
>>>>>>
>>>>>> empty_page_fixup now doesn't parse the entire page for 0xffs, it just
>>>>>> checks if the correct flags have been raised by the controller hardware,
>>>>>> and replaces the 'special offsets' with 0xffs instead of 0x54s.
>>>>>
>>>>> But didn't you say that those pattern assignment were guaranteeing that
>>>>> the tested chunk is empty? Or am I missing something else?
>>>>
>>>> No, the controller reports 0x54s at special offsets, but we still need
>>>> to parse the entire buffer for 0xffs because the flash user might have
>>>> intentionally placed 0x54 in that offsets.
>>>>
>>>> The previous revisions of the patchset first the changed the
>>>> 0x54s to 0xffs at the special offsets, and then checked if the
>>>> entire page for 0xffs. If any single byte wasn't 0xff, it reported it
>>>> as not empty and replaced the offsets back with 0x54s. For the newer
>>>> IPs, we don't need to read the entirepage, we only need to read a
>>>> bitfield per chunk to be sure.
>>>
>>> Oh, I thought the FS_OP_ERR + 0X54 pattern @3 and 175 were enough to
>>> detect an empty page, but I must have misunderstood your previous
>>> explanations. Anyway, adding an extra nand_check_erased_ecc_chunk()
>>> here shouldn't hurt, so I'm fine with that one.
>>
>> Yeah, we need to check manually too, sadly. Although, since we are sure
>> that it is always 0xffs, I can put the faster memchr_inv func to check
>> if the page is erased.
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>     From what I understood, we still need to parse the chunks to try to
>>>>>> fix 'ecc->strength' number of bitflips.
>>>>>
>>>>> No, if the controller tests and guarantees that a specific page is empty
>>>>> (filled with ff), then we should trust it.
>>>>> I suggested to use nand_check_erased_ecc_chunk() in one of my
>>>>> previous review because I thought the 0x54 detection scheme was not
>>>>> sufficient to detect empty pages, but you said it was, so I trust
>>>>> you ;). And if it's really safe, then we don't need to check again with
>>>>> nand_check_erased_ecc_chunk() here.
>>>>
>>>> Okay. I thought that when NAND controllers report an empty page, there
>>>> can still be bitflips in them once we read it, and that we need to
>>>> use nand_check_erased_ecc_chunk to set those bits back to 1.
>>>
>>> It's really dependent on your NAND controller, so I can't answer that
>>> question for your specific case, but usually NAND controller are able
>>> to detect pages filled with 0xff, but as soon as you have a single
>>> bitflip, the control is passed to the ECC engine which tries to correct
>>> errors (and fails to do it in most cases).
>>
>> Yes, that seems to be the case for this controller.
>>
>>> Some ECC engines are smarter and you can pass them an 'acceptable'
>>> number of bitflips that is used by the "erased page detection" logic.
>>
>> I haven't seen such an 'acceptable' bitfield for this controller.
>>
>>> And other ECC engines take care of xoring the ECC bytes so that it
>>> generates 0xff bytes for empty pages (this solution is the ideal one,
>>> since you're guaranteed to fix bitflips even for the empty/erased page
>>> case).
>>
>> Okay, I doubt that the controller does that here, but I'll go through
>> the docs and verify. Thanks for the explanation.
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> +				if (ret < 0) {
>>>>>>>> +					mtd->ecc_stats.failed++;
>>>>>>>> +				} else {
>>>>>>>> +					mtd->ecc_stats.corrected += ret;
>>>>>>>> +					max_bitflips =
>>>>>>>> +						max_t(unsigned int, max_bitflips, ret);
>>>>>>>> +				}
>>>>>>>> +			} else {
>>>>>>>> +				if (buffer & BS_UNCORRECTABLE_BIT) {
>>>>>>>
>>>>>>> ... here is where you should check if what was detected as
>>>>>>> uncorrectable errors is not in fact some bitflips in an erased page.
>>>>>>
>>>>>> This path will never hit for a page reported as erased by the HW. The
>>>>>> 'else' branch happens only for pages that were reported as 'not erased'
>>>>>> by empty page fixup.
>>>>>>
>>>>>> In other words, the BS_UNCORRECTABLE_BIT register bitfield is never
>>>>>> checked for an erased page. In some experiments I performed, I noticed
>>>>>> that this bitfield was almost always set for an erased page. There is
>>>>>> not point in even checking this field for an erased page.
>>>>>
>>>>> No, my point was that, if you have one or several bitflips in an erased
>>>>> page (which can happen), then your NAND controller will first detect
>>>>> that it's not an empty page (because you have some bits set to zero),
>>>>> and then try to correct the errors with its ECC engine (which will
>>>>> probably fail, unless your controller generate 0xff ECC bytes for an
>>>>> empty page). nand_check_erased_ecc_chunk() has been created exactly for
>>>>> this use case: manually check if a page is 'almost' empty when the ECC
>>>>> engine fails to correct errors.
>>>>
>>>> Okay. I think I understand now :). I thought nand_check_erased_ecc_chunk
>>>> had to be used for pages that were reported as erased, but it is used
>>>> for pages that aren't detected as erased because of some bitflips, and
>>>> we just make sure if it is erased or not.
>>>>
>>>> Should the pseudo code look something like this?
>>>>
>>>> /* ecc->read_page */
>>>> int qcom_nand_read_page(...)
>>>> {
>>>> 	/* read the page */
>>>> 	...
>>>>
>>>> 	erased = empty_page_fixup();
>>>> 	/* we make sure above that the entire page is 0xffs or not */
>>>>
>>>> 	return parse_read_errors(host, erased);
>>>> }
>>>>
>>>> int parse_read_errors(host, erased)
>>>> {
>>>> 	for each chunk {	
>>>> 		if (!erased) {
>>>> 			if (uncorrectable errors) {
>>>> 				ret = nand_check_erased_ecc_chunk();
>>>> 				if (ret < 0) {
>>>> 					/* not an erased page, report */
>>>> 					stats.failed++
>>>> 				} else {
>>>> 					/* 'almost' empty page which
>>>> 					HW couldn't detect as erased */
>>>> 					stats.corrected += ret;
>>>> 				}
>>>> 			} else {
>>>> 				stats.corrected += stat;
>>>> 			}
>>>> 		}
>>>> 	}
>>>> }
>>>
>>> Yep, exactly.
>>
>> Thanks. I'll fix this and test it out.
>
> If you want to check that your "bitflips in erased pages" handling
> is correct, you can try this tool to artificially flip some bits
> [1].
>
> # flash_erase /dev/mtdX Y 1
> # nandflipbits /dev/mtdX 2@<Y>:3@<Y+1>
>

Thanks for the suggestion. I was thinking of running mtd_torturetest
on an eraseblock for a few days and hope for a few bitflips. This
seems much easier :)

Archit

> Best Regards,
>
> Boris
>
> [1]http://lists.infradead.org/pipermail/linux-mtd/2014-November/056634.html
>
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
