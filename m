Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13erD5-0000Mh-00
	for mtd-list@infradead.org; Fri, 29 Sep 2000 04:51:43 +0100
Received: from cvsftp.cotw.com ([208.242.241.39] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13erD4-0000Mb-00
	for mtd@infradead.org; Fri, 29 Sep 2000 04:51:42 +0100
Message-ID: <39D41406.CF5BE794@cotw.com>
Date: Thu, 28 Sep 2000 23:01:10 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
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
> 1. What means NFTL? I always read ist, but I can't find what the letters
>    mean :-(
>
NFTL stands for NAND Flash Translation Layer.

> 2. Is DOC2000.c able to handle the DOC Millennium chips? When I read the
>    datasheets I mean they are different chips.
> 
The drivers for DOC2000 and DOC Millenium are being merged into
the 'doc2000.c' module and it will/should be renamed to
'diskonchip.c' .

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
 Public Key: 'finger sjhill@mail.cotw.com'
 FPR1: E124 6E1C AF8E 7802 A815
 FPR2: 7D72 829C 3386 4C4A E17D


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
