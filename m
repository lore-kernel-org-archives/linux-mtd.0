Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137Frd-0005mU-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 12:18:41 +0100
Received: from [62.6.164.226] (helo=mail.linuxgrrls.org ident=postfix)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 137Frc-0005mO-00
	for mtd@infradead.org; Wed, 28 Jun 2000 12:18:40 +0100
Date: Wed, 28 Jun 2000 12:16:35 +0100 (BST)
From: Kira Brown <kira@linuxgrrls.org>
To: Brendan Simon <brendan.simon@ctam.com.au>
Cc: mtd@infradead.org
Subject: Re: Flash chip locking
In-Reply-To: <395AB066.3070708@ctam.com.au>
Message-ID: <Pine.LNX.4.21.0006281213540.29525-100000@carrot.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 28 Jun 2000, Brendan Simon wrote:

> You are implying that 128us is a large amount of time to wait.=A0 Maybe=
=20
> with todays processors it is, I don't really know if it is or isn't for=
=20
> the average processor speed.

On a 1GHz processor, sometimes we can do more than one instruction every
1nsec. 128usecs is an eternity.  (128usecs was long enough to do a
complete DRAM refresh on a 1MHz 6502...)

> Does the udelay() imply that the scheduler can switch to another process =
?

Specifically it's there so that interrupts can happen so that bottom ends
can run;  scheduling isn't an issue.

kira.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
