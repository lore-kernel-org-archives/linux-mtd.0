Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZwYa-00069i-00
	for mtd-list@infradead.org; Fri, 15 Sep 2000 15:33:36 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZwYZ-00069c-00
	for mtd@infradead.org; Fri, 15 Sep 2000 15:33:35 +0100
Message-ID: <39C2342C.F24C13F3@arcom.co.uk>
Date: Fri, 15 Sep 2000 15:37:32 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: Can't read bytes from x16 device
References: <39C1F36B.8E97D5F4@arcom.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Vrabel wrote:

> I have an Intel 28F640J5 part in x16 mode.  It appears I can't read
> bytes which are odd aligned.  After reading one odd aligned byte all
> reads fail.

Reading the specs for this chip indicates that the high byte is not used
for command or status information.  So I changed
do_read_1_by_16_onechip() to align commands and status reads on word
boundaries.

David Vrabel.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
