Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12fkEn-0004CB-00
	for mtd-list@infradead.org; Thu, 13 Apr 2000 15:04:53 +0100
Received: from ncc1.infomail.es ([194.224.53.134] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12fkEm-0004Bm-00
	for mtd@infradead.org; Thu, 13 Apr 2000 15:04:52 +0100
Message-ID: <38F5D351.36983379@tsai.es>
Date: Thu, 13 Apr 2000 16:01:53 +0200
From: Rodrigo Moya <rmoya@tsai.es>
MIME-Version: 1.0
To: MTD List <mtd@infradead.org>
Subject: Re: problems compiling
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi all!

I've found again one of the errors I found yesterday: ram_write is
defined both in mtdram.c and mapped.c. I forgot to mention this one, but
yesterday I commented the ram_write definition in mtdram.c.

Is this another problem of mine?

Cheers


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
