Received: from t111.niisi.ras.ru ([193.232.173.111] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154L3Y-0005HR-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 May 2001 12:19:28 +0100
Message-ID: <3B12A202.3040409@niisi.msk.ru>
Date: Mon, 28 May 2001 15:07:46 -0400
From: Alexandr Andreev <andreev@niisi.msk.ru>
MIME-Version: 1.0
To: dwmw2@infradead.org
CC: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Why timer interrupt is disabled?
References: <3B0EE8CF.7040502@niisi.msk.ru> <20010526000119.A23273@suse.de>
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

I had asked this question to linux-kernel@vger.kernel.org and there is 
the answer:

Jens Axboe wrote:

>On Fri, May 25 2001, Alexandr Andreev wrote:
>
>>Hi, list
>>In ll_rw_block.c, before calling block device specific request function 
>>( i mean do_hd_request, do_ftl_request, ... ) the io_request_lock is 
>>locking, and all interrupts are disabling. I know, that request handler 
>>routine have to be atomic, but when we read data from a flash device ( 
>>for example ) we use a timeouts. Where do we have to enable timer 
>>interrupts, or should we disable all interrupts?
>>
>
>Even with dropping io_request_lock, it's not recommended to sleep inside
>the request_fn. WIth plugging, you are basically preventing the other
>plugged queues from being run until you return.
>
>You could use a timer or similar to call you on a specified timeout
>instead.
>
... and nevertheless, this is a bad idea to unlock the io_request_lock 
inside the do_ftl_request. What about the SMP? It may happen that one 
CPU is reading and other CPU is writing data at the same time. So, the 
flash memory can return status value instead of data, for example. Does 
the chip->mutex lock provides  necessary synchronization?
I look at the other block device drivers code and found, that io_request 
handlers do sti() in some cases. If you still don`t want to do it, we 
could use a softirq. In the do_fd_request(), the "bottom halves" is used 
for example. We could use a "bottom halves" or even a tasklet in our 
case. What do you think about this?
