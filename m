Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Sfe9-0006tx-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 13:37:33 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Sfe8-0006tr-00
	for mtd@infradead.org; Tue, 13 Feb 2001 13:37:32 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002b01c095b4$fe0387b0$0a01a8c0@Win1> 
References: <002b01c095b4$fe0387b0$0a01a8c0@Win1> 
To: joakim.tjernlund@lumentis.se
Cc: mtd@infradead.org
Subject: Re: Boot flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Feb 2001 13:37:21 +0000
Message-ID: <12130.982071441@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


joakim.tjernlund@lumentis.se said:
> I want to use JFFS on a custom made PPC860 board. This board will have
> NOR flash memory(Intel) and will probably use ppcboot(suggestions for
> better boot loader welcome). Can I have ppcboot share a flash device
> with JFFS?

Assuming ppcboot is happy with this arrangement, yes. Arrange the 'map'
driver to split the flash into multiple partitions after probing it. See
pnc2000.c for one of many examples of this. The boot partition appears to
the upper layers, including JFFS, as an entirely separate MTD device.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
