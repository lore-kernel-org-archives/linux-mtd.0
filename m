Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14l4G6-0002aD-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 08:32:46 +0100
Received: from [203.102.220.26] (helo=mail.nulec.com.au)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14l4G5-0002a7-00
	for mtd@infradead.org; Thu, 05 Apr 2001 08:32:45 +0100
Message-ID: <1072F1A27E99D3119747005004B9A380EB98A4@MAIL>
From: Brett Carswell <BrettC@nulec.com.au>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: CFI with 4 x8/x16 devices on a 32-bit bus
Date: Thu, 5 Apr 2001 17:32:38 +1000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi All,

I'm having problems getting MTD working on a RPXLite board. I'm not having
endian problems as have been discussed recently - that part seems OK. The
board has four AMD 29LV160 chips which are in x8 mode. These chips can also
be in x16 mode but aren't in this case. 

My first question is am I correct in expecting that I should see these chips
detected as 4 x8 Devices in 32-bit mode? I can get them working in this mode
only by shifting all the offset addresses in my mapping functions right by
one. However when I do this and write to the flash every second word is
skipped (not surprisingly).

It's as though I need to shift the addresses for the CFI commands only. I
looked in the archives from a couple of months ago an it seemed as though
the problem was fixed. Perhaps I'm missing a point somewhere.

Thanks in advance,
Brett Carswell

Nu-Lec Industries  (ACN 085 972 425)
35-37 South Street, Lytton, Brisbane, Qld, 4178, Australia
PO Box 761, Wynnum, Qld, 4178, Australia
Direct Dial Phone No:	+61 7 3249 5498
Switchboard Phone No:	+61 7 3249 5444
Facsimile No:		+61 7 3249 5888
Email Address:		BrettC@nulec.com.au
World Wide Web Site:	http://www.nulec.com.au




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
