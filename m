Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13euHN-0000jA-00
	for mtd-list@infradead.org; Fri, 29 Sep 2000 08:08:21 +0100
Received: from cvsftp.cotw.com ([208.242.241.39] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13euHM-0000j4-00
	for mtd@infradead.org; Fri, 29 Sep 2000 08:08:20 +0100
Received: from cotw.com (laptop1.ptec.com [192.168.10.13])
	by cvsftp.cotw.com (8.9.3/8.9.3) with ESMTP id CAA27103
	for <mtd@infradead.org>; Fri, 29 Sep 2000 02:07:43 -0500
Message-ID: <39D44220.FB9C32E4@cotw.com>
Date: Fri, 29 Sep 2000 02:17:52 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
MIME-Version: 1.0
To: MTD List <mtd@infradead.org>
Subject: First release of NAND flash device driver...
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Greetings.

I have released my first version of a NAND flash driver. While
it is written for my specific board, a person should easily be
able to simply tailor the 'nand_send_command' function to their
platform and be ready to go. I also have not put code in to
deal with the NAND devices that have 256 byte wide pages. Please
note that you may not modify the ECC algorithms in 'nand_ecc.c'
as I am still working with Toshiba on licensing terms. Comments
are welcome. I will be implementing the write functions tomorrow
and then begin modifications to JFFS! Well, I have been up for
21 hours straight and I'm off to bed. Cheers.

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
 Public Key: 'finger sjhill@mail.cotw.com'
 FPR1: E124 6E1C AF8E 7802 A815
 FPR2: 7D72 829C 3386 4C4A E17D


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
