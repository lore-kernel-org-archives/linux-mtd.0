Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143c1r-0004k7-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 10:42:27 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143c1q-0004k1-00
	for mtd@infradead.org; Wed, 06 Dec 2000 10:42:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20001205122657.A11201@tetsuo.applianceware.com> 
References: <20001205122657.A11201@tetsuo.applianceware.com> 
To: Mike Panetta <mpanetta@applianceware.com>
Cc: mtd@infradead.org
Subject: Re: CVS MTD drivers -> latest devel kernel. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 06 Dec 2000 10:40:06 +0000
Message-ID: <11923.976099206@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mpanetta@applianceware.com said:
>  If I want to use the latest CVS MTD drivers in the latest (or not so
> latest 2.4.0-test10) kernel can I just copy the kernel dir in cvs to
> linux/drivers/mtd?

Also copy the contents of the include/linux/mtd/ directory into the 
appropriate place in your kernel tree.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
