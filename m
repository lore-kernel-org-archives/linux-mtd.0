Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pYY1-0002ka-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 17:41:49 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pYY0-0002kT-00
	for mtd@infradead.org; Tue, 17 Apr 2001 17:41:48 +0100
Received: from dwmw2 (helo=redhat.com)
	by passion.cambridge.redhat.com with local-esmtp (Exim 3.16 #2)
	id 14pYXx-0001pK-00
	for mtd@infradead.org; Tue, 17 Apr 2001 17:41:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.30.0103262244130.27497-100000@imladris.demon.co.uk> 
References: <Pine.LNX.4.30.0103262244130.27497-100000@imladris.demon.co.uk> 
Cc: mtd@infradead.org
Subject: Re: Directory restructure? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Apr 2001 17:41:45 +0100
Message-ID: <7025.987525705@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
> It's getting a bit cluttered... I'm pondering the wisdom of
> rearranging it  into something like...

> drivers/mtd/chips - CFI, JEDEC, ROM, RAM, amd_flash, etc. 
> drivers/mtd/maps - all the map drivers drivers/mtd/devices - all-in-one drivers
> like mtdram, doc2000, etc.

It's done. I haven't yet fixed up the Makefile - I'll do it tomorrow if 
nobody's beaten me to it.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
