Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbZpy-0002eP-Hw
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 15:04:28 +0000
Message-ID: <4E09ED56.2070704@parrot.com>
Date: Tue, 28 Jun 2011 17:03:50 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 2/6] nand_wait : warn if the nand is busy on exit
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>	
	<1309105616-3609-2-git-send-email-matthieu.castet@parrot.com>
	<1309247836.23597.42.camel@sauron>
In-Reply-To: <1309247836.23597.42.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Sun, 2011-06-26 at 18:26 +0200, Matthieu CASTET wrote:
>> This patch allow to detect buggy driver/hardware with
>> bad RnB (dev_ready) management.
>> This check cost nothing and could help to detect bugs.
>>
>> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
>> ---
>>  drivers/mtd/nand/nand_base.c |    2 ++
>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index a3c7fd3..095dfea 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -885,6 +885,8 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
>>  	led_trigger_event(nand_led_trigger, LED_OFF);
>>  
>>  	status = (int)chip->read_byte(mtd);
>> +	/* This can happen if in case of timeout or buggy dev_ready */
>> +	WARN_ON(!(status & NAND_STATUS_READY));
>>  	return status;
> 
> This seem to completely miss the chip->dev_ready != NULL case, e.g.,
> piece of code above is like this
> 
>                 while (time_before(jiffies, timeo)) {
>                         if (chip->dev_ready) {
>                                 if (chip->dev_ready(mtd))
>                                         break;
>                         } else {
>                                 if (chip->read_byte(mtd) & NAND_STATUS_READY)
>                                         break;
>                         }
>                         cond_resched();
>                 }
> 
Sorry, I don't understand what you mean.

We don't care what's done in the loop (chip->dev_ready != NULL or, not). We only
check when the loop exit, that READY bit is set in the status.


Matthieu
