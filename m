Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12tui3-0001wS-00
	for mtd-list@infradead.org; Mon, 22 May 2000 17:05:39 +0100
Date: Mon, 22 May 2000 18:05:36 +0200
From: Andries Brouwer <aeb@veritas.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-kernel@vger.rutgers.edu, mtd@infradead.org
Subject: Re: HDIO_GETGEO vs. BLKGETSIZE
Message-ID: <20000522180536.A23898@veritas.com>
References: <20000522163051.A23080@veritas.com> <20000522161756.A23047@veritas.com> <29342.958997177@devel2.axiom.internal> <20000522161756.A23047@veritas.com> <30907.959005313@devel2.axiom.internal> <20000522163051.A23080@veritas.com> <31364.959010436@devel2.axiom.internal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <31364.959010436@devel2.axiom.internal>; from dwmw2@infradead.org on Mon, May 22, 2000 at 04:47:16PM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, May 22, 2000 at 04:47:16PM +0100, David Woodhouse wrote:

> aeb@veritas.com said:
> > > What if BLKGETSIZE/(H*S) isn't an integer?
> > / is the C operator. It rounds down. 
> 
> Sorry, what I meant to say was:
> 
> What if (BLKGETSIZE / (H*S)) * (H*S) != BLKGETSIZE?
> 
> Is there anything that's likely to get confused by that?

No. It happens all the time:

# hdparm -g /dev/hda
 geometry     = 2100/255/63, sectors = 33750864, start = 0

and 2100*255*63 = 33736500 < 33750864.
It just means that if you use an fdisk that likes partitions
to start and end on cylinder boundaries, the last partial
cylinder is wasted. In this case that would be 7 MB.

Andries



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
