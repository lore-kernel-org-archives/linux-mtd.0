Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GTtT-0002Br-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 22:38:59 +0000
Message-ID: <3A5CE4A7.AB29F73E@colubris.com>
Date: Wed, 10 Jan 2001 17:39:35 -0500
From: =?iso-8859-1?Q?St=E9phane?= Laroche <stephane.laroche@colubris.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: CFI problems with 32bit bus and 4 devices
References: <Pine.LNX.4.30.0101102149450.1062-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> So - are x16 devices in x8 mode _really_ compatible with x8 devices if you
> shift the address lines over by one? Common sense would imply that's the
> case. Bitter experience would imply that the manufacturers have
> probably screwed it up in interesting ways.

The only difference between the 2 modes are the CFI addresses (you have to
multiply them by 2 in x8 mode).  So you cannot cover that in the map driver,
which doesn't know the difference between a CFI and a normal operation.

-Stephane




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
