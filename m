Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ABqk-0006Mx-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 14:37:54 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13ABqh-0006Mp-00
	for mtd@infradead.org; Thu, 06 Jul 2000 14:37:52 +0100
From: Dvir Oren <dvir@lucidvon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date: Thu,  6 Jul 2000 16:36:49 +0300 (IDT)
To: rmoya@tsai.es
CC: MTD <mtd@infradead.org>
Subject: Re: Re: plilo problems
In-Reply-To: <E13AA03-0005yZ-00@infradead.org>
References: <E13AA03-0005yZ-00@infradead.org>
Message-ID: <14692.35524.994297.742349@jodie.lucid>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Rodrigo Moya writes ("Re: Re: plilo problems"):

> > LILO
> > .ccboot:
> > Loading linux.........................

It might be because you have a large kernel.  One of the effects that
the patch does is limit the size of the kernel you can use.  I think
that LILO should have warned about it, or not installed it, but I may
be wrong.  What size kernel are you using?  I think it should not be
larger than 450K or so.  Try to make a smaller kernel.

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
