Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141Ws6-0007E7-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 16:47:46 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141Ws5-0007E1-00
	for mtd@infradead.org; Thu, 30 Nov 2000 16:47:45 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200011301404.AAA00314@singularity.tronunltd.com> 
References: <200011301404.AAA00314@singularity.tronunltd.com> 
To: "Ian" <Relativity@HumanHeuristic.com>
Cc: lkhatskevitch@hotmail.com, mtd@infradead.org
Subject: Re: inter-module-2.2.17 patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Nov 2000 16:47:33 +0000
Message-ID: <7583.975602853@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Relativity@HumanHeuristic.com said:
>  I got the "NFTL_findfreeblock: there are too few free EUNs" ... which
> is odd, since the only time I've seen them before is after a heap of
> DoC disk writes ... 

That's a normal situation. I've toned down the warning (made it a DEBUG 
message)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
