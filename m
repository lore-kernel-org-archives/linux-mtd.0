Received: from mail.ch.keymile.com ([193.17.201.103])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pl8Ru-0005Jn-Bi
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2011 23:18:51 +0000
Message-ID: <4D4B37D4.4050204@keymile.com>
Date: Fri, 04 Feb 2011 00:18:44 +0100
From: Stefan Bigler <stefan.bigler@keymile.com>
MIME-Version: 1.0
To: stefan.bigler@keymile.com
Subject: Re: Numonyx NOR and chip->mutex bug?
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>	
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>	
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>	
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>	
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com>
In-Reply-To: <4D4AD9ED.8060104@keymile.com>
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>,
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

Now I have a patch that fix my problem. I did not yet do a lot of tests 
and I did
not yet analyzed correctness in all cases.
I check in the inval_cache_and_wait_for_operation() of the status is 
status_OK
the if the chip->state and the chip_state (the current chip state and 
the chip state
when the function is called) are equal or not. If equal break and exit 
(set the
chip->state= FL_STATUS) and if not equal add the thread in the wait queue.

I think we are not finished when not equal so we have do not have to 
take the mutex.

Now why this code worked with the older Flash chips. I don't know, but 
eventually
they are slower after the write buffer command 0xe8 and they are still 
busy when
inval_cache_and_wait_for_operation() checks if status_OK.
Tomorrow I'll check if this is the case. Now I do not have access to the HW.

Regards Stefan


diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c 
b/drivers/mtd/chips/cfi_cmdset_0001.c
index 28fc5c2..723985c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c

@@ static int inval_cache_and_wait_for_operation(
      for (;;) {
          status = map_read(map, cmd_adr);
-        if (map_word_andequal(map, status, status_OK, status_OK))
+        if (map_word_andequal(map, status, status_OK, status_OK)) {
+            if (chip->state != chip_state) {
+                goto unequal_states;
+            }
              break;
+        }

          if (!timeo) {

@@  static int inval_cache_and_wait_for_operation(
              cond_resched();
              timeo--;
          }
          mutex_lock(&chip->mutex);

+unequal_states:
          while (chip->state != chip_state) {


Am 02/03/2011 05:38 PM, schrieb Stefan Bigler:
> Hi
>
> I did some more anaysis of the write probem when creating a ubivolume.
> I come to the conclusion that there must be a problem in the fuction
> inval_cache_and_wait_for_operation().
>
> Why I think this. In the log below you see that in the first part the
> do_erase_oneblock() start the erasing. In the function
> inval_cache_and_wait_for_operation() this thread is interrupted.
>
> A do_write_buffer() suspends the erase by chip_ready() and runs until
> cmd 0xe8 and waits for completion in WAIT_TIMEOUT.
>
> Here again the do_erase_oneblock() continues to run and runs a
> erase resume sequence to the end of erase the block.
> --> THIS IS WRONG.
>
> Now the do_write_buffer() continue but it ends in a write error.
>
>
> When reading the inval_cache_and_wait_for_operation() there are 2
> places were the mutex is unlocked
>
> 1) while INVALIDATE_CACHED_RANGE()
> 2) if status is not status_OK
>
> My measurement shows that the mutex is taken in the first place.
>
> Now I do expect that this method should make sure that the erasing
> thread get "suspended" and the writing task can continue.
> But this is not the case.
> There is code were we compare the chip_state and chip->state.
> But we are not hitting this code.
>
> This is the summary of my analysis for today.
> I was asking me why this code is working on other chips?
>
> Regards
> Stefan
>
>
> do_erase_oneblock() begin
> [1507][0209] do_erase_oneblock start adr=0x00000000 len=0x20000
> [1507][0209] map_write 0x50 to 0x00000000
> [1507][0209] map_write 0x20 to 0x00000000
> [1507][0209] map_write 0xd0 to 0x00000000
> [1507][0209] do_erase_oneblock before INVAL_CACHE_AND_WAIT 
> adr=0x00000000 len=0x20000
> [1507][0209] inval_cache_and_wait_for_operation short unlock
>
> do_write_buffer() begin
> [1507][0465] map_write 0xb0 to 0x03fe4c00
> [1515][0465] erase suspend 1         adr=0x03fe4c00
> [1515][0465] map_write 0x70 to 0x03fe4c00
> [1515][0465] map_write 0xe8 to 0x03fe4c00
> [1515][0465] buffer write before 0xe8 WAIT_TIMEOUT
> [1515][0465] inval_cache_and_wait_for_operation short unlock
>
> do_erase_oneblock() continue & finish
> [1515][0209] inval_cache_and_wait_for_operation short lock
> [1515][0209] do_erase_oneblock after  INVAL_CACHE_AND_WAIT 
> adr=0x00000000 len=0x20000
> [1515][0209] map_write 0x70 to 0x00000000
> [1515][0209] map_write 0x50 to 0x00000000
> [1515][0209] map_write 0xd0 to 0x00000000
> [1515][0209] map_write 0x70 to 0x00000000
> [1523][0209] erase resumed 2b        adr=0x00000000
> [1527][0209] do_erase_oneblock end   adr=0x00000000 len=0x20000
>
> do_write_buffer() continue & error
> [1527][0465] inval_cache_and_wait_for_operation short lock
> [1531][0465] buffer write after  0xe8 WAIT_TIMEOUT
> [1531][0465] buffer write data to buf words=511
> [1531][0465] buffer write data buf done
> [1531][0465] map_write 0xd0 to 0x03fe4c00
> [1531][0465] 50000000.flash: buffer write before INVAL_CACHE_AND_WAIT 
> adr=0x03fe5000 len=0x400
> [1531][0465] inval_cache_and_wait_for_operation short unlock
> [1531][0465] inval_cache_and_wait_for_operation short lock
> [1531][0465] inval_cache_and_wait_for_operation long unlock
> [1543][0465] inval_cache_and_wait_for_operation long lock
>
> [2503][0465] inval_cache_and_wait_for_operation long unlock
> [2511][0465] inval_cache_and_wait_for_operation long lock
> [2511][0465] 50000000.flash: buffer write after  INVAL_CACHE_AND_WAIT 
> adr=0x03fe5000 len=0x400
> [2511][0465] map_write 0x50 to 0x03fe4c00
> [2511][0465] map_write 0x70 to 0x03fe4c00
> [2519][0465] 50000000.flash: buffer write error status 0xb0 
> adr=0x03fe5000 len=0x400
>
> Am 02/03/2011 04:24 PM, schrieb Michael Cashwell:
>> On Feb 3, 2011, at 4:50 AM, Joakim Tjernlund wrote:
>>
>>>>> My failures were caused by the erase-resume status read "seeing" a 
>>>>> non-busy WSM. Adding a 20µs delay before that read (actually after 
>>>>> the command write, but it amounts to the same thing) prevents this 
>>>>> from happening. By the time awakened "wait-for-completion" code 
>>>>> does its first status read it sees the WSM as busy as it should 
>>>>> until the erase actually finishes.
>>> Perhaps you can test for ESS(SR.6) too?
>>> something like:
>>>   if DWS&&  !ESS
>> Hmmm. So instead of a blind delay it would loop (with a timeout) 
>> while DWS&&  ESS are both set (meaning the erase resume command just 
>> written hasn't yet taken effect). It does make sense that if the 
>> resume takes time to drop SR.7 (ready) that it would also take time 
>> to drop SR.6 (ESS).
>>
>> I like that. I'll add that to the set of tests today and report back.
>>
>> -Mike
>>
>
