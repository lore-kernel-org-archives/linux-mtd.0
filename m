Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Zc5Y-0002JX-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 17:42:16 +0100
Received: from caja.ldhs.cetuc.puc-rio.br ([139.82.28.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Zc5S-0002JQ-00
	for mtd@infradead.org; Thu, 14 Sep 2000 17:42:14 +0100
From: "Miguel Freitas" <miguel@cetuc.puc-rio.br>
To: ithompson@coollogic.com
Date: Thu, 14 Sep 2000 13:41:08 GMT-3
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: lilo patch
Reply-to: miguel@cetuc.puc-rio.br
CC: mtd@infradead.org
Message-ID: <4DB39F451F@mamao.cetuc.puc-rio.br>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


	Hi Ian,

> 64M DOC2000s don't seem to work with M-Systems binary driver.
> 
> Has anyone any experience with 64M DOC2000s? We have several and
> approx. 25% won't format to full capacity with the M-Systems
> utilities.

   The newest DiskOnChip driver in CVS (our driver, not the M-
Systems) should be aware of 64M nand chips. Unfortunatly, NFTL 
may not work with non 8kbytes erase blocks (64M have 16kbytes 
blocks), but I really don't know. I'm a little busy, and I haven't 
checked nftl code yet....
   I would be grateful if you could try the latest CVS code and report 
and success/failures. There is a utility (nandtest) where you can test 
raw access to nand chips without nftl.
   I think there are new drivers on the M-Systems site to handle 64M 
DOC2000s, but probably not for linux.


Regards,

Miguel Freitas
Center for Telecommunications Studies
CATHOLIC UNIVERSITY - BRASIL
e-mail: miguel@cetuc.puc-rio.br
phone/fax#:+55-21-540-8854


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
