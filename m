Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14a3n4-0004em-00
	for mtd-list@infradead.org; Mon, 05 Mar 2001 22:49:18 +0000
Received: from [209.43.202.2] (helo=stpeter.astanetworks.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14a3n2-0004eg-00
	for mtd@infradead.org; Mon, 05 Mar 2001 22:49:16 +0000
Received: from navajo.astanetworks.com (navajo.astanetworks.com [192.168.10.8])
	by stpeter.astanetworks.com (Postfix) with ESMTP id B983A7F85
	for <mtd@infradead.org>; Mon,  5 Mar 2001 15:45:56 -0600 (CST)
Message-ID: <15E6537E180CC545848148F30F6688D81945CF@navajo.astanetworks.com>
From: Pete Skelly <pete.skelly@astanetworks.com>
To: Pete Skelly <pete.skelly@astanetworks.com>,
	"'mtd@infradead.org'" <mtd@infradead.org>
Subject: RE: DOC2000 - 96MB on a 650Mhz PIII - cannot doc_read_ecc 
Date: Mon, 5 Mar 2001 14:48:43 -0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Found the problem...
11.4.1 states that you must wait for ready after reading
the last byte in a page, as the flash devices needs to 
change pages.
According to the toshiba doc's on the particular flash chips
in my DoC, this holds true for both in band and out-of-band 
memory.  
The nftl driver performs an oob read to check the ANAND header, 
and the 8 byte oob data is at the end of the 16 byte oob data 
page, causing a 'busy' cycle.

I've also verified that there is no 'page end' check for
doc_read or doc_read_ecc.  

I've tested my fixes for this against my 96MB DoC on PIII module
with success, and have checked in a patch on cvs.

It'd be great if someone could verify this fix against a
DoC Millenium, as I don't have access to one of those.

A number of people have indicated they have been having problems
with larger DoC devices, and I suspect this may in fact be the problem.
Either the page swap delay is longer on larger devices, or they
are running on faster machines.  

p




-----Original Message-----
From: Pete Skelly [mailto:pete.skelly@astanetworks.com]
Sent: Friday, March 02, 2001 12:38 AM
To: Pete Skelly; 'mtd@infradead.org'
Subject: RE: DOC2000 - 96MB on a 650Mhz PIII - cannot doc_read_ecc 



Looks like timing is in fact the problem.  I multiplied the delay
in the routine DoC_Delay by 3, making this call last as long
as if my machine were a 200Mhz machine (which is probably closer to
what the Doc2000 drivers we're developed on), and was able to
successfully use nflt on the drive.

Although it looks like M-Systems doesn't publish the actual delays required,
they did indicate that there were in fact delays that had to be taken into
account.  

Any idea on the real numbers for the delays.  If one knew that, one could
write
proc-speed independent delay code (err, not sure whether I'm volunteering or
not)


Also, could this be related to some of the problems people are seeing with
larger
modules?  Do the larger modules have greater delays for sending commands to
the chip,
or are they simply found in faster systems?

p

-----Original Message-----
From: Pete Skelly [mailto:pete.skelly@astanetworks.com]
Sent: Thursday, March 01, 2001 4:59 PM
To: 'mtd@infradead.org'
Subject: DOC2000 - 96MB on a 650Mhz PIII - cannot doc_read_ecc 



I've been having trouble getting my 96MB DOC device to run on my system,
and have noticed a few others having similar problems in the archive.  

I'm using the mtd drivers from the 2.4.1 kernel (no mods)

I threw a kernel debugger on the system, and set a breakpoint where the ECC
status
is read, and it returned 0x8a, 0x8e, 0x8a during the 3 reads of  the ECC
status, 
hence a failure.

Next, I stepped through the entire doc_read_ecc process, and reading the 
ecc status returned 0x8a, 0x8e, 0x0a, a success.

This implies that there are some timing issues with either the larger DOC
chips
that are not addressed in the code, or there are timing issues caused by the
fact
that I'm running a PIII -650 system, which is a bit faster than most
embedded systems.

Anyone else come across anything like this.  I'm going to do some more
sniffing around,
to see if I can determine exactly which 'Delay' is not long enough, but if
anyone has any
technical info on what timing issues might be suspect, your help would be
appreciated.

p



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
