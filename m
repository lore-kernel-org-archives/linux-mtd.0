Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sLrK-00071e-00
	for mtd-list@infradead.org; Thu, 18 May 2000 09:40:46 +0100
From: Alessandro Rubini <rubini@pop.systemy.it>
Message-Id: <200005180840.KAA32242@pop.systemy.it>
Subject: Re: DoC2k_init problem
To: dwmw2@infradead.org (David Woodhouse)
Date: Thu, 18 May 100 10:40:43 +0200 (MET DST)
Cc: phiggins@transzap.com, mtd@infradead.org
In-Reply-To: <15284.958637993@devel2.axiom.internal> from "David Woodhouse" at May 18, 0 09:19:53 am
Content-Type: text
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> There's no equivalent to request_region() for memory space, unfortunately.

Hmm.. what about request_mem_region()?

/alessandro


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
