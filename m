Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137Fil-0005l4-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 12:09:31 +0100
Received: from ctam155.prophecy.net.au ([203.21.127.155] helo=powerbook.ctam.com.au)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 137Fij-0005ky-00
	for mtd@infradead.org; Wed, 28 Jun 2000 12:09:30 +0100
Received: from localhost ([127.0.0.1] helo=ctam.com.au)
	by powerbook.ctam.com.au with esmtp (Exim 3.12 #1 (Debian))
	id 137Tnz-0002dm-00
	for <mtd@infradead.org>; Wed, 28 Jun 2000 21:11:51 -0500
Message-ID: <395AB066.3070708@ctam.com.au>
Date: Wed, 28 Jun 2000 21:11:50 -0500
From: Brendan Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: Flash chip locking
References: <16397.962188563@cygnus.co.uk>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> =

> So we try to keep the latency down to a minimum. Rather than the na=EFv=
e =

> inner loop which looked like this:
> =

> foreach(word to write) {
> 	spin_lock_bh();
> 	writeb(WRITE_COMMAND);
> 	writeb(datum);
> 	while (!done)
> 		;
> 	spin_unlock_bh();
> }
> =

> .... we do something more like
> =

> foreach(word to write) {
> =

> retry:
> 	spin_lock_bh();
> 	if (!ready) {
> 		spin_unlock()
> 		udelay(a little while);
> 		goto retry;
> 	}
> 	writeb(WRITE_COMMAND);
> 	writeb(datum);
> 	spin_unlock_bh();
> 	udelay(expected time for the write we just started);
> 	spin_lock_bh();
> 	check final status, loop or whatever
> 	spin_unlock_bh();
Or to avoid ugly "goto" statements.
=A0=A0 spin_lock_bh();
=A0=A0 while (!ready)
=A0=A0 {
=A0=A0 =A0 =A0 spin_unlock()
=A0=A0 =A0 =A0 udelay(a_little_while);
=A0=A0 =A0 =A0 spin_lock_bh();
=A0=A0 }

You are implying that 128us is a large amount of time to wait.=A0 Maybe =

with todays processors it is, I don't really know if it is or isn't for =

the average processor speed.=A0 Does the udelay() imply that the schedule=
r =

can switch to another process ?=A0 If so, I would have thought that the =

scheduling process would take a lot longer that 128us, but I could be =

wrong !!!
If no scheduling is performed then then there would be no difference to =

the naive "foreach" loop that you mention.

Are my assumptions reasonable ?

Brendan Simon.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
