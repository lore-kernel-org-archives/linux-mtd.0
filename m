Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13KWh1-00008L-00
	for mtd-list@infradead.org; Fri, 04 Aug 2000 02:54:35 +0100
Received: from sis.com.tw ([203.67.208.2] helo=fw11.sis.com.tw)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13KWgv-00008F-00
	for mtd@infradead.org; Fri, 04 Aug 2000 02:54:30 +0100
Message-ID: <398A226D.8E19BF9F@sis.com.tw>
Date: Fri, 04 Aug 2000 09:54:53 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Ciro Cattuto <ciro@prosa.it>
CC: mtd@infradead.org
Subject: Re: DOC2000 & NFTL problems
References: <20000802134851.A2924@localhost> <3988F8D2.FD1AB1E2@sis.com.tw> <20000803125852.A1378@localhost>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Ciro Cattuto wrote:
> 
> On Thu, Aug 03, 2000 at 12:45:06PM +0800, Ollie Lho wrote:
> 
> > It seems that the nftl.c can not find the correct NFTL partition on the DoC,
> > can you use nftldump ??
> 
> Here it is. Any ideas?
> 
> Ciro
> 
>  --------------------------------------------------------------
>  # ./nftldump
>  NFTL Media Header found at offset 16000:
>  NumEraseUnits:    501
>  FirstPhysicalEUN: 11
>  Formatted Size:   1998848
>  UnitSizeFactor:   0xff
>  Second NFTL Media Header found at offset 18000
>  EraseMark not present in unit 11: 0
>  Unit 11 is free
>  EraseMark not present in unit 12: 0
>  Unit 12 is free
>  EraseMark not present in unit 13: 0
>  Unit 13 is free
>  EraseMark not present in unit 14: 0
>  Unit 14 is free
>  EraseMark not present in unit 15: 0
>  [...]
>  Unit 209 is free
>  EraseMark not present in unit 210: 0
>  Unit 210 is free
>  Unit 211 is free
>  EraseMark not present in unit 212: 0
>  Unit 212 is free
>  EraseMark not present in unit 213: 0
>  [...]
>  EraseMark not present in unit 463: 0
>  Unit 463 is free
>  EraseMark not present in unit 464: ffff
>  Unit 464 is free
>  EraseMark not present in unit 465: 0
>  Unit 465 is free
>  EraseMark not present in unit 466: 0
>  [...]
>  EraseMark not present in unit 509: 0
>  Unit 509 is free
>  EraseMark not present in unit 510: 0
>  Unit 510 is free
>  EraseMark not present in unit 511: 0

The DoC is not properly nftl_formatted, or the OOB areas are broken
or not correctly accessed by doc2000.c

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
