Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 122ecf-00010m-00
	for mtd-list@infradead.org; Mon, 27 Dec 1999 18:11:57 +0000
Received: from gate.mvhi.com ([194.205.184.34])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 122ece-00010g-00
	for mtd@infradead.org; Mon, 27 Dec 1999 18:11:56 +0000
Date: Mon, 27 Dec 1999 18:16:53 +0000 (GMT)
From: David Woodhouse <dwmw2@gate.mvhi.com>
To: Dvir Oren <dviro@lucidvon.com>
cc: MTD <mtd@infradead.org>, David Woodhouse <David.Woodhouse@mvhi.com>
Subject: Re: MTD in 2.2 kernel, and geometry error
In-Reply-To: <E121dM3-0001Cj-00@gate.mvhi.com>
Message-ID: <Pine.LNX.4.03.9912271815340.21265-100000@gate.mvhi.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Looking at the boot log, I can't see why you can't access the NFTL.
Check the contents of /proc/devices - the major number listed there for
NFTL should match the major number of your /dev/nftla1 device.

I'd check exactly what they should be but I'm at the wrong end of a 14k
dialup link.

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
