Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZbxL-00015Z-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 17:01:31 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZbxK-00015T-00
	for mtd@infradead.org; Mon, 27 Mar 2000 17:01:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000327172759.26529E-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000327172759.26529E-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
cc: mtd@infradead.org
Subject: Re: New release of MTD code pending. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 27 Mar 2000 17:01:25 +0100
Message-ID: <10326.954172885@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  All this should really be documented in mtd.h, so that one can rely
> on certain properties. The you can just fix drivers that don't
> implement stuff you depend on, instead of having to read all drivers
> to see how the api really works.

Definitely. At the moment, I don't think there even _is_ a good example to
point at. 

I started this in HTML at one point, but didn't get very far, do didn't ever 
publish it:
	http://www.linux-mtd.infradead.org/tech/API.html

> I was thinking of using alan's new kernel documentation stuff. That
> would be nice.

Yes, the DocBook stuff looks quite good.

I'd very much like to get some real documentation done, then go through the 
existing drivers and audit them sensibly against that documentation. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
