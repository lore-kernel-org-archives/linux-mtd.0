Received: from relay.ptn-ipout02.plus.net ([212.159.7.36])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MgcFV-0002RQ-5D
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 10:30:37 +0000
Message-ID: <e5b07cfc262281f1e1c2687c19cb3524.squirrel@webmail.plus.net>
In-Reply-To: <1251367574.9940.2.camel@dax.rpnet.com>
References: <4A9573CF.8030105@bubblegen.co.uk>
	<1251323622.16040.13.camel@dax.rpnet.com>
	<9f22e03e9efbb90b242869d7652caa97.squirrel@webmail.plus.net>
	<1251367574.9940.2.camel@dax.rpnet.com>
Date: Thu, 27 Aug 2009 11:30:31 +0100
Subject: Re: mtdoops and non pre-emptible kernel
From: "Matthew Lear" <matt@bubblegen.co.uk>
To: "Richard Purdie" <rpurdie@openedhand.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: matt@bubblegen.co.uk, linux-mtd@lists.infradead.org
Reply-To: matt@bubblegen.co.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Thu, 2009-08-27 at 09:59 +0100, Matthew Lear wrote:
>> In any case, yes I saw the two paths the code can go, ie if the mtd
>> device's panic_write() is available and we're in interrupt context then
>> use the panic_write function to write to flash, else use the work queue.
>> The path that my scenario takes is always the latter but the write in
>> context of the work queue never happens.
>>
>> If this is because of the small window in which to perform the write and
>> there are other factors coming into play involving scheduling then
>> obviously that's not a direct issue for the mtdoops code.
>>
>> However, the call to mtdoops_console_sync() (which causes the flash
>> write
>> to be initiated from console_unblank() for the ttyMTD console device) is
>> eventually followed by the panic routine spinning in a tight loop with
>> an
>> mdelay(1). There doesn't appear to be anywhere in this path where
>> schedule() is invoked. Because of running a non pre-emptible kernel,
>> there
>> is no way, certainly that I can see, that a context can switch can
>> happen
>> to allow the jobs in the work queue to be run without at least calling
>> schedule() after calling schedule_work() from within
>> mtdoops_console_sync().
>>
>> Maybe I've missed something :-) but calling schedule() after
>> schedule_work() certainly seems to be the correct approach to at least
>> allow the code to do what it's trying to do, especially on non
>> pre-emptible kernels.
>
> That isn't the right solution since calling schedule() is not something
> allowed at that point in the code, particularly in the middle of a
> kernel panic. We really need to detect that we're about to head into the
> panic spining loop and then call the write function directly. How we do
> that I'm not so sure without going into the code in more detail. I
> suspect something has subtly changed in the kernel meaning that
> particular circumstances no longer works :/
>
That's fair enough. I suppose a possible solution would be to do what I've
done locally for testing, ie:

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1a6b3be..2d734e2 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -335,7 +335,7 @@ static void mtdoops_console_sync(void)
                /* Interrupt context, we're going to panic so try and log */
                mtdoops_write(cxt, 1);
        else
-               schedule_work(&cxt->work_write);
+               mtdoops_write(cxt, 0);
 }

 static void

Obviously this performs the flash write in the same context as that of
panic() and negates the need for the registration and usage of the work
routine, so it would simplify things. However, this would/could effect
what happens during a panic. Clearly the thought behind writing to flash
asynchronously was deemed a requirement.

Perhaps it does need another look and some testing on pre-empt and non
pre-empt kernels just to get a feel for if the mtdoops code is still
working as intended. I know that our kernel will be running with the above
patch applied as it's the only way I can reliably log to flash upon panic.

Cheers,
--  Matt
