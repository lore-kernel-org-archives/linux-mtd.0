Received: from t111.niisi.ras.ru ([193.232.173.111] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 153KGi-0000O5-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 17:16:52 +0100
Message-ID: <3B0EF62E.30207@niisi.msk.ru>
Date: Fri, 25 May 2001 20:17:50 -0400
From: Alexandr Andreev <andreev@niisi.msk.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Why timer interrupt is disabled?
References: <3B0EE338.1000701@niisi.msk.ru>  <3B0E5857.636CBC17@niisi.msk.ru> <11329.990796371@redhat.com> <25506.990803856@redhat.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse wrote:

>andreev@niisi.msk.ru said:
>
>>I know that JFFS is the better choice, but
>>I must use the FTL driver, because there is installed X-server on my 
>>flash partition... 
>>
>I don't see the logic. The Compaq iPAQ works quite well with the X-server 
>in the JFFS2 filesystem.
>
I don`t want to format my flash partition write now. Besides it doesn`t 
matter. Of course i`ll use JFFS in the future. 

>>I think that unlocking of the io_request_lock inside ftl driver
>>is not a good idea, because the do_ftl_request must be atomic.
>>
>My understanding is that it's perfectly safe to drop the io_request_lock as long as we only look at the request at the head of the queue. There's no 
>need for do_ftl_request to be atomic - and in fact it cannot be atomic 
>because the flash read and write calls may sleep.
>
   I think, if write call sleeps, than we must return. Do i wrong?
   Locking of io_request_lock and disabling interrupts, are mading in 
block devices common driver. I read the kernel-api documentation in 
Documentation/DocBook/kernel-api/r10011.html: " A global spin lock 
$io_request_lock must be held while manipulating the requests on the 
request queue."
   Besides, if we unlock the io_request_lock and enable all interrupts 
it might to occur this thing:
While we are reading or writing data to the flash, the timer interrupt 
is happens. Next, the schedule() called, and an other process begins to 
write or read data to the flash. Can you guarantee, that flash is 
protected by locks and "chips->state" inside the CFI driver? I mean: if 
we write the READ_STATUS command to flash inside context of first 
process, and trying to read data inside context of second process, than 
we read status, but not data. 
   In all cases we need to enable timer ticks, anywhere in flash. It is 
the simplies way i think...
