Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14H6vy-0004d8-00
	for mtd-list@infradead.org; Fri, 12 Jan 2001 16:20:10 +0000
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14H6vx-0004cw-00
	for mtd@infradead.org; Fri, 12 Jan 2001 16:20:09 +0000
Received: from godzilla.axis.se (godzilla.axis.se [10.13.9.111])
	by roma.axis.se (8.9.3/8.9.3) with ESMTP id RAA01969
	for <mtd@infradead.org>; Fri, 12 Jan 2001 17:19:17 +0100 (MET)
Date: Fri, 12 Jan 2001 19:27:45 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: mtd@infradead.org
Subject: mtdpart.c
Message-ID: <Pine.LNX.4.21.0101121920380.26282-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi! I'm adding a physical mapping for our flash partitioning. Basically
it's just that I read a partition-table at the start of the flash, and
then I want different devices created that correspond to the different
partitions. 

I noticed that pnc2000.c uses add_mtd_partitions, but this is defined in
mtdpart.c which is not in the Makefile.. is it safe to use this or should
I conjure up partition code myself in my mapping ?

Regards,
Bjorn




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
