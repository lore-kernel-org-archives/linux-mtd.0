Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12UdIQ-0004EO-00
	for mtd-list@infradead.org; Mon, 13 Mar 2000 22:26:42 +0000
Received: from proxy.datalux.com ([204.111.16.98] helo=datalux_nt1.datalux_nt1)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12UdIP-0004EI-00
	for mtd@infradead.org; Mon, 13 Mar 2000 22:26:41 +0000
Message-ID: <38CD6ADC.959CEB3D@datalux.com>
Date: Mon, 13 Mar 2000 17:25:32 -0500
From: Ralph Stickley <rstickley@datalux.com>
MIME-Version: 1.0
To: mtd-list <mtd@infradead.org>
Subject: Does Compact Flash work ?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Not sure if this is a good place to ask...but...

Is anyone using the Compact flash as an IDE device ?

Do these need the flash drivers used for the Disk-On-Chip ??

The problem I'm having is using these devices with the ext2 file system
format. Seems to work ok with DOS, but simply doing an fdisk and
formatting for ext2 and they act "strange" - seek errors, drive ready,
etc...fdisk doesn't seem to like them, but I can't find the CHS
infomation for any of my cards (Sandisk/PQI 32MB)...

Thanks in advance...
Ralph Stickley
Datalux, Corp.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
