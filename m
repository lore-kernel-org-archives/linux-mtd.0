Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D0bkP-0000FG-Nd
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 08:38:29 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1D0bhg-000408-5K
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 09:35:36 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2005 09:35:36 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2005 09:35:36 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Mon, 14 Feb 2005 09:37:45 +0100
Message-ID: <cupnsf$skj$1@sea.gmane.org>
References: <ctsr0r$94m$1@sea.gmane.org>	<20050206220713.D99FE15504@desire.actrix.co.nz>	<cu7934$irr$1@sea.gmane.org>	<20050208000532.543131604C@desire.actrix.co.nz>
	<4209AAC3.2090806@magellan-technology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <4209AAC3.2090806@magellan-technology.com>
Sender: news <news@sea.gmane.org>
Subject: Re: Writing frequently to NAND - wearing, caching?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Aras,

>>>>> I have an application which may need to write states frequently to my
>>>>> nand-fs in order to have these states in case of powerdown.
>>>>> But I'm a bit concerned about wearing the nand if I write to 
>>>>> frequently.
>  > <snip>
>> (because we're not using explicite wear levelling) we still have only 
>> reached 24,000 - only 24% of the 100,000 cycle lifetime of the flash.
Thanks for the "comments" below - they are nice to have...

> ... and then there is the fact that the 100,000 write cycle limit is 
> generally a conservative estimate based on testing of the device at an 
> operating temperature of around 125 celcius! Most likely the device will 
> be able to withstand over to 1,000,000 write cycles before failure. If 
> your FS uses write verification to make sure the data is secure then you 
> shouldn't have any problems even if you do reach this limit on some 
> areas of the Flash.
> 
>  From the "Toshiba NAND Flash Applications Design Guide"
> 
> "NOR Flash is typically limited to around 100,000 cycles. Since the 
> electron flow-path due to the hot electron injection for programming is 
> different from the one due to tunneling from the floating gate to the 
> source for erasing, degradation is enhanced. However, in NAND Flash, 
> both the programming and erasing is achieved by uniform Fowler- Nordheim 
> tunneling between the floating gate and the substrate. This uniform 
> programming and uniform erasing technology guarantees a wide cell 
> threshold window even after 1,000,000 cycles."
> 
> and
> 
> "There is one question that often comes up  Is ECC really necessary?  
> After all, the likeliest cause of a bit error is during the programming 
> process. For example, if you program a block, then verify it has no 
> errors, how reliable is the data? In these ROM-like applications where 
> the write/erase cycles is very low, the actual failure rate for a block 
> is about 3 ppm after 10 years (i.e. 3 blocks out of every million blocks 
> will have a bit error after 10 years) in which a block failure is 
> defined as a single bit error. This result was derived from testing 
> 29708 pieces of 512Mb NAND (0.16um) by writing a checkerboard pattern 
> into blocks and storing at 125C. Since there will be a non-zero data 
> retention failure rate, you should limit the amount of code to 1 block 
> to achieve a low ppm probability of failure."
