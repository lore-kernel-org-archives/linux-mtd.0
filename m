Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12SdV9-0000py-00
	for mtd-list@infradead.org; Wed, 08 Mar 2000 10:15:35 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12SdV8-0000ps-00
	for mtd@infradead.org; Wed, 08 Mar 2000 10:15:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000308093421.13423C-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000308093421.13423C-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org
Subject: Re: mtd comments 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 Mar 2000 10:15:32 +0000
Message-ID: <2182.952510532@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  .
> This is mainly used as a bootsector type of thing. The idea seems to
> be that if your boot-code is a lot less than 64k you don't waste so
> much space. And you can also store configuration data in one of the
> smaller sectors, and rewrite it without destroying the boot sector. 

Options include...

1. Ignore the smaller erasesize - pretend it's 64Kb and force you to erase the 
whole lot at once.

2. Treat the parts with different erasesize as different logical devices as 
far as the MTD layer is concerned.

3. Change the MTD interface so it can handle variable sector sizes somehow.

As you seem to be implying that the parts with different sector sizes are used 
for a different purpose than the majority of the flash device, I'm inclined 
to favour #2 for now.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
