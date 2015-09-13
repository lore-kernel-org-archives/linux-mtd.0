Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zb7YU-0008Ag-Gu
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2015 13:42:55 +0000
Subject: Re: [PATCH v4 2/5] mtd: nand: Qualcomm NAND controller driver
To: linux-mtd@lists.infradead.org, computersforpeace@gmail.com
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-3-git-send-email-architt@codeaurora.org>
 <20150826233752.GU19120@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, dehrenberg@google.com,
 cernekee@gmail.com, linux-arm-msm@vger.kernel.org, agross@codeaurora.org,
 linux-kernel@vger.kernel.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <55F57D42.10802@codeaurora.org>
Date: Sun, 13 Sep 2015 19:12:26 +0530
MIME-Version: 1.0
In-Reply-To: <20150826233752.GU19120@codeaurora.org>
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


On 8/27/2015 5:07 AM, Stephen Boyd wrote:
> On 08/19, Archit Taneja wrote:
>> The Qualcomm NAND controller is found in SoCs like IPQ806x, MSM7xx,
>> MDM9x15 series.
>>
>> It exists as a sub block inside the IPs EBI2 (External Bus Interface 2)
>> and QPIC (Qualcomm Parallel Interface Controller). These IPs provide a
>> broader interface for external slow peripheral devices such as LCD and
>> NAND/NOR flash memory or SRAM like interfaces.
>>
>> We add support for the NAND controller found within EBI2. For the SoCs
>> of our interest, we only use the NAND controller within EBI2. Therefore,
>> it's safe for us to assume that the NAND controller is a standalone block
>> within the SoC.
>>
>> The controller supports 512B, 2kB, 4kB and 8kB page 8-bit and 16-bit NAND
>> flash devices. It contains a HW ECC block that supports BCH ECC (4, 8 and
>> 16 bit correction/step) and RS ECC(4 bit correction/step) that covers main
>> and spare data. The controller contains an internal 512 byte page buffer
>> to which we read/write via DMA. The EBI2 type NAND controller uses ADM DMA
>> for register read/write and data transfers. The controller performs page
>> reads and writes at a codeword/step level of 512 bytes. It can support up
>> to 2 external chips of different configurations.
>>
>> The driver prepares register read and write configuration descriptors for
>> each codeword, followed by data descriptors to read or write data from the
>> controller's internal buffer. It uses a single ADM DMA channel that we get
>> via dmaengine API. The controller requires 2 ADM CRCIs for command and
>> data flow control. These are passed via DT.
>>
>> The ecc layout used by the controller is syndrome like, but we can't use
>> the standard syndrome ecc ops because of several reasons. First, the amount
>> of data bytes covered by ecc isn't same in each step. Second, writing to
>> free oob space requires us writing to the entire step in which the oob
>> lies. This forces us to create our own ecc ops.
>>
>> One more difference is how the controller accesses the bad block marker.
>> The controller ignores reading the marker when ECC is enabled. ECC needs
>> to be explicity disabled to read or write to the bad block marker. For
>> this reason, we use the newly created flag NAND_BBT_ACCESS_BBM_RAW to
>> read the factory provided bad block markers.
>>
>> v4:
>> - Shrink submit_descs
>> - add desc list node at the end of dma_prep_desc
>> - Endianness and warning fixes
>>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>>
>> v3:
>> - Refactor dma functions for maximum reuse
>> - Use dma_slave_confing on stack
>> - optimize and clean upempty_page_fixup using memchr_inv
>> - ensure portability with dma register reads using le32_* funcs
>> - use NAND_USE_BOUNCE_BUFFER instead of doing it ourselves
>> - fix handling of return values of dmaengine funcs
>> - constify wherever possible
>> - Remove dependency on ADM DMA in Kconfig
>> - Misc fixes and clean ups
>>
>> v2:
>> - Use new BBT flag that allows us to read BBM in raw mode
>> - reduce memcpy-s in the driver
>> - some refactor and clean ups because of above changes
>>
>> Reviewed-by: Andy Gross <agross@codeaurora.org>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>> ---
>
> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
>

Can someone from the the linux-mtd community review this?

Thanks,
Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
