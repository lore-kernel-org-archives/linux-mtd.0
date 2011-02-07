Received: from mail.ch.keymile.com ([193.17.201.103])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmSMu-0000Wy-TH
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 14:47:10 +0000
Message-ID: <4D5005E4.1040506@keymile.com>
Date: Mon, 07 Feb 2011 15:47:00 +0100
From: Stefan Bigler <stefan.bigler@keymile.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: Numonyx NOR and chip->mutex bug?
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>	
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>	
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>	
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>	
	<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067
	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	
	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39.CB78C79D-ONC125782F.0074C320-C125782F.007542AF@transmode.se>
In-Reply-To: <OF2C1ABD39.CB78C79D-ONC125782F.0074C320-C125782F.007542AF@transmode.se>
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Michael Cashwell <mboards@prograde.net>
Reply-To: stefan.bigler@keymile.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I run the test on my side with the patches proposed with and without 
barrier().
Both worked without problems.

My workspace has now the following patches:

1) clear status before suspend
------------------------------
+    /* numonyx data sheet clearly says to always reset the status bits
+       before resuming a suspended erase. not doing so results in
+       an ambiguous mixture of status bits once the command ends. */
+    debug_map_write(map, CMD(0x50), adr);
+    debug_map_write(map, CMD(0xd0), adr);


2) compare chip>state and chip_state before touching the chip
------------------------------------------------------------

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e89f2d0..73e29a3 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1243,12 +1243,34 @@ static int inval_cache_and_wait_for_operation(
  		timeo = 500000;
  	reset_timeo = timeo;
  	sleep_time = chip_op_time / 2;
-
+	barrier(); /* make sure chip->state gets reloaded */
  	for (;;) {
+		if (chip->state != chip_state) {
+			/* Someone's suspended the operation: sleep */
+			DECLARE_WAITQUEUE(wait, current);
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq,&wait);
+			mutex_unlock(&chip->mutex);
+			schedule();
+			remove_wait_queue(&chip->wq,&wait);
+			mutex_lock(&chip->mutex);
+			continue;
+		}
+
  		status = map_read(map, cmd_adr);
  		if (map_word_andequal(map, status, status_OK, status_OK))
  			break;

+		if (chip->erase_suspended&&  chip_state == FL_ERASING)  {
+			/* Erase suspend occured while sleep: reset timeout */
+			timeo = reset_timeo;
+			chip->erase_suspended = 0;
+		}
+		if (chip->write_suspended&&  chip_state == FL_WRITING)  {
+			/* Write suspend occured while sleep: reset timeout */
+			timeo = reset_timeo;
+			chip->write_suspended = 0;
+		}
  		if (!timeo) {
  			map_write(map, CMD(0x70), cmd_adr);
  			chip->state = FL_STATUS;
@@ -1272,27 +1294,6 @@ static int inval_cache_and_wait_for_operation(
  			timeo--;
  		}
  		mutex_lock(&chip->mutex);
-
-		while (chip->state != chip_state) {
-			/* Someone's suspended the operation: sleep */
-			DECLARE_WAITQUEUE(wait, current);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			add_wait_queue(&chip->wq,&wait);
-			mutex_unlock(&chip->mutex);
-			schedule();
-			remove_wait_queue(&chip->wq,&wait);
-			mutex_lock(&chip->mutex);
-		}
-		if (chip->erase_suspended&&  chip_state == FL_ERASING)  {
-			/* Erase suspend occured while sleep: reset timeout */
-			timeo = reset_timeo;
-			chip->erase_suspended = 0;
-		}
-		if (chip->write_suspended&&  chip_state == FL_WRITING)  {
-			/* Write suspend occured while sleep: reset timeout */
-			timeo = reset_timeo;
-			chip->write_suspended = 0;
-		}
  	}

3) Fix for errata regarding Flexlock Write Timing
-------------------------------------------------
This patch is not tested because the code is not called in my
test cases.

+       int ofs_factor = cfi->interleave * cfi->device_type;


