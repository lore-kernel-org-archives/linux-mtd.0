Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137QcC-0007rM-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 23:47:28 +0100
Received: from ctam155.prophecy.net.au ([203.21.127.155] helo=powerbook.ctam.com.au)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 137Qc9-0007qu-00
	for mtd@infradead.org; Wed, 28 Jun 2000 23:47:27 +0100
Received: from localhost ([127.0.0.1] helo=ctam.com.au)
	by powerbook.ctam.com.au with esmtp (Exim 3.12 #1 (Debian))
	id 137eha-0005QY-00
	for <mtd@infradead.org>; Thu, 29 Jun 2000 08:49:58 -0500
Message-ID: <395B5405.7030604@ctam.com.au>
Date: Thu, 29 Jun 2000 08:49:57 -0500
From: Brendan Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: Flash chip locking
References: <395AB066.3070708@ctam.com.au>  <16397.962188563@cygnus.co.uk> <20586.962191497@cygnus.co.uk>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> =

> brendan.simon@ctam.com.au said:
> =

> =

> > Or to avoid ugly "goto" statements.
> >=A0=A0 spin_lock_bh();
> >=A0=A0 while (!ready)
> >=A0=A0 {
> >=A0=A0 =A0 =A0 spin_unlock()
> >=A0=A0 =A0 =A0 udelay(a_little_while);
> >=A0=A0 =A0 =A0 spin_lock_bh();
> >=A0=A0 }

Maybe this is a better so that the spin_lock_bh() call is not repeated.
=A0=A0 while(1)
=A0=A0 {
=A0=A0 =A0 =A0 spin_lock_bh();
=A0=A0 =A0 =A0 if (ready)
=A0=A0 =A0 =A0 {
=A0=A0 =A0 =A0 =A0 =A0 break;
=A0=A0 =A0 =A0 }
=A0=A0 =A0 =A0 spin_unlock();
=A0=A0 =A0 =A0 udelay(some_period);
=A0=A0 }

> Personally, I prefer the goto version. I think it's clearer. We're =

> releasing the lock and going back to exactly the state we were in at th=
e =

> 'retry:' label. It doesn't really matter though. =

You are right.=A0 At the end of the day I guess it doesn't really matter.=

I just think that using labels and gotos is not a scalable technique, so =

I try to avoid them.

Thanks for the explanations below.=A0 It is much clearer now.=A0 I am sti=
ll =

green when it comes to linux internals.=A0 Hopefully that will change in =

the next 6 months when I have to write drivers and apps for a powerpc =

embedded product with DOC and some custom hardware.

Thanks,
Brendan Simon.

> > You are implying that 128us is a large amount of time to wait.=A0 May=
be
> > with todays processors it is, I don't really know if it is or isn't
> > for  the average processor speed.=A0
> =

> It's a long time to disable interrupts or bottom halves. If we didn't h=
ave =

> to disable bottom halves, I wouldn't worry about it.
> =

> =

> > Does the udelay() imply that the scheduler  can switch to another pro=
cess?=A0
> =

> No. We'd use schedule_timeout() to allow the scheduler to switch.
> =

> > If so, I would have thought that the  scheduling process would take a=
 lot
> > longer that 128us, but I could be  wrong !!! =

> =

> I agree - that's why I used udelay() which is a busy-wait rather than =

> scheduling. =

> =

> > If no scheduling is performed  then then there would be no difference=
 to
> > the naive "foreach" loop that you mention.
> =

> The difference is that in the latter version we are allowing interrupts=

> while we're doing the delay, while in the former they're disabled. Ther=
e =

> are in fact _two_ major differences between the two - the presence of t=
he =

> delay, and the place at which we actually wait for the chip to be ready=
=2E
> =

> The delay is just an optimisation - there's no a lot of point in beatin=
g on =

> the chip's READY line until there's at least a chance that it'll be don=
e, =

> whether we're busy-waiting with IRQs disabled or not.
> =

> The important bit is that we let the interrupts run while we're waiting=
 for =

> the chip.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
