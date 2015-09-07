Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYxYy-0002wT-Rl
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2015 14:38:29 +0000
Subject: Re: [PATCH v4 1/3] mtd: nand: increase ready wait timeout and report
 timeouts
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <1438005019-28162-1-git-send-email-alex.smith@imgtec.com>
 <1438005019-28162-2-git-send-email-alex.smith@imgtec.com>
 <20150906203726.GA7745@laptop.cereza>
CC: <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "Zubair Lutfullah Kakakhel" <Zubair.Kakakhel@imgtec.com>,
 <linux-kernel@vger.kernel.org>
From: Alex Smith <alex.smith@imgtec.com>
Message-ID: <55EDA149.6040002@imgtec.com>
Date: Mon, 7 Sep 2015 15:38:01 +0100
MIME-Version: 1.0
In-Reply-To: <20150906203726.GA7745@laptop.cereza>
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

Hi Ezequiel,

Thanks for reviewing the series.

On 06/09/2015 21:37, Ezequiel Garcia wrote:
> On 27 Jul 02:50 PM, Alex Smith wrote:
>> If nand_wait_ready() times out, this is silently ignored, and its
>> caller will then proceed to read from/write to the chip before it is
>> ready. This can potentially result in corruption with no indication as
>> to why.
>>
>> While a 20ms timeout seems like it should be plenty enough, certain
>> behaviour can cause it to timeout much earlier than expected. The
>> situation which prompted this change was that CPU 0, which is
>> responsible for updating jiffies, was holding interrupts disabled
>> for a fairly long time while writing to the console during a printk,
>> causing several jiffies updates to be delayed. If CPU 1 happens to
>> enter the timeout loop in nand_wait_ready() just before CPU 0 re-
>> enables interrupts and updates jiffies, CPU 1 will immediately time
>> out when the delayed jiffies updates are made. The result of this is
>> that nand_wait_ready() actually waits less time than the NAND chip
>> would normally take to be ready, and then read_page() proceeds to
>> read out bad data from the chip.
>>
>> The situation described above may seem unlikely, but in fact it can be
>> reproduced almost every boot on the MIPS Creator Ci20.
>>
> 
> Not only unlikely but scary :) BTW, can't find SMP patches for Ci20,
> are you sure this behavior will apply once SMP is upstreamed?

Certainly made for fun debugging ;)

SMP support only exists in our 3.18 branch [1] at the moment, which was where this problem was encountered. Support should be upstreamed at some point, and I would guess that this behaviour could still happen then (even though it's a really obscure edge case that we were somehow managing to almost always hit on boot).

[1] https://github.com/MIPS/CI20_linux

> 
>> Debugging this was made more difficult by the misleading comment above
>> nand_wait_ready() stating "The timeout is caught later" - no timeout
>> was ever reported, leading me away from the real source of the problem.
>>
>> Therefore, this patch increases the timeout to 200ms. This should be
>> enough to cover cases where jiffies updates get delayed. Additionally,
>> add a pr_warn() when a timeout does occur so that it is easier to
>> pinpoint any problems in future caused by the chip not becoming ready.
>>
>> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
>> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>> v3 -> v4:
>>  - New patch to fix issue encountered in external Ci20 3.18 kernel
>>    branch which also applies upstream.
>> ---
>>  drivers/mtd/nand/nand_base.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index ceb68ca8277a..a0dab3414f16 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -543,23 +543,32 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
>>  	}
>>  }
>>  
>> -/* Wait for the ready pin, after a command. The timeout is caught later. */
>> +/**
>> + * nand_wait_ready - [GENERIC] Wait for the ready pin after commands.
>> + * @mtd: MTD device structure
>> + *
>> + * Wait for the ready pin after a command, and warn if a timeout occurs.
>> + */
>>  void nand_wait_ready(struct mtd_info *mtd)
>>  {
>>  	struct nand_chip *chip = mtd->priv;
>> -	unsigned long timeo = jiffies + msecs_to_jiffies(20);
>> +	unsigned long timeo = jiffies + msecs_to_jiffies(200);
>>  
>>  	/* 400ms timeout */
>>  	if (in_interrupt() || oops_in_progress)
>>  		return panic_nand_wait_ready(mtd, 400);
>>  
>>  	led_trigger_event(nand_led_trigger, LED_FULL);
>> +
> 
> Spurious change here.

Removed.

> 
>>  	/* Wait until command is processed or timeout occurs */
>>  	do {
>>  		if (chip->dev_ready(mtd))
>> -			break;
>> +			goto out;
>>  		touch_softlockup_watchdog();
>>  	} while (time_before(jiffies, timeo));
>> +
>> +	pr_warn("timeout while waiting for chip to become ready\n");
>> +out:
>>  	led_trigger_event(nand_led_trigger, LED_OFF);
>>  }
> 
> This change looks reasonable, a timeout value should be large enough
> to be confident the operation has _really_ timed out. On non-error
> path, this change shouldn't make any difference.
> 
> And the warning is probably helpful too, so:
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Great, thanks.

Alex
