Message-ID: <55CB86CE.3050004@st.com>
Date: Wed, 12 Aug 2015 10:47:58 -0700
From: vikasm <vikas.manocha@st.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
CC: Graham Moore <grmoore@opensource.altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David
 Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Tull
 <atull@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>
Subject: Re: [PATCH V6 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
References: <1438105083-19738-1-git-send-email-grmoore@opensource.altera.com>
 <201508060115.18627.marex@denx.de>
 <9026814FBF99304F9FA3AC3FB72F3E2F0491A0BE@SAFEX1MAIL4.st.com>
 <201508121111.52367.marex@denx.de>
In-Reply-To: <201508121111.52367.marex@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On 08/12/2015 02:11 AM, Marek Vasut wrote:
> On Wednesday, August 12, 2015 at 03:05:48 AM, Vikas MANOCHA wrote:
>> Hi Marek,
> 
> Hi,
> 
>>> -----Original Message-----
>>> From: Marek Vasut [mailto:marex@denx.de]
>>> Sent: Wednesday, August 05, 2015 4:15 PM
>>> To: Vikas MANOCHA
>>> Cc: Graham Moore; linux-mtd@lists.infradead.org; David Woodhouse; Brian
>>> Norris; linux-kernel@vger.kernel.org; Alan Tull; Dinh Nguyen; Yves
>>> Vandervennet
>>> Subject: Re: [PATCH V6 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
>>> Flash Controller.
>>>
>>> On Wednesday, August 05, 2015 at 08:29:11 PM, vikasm wrote:
>>>> Hi Graham,
>>>
>>> Hi vikasm,
>>>
>>>> On 07/28/2015 10:38 AM, Graham Moore wrote:
>>>>> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
>>>>> ---
>>>>> V2: use NULL instead of modalias in spi_nor_scan call
>>>>> V3: Use existing property is-decoded-cs instead of creating
>>>>> duplicate. V4: Support Micron quad mode by snooping command stream
>>>>> for EVCR command and subsequently configuring Cadence controller for
>>>>> quad
>>>
>>> mode.
>>>
>>>>> V5: Clean up sparse and smatch complaints.  Remove snooping of
>>>>> Micron quad mode.  Add comment on XIP mode bit and dummy clock
>>>>> cycles.  Set up SRAM partition at 1:1 during init.
>>>>> V6: Remove dts patch that was included by mistake.  Incorporate
>>>>> Vikas's comments regarding fifo width, SRAM partition setting, and
>>>>> trigger address.  Trigger address was added as an unsigned int, as
>>>>> it is not an IO resource per se, and does not need to be mapped.
>>>>> Also add Marek Vasut's workaround for picking up OF properties on
>>>
>>> subnodes.
>>>
>>>> I am still not able to apply this patch to master. It seems to be
>>>> rebased on master for ..spi-nor/Kconfig & spi-nor/makefile.
>>>
>>> I'm able to apply this on next/master just fine.
>>
>> I think my thunderbird client is messing up with the patch, I am trying to
>> fix it.
> 
> OK
> 
>>>> Also I still see spaces are still not replaced by tabs in this version.
>>>
>>> Which exact spots are you talking about ? I don't see that many indent
>>> flubs in this patch to be honest. Sometimes, it is better to indent the
>>> last piece with spaces (mandated by kernel coding style btw) to increase
>>> the readability.
>>>
>>> This is in particular the case with stuff like this:
>>>
>>> pr_err("formating string that is almost 80 chars long %i!\n",
>>>
>>>        parameter_that_is_indented_with_7_spaces);
>>>
>>> The sole purpose is to align stuff right under the opening parenthesis.
>>>
>>>>> ---
>>>
>>> btw. would you please learn to use [...] and keep only the part you're
>>> commenting on with a bit of context in your reply? It is really hard to
>>> locate your comment if it's inbetween 500 lines of nothing.
>>>
>>> [...]
>>
>> Thanks Marek, I am not sure how to use it.  I would appreciate any help.
> 
> That's rather simple in fact, but it really depends on your UI.
> TL;DR, select the irrelevant piece of email and replace it with [...] .
> 
> [...]
> 

ok, thanks I will try to use it.

>>>>> +       writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
>>>>> +
>>>>> +       /* Clear all interrupts. */
>>>>> +       writel(CQSPI_IRQ_STATUS_MASK, reg_base +
>>>>> + CQSPI_REG_IRQSTATUS);
>>>>> +
>>>>> +       cqspi->irq_mask = CQSPI_IRQ_MASK_RD;
>>>>> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
>>>>> +
>>>>> +       reinit_completion(&cqspi->transfer_complete);
>>>>> +       writel(CQSPI_REG_INDIRECTRD_START_MASK,
>>>>> +              reg_base + CQSPI_REG_INDIRECTRD);
>>>>> +
>>>>> +       while (remaining > 0) {
>>>>> +               ret =
>>>>> wait_for_completion_timeout(&cqspi->transfer_complete, +
>>>>>
>>>>>                                 msecs_to_jiffies +
>>>>>                           
>>>>>                           (CQSPI_READ_TIMEOUT_MS)); +
>>>>>
>>>>> +               bytes_to_read = CQSPI_GET_RD_SRAM_LEVEL(reg_base);
>>>>
>>>> There should not be any need to read SRAM level, we should be able to
>>>> get rid of it like in u-boot.
>>>
>>> Can you explain why ?
>>
>> There is no need to check for sram fill level. If sram is empty, cpu will
>> go in the wait state till the time data is available from flash.
> 
> You mean reading from SRAM will stall the CPU ?

yes, till the time data is available. Simple timeout could avoid longer wait cycles.

> 
>> Also Relying on SRAM fill level only for deciding when the data should
>> befetched from the local SRAM is not most efficient approach, particularly
>> if we are working on high data rates.
>>
>> After one SRAM word is collected, the information is forwarded into system
>> domain and then synchronized into register domain (apb). If we are using
>> slow APB and AHB clks, SRAM fill level might not be up-to-dated because of
>> latency cycles needed for synchronization. For example in case we are
>> getting SRAM fill level equal to 10 locations but in reality there were 2
>> another words completed and actual level is 12 but information may not be
>> synchronized yet because of the synchronization latency on APB domain.
> 
> We use the SRAM level only to determine how many bytes at minimum can we safely
> read. If there are more data waiting, but the SRAM level is not yet updated, we
> will keep looping here until the update happens, right ?
> 
> Though I agree this is not the most efficient method either. Can the CQSPI do
> DMA and deliver the data to CPU's RAM somehow on it's own maybe ?

If DMA is connected, it should be possible like with peripheral as flow controller. It would depend on SOC arch.
Some SOC might not support DMA with qspi periphral. But for sure DMA usage seems most efficient.

Rgds,
Vikas

> 
> Thanks!
> .
> 
