Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ttET-0001hV-00
	for mtd-list@infradead.org; Mon, 22 May 2000 15:31:01 +0100
Date: Mon, 22 May 2000 16:30:51 +0200
From: Andries Brouwer <aeb@veritas.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-kernel@vger.rutgers.edu, mtd@infradead.org
Subject: Re: HDIO_GETGEO vs. BLKGETSIZE
Message-ID: <20000522163051.A23080@veritas.com>
References: <20000522161756.A23047@veritas.com> <29342.958997177@devel2.axiom.internal> <20000522161756.A23047@veritas.com> <30907.959005313@devel2.axiom.internal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <30907.959005313@devel2.axiom.internal>; from dwmw2@infradead.org on Mon, May 22, 2000 at 03:21:53PM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, May 22, 2000 at 03:21:53PM +0100, David Woodhouse wrote:

> aeb@veritas.com said:
> > A modern fdisk will use the values for heads and sectors/track given
> > by HDIO_GETGEO, but ignore the value for cylinders.
> 
> > Instead, the number of cylinders is computed as BLKGETSIZE/(H*S).

> What if BLKGETSIZE/(H*S) isn't an integer?

/ is the C operator. It rounds down.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
