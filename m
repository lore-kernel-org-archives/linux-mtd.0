Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12XKYQ-0005iX-00
	for mtd-list@infradead.org; Tue, 21 Mar 2000 09:02:22 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12XKYP-0005iR-00
	for mtd@infradead.org; Tue, 21 Mar 2000 09:02:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200003210701.QAA28683@mail0.dreamwiz.com> 
References: <200003210701.QAA28683@mail0.dreamwiz.com> 
To: trusty@dreamwiz.com
Cc: mtd@infradead.org
Subject: Re: Any body has physmem.o or physmem.c? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 Mar 2000 09:02:20 +0000
Message-ID: <30827.953629340@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


trusty@dreamwiz.com said:
>  I have installed  mtd-20000131, but this version has no physmem.o nor
> physmem.c. So, please anybody help me!

It's now called slram.c, but I've been given a better way of simulating, and I 
have yet to commit it to the CVS tree. Watch this space...

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
