Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13eqlU-0000KI-00
	for mtd-list@infradead.org; Fri, 29 Sep 2000 04:23:12 +0100
Received: from sis.com.tw ([203.67.208.2] helo=fw11.sis.com.tw)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13eqlR-0000KB-00
	for mtd@infradead.org; Fri, 29 Sep 2000 04:23:10 +0100
Message-ID: <39D40AD4.5EB3BB08@sis.com.tw>
Date: Fri, 29 Sep 2000 11:21:56 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Juergen Beisert <jbeisert@eurodsn.de>
CC: mtd@infradead.org
Subject: Re: DOC2000 and DOC Millennium
References: <3.0.6.32.20000928084316.007d1510@eurodsn.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Juergen Beisert wrote:
> 
> Two questions:
> 
> 1. What means NFTL? I always read ist, but I can't find what the letters mean :-(
> 2. Is DOC2000.c able to handle the DOC Millennium chips? When I read the datasheets I mean they are different chips.
> 
> Thanks
> Juergen Beisert
> 

1. NAND Flash Translation Layer, an M-System patented way to manange "blocks"
on NAND flash.

2. Probably, you should try. The one merged doc2001.c and doc2000.c does not
have Millennium to test. The one have Millennium (me) doese not hve time to
test it.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
