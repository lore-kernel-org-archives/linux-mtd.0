Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 126bft-00065P-00
	for mtd-list@infradead.org; Fri, 07 Jan 2000 15:51:37 +0000
Received: from out5.prserv.net ([165.87.194.243] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 126bfq-00065J-00
	for mtd@infradead.org; Fri, 07 Jan 2000 15:51:34 +0000
From: "Dvir Oren" <dviro@lucidvon.com>
To: MTD <mtd@infradead.org>
Date: Fri, 7 Jan 2000 17:55:38 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: Hardware RO & delays [DOC2000]
In-reply-to: <3875490A.1078B54B@ctam.com.au>
Message-Id: <E126bfq-00065J-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

> Are you sure it is the DOC drivers ?  Could it be something else ?
> Highly loaded ethernet network with lots of collisions which forces the
> ethernet card to back off it's transmissions ?

No.  I'm not sure it's the flash.  However, these delays don't happen 
on a standard PC that doesn't have flash (of course, there are 
several hundred other differences), but it does occur on a "network 
computer" that has no hard disk and uses flash.

> If you are not using a Real Time Operating System (like RT-Linux or
> KURT) then you are not guaranteed to have processes run with any
> determinism.

The system doesn't really need to be real time, it can suffer small 
delays.  


---------
Dvir Oren <dvir@lucidvon.com>
Lucid VON Ltd. <http://www.lucidvon.com>
Twin Towers 2,     Suite 406,     P.O.Box 159
35 Jabotinsky street, Ramat-Gan 52511, ISRAEL
Tel:+972 3 6137214         Fax:+972 3 6137215


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
