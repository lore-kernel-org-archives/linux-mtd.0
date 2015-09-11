Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaMXo-00007g-3l
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 11:31:05 +0000
Message-ID: <55F2BB5B.4040701@axis.com>
Date: Fri, 11 Sep 2015 13:30:35 +0200
From: Niklas Cassel <niklas.cassel@axis.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, Alex Smith
 <alex.smith@imgtec.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Alex
 Smith <alex@alex-smith.me.uk>, Zubair Lutfullah Kakakhel
 <Zubair.Kakakhel@imgtec.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/4] mtd: nand: increase ready wait timeout and report
 timeouts
References: <1441703453-2838-1-git-send-email-alex.smith@imgtec.com>
 <1441703453-2838-2-git-send-email-alex.smith@imgtec.com>
 <20150909234936.GB11487@google.com>
In-Reply-To: <20150909234936.GB11487@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/10/2015 01:49 AM, Brian Norris wrote:
> + Niklas
> 
> On Tue, Sep 08, 2015 at 10:10:50AM +0100, Alex Smith wrote:
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
>> Debugging this was made more difficult by the misleading comment above
>> nand_wait_ready() stating "The timeout is caught later" - no timeout
>> was ever reported, leading me away from the real source of the problem.
>>
>> Therefore, this patch increases the timeout to 200ms. This should be
>> enough to cover cases where jiffies updates get delayed. Additionally,
>> add a pr_warn() when a timeout does occur so that it is easier to
>> pinpoint any problems in future caused by the chip not becoming ready.
> 
> Did you examine other solutions? I've seen patches for hrtimer support
> previously:
> 
> http://patchwork.ozlabs.org/patch/160333/
> http://patchwork.ozlabs.org/patch/431066/
> 
> A few things have been cleaned up since then, so some of the initial
> objections to the hrtimer patch don't make sense anymore, I believe.
> 
> Anyway, I think just increasing the timeout looks OK to me (as long as
> we never have a 200ms jiffies jump... can this happen??), so hrtimer may
> be over-engineering. I just want to make sure both options have been
> considered before officially choosing one over the other.
> 
> Brian
> 
>> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
>> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>> v4 -> v5:
>>  - Remove spurious change.
>>  - Add Ezequiel's Reviewed-by.
>>
>> v3 -> v4:
>>  - New patch to fix issue encountered in external Ci20 3.18 kernel
>>    branch which also applies upstream.
>> ---
>>  drivers/mtd/nand/nand_base.c | 14 +++++++++++---
>>  1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index ceb68ca8277a..07b831b94e5c 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -543,11 +543,16 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
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
Sample the jiffies value just before the do-while loop, just like in nand_wait()
and nand_wait_status_ready().

>>  
>>  	/* 400ms timeout */
The timeout is 400 ms when called from interrupt context, and 200 ms
when called from non-interrupt context. The timeout value should not depend on us being in
irq context or not. (This is also how it works for nand_wait())

Since the timeout is only for worst case, it should not affect best case, so use
400 ms for both contexts. Change the timeout to always be 400 ms also in nand_wait().

nand_wait_ready() and nand_wait_status_ready() uses a do-while loop,
nand_wait() uses a normal while loop.
For consistency, change nand_wait() to also use a do-while loop.

>>  	if (in_interrupt() || oops_in_progress)
>> @@ -557,9 +562,12 @@ void nand_wait_ready(struct mtd_info *mtd)
>>  	/* Wait until command is processed or timeout occurs */
>>  	do {
>>  		if (chip->dev_ready(mtd))
>> -			break;
>> +			goto out;
>>  		touch_softlockup_watchdog();
To not lock the cpu, especially on non-preempt kernels, use cond_resched instead of
touch_softlockup_watchdog, just like nand_wait() does.

>>  	} while (time_before(jiffies, timeo));
>> +
>> +	pr_warn("timeout while waiting for chip to become ready\n");
Rate limit the printk.

>> +out:
>>  	led_trigger_event(nand_led_trigger, LED_OFF);
>>  }
>>  EXPORT_SYMBOL_GPL(nand_wait_ready);
>> -- 
>> 2.5.0
>>


The patch would then look something like this:

--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -544,23 +544,32 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
 	}
 }
 
-/* Wait for the ready pin, after a command. The timeout is caught later. */
+/**
+ * nand_wait_ready - [GENERIC] Wait for the ready pin after commands.
+ * @mtd: MTD device structure
+ *
+ * Wait for the ready pin after a command, and warn if a timeout occurs.
+ */
 void nand_wait_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
-	unsigned long timeo = jiffies + msecs_to_jiffies(20);
+	unsigned long timeo = 400;
 
 	/* 400ms timeout */
 	if (in_interrupt() || oops_in_progress)
-		return panic_nand_wait_ready(mtd, 400);
+		return panic_nand_wait_ready(mtd, timeo);
 
 	led_trigger_event(nand_led_trigger, LED_FULL);
 	/* Wait until command is processed or timeout occurs */
+	timeo = jiffies + msecs_to_jiffies(timeo);
 	do {
 		if (chip->dev_ready(mtd))
-			break;
-		touch_softlockup_watchdog();
+			goto out;
+		cond_resched();
 	} while (time_before(jiffies, timeo));
+
+	pr_warn_ratelimited("timeout while waiting for chip to become ready\n");
+out:
 	led_trigger_event(nand_led_trigger, LED_OFF);
 }
 EXPORT_SYMBOL_GPL(nand_wait_ready);
@@ -886,15 +895,12 @@ static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd: MTD device structure
  * @chip: NAND chip structure
  *
- * Wait for command done. This applies to erase and program only. Erase can
- * take up to 400ms and program up to 20ms according to general NAND and
- * SmartMedia specs.
+ * Wait for command done. This applies to erase and program only.
  */
 static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
-
-	int status, state = chip->state;
-	unsigned long timeo = (state == FL_ERASING ? 400 : 20);
+	int status;
+	unsigned long timeo = 400;
 
 	led_trigger_event(nand_led_trigger, LED_FULL);
 
@@ -910,7 +916,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 		panic_nand_wait(mtd, chip, timeo);
 	else {
 		timeo = jiffies + msecs_to_jiffies(timeo);
-		while (time_before(jiffies, timeo)) {
+		do {
 			if (chip->dev_ready) {
 				if (chip->dev_ready(mtd))
 					break;
@@ -919,7 +925,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 					break;
 			}
 			cond_resched();
-		}
+		} while (time_before(jiffies, timeo));
 	}
 	led_trigger_event(nand_led_trigger, LED_OFF);
 
-- 

Tested locally and works just as good as the hrtimer patch that I sent out a couple of months ago.
