Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13KInz-0005yl-00
	for mtd-list@infradead.org; Thu, 03 Aug 2000 12:04:51 +0100
Received: from [213.255.48.147] (helo=giga.prosa.it ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13KInx-0005yf-00
	for mtd@infradead.org; Thu, 03 Aug 2000 12:04:50 +0100
Date: Thu, 3 Aug 2000 12:58:52 +0200
From: Ciro Cattuto <ciro@prosa.it>
To: Ollie Lho <ollie@sis.com.tw>
Cc: mtd@infradead.org
Subject: Re: DOC2000 & NFTL problems
Message-ID: <20000803125852.A1378@localhost>
References: <20000802134851.A2924@localhost> <3988F8D2.FD1AB1E2@sis.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3988F8D2.FD1AB1E2@sis.com.tw>; from ollie@sis.com.tw on Thu, Aug 03, 2000 at 12:45:06PM +0800
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, Aug 03, 2000 at 12:45:06PM +0800, Ollie Lho wrote:

> It seems that the nftl.c can not find the correct NFTL partition on the DoC,
> can you use nftldump ??

Here it is. Any ideas?

Ciro

 --------------------------------------------------------------
 # ./nftldump
 NFTL Media Header found at offset 16000:
 NumEraseUnits:    501
 FirstPhysicalEUN: 11
 Formatted Size:   1998848
 UnitSizeFactor:   0xff
 Second NFTL Media Header found at offset 18000
 EraseMark not present in unit 11: 0
 Unit 11 is free
 EraseMark not present in unit 12: 0
 Unit 12 is free
 EraseMark not present in unit 13: 0
 Unit 13 is free
 EraseMark not present in unit 14: 0
 Unit 14 is free
 EraseMark not present in unit 15: 0
 [...]
 Unit 209 is free
 EraseMark not present in unit 210: 0
 Unit 210 is free
 Unit 211 is free
 EraseMark not present in unit 212: 0
 Unit 212 is free
 EraseMark not present in unit 213: 0
 [...]
 EraseMark not present in unit 463: 0
 Unit 463 is free
 EraseMark not present in unit 464: ffff
 Unit 464 is free
 EraseMark not present in unit 465: 0
 Unit 465 is free
 EraseMark not present in unit 466: 0
 [...]
 EraseMark not present in unit 509: 0
 Unit 509 is free
 EraseMark not present in unit 510: 0
 Unit 510 is free
 EraseMark not present in unit 511: 0
 Unit 511 is free
 Virtual Unit #0: Not present
 Virtual Unit #1: Not present
 Virtual Unit #2: Not present
 Virtual Unit #3: Not present
 Virtual Unit #4: Not present
 [...]
 Virtual Unit #243: Not present
 Virtual Unit #244: Not present
 # 
 --------------------------------------------------------------


-- 
Ciro Cattuto, Open Source Developer, Linuxcare Italia SpA
Tel. +39.338.3002140  Fax +39.049.8036484 
ciro@linuxcare.com    http://www.linuxcare.com/
ciro@prosa.it         http://www.prosa.it/
Linuxcare. Support for the revolution.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
