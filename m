Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13mZUB-0003Ex-00
	for mtd-list@infradead.org; Fri, 20 Oct 2000 11:33:15 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13mZUA-0003Er-00
	for mtd@infradead.org; Fri, 20 Oct 2000 11:33:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: kundrat@pkx.sk
Subject: Patch for NFTL corruption.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Oct 2000 11:33:06 +0100
Message-ID: <10102.972037986@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

v1.44 of nftl.c and v1.3 of nftl_format.c contain a correction to my code 
where it seems I misinterpreted the spec - pointed out by Peter Kundrat.

If you've been seeing corruption on NFTL, please obtain the new version 
from CVS and try to reproduce it.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
