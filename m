Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Fa5d-0003NI-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 11:31:33 +0100
Message-ID: <397825D6.BDE058A3@sis.com.tw>
Date: Fri, 21 Jul 2000 18:28:38 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
        "Ronald G. Minnich" <rminnich@lanl.gov>, Joe Wang <joewang@sis.com.tw>,
        "K.M. Liu" <kmliu@sis.com.tw>, mtd@infradead.org,
        freebios-devel@sourceforge.net
Subject: SOLVED: Turnning On DOC Millennium ECC Logic
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=big5
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David,
	I have successfully turned on the ECC logic of DoC Millennium. The
ECC logic correctly caculate the ECC on both read and write cases. Now the Millennium driver is as complete as DoC 2000
driver. I will send you a patch
next Monday after I did some test (should I CC to Linus also ??).

Ronald,
	I can now program the IPL area correctly, the IPL area can be download
by the internal logic of the Millennium such that the disk on chip acts as a
512 bytes ROM when power-up. We can proceed to work on how to shrink the DRAM
sizing/timing code into 512 byte. After that we will have a complete Diskless,
BIOSless, maintance free enviroment which should be very useful for you cluster
nodes. BTW, did you read the SPD DRAM sizing/timing code I sent to you ?? And
did you reproduce the SiS FB (no VGA BIOS) stuff on your side ??

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
