Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141rMh-000383-00
	for mtd-list@infradead.org; Fri, 01 Dec 2000 14:40:43 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141rMf-00037x-00
	for mtd@infradead.org; Fri, 01 Dec 2000 14:40:42 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: ollie@sis.com.tw, linuxbios@lanl.gov
Subject: DiskOnChip 2000/Millennium driver merge.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Dec 2000 14:40:32 +0000
Message-ID: <8574.975681632@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I've now cleaned up some of the differences between the new combined 
doc200[01] driver and the doc2001-only driver, and enabled 
DOC_SINGLE_DRIVER in the docprobe code.

I haven't removed the conditional stuff for two reasons -
	1. Ollie wants to keep the separate doc2001 driver for easier
		development and testing
	2. The doc2000 driver doesn't actually _work_ for writing. It
		exhibits the same behaviour with both types of device -
		writes to NFTL just don't appear to _stay_ written.

If you need write support for the Millennium right now, just comment out
the definition of DOC_SINGLE_DRIVER in docprobe.c and continue to use 
the doc2001 module.

As the doc2001 driver is working fine, I'm fairly sure it's a hardware
driver problem, not an NFTL code problem. Writes to the main body of the
flash appear to work too, so I currently suspect that it's an OOB data write
problem. 

If anyone else with Millennium hardware could take a look at the 
differences between doc2000.c and doc2001.c, especially Ollie who actually 
knows what he's doing, that'd be very much appreciated.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
