Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143XGg-00043a-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 05:37:26 +0000
Received: from mrserver.wte.net ([206.98.206.71] helo=mrserver.cachier.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143XGf-00043U-00
	for mtd@infradead.org; Wed, 06 Dec 2000 05:37:25 +0000
From: Levi Khatskevitch <LKhatskevitch@cachier.com>
Reply-To: LKhatskevitch@cachier.com
To: "Ian" <Relativity@HumanHeuristic.com>
Subject: Re: Millennium
Date: Wed, 6 Dec 2000 00:30:26 -0500
Content-Type: text/plain
References: <200012060445.OAA20682@singularity.tronunltd.com>
In-Reply-To: <200012060445.OAA20682@singularity.tronunltd.com>
Cc: mtd@infradead.org, linuxbios@lanl.gov
MIME-Version: 1.0
Message-Id: <00120600343401.02531@mrserver>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 05 Dec 2000, Ian wrote:
> Is there any firmware required on the DoC2001 to make it perform its 8 x bootblock 
> memory magic?  .. or is it all done in glue logic?
> 

No, it's in glue logic tied initially to DoC reset pin. I'm 99.99% certain
about that. If anyone says otherwise I'd be VERY surprised. My sources
M-Systems docs & mtd code.

- Levi

-- 
Levi Khatskevitch
CTO
Cachier, Corp.
575 Grand St., Suite E306
New York, NY 10002


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