+	/* address numonyx errata regarding Flexlock Write Timing.
+	   before doing a 0x60 lock/unlock sequence on a sector
+	   its current lock state needs to be read and the result
+          discarded. */
+       debug_map_write(map, CMD(0x90), adr+(2*ofs_factor));
+	chip->state = FL_JEDEC_QUERY;
+	(void) cfi_read_query(map, adr+(2*ofs_factor));


What are your plans?
Can I do some more tests?


Regards Stefan

Attached you find the small script creating a ubivolume write to it and delete it afterwards.

dd if=foofoo of=testfile bs=1024 count=1024
date
echo time ubimkvol /dev/ubi0 -s 6MiB -N test1
time ubimkvol /dev/ubi0 -s 6MiB -N test1
date
echo time cp testfile /dev/`cat /proc/mtd | grep test1 | sed 's/: .*//' | sed 's/mtd/mtdblock/'`
time cp testfile /dev/`cat /proc/mtd | grep test1 | sed 's/: .*//' | sed 's/mtd/mtdblock/'`
date
echo time ubirmvol /dev/ubi0 -N test1
time ubirmvol /dev/ubi0 -N test1


Am 02/06/2011 10:20 PM, schrieb Joakim Tjernlund:
> Michael Cashwell<mboards@prograde.net>  wrote on 2011/02/06 22:13:40:
>> On Feb 6, 2011, at 12:29 PM, Joakim Tjernlund wrote:
>>
>>> Michael Cashwell<mboards@prograde.net>  wrote on 2011/02/06 16:49:53:
>>>
>>>> That's clearly what's happening in Stefan's trace when thread 465 writes 0xe8 and the next write is 0x70 by thread 209. Such a sequence is absolutely illegal (for the flash) and the latter thread is the problem. If we could get a stack trace for that map_write 0x70 I think we'd find the thread
> awoke and touched the chip without verifying the state first. The question is why.
>>> Without my patch it is clear that you do end up with this problem. The first time one enter the for(;;) loop the driver reads out status from the chip before checking chip->state. This of course assumes that dropping the lock earlier may cause a schedule. So far Stefans tests indicates this to
> be true.
>> Yes, it was your patch and his log that lead me down that path!
>>
>>>> One last idea.
>>>>
>>>> The whole for(;;) loop in inval_cache_and_wait_for_operation() looks odd to me. Continuing with your idea of moving the chip->state while loop first, I see other problems. It seems to me that anywhere we drop and retake the chip mutex the very next thing needs to be the state check loop. Any
> break in holding that mutex means we must go back to the top and check state again.
>>>> I don't think the code as written does that. I have a completely reordered version of this function. (It didn't fix my issue but I think mine is something else.) On Monday I'll send that to you so you can consider it.
>>> Yes, it is a bit odd. In addition to my patch one could move the erase suspend tests before the if(!timeo) test.
>> Precisely. I suspect you may well already have my reordered version. :-)
> hehe, lets se(the barrier() is probably useless):
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index e89f2d0..73e29a3 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -1243,12 +1243,34 @@ static int inval_cache_and_wait_for_operation(
>   		timeo = 500000;
>   	reset_timeo = timeo;
>   	sleep_time = chip_op_time / 2;
> -
> +	barrier(); /* make sure chip->state gets reloaded */
>   	for (;;) {
> +		if (chip->state != chip_state) {
> +			/* Someone's suspended the operation: sleep */
> +			DECLARE_WAITQUEUE(wait, current);
> +			set_current_state(TASK_UNINTERRUPTIBLE);
> +			add_wait_queue(&chip->wq,&wait);
> +			mutex_unlock(&chip->mutex);
> +			schedule();
> +			remove_wait_queue(&chip->wq,&wait);
> +			mutex_lock(&chip->mutex);
> +			continue;
> +		}
> +
>   		status = map_read(map, cmd_adr);
>   		if (map_word_andequal(map, status, status_OK, status_OK))
>   			break;
>
> +		if (chip->erase_suspended&&  chip_state == FL_ERASING)  {
> +			/* Erase suspend occured while sleep: reset timeout */
> +			timeo = reset_timeo;
> +			chip->erase_suspended = 0;
> +		}
> +		if (chip->write_suspended&&  chip_state == FL_WRITING)  {
> +			/* Write suspend occured while sleep: reset timeout */
> +			timeo = reset_timeo;
> +			chip->write_suspended = 0;
> +		}
>   		if (!timeo) {
>   			map_write(map, CMD(0x70), cmd_adr);
>   			chip->state = FL_STATUS;
> @@ -1272,27 +1294,6 @@ static int inval_cache_and_wait_for_operation(
>   			timeo--;
>   		}
>   		mutex_lock(&chip->mutex);
> -
> -		while (chip->state != chip_state) {
> -			/* Someone's suspended the operation: sleep */
> -			DECLARE_WAITQUEUE(wait, current);
> -			set_current_state(TASK_UNINTERRUPTIBLE);
> -			add_wait_queue(&chip->wq,&wait);
> -			mutex_unlock(&chip->mutex);
> -			schedule();
> -			remove_wait_queue(&chip->wq,&wait);
> -			mutex_lock(&chip->mutex);
> -		}
> -		if (chip->erase_suspended&&  chip_state == FL_ERASING)  {
> -			/* Erase suspend occured while sleep: reset timeout */
> -			timeo = reset_timeo;
> -			chip->erase_suspended = 0;
> -		}
> -		if (chip->write_suspended&&  chip_state == FL_WRITING)  {
> -			/* Write suspend occured while sleep: reset timeout */
> -			timeo = reset_timeo;
> -			chip->write_suspended = 0;
> -		}
>   	}
>
>   	/* Done and happy. */
>
>>>>> Oh, one more thing, possibly one needs to add cpu_relax() or similar to force gcc to reload chip->state in the while loop?
>>>> I was also wondering about possible gcc optimization issues. I'm on 4.5.2 and that worked for me with the 2003 flash part. The same binaries fail with the 2008 parts, so, I don't know.
>>> Very recent gcc, I am 3.4.6 but recently I began testing a little with 4.5.2. I do think I will wait for 4.5.3
>> I tried 4.5.1 but it failed for other reasons. I submitted bug reports to gnu and a fix appeared (finally) in 4.5.2. It's been good so far but I'm always mindful of that issue.
>>
>> Staying current is a two edge sword. In general, later gccs have better code analysis and warnings which are valuable even if we ship using an older version.
> Precisely, but later gcc is worse optimizing trivial code.
>
>>>> Keep in mind that chip->state is not a hardware access. It's just another struct member. And I think that the rules are that any function call counts as a sequence point and gcc isn't allowed to think it knows what the result is and must reload it.
>>>>
>>>> Lastly, consider the direction of the behavior. If we're in the state-check while loop then we got there because the two things were NOT equal. If an optimization error is causing a stale value to be compared wouldn't the observed behavior be that it remains not equal? (If it's not reloaded
> then how could it change?)
>>>> I'd expect an optimization error like that to get us stuck in the while loop, not exit from it prematurely.
>>> Yes, all true. I wonder though if the mutex lock/unlock counts as a reload point? These are usually some inline asm. If not one could possibly argue that the first chip->state access, before entering the while body is using an old value.
>> Yes, how inlines interact with sequence points has never been entirely clear to me. Especially since the compiler is free to inline something I didn't tell it to and to ignore me telling to inline if it wants to.
>>
>> I *think* the rules are semantic. If it's written (preprocessor aside) to look like a function call then it counts as a sequence point even if it ends up being inlined. But that's all quite beyond anything I can say for sure!
> That makes sense too.
>
>>>> Makes me head hurt!
>>> You are not alone :)
>> So collectively maybe we can make it hurt less. That's my theory, anyway, and I'm sticking to it.
> :)
>
