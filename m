Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141XPN-0007Te-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 17:22:09 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141XPM-0007TY-00
	for mtd@infradead.org; Thu, 30 Nov 2000 17:22:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <44632C76B97BD211AF6B00805FADCAB202D738E9@exchange.saltaire.pace.co.uk> 
References: <44632C76B97BD211AF6B00805FADCAB202D738E9@exchange.saltaire.pace.co.uk> 
To: Simon Wood <Simon.Wood@pace.co.uk>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: M-System DOC Millennium with MTD. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Nov 2000 17:22:07 +0000
Message-ID: <11642.975604927@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Simon.Wood@pace.co.uk said:
> 	Nov 30 15:34:23 leper kernel: M-Systems DiskOnChip driver. (C) 1999
> Machine Vision Holdings, Inc.

> And /proc/mtd is empty 

Try changing the jumpers so the DiskOnChip appears at a different location. 
Also try setting CONFIG_MTD_DOCPROBE_ADDRESS to the address at which you know 
the device is mapped.

Can you show me the contents of your .config? At least the CONFIG_MTD* 
parts.
--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
