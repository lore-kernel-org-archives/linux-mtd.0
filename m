Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12tuQI-0001sx-00
	for mtd-list@infradead.org; Mon, 22 May 2000 16:47:18 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12tuQH-0001sr-00
	for mtd@infradead.org; Mon, 22 May 2000 16:47:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20000522163051.A23080@veritas.com> 
References: <20000522163051.A23080@veritas.com>  <20000522161756.A23047@veritas.com> <29342.958997177@devel2.axiom.internal> <20000522161756.A23047@veritas.com> <30907.959005313@devel2.axiom.internal> 
To: Andries Brouwer <aeb@veritas.com>
Cc: linux-kernel@vger.rutgers.edu, mtd@infradead.org
Subject: Re: HDIO_GETGEO vs. BLKGETSIZE 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 22 May 2000 16:47:16 +0100
Message-ID: <31364.959010436@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


aeb@veritas.com said:
> > What if BLKGETSIZE/(H*S) isn't an integer?
> / is the C operator. It rounds down. 

Sorry, what I meant to say was:

What if (BLKGETSIZE / (H*S)) * (H*S) != BLKGETSIZE?

Is there anything that's likely to get confused by that?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
