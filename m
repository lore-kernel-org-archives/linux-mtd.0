Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Q8Lp-0007kf-00
	for mtd-list@infradead.org; Sat, 19 Aug 2000 14:07:53 +0100
Received: from ip-151-191.gw.total-web.net ([209.186.151.191] helo=150.81.192.20)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13Q8Ln-0007kZ-00
	for mtd@infradead.org; Sat, 19 Aug 2000 14:07:52 +0100
From: "Matt Hortman" <mbhortman@ieee.org>
Date: Sat, 19 Aug 2000 09:12:39 -0400
To: mtd@infradead.org
Subject: Re: Silicon storage technology disk on chips
Message-ID: <20000819091239.B1040@khayman.mavrik.com>
References: <Pine.LNX.4.04.10008171036080.3494-100000@phoenix.bmedesign.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.04.10008171036080.3494-100000@phoenix.bmedesign.com>; from mdj@phoenix.bmedesign.com on Thu, Aug 17, 2000 at 10:37:16AM -0600
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> Has anyone here heard of the ssti disk on chips and whether they
> are compatible with the m-systems chips?
> 
> The website is at
> 
> http://www.ssti.com

I just took a look at the datasheet for their ATA-Disk Chip.  It has a
completely different pinout and design goal than the M-Sys DOC.  The
SSTI chip is designed to go directly on an IDE bus and look like a
hard drive.  The pinout is completely different.  It also does not
require an additional drivers other than IDE.

(I haven't used one, I gleaned this from the datasheet).

-Matt


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
