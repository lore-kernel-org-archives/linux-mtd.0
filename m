Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14b3yf-0001uf-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 17:13:25 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14b3ye-0001uW-00
	for mtd@infradead.org; Thu, 08 Mar 2001 17:13:25 +0000
Message-ID: <3AA7C45C.E7652E1F@danielind.com>
Date: Thu, 08 Mar 2001 11:41:48 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
CC: Kevin Jacobs <jacobs@penguin.theopalgroup.com>,
 	mtd@infradead.org
Subject: Re: Oh, the many joys of MTD...
References: <Pine.LNX.4.30.0103081119360.14989-100000@xanadu.home>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>
> The device mapping is done with the ioremap() call which is responsible for
> providing a non-cacheable mapping.

Actually I had to use ioremap_nocache() call with my ELANSC520 processor (which
has a processor I&D cache).
This is even with caching actually disabled for the flash banks inside the
processor (by the startup processor init code).

Does ioremap() do any caching of it's own? What's the diff between the two?

Vipin




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
