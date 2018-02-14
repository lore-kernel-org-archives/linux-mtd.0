Received: from fllnx209.ext.ti.com ([198.47.19.16])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elzsi-0000jq-6I
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 16:26:07 +0000
Subject: Re: [RFC PATCH 4/6] spi: ti-qspi: Implement the spi_mem interface
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-5-boris.brezillon@bootlin.com>
 <6a9eaaaf-20a6-b332-03d0-9d16e24d0b3d@ti.com>
 <20180212133158.3032442f@bbrezillon>
 <67e61203-a2e9-853c-6cda-7226499611c2@ti.com>
 <20180212170809.3f0b5e20@bbrezillon>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <0944fefa-6ef8-a93a-dad6-660044b8ec8e@ti.com>
Date: Wed, 14 Feb 2018 21:55:10 +0530
MIME-Version: 1.0
In-Reply-To: <20180212170809.3f0b5e20@bbrezillon>
Content-Type: text/plain; charset="utf-8"
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



On 12-Feb-18 9:38 PM, Boris Brezillon wrote:
> On Mon, 12 Feb 2018 21:30:09 +0530
> Vignesh R <vigneshr@ti.com> wrote:
> 
>> On 12-Feb-18 6:01 PM, Boris Brezillon wrote:
>>> On Mon, 12 Feb 2018 17:13:55 +0530
>>> Vignesh R <vigneshr@ti.com> wrote:
>>>   
>>>> On Tuesday 06 February 2018 04:51 AM, Boris Brezillon wrote:  
>>>>> From: Boris Brezillon <boris.brezillon@free-electrons.com>
>>>>>
>>>>> The spi_mem interface is meant to replace the spi_flash_read() one.
>>>>> Implement the ->exec_op() method so that we can smoothly get rid of the
>>>>> old interface.
>>>>>
>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>>>> ---
>>>>>   drivers/spi/spi-ti-qspi.c | 85 +++++++++++++++++++++++++++++++++++++++--------
>>>>>   1 file changed, 72 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
>>>>> index c24d9b45a27c..40cac3ef6cc9 100644
>>>>> --- a/drivers/spi/spi-ti-qspi.c
>>>>> +++ b/drivers/spi/spi-ti-qspi.c    
>>>>
>>>> [...]
>>>>   
>>>>> +static const struct spi_controller_mem_ops ti_qspi_mem_ops = {
>>>>> +   .exec_op = ti_qspi_exec_mem_op,    
>>>>
>>>>         .supports_op = ti_qspi_supports_mem_op,
>>>>
>>>> Its required as per spi_controller_check_ops() in Patch 1/6  
>>>   
>>> ->supports_op() is optional, and if it's missing, the core will do the  
>>> regular QuadSPI/DualSPI/SingleSPI check (see spi_mem_supports_op()
>>> implementation).   
>>
>> You might have overlooked spi_controller_check_ops() from Patch 1/6:
>> +static int spi_controller_check_ops(struct spi_controller *ctlr)
>> +{
>> +	/*
>> +	 * The controller can implement only the high-level SPI-memory
>> +	 * operations if it does not support regular SPI transfers.
>> +	 */
>> +	if (ctlr->mem_ops) {
>> +		if (!ctlr->mem_ops->supports_op ||
>> +		    !ctlr->mem_ops->exec_op)
>> +			return -EINVAL;
>> +	} else if (!ctlr->transfer && !ctlr->transfer_one &&
>> +		   !ctlr->transfer_one_message) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>
>> So if ->supports_op() is not populated by SPI controller driver, then
>> driver probe fails with -EINVAL. This is what I observed on my TI
>> hardware when testing this patch series.
> 
> Correct. Then I should fix spi_controller_check_ops() to allow empty
> ctlr->mem_ops->supports_op.
> 
>>
>>> This being said, if you think a custom ->supports_op()
>>> implementation is needed for this controller I can add one.
>>>   
>>
>> spi_mem_supports_op() should suffice for now if above issue is fixed.
> 
> Cool. IIUC, you tested the series on a TI SoC. Does it work as
> expected? Do you see any perf regressions?
> 

I am planning to collect throughput numbers with this series for TI
QSPI. I don't think there would be noticeable degradation.
But, it would be interesting to test for a driver thats now under
drivers/mtd/spi-nor moved to drivers/spi and see if added overhead of
m25p80 layer + spi core has any impact.
