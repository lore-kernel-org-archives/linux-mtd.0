Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13jsSp-0005Ox-00
	for mtd-list@infradead.org; Fri, 13 Oct 2000 01:12:43 +0100
Message-ID: <39E65472.8A7A2E96@mvista.com>
Date: Thu, 12 Oct 2000 17:16:50 -0700
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org, ahennessy@mvista.com
Subject: Re: Flash chip locking
References: <16397.962188563@cygnus.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> Unfortunately, we have to consider the fact that this lock will also be
> obtained from a Bottom Half context, when the "has the erase finished y=
et?"
> timer runs. Therefore, all occurrences of spin_lock in the main code ha=
ve
> to be spin_lock_bh()=B9 instead of the nurmal (and almost free) spin_lo=
ck().
>
>

Was the  "has the erase finished yet?" timer the only reason for using
spin_lock_bh instead of spin_lock?   Since the timer isn't implemented ye=
t,
spin_lock can be used at the moment, correct?   I'm experimenting with th=
e
driver in an environment that can  only tolerate disabling the bottom hal=
f for
very brief periods.

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
