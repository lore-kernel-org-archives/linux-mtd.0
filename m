Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14d1QY-0005f2-00
	for mtd-list@infradead.org; Wed, 14 Mar 2001 02:54:18 +0000
Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14d1QW-0005ew-00
	for mtd@infradead.org; Wed, 14 Mar 2001 02:54:16 +0000
Message-ID: <3AAEDDA1.2AEB9BE3@mvista.com>
Date: Tue, 13 Mar 2001 18:55:30 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: mtd@infradead.org, ahennessy@mvista.com
Subject: Re: erase.c
References: <Pine.LNX.4.30.0103130802440.6091-100000@imladris.demon.co.uk> <3AAE6A90.B6844ACC@mvista.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>
>
> I still need to fix the parameter checking in mtdpart.c and
> cfi_cmdset_0001.c to insure
> that the unlock is for the entire flash.
>

Nevermind,

This would require the user to know the size of the entire flash  - it's
just simpler
to document that unlocking the flash means unlocking the whole thing - to
help that
I'll document better in cfi_cmdset_0001.c and
rename the function do_unlock_oneblock() to simply   do_unlock().

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
