Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 126PXN-0005ms-00
	for mtd-list@infradead.org; Fri, 07 Jan 2000 02:54:01 +0000
Received: from ctam160.prophecy.com.au
	([203.21.127.160] helo=k9.prophecy.com.au ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 126PXI-0005mm-00
	for mtd@infradead.org; Fri, 07 Jan 2000 02:53:58 +0000
Message-ID: <3875490A.1078B54B@ctam.com.au>
Date: Fri, 07 Jan 2000 13:01:47 +1100
From: Brendan J Simon <Brendan.Simon@ctam.com.au>
Reply-To: Brendan.Simon@ctam.com.au
MIME-Version: 1.0
To: Dvir Oren <dviro@lucidvon.com>
CC: MTD <mtd@infradead.org>
Subject: Re: Hardware RO & delays [DOC2000]
References: <E126NIB-0005it-00@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Dvir Oren wrote:

> 2.  Does the driver block the system?  I'm experience delays in
> sending udp packets over ethernet for periods of 50-300
> miliseconds.  I have a function that is supposed to send every
> several miliseconds a packets, and when going over the logs, I
> once in a while see a packet that is delayed for several tens of
> miliseconds, which is not acceptable by me.  Any ideas?
>
> David, does the driver block the system?

Are you sure it is the DOC drivers ?  Could it be something else ?
Highly loaded ethernet network with lots of collisions which forces the
ethernet card to back off it's transmissions ?

If you are not using a Real Time Operating System (like RT-Linux or
KURT) then you are not guaranteed to have processes run with any
determinism.

Brendan Simon.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
