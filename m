Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13U96g-0006N1-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 15:44:50 +0100
Received: from passion.cygnus.co.uk ([194.130.39.73] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13U96f-0006Mv-00
	for mtd@infradead.org; Wed, 30 Aug 2000 15:44:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <luu2c2vmue.fsf_-_@hci.ucsd.edu> 
References: <luu2c2vmue.fsf_-_@hci.ucsd.edu> 
To: David Fox <dsfox@cogsci.ucsd.edu>
Cc: mtd@infradead.org
Subject: Re: What do these log messages mean? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 30 Aug 2000 16:44:23 +0100
Message-ID: <20548.967650263@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


The 'Possible DiskOnChip with unknown ChipID 50' is just because there's no 
sensible way to probe for the hardware. Ignore it.

The real problem is "Cannot find driver for...".

Make sure you have CONFIG_MODVERSIONS turned off, and that you have 
doc2000.o loaded before you load docprobe.o

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
