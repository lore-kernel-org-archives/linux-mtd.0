Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12fOB3-0001U7-00
	for mtd-list@infradead.org; Wed, 12 Apr 2000 15:31:33 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12fOB2-0001U0-00
	for mtd@infradead.org; Wed, 12 Apr 2000 15:31:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38F4855A.EF47278A@tsai.es> 
References: <38F4855A.EF47278A@tsai.es> 
To: Rodrigo Moya <rmoya@tsai.es>
Cc: MTD List <mtd@infradead.org>
Subject: Re: problems compiling 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 12 Apr 2000 15:31:27 +0100
Message-ID: <2127.955549887@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


rmoya@tsai.es said:
>  I haven't investigated too much why are these errors, but the first
> is about linux/compatmac.h.

compatmac.h contains a handful of macros which allow you to use 2.3 code 
with 2.2 kernels. If you really can't update your kernel, you should be 
able to get away with just grabbing a copy of include/linux/compatmac.h 
from a newer kernel.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
