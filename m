Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12tt5f-0001fe-00
	for mtd-list@infradead.org; Mon, 22 May 2000 15:21:55 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12tt5e-0001fY-00
	for mtd@infradead.org; Mon, 22 May 2000 15:21:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20000522161756.A23047@veritas.com> 
References: <20000522161756.A23047@veritas.com>  <29342.958997177@devel2.axiom.internal> 
To: Andries Brouwer <aeb@veritas.com>
Cc: linux-kernel@vger.rutgers.edu, mtd@infradead.org
Subject: Re: HDIO_GETGEO vs. BLKGETSIZE 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 22 May 2000 15:21:53 +0100
Message-ID: <30907.959005313@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


aeb@veritas.com said:
> A modern fdisk will use the values for heads and sectors/track given
> by HDIO_GETGEO, but ignore the value for cylinders.

> Indeed, since cylinders is a 16-bit field and the number of cylinders
> can be larger than 65535, the value may be truncated, and is to be
> considered worthless.

> Instead, the number of cylinders is computed as BLKGETSIZE/(H*S).

What if BLKGETSIZE/(H*S) isn't an integer?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
