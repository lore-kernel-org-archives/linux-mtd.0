Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 153KX7-0000PB-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 17:33:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B0EF62E.30207@niisi.msk.ru> 
References: <3B0EF62E.30207@niisi.msk.ru>  <3B0EE338.1000701@niisi.msk.ru> <3B0E5857.636CBC17@niisi.msk.ru> <11329.990796371@redhat.com> <25506.990803856@redhat.com> 
To: Alexandr Andreev <andreev@niisi.msk.ru>
Cc: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Why timer interrupt is disabled? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 May 2001 17:37:42 +0100
Message-ID: <1765.990808662@redhat.com>
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

andreev@niisi.msk.ru said:
>   Locking of io_request_lock and disabling interrupts, are mading in
> block devices common driver. I read the kernel-api documentation in
> Documentation/DocBook/kernel-api/r10011.html: " A global spin lock
> $io_request_lock must be held while manipulating the requests on the
> request queue."

Ah - but we're _not_ manipulating the requests on the request queue. We're 
servicing the request at the head of the queue, which is a special case - 
the queueing code knows that drivers are likely to be looking at the 
request at the head of the queue even while the io_request_lock is not held.


andreev@niisi.msk.ru said:
> While we are reading or writing data to the flash, the timer interrupt
>  is happens. Next, the schedule() called, and an other process begins
> to  write or read data to the flash.

The kernel is not preemptively scheduled. Unless the first process 
explicitly calls schedule(), it's not going to lose the CPU. Only processes 
in user mode are scheduled from the timer IRQ.

--
dwmw2
