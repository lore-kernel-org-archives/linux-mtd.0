Received: from cc60549-a.deven1.ov.nl.home.com ([217.120.142.92] helo=server.wielewaal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175USG-0006CC-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 17:38:17 +0100
Received: from lunarpieter (lunarpieter.wielewaal [192.168.14.99])
	by server.wielewaal (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with SMTP id g48Gc4630225
	for <linux-mtd@lists.infradead.org>; Wed, 8 May 2002 18:38:04 +0200
From: "Pieter Grimmerink" <mailinglists@grimmerink.nl>
To: <linux-mtd@lists.infradead.org>
Subject: Current status JFFS2 on DOC
Date: Wed, 8 May 2002 18:37:08 +0200
Message-ID: <MPBBIIEFELAEABNCNHMMGELBDAAA.mailinglists@grimmerink.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I was quite happy to read about the recent efforts to support
JFFS2 on NAND devices.

Currently I'm about to make a decision on which flash device
to use for a new embedded device. 
Looking at prices NAND flash looks like the best option, 
especially if we can use JFFS2 on it.

>From a design point of view, DiscOnChip looks nice with
it's feature to boot from it.
SmartMedia looks a bit cheaper, but that would require
a separate NOR device, large enough to hold a compressed
kernel, total price going up above the DOC prices again.

However, all that I have found so far in mailinglists and
howto's, indicates that JFFS2 on smartmedia has been further
investigated then JFFS2 on DOC.
But as far as I understand, there should be no physical limitation
on a DOC to eventually host a JFFS2 filesystem.

Is this all true, and has someone managed to get a working 
JFFS2 filesystem on a DOC? 
and finaly, what are the chances of acutally booting into a 
JFFS2 root filesystem directly from a DOC?
(I heard something about a modified GNU GRUB to replace the DOC
firmware)

This would eventually all have to run on a non-x86 processor.

Is this a workable solution already, or would I have to go for
more 'conventional' hardware to be safe?

Best regards,

Pieter Grimmerink
