Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sUWx-0003ic-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 20:00:51 +0100
Received: from user-vc8ftn3.biz.mindspring.com ([216.135.246.227] helo=mail.ivivity.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14sUWw-0003iV-00
	for mtd@infradead.org; Wed, 25 Apr 2001 20:00:50 +0100
Message-ID: <25369470B6F0D41194820002B328BDD27CB5@ATLOPS>
From: Marc Karasek <marc_karasek@ivivity.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: nftl_format
Date: Wed, 25 Apr 2001 15:00:02 -0400
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I just d/l and compiled the format utility to format a 32mb doc device.  

When I tried to run it, it complained about the erase size not being 8K in
size. I did a printf 
to see what size it was reading and it is 16K (0x4000).  Is this an issue
just with nftl_format?  If so i will fix this, if this is also an issue with
the driver I can look into this also.

Marc Karasek
Sr. Firmware Eng
iVivity Inc.
marc_karasek@ivivity.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
