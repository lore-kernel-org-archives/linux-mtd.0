Received: from t111.niisi.ras.ru ([193.232.173.111] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 153LPi-0000TB-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 18:30:15 +0100
Message-ID: <3B0F0766.1080207@niisi.msk.ru>
Date: Fri, 25 May 2001 21:31:18 -0400
From: Alexandr Andreev <andreev@niisi.msk.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Why timer interrupt is disabled?
References: <3B0EF62E.30207@niisi.msk.ru>  <3B0EE338.1000701@niisi.msk.ru> <3B0E5857.636CBC17@niisi.msk.ru> <11329.990796371@redhat.com> <25506.990803856@redhat.com> <1765.990808662@redhat.com>
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

>Ah - but we're _not_ manipulating the requests on the request queue. We're 
>servicing the request at the head of the queue, which is a special case - 
>the queueing code knows that drivers are likely to be looking at the 
>request at the head of the queue even while the io_request_lock is not held.
>
>
>The kernel is not preemptively scheduled. Unless the first process 
>explicitly calls schedule(), it's not going to lose the CPU. Only processes 
>in user mode are scheduled from the timer IRQ.
>
Oh yeah, i've got it... you absolutely right, the flash driver will 
never support requests manipulating, so we can don't care about the 
io_request_lock holding, and kernel is really preemptively.
So, we can unlock the io_request_lock in ftl.c, but what about double 
unlocking? Or, do you want to lock it back after proceeding request :) 
Is there any conflicts, when we try to unlock already unlocked lock? 
