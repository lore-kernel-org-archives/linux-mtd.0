Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sMMg-000779-00
	for mtd-list@infradead.org; Thu, 18 May 2000 10:13:10 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12sMMf-000773-00
	for mtd@infradead.org; Thu, 18 May 2000 10:13:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200005180840.KAA32242@pop.systemy.it> 
References: <200005180840.KAA32242@pop.systemy.it> 
To: Alessandro Rubini <rubini@pop.systemy.it>
Cc: phiggins@transzap.com, mtd@infradead.org
Subject: Re: DoC2k_init problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 May 2000 10:13:07 +0100
Message-ID: <15617.958641187@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rubini@pop.systemy.it said:
>  Hmm.. what about request_mem_region()?

That's only in 2.3, though, isn't it? I'm trying to avoid adding too much
2.3-specific code at this stage.

Besides which, we've just realised (and I'm writing that response now) that 
we have to eliminate duplicates more strictly than that - if you don't 
decode all the address lines, the same DiskOnChip can turn up at different 
locations too.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
