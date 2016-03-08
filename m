Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adEeV-0000gb-LB
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 10:14:10 +0000
Subject: Re: [PATCH v8 2/3] mtd: nand: Qualcomm NAND controller driver
To: computersforpeace@gmail.com
References: <1453360399-32029-1-git-send-email-architt@codeaurora.org>
 <1454489991-14717-1-git-send-email-architt@codeaurora.org>
 <1454489991-14717-3-git-send-email-architt@codeaurora.org>
 <20160204113938.1317095d@bbrezillon> <56C2C6A2.8030200@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org,
 linux-mtd@lists.infradead.org, andy.gross@linaro.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <56DEA5D3.8060605@codeaurora.org>
Date: Tue, 8 Mar 2016 15:43:39 +0530
MIME-Version: 1.0
In-Reply-To: <56C2C6A2.8030200@codeaurora.org>
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



On 2/16/2016 12:20 PM, Archit Taneja wrote:
> Hi Brian,
>
> On 02/04/2016 04:09 PM, Boris Brezillon wrote:
>> Hi Archit,
>>
>> On Wed,  3 Feb 2016 14:29:50 +0530
>> Archit Taneja <architt@codeaurora.org> wrote:
>>
>>> The Qualcomm NAND controller is found in SoCs like IPQ806x, MSM7xx,
>>> MDM9x15 series.
>>>
>>> It exists as a sub block inside the IPs EBI2 (External Bus Interface 2)
>>> and QPIC (Qualcomm Parallel Interface Controller). These IPs provide a
>>> broader interface for external slow peripheral devices such as LCD and
>>> NAND/NOR flash memory or SRAM like interfaces.
>>>
>>> We add support for the NAND controller found within EBI2. For the SoCs
>>> of our interest, we only use the NAND controller within EBI2. Therefore,
>>> it's safe for us to assume that the NAND controller is a standalone
>>> block
>>> within the SoC.
>>>
>>> The controller supports 512B, 2kB, 4kB and 8kB page 8-bit and 16-bit
>>> NAND
>>> flash devices. It contains a HW ECC block that supports BCH ECC (4, 8
>>> and
>>> 16 bit correction/step) and RS ECC(4 bit correction/step) that covers
>>> main
>>> and spare data. The controller contains an internal 512 byte page buffer
>>> to which we read/write via DMA. The EBI2 type NAND controller uses
>>> ADM DMA
>>> for register read/write and data transfers. The controller performs page
>>> reads and writes at a codeword/step level of 512 bytes. It can
>>> support up
>>> to 2 external chips of different configurations.
>>>
>>> The driver prepares register read and write configuration descriptors
>>> for
>>> each codeword, followed by data descriptors to read or write data
>>> from the
>>> controller's internal buffer. It uses a single ADM DMA channel that
>>> we get
>>> via dmaengine API. The controller requires 2 ADM CRCIs for command and
>>> data flow control. These are passed via DT.
>>>
>>> The ecc layout used by the controller is syndrome like, but we can't use
>>> the standard syndrome ecc ops because of several reasons. First, the
>>> amount
>>> of data bytes covered by ecc isn't same in each step. Second, writing to
>>> free oob space requires us writing to the entire step in which the oob
>>> lies. This forces us to create our own ecc ops.
>>>
>>> One more difference is how the controller accesses the bad block marker.
>>> The controller ignores reading the marker when ECC is enabled. ECC needs
>>> to be explicity disabled to read or write to the bad block marker. The
>>> nand_bbt helpers library hence can't access BBMs for the controller.
>>> For now, we skip the creation of BBT and populate chip->block_bad and
>>> chip->block_markbad helpers instead.
>>>
>>> Reviewed-by: Andy Gross <agross@codeaurora.org>
>>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>>> ---
>>> v8:
>>>    - Use nand_check_erased_ecc_chunk in the right manner as
>>>      suggested by Boris (place the check when we see uncorrectable
>>>      errors).
>>>    - Rewrite the empty_page_fixup code such that we check for a
>>>      codeword being erased rather than the entire page. This simplifies
>>>      the code and we can now place it in parse_read_errors().
>>>    - Introduce raw page access functions. This results in making some
>>>      modifications in the existing ECC page access ops too, since the
>>>      layout now also considers the real/dummy bad block markers.
>>> Explained
>>>      in comments.
>>>
>>> v7:
>>>    - Incorporated missing/new comments by Boris
>>>    - Cleaned up some strict checkpatch warnings
>>>
>>> v6:
>>>    - Fix up erased page parsing. Use nand_check_erased_ecc_chunk to
>>>      return corrected bitflips in an erased page.
>>>    - Fix whitespace issues
>>>    - Update compatible tring to something more specific
>>>
>>> v5:
>>>    - split chip/controller structs
>>>    - simplify layout by considering reserved bytes as part of ECC
>>>    - create ecc layouts automatically
>>>    - implement block_bad and block_markbad chip ops instead of
>>>    - read_oob_raw/write_oob_raw ecc ops to access BBMs.
>>>    - Add NAND_SKIP_BBTSCAN flag until we get badblockbits support.
>>>    - misc clean ups
>>>
>>> v4:
>>>    - Shrink submit_descs
>>>    - add desc list node at the end of dma_prep_desc
>>>    - Endianness and warning fixes
>>>    - Add Stephen's Signed-off since he provided a patch to fix
>>>      endianness problems
>>>
>>> v3:
>>>    - Refactor dma functions for maximum reuse
>>>    - Use dma_slave_confing on stack
>>>    - optimize and clean upempty_page_fixup using memchr_inv
>>>    - ensure portability with dma register reads using le32_* funcs
>>>    - use NAND_USE_BOUNCE_BUFFER instead of doing it ourselves
>>>    - fix handling of return values of dmaengine funcs
>>>    - constify wherever possible
>>>    - Remove dependency on ADM DMA in Kconfig
>>>    - Misc fixes and clean ups
>>>
>>> v2:
>>>    - Use new BBT flag that allows us to read BBM in raw mode
>>>    - reduce memcpy-s in the driver
>>>    - some refactor and clean ups because of above changes
>>>
>>>   drivers/mtd/nand/Kconfig      |    7 +
>>>   drivers/mtd/nand/Makefile     |    1 +
>>>   drivers/mtd/nand/qcom_nandc.c | 2224
>>> +++++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 2232 insertions(+)
>>>   create mode 100644 drivers/mtd/nand/qcom_nandc.c
>>>
>>
>> [...]
>>
>>> +static int qcom_nand_host_setup(struct qcom_nand_host *host)
>>> +{
>>> +    struct nand_chip *chip = &host->chip;
>>> +    struct mtd_info *mtd = nand_to_mtd(chip);
>>> +    struct nand_ecc_ctrl *ecc = &chip->ecc;
>>> +    struct qcom_nand_controller *nandc =
>>> get_qcom_nand_controller(chip);
>>> +    int cwperpage, bad_block_byte;
>>> +    bool wide_bus;
>>> +    int ecc_mode = 1;
>>> +
>>> +    /*
>>> +     * the controller requires each step consists of 512 bytes of data.
>>> +     * bail out if DT has populated a wrong step size.
>>> +     */
>>> +    if (ecc->size != NANDC_STEP_SIZE) {
>>> +        dev_err(nandc->dev, "invalid ecc size\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
>>> +
>>> +    if (ecc->strength >= 8) {
>>> +        /* 8 bit ECC defaults to BCH ECC on all platforms */
>>> +        host->bch_enabled = true;
>>> +        ecc_mode = 1;
>>> +
>>> +        if (wide_bus) {
>>> +            host->ecc_bytes_hw = 14;
>>> +            host->spare_bytes = 0;
>>> +            host->bbm_size = 2;
>>> +        } else {
>>> +            host->ecc_bytes_hw = 13;
>>> +            host->spare_bytes = 2;
>>> +            host->bbm_size = 1;
>>> +        }
>>> +    } else {
>>> +        /*
>>> +         * if the controller supports BCH for 4 bit ECC, the controller
>>> +         * uses lesser bytes for ECC. If RS is used, the ECC bytes is
>>> +         * always 10 bytes
>>> +         */
>>> +        if (nandc->ecc_modes & ECC_BCH_4BIT) {
>>> +            /* BCH */
>>> +            host->bch_enabled = true;
>>> +            ecc_mode = 0;
>>> +
>>> +            if (wide_bus) {
>>> +                host->ecc_bytes_hw = 8;
>>> +                host->spare_bytes = 2;
>>> +                host->bbm_size = 2;
>>> +            } else {
>>> +                host->ecc_bytes_hw = 7;
>>> +                host->spare_bytes = 4;
>>> +                host->bbm_size = 1;
>>> +            }
>>> +        } else {
>>> +            /* RS */
>>> +            host->ecc_bytes_hw = 10;
>>> +
>>> +            if (wide_bus) {
>>> +                host->spare_bytes = 0;
>>> +                host->bbm_size = 2;
>>> +            } else {
>>> +                host->spare_bytes = 1;
>>> +                host->bbm_size = 1;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    /*
>>> +     * we consider ecc->bytes as the sum of all the non-data content
>>> in a
>>> +     * step. It gives us a clean representation of the oob area
>>> (even if
>>> +     * all the bytes aren't used for ECC).It is always 16 bytes for
>>> 8 bit
>>> +     * ECC and 12 bytes for 4 bit ECC
>>> +     */
>>> +    ecc->bytes = host->ecc_bytes_hw + host->spare_bytes +
>>> host->bbm_size;
>>> +
>>> +    ecc->read_page        = qcom_nandc_read_page;
>>> +    ecc->read_page_raw    = qcom_nandc_read_page_raw;
>>> +    ecc->read_oob        = qcom_nandc_read_oob;
>>> +    ecc->write_page        = qcom_nandc_write_page;
>>> +    ecc->write_page_raw    = qcom_nandc_write_page_raw;
>>> +    ecc->write_oob        = qcom_nandc_write_oob;
>>
>> You should probably also implement ->{read, write}_oob_raw(), otherwise
>> the core set them to ecc->{read, write}_oob(), which is not exactly the
>> same. Anyway, let's keep that as things that as future improvements.
>> The rest looks good to me.
>>
>> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> If the patchset looks okay to you, could you please take this for the
> 4.6 merge window?

Ping

Archit

>
> Thanks,
> Archit
>
>>
>> Thanks for your patience, and all the reworks you've done.
>>
>> Best Regards,
>>
>> Boris
>>
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
