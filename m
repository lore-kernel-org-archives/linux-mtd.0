Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12fkMJ-0004Ed-00
	for mtd-list@infradead.org; Thu, 13 Apr 2000 15:12:39 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12fkMI-0004EX-00
	for mtd@infradead.org; Thu, 13 Apr 2000 15:12:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38F5D351.36983379@tsai.es> 
References: <38F5D351.36983379@tsai.es> 
To: Rodrigo Moya <rmoya@tsai.es>
Cc: MTD List <mtd@infradead.org>
Subject: Re: problems compiling 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 13 Apr 2000 15:12:49 +0100
Message-ID: <18216.955635169@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


rmoya@tsai.es said:
>  I've found again one of the errors I found yesterday: ram_write is
> defined both in mtdram.c and mapped.c. I forgot to mention this one,
> but yesterday I commented the ram_write definition in mtdram.c.

> Is this another problem of mine?

No, this is a real problem - they should both be declared 'static'.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
