Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Ydum-0002eq-00
	for mtd-list@infradead.org; Fri, 02 Mar 2001 00:59:24 +0000
Received: from [209.43.202.2] (helo=stpeter.astanetworks.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Yduk-0002e4-00
	for mtd@infradead.org; Fri, 02 Mar 2001 00:59:23 +0000
Received: from navajo.astanetworks.com (navajo.astanetworks.com [192.168.10.8])
	by stpeter.astanetworks.com (Postfix) with ESMTP id 578B07F89
	for <mtd@infradead.org>; Thu,  1 Mar 2001 17:56:02 -0600 (CST)
Message-ID: <15E6537E180CC545848148F30F6688D81945BD@navajo.astanetworks.com>
From: Pete Skelly <pete.skelly@astanetworks.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: DOC2000 - 96MB on a 650Mhz PIII - cannot doc_read_ecc 
Date: Thu, 1 Mar 2001 16:58:50 -0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


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
