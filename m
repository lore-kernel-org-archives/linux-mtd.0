Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSIzW-0007eT-Cm
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2018 09:20:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Jun 2018 14:49:46 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross
 <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 15/16] mtd: rawnand: qcom: helper function for raw read
In-Reply-To: <20180607144350.1a4427a0@xps13>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-16-git-send-email-absahu@codeaurora.org>
 <20180527155311.4c05d7ab@xps13>
 <19569fdc057754978298a7e7afc9016a@codeaurora.org>
 <20180607144350.1a4427a0@xps13>
Message-ID: <ad00e3739457dadc919bbebf9f6901b7@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-06-07 18:13, Miquel Raynal wrote:
> Hi Abhishek,
> 
> On Mon, 28 May 2018 13:04:45 +0530, Abhishek Sahu
> <absahu@codeaurora.org> wrote:
> 
>> On 2018-05-27 19:23, Miquel Raynal wrote:
>> > Hi Abhishek,
>> > > On Fri, 25 May 2018 17:51:43 +0530, Abhishek Sahu
>> > <absahu@codeaurora.org> wrote:
>> > >> This patch does minor code reorganization for raw reads.
>> >> Currently the raw read is required for complete page but for
>> >> subsequent patches related with erased codeword bit flips
>> >> detection, only few CW should be read. So, this patch adds
>> >> helper function and introduces the read CW bitmask which
>> >> specifies which CW reads are required in complete page.
>> >> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> >> ---

  <snip>

>> >> +	for (i = start_step; i < last_step; i++) {
>> > > This comment applies for both patches 15 and 16:
>> > > I would really prefer having a qcom_nandc_read_cw_raw() that reads only
>> > one CW. From qcom_nandc_read_page_raw() you would loop over all the CW
>> > calling qcom_nandc_read_cw_raw() helper (it's raw reads, we don't care
>> > about performances)
>> 
>>   Doing that way will degrade performances hugely.
>> 
>>   Currently once we formed the descriptor, the DMA will take care
>>   of complete page data transfer from NAND device to buffer and will
>>   generate single interrupt.
>> 
>>   Now it will form one CW descriptor and wait for it to be finished.
>>   In background, the data transfer from NAND device will be also
>>   split and for every CW, it will give the PAGE_READ command again,
>>   which is again time consuming.
>> 
>>   Data transfer degradation is ok but it will increase CPU time
>>   and number of interrupts which will impact other peripherals
>>   performance that time.
>> 
>>   Most of the NAND parts has 4K page size i.e 8 CWs.
>> 
>> > and from ->read_page_raw() you would check
>> > CW with uncorrectable errors for being blank with that helper. You
>> > would avoid the not-so-nice logic where you read all the CW between the
>> > first bad one and the last bad one.
>> >
>>   The reading b/w first CW and last CW is only from NAND device to 
>> NAND
>>   HW buffers. The NAND controller has 2 HW buffers which is used to
>>   optimize the traffic throughput between the NAND device and
>>   system memory,in both directions. Each buffer is 544B in size: 512B
>>   for data + 32B spare bytes. Throughput optimization is achieved by
>>   executing internal data transfers (i.e. between NANDc buffers and
>>   system memory) simultaneously with NAND device operations.
>> 
>>   Making separate function won't help in improving performance for
>>   this case either since once every thing is set for reading page
>>   (descriptor formation, issue the PAGE_READ, Data transfer from
>>   Flash array to data register in NAND device), the read time from
>>   device to NAND HW buffer is very less. Again, we did optimization
>>   in which the copying from NAND HW buffer to actual buffer is being
>>   done only for those CW's only.
>> 
>>   Again, in this case CPU time will be more.
>> 
> 
> 
> I understand the point and thanks for detailing it. But raw access
> happen either during debug (we don't care about CPU time) or when there
> is an uncorrectable error, which is very unlikely to happen very often
> when using eg. UBI/UBIFS. So I'm still convinced it is better to have a
> _simple_ and straightforward code for this path than something way
> harder to understand and much faster.
> 
> You can add a comment to explain what would be the fastest way and
> why though.
> 

  Thanks Miquel. I will do the changes to make function for
  single codeword raw read.

  Regards,
  Abhishek
