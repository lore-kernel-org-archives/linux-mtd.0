Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xmiD-0000LD-00
	for mtd-list@infradead.org; Fri, 02 Jun 2000 09:21:49 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=exim)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12xmiC-0000L6-00
	for mtd@infradead.org; Fri, 02 Jun 2000 09:21:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000601190835.3413A-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000601190835.3413A-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: Bjorn Wesen <bjorn.wesen@axis.com>,
    Finn Hakansson <finn.hakansson@axis.com>, mtd@infradead.org,
    alan@redhat.com
Subject: Re: JFFS - ready for submission into 2.[34]? 
Mime-Version: 1.0
Content-Type: text/plain
Date: Fri, 02 Jun 2000 09:21:43 +0100
Message-ID: <28127.959934103@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  I will look at it tomorrow at work (Haven't had time before). All
> functionallity should be implemented and work. I haven't done any
> larger scale testing yet though, so it's definitely experimental.

Fine. We all know how to get larger scale testing :)

> There is a bug in the mkfs.jffs program though. It generates too big
> nodes (which the jffs code can't handle) for files that are larger
> than 64k.

I saw the dicussion about this, and was wondering why mkfs.jffs actually 
populates the filesystem at all. Is it because it's more space-efficient to 
do it all at once than it would be to mkfs, mount and populate it?


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
