Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11w1KD-0005dR-00
	for mtd-list@infradead.org; Thu, 09 Dec 1999 11:01:29 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11w1KB-0005dL-00
	for mtd@imladris.mvhi.com; Thu, 09 Dec 1999 11:01:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <384EE388.C92A374E@go2fax.com> 
References: <384EE388.C92A374E@go2fax.com>  <384ECF77.C1F5D6FC@danielind.com> 
To: Bob Canup <rcanup@go2fax.com>
Cc: MTD <mtd@imladris.mvhi.com>
Subject: Re: [Fwd: Power Down] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 09 Dec 1999 11:02:40 +0000
Message-Id: <E11w1LM-0005MN-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


rcanup@go2fax.com said:
>  You can identify a bad sector - the question is what do you do about
> it? 

Use a journalling filesystem. Make sure that any sector that's being written 
is disposable - if it gets wiped, then you can just do without it. Only remove 
your old copy of the filesystem data thats in that sector when you have a 100% 
guarantee that your write has hit the media correctly.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
