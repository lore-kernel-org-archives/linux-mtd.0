Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11viiC-0004by-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 15:09:00 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11viiB-0004bs-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 15:08:59 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <384C49A2.CBD3B7CD@danielind.com> 
References: <384C49A2.CBD3B7CD@danielind.com> 
To: Vipin Malik <vmalik@danielind.com>
Cc: MTD <mtd@imladris.mvhi.com>
Subject: Re: [Fwd: power down] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 Dec 1999 15:10:15 +0000
Message-Id: <E11vijP-00034X-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


vmalik@danielind.com said:
>  <desperate plea> Come on guys (and gals). Am I championing a lost
> cause here? Have we given up on power down reliability of nonvolatile
> data in embedded systems under Linux?

Power down reliability of such data is an absolute must. I expect embedded 
systems using NFTL and ext3 to be absolutely reliable even if the plug is 
pulled half-way through a write.

This means we end up with two separate journalling / logging mechanisms - one
at the block device level (ext3) and one at the flash media level (NFTL). As I
said - ideally, we ditch that in the end and have a journalling/log-structured
filesystem directly on the flash media.

> Is anyone interested in this!? Lurkers please respond. How many people
> read this list anyway? </desperate plea> 

infradead /var/lib/majordomo/lists $ wc -l mtd
     64 mtd


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
