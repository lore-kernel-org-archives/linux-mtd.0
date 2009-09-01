Received: from relay.ptn-ipout02.plus.net ([212.159.7.36])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MiQ5t-0004Gi-Gn
	for linux-mtd@lists.infradead.org; Tue, 01 Sep 2009 09:56:09 +0000
Message-ID: <4A9CEFAD.3040500@bubblegen.co.uk>
Date: Tue, 01 Sep 2009 10:55:57 +0100
From: Matthew Lear <matt@bubblegen.co.uk>
MIME-Version: 1.0
To: Richard Purdie <rpurdie@openedhand.com>
Subject: Re: mtdoops and non pre-emptible kernel
References: <4A9573CF.8030105@bubblegen.co.uk>
	<1251323622.16040.13.camel@dax.rpnet.com>
	<9f22e03e9efbb90b242869d7652caa97.squirrel@webmail.plus.net>
	<1251367574.9940.2.camel@dax.rpnet.com>
	<e5b07cfc262281f1e1c2687c19cb3524.squirrel@webmail.plus.net>
	<1251387854.21836.13.camel@dax.rpnet.com>
	<2332c4705498dd96b79c6634aa507b32.squirrel@webmail.plus.net>
In-Reply-To: <2332c4705498dd96b79c6634aa507b32.squirrel@webmail.plus.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: matt@bubblegen.co.uk, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthew Lear wrote:
>> On Thu, 2009-08-27 at 11:30 +0100, Matthew Lear wrote:
>>> That's fair enough. I suppose a possible solution would be to do what
>>> I've
>>> done locally for testing, ie:
>>>
>>> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
>>> index 1a6b3be..2d734e2 100644
>>> --- a/drivers/mtd/mtdoops.c
>>> +++ b/drivers/mtd/mtdoops.c
>>> @@ -335,7 +335,7 @@ static void mtdoops_console_sync(void)
>>>                 /* Interrupt context, we're going to panic so try and
>>> log */
>>>                 mtdoops_write(cxt, 1);
>>>         else
>>> -               schedule_work(&cxt->work_write);
>>> +               mtdoops_write(cxt, 0);
>>>  }
>> I just refreshed my memory a bit. I'd guess your mtd driver doesn't have
>> a panic_write function which is highly desirable for this kind of use.
>>
>> How about some code like this?:
>>
>> 	if (mtd->panic_write && in_interrupt())
>> 		/* Interrupt context, we're going to panic so try and log */
>> 		mtdoops_write(cxt, 1);
>> 	else if (in_interrupt())
>> 		/* Interrupt context but with no panic write function */
>>                 /* We're going to crash anyway so we may as well try and
>> log */
>> 		mtdoops_write(cxt, 0);
>> 	else
>> 		schedule_work(&cxt->work_write);
>>
> 
> Hi Richard. Unfortunately, in all the circumstances that I've been using
> to force a panic (insmod a ko which just panics, provide some obviously
> wrong boot args on the command line etc), I never seem to be in interrupt
> context when the mtdoops code syncs and tries to write to flash, ie:
> 
> if (mtd->panic_write)
>   printk(KERN_ALERT "we've got panic_write()\n");
> else if (in_interrupt())
>   printk(KERN_ALERT "we're in interrupt\n");
> else
> printk(KERN_ALERT "we'll just schedule work\n");
> 
> always prints the last message (although I know that my mtd driver doesn't
> have a panic_write function so the first was never going to appear). So,
> even if I have a panic_write function, it would never get called as the
> initial condition would be false.
> 
> I agree that your code snippet above makes sense and should probably be
> put forward for integration, though :-)
> 
> I'm still a bit stuck with the fact that I'm panicking, I'm not in
> interrupt context but the jobs in the work queue don't get scheduled to
> run because nothing can force a context switch so my flash never gets
> written to.
> 
> I believe that it is a correct guideline to call schedule() after calling
> schedule_work(). Is this a true statement? However, as you say, in a panic
> situation this is undesirable. That said though, I partially do think that
> the mtd console unblank function should adhere to this behaviour and call
> schedule(). What I'm trying to say is, just because the mtd console
> unblank is called from panic() isn't this breaking the guidelines on the
> usage of schedule_work() (ie not calling schedule()afterwards) and making
> assumptions about what else is going on in the system?
> 
> Cheers,
> --  Matt
> 

Hi Richard - I plan to raise this issue in the kernel bug tracker to
hopefully open up discussion with people who are much more involved with
recent kernel changes than I. The idea being that there may have been
changes may have effected the way that the mtd oops code behaves during
a panic. As the code stands at the moment it does not seem to work
correctly for me. Obviously if this is due to other aspects of my system
being configured incorrectly then that's absolutely fine and I'll ensure
these are resolved :-) I think this is the right thing to do.
Cheers,
--  Matt
