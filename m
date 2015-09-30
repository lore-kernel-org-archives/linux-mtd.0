Received: from li271-223.members.linode.com ([178.79.152.223]
 helo=mail.mleia.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhPZW-0002TJ-Te
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 22:09:59 +0000
Message-ID: <560C5DA0.4090201@mleia.com>
Date: Thu, 01 Oct 2015 01:09:36 +0300
From: Vladimir Zapolskiy <vz@mleia.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH 1/5] mtd: nand: lpc32xx_slc: fix calculation of timing
 arcs from given values
References: <1443458338-23552-1-git-send-email-vz@mleia.com>
 <20150930211253.GK143959@google.com> <560C5185.5050106@mleia.com>
 <20150930214631.GM143959@google.com>
In-Reply-To: <20150930214631.GM143959@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01.10.2015 00:46, Brian Norris wrote:
> On Thu, Oct 01, 2015 at 12:17:57AM +0300, Vladimir Zapolskiy wrote:
>> Hi Brian,
>>
>> On 01.10.2015 00:12, Brian Norris wrote:
>>> + Roland, who authored the driver
>>>
>>> On Mon, Sep 28, 2015 at 07:38:58PM +0300, Vladimir Zapolskiy wrote:
>>>> According to LPC32xx User's Manual all values measured in clock cycles
>>>> are programmable from 1 to 16 clocks (4 bits) starting from 0 in
>>>> bitfield. Correctness of 0 bitfield value (i.e. programmed 1 clock
>>>> timing) is proven with actual NAND chip devices.
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
>>>> ---
>>>>  drivers/mtd/nand/lpc32xx_slc.c | 12 ++++++------
>>>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
>>>> index abfec13..5a3c6e0 100644
>>>> --- a/drivers/mtd/nand/lpc32xx_slc.c
>>>> +++ b/drivers/mtd/nand/lpc32xx_slc.c
>>>> @@ -240,13 +240,13 @@ static void lpc32xx_nand_setup(struct lpc32xx_nand_host *host)
>>>>  
>>>>  	/* Compute clock setup values */
>>>>  	tmp = SLCTAC_WDR(host->ncfg->wdr_clks) |
>>>> -		SLCTAC_WWIDTH(1 + (clkrate / host->ncfg->wwidth)) |
>>>> -		SLCTAC_WHOLD(1 + (clkrate / host->ncfg->whold)) |
>>>> -		SLCTAC_WSETUP(1 + (clkrate / host->ncfg->wsetup)) |
>>>> +		SLCTAC_WWIDTH(clkrate / host->ncfg->wwidth) |
>>>> +		SLCTAC_WHOLD(clkrate / host->ncfg->whold) |
>>>> +		SLCTAC_WSETUP(clkrate / host->ncfg->wsetup) |
>>>>  		SLCTAC_RDR(host->ncfg->rdr_clks) |
>>>> -		SLCTAC_RWIDTH(1 + (clkrate / host->ncfg->rwidth)) |
>>>> -		SLCTAC_RHOLD(1 + (clkrate / host->ncfg->rhold)) |
>>>> -		SLCTAC_RSETUP(1 + (clkrate / host->ncfg->rsetup));
>>>> +		SLCTAC_RWIDTH(clkrate / host->ncfg->rwidth) |
>>>> +		SLCTAC_RHOLD(clkrate / host->ncfg->rhold) |
>>>> +		SLCTAC_RSETUP(clkrate / host->ncfg->rsetup);
>>>>  	writel(tmp, SLC_TAC(host->io_base));
>>>>  }
>>>>  
>>>
>>> Hmm, I'm guessing this was done to ensure we didn't round down too much.
>>> Perhaps this should be using DIV_ROUND_UP() instead, so we can get an
>>> exact match where possible, but not set too low of a clock rate by
>>> rounding down?
>>
>> unfortunately bare DIV_ROUND_UP() can not help here, because 0 is a
>> valid resulting bitfield value here, if some timing is lower than clkrate.
> 
> OK, so if I understand it correctly, you're saying that 0 means 1
> period, 1 means 2 periods, etc.? Then I guess your patch would be OK but
> still conservative. 

Right, your understanding is correct.

> I can take it, if you'd like. I'd like an ack from
> Roland if possible though.

Sure.

> According to my reading, you still look convservative for some clock
> rates. What if clock rate is exactly divisible by W_WIDTH, for instance?
> Then you have:
> 
>   clkrate / wwidth = X periods
> 
> But programming a value of "X" would mean "X + 1" periods, which is 1
> too much.
> 
> Maybe you actually need something like this?
> 
> 	tmp = SLCTAC_WDR(DIV_ROUND_UP(clkrate, host->ncfg->wwidth) - 1) | 
> 		...;

I think this is a valid correction of the corner case. And actually I
would prefer to grab it, plus I found another overflow problem in
SLCTAC_*(n) definitions, so I'll send v2 shortly.

--
With best wishes,
Vladimir
