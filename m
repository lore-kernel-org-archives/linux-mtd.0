Received: from mailhub.hp.com ([192.151.27.10])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1C4ppM-0001fW-UK
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2004 19:56:46 -0400
From: "Christopher Hoover" <ch@hpl.hp.com>
To: <tharbaugh@lnxi.com>, "'Ben Dooks'" <ben-mtd@fluff.org>
Date: Tue, 7 Sep 2004 16:52:53 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <1094564091.20769.350.camel@tubarao>
Message-Id: <20040907235310.31BF32711A@mailhub.hp.com>
Cc: ben@fluff.org, linux-mtd@lists.infradead.org
Subject: RE: jedec_probe problems with 16bit devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> It seems like the CFI_DEVICETYPE_X8 was changed to cfi->device_type at
> one point and it broke some 16-bit chips.
> 
> I think all of the CFI_DEVICETYPE_X8s were removed from jedec_probe.c
> 1.30, but then some were added back in at 1.36.  I'm trying 
> to find the
> discussion as to why this happened, but what I'm finding isn't very
> descriptive:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2003-October/00
> 8685.html
> 
> I seem to remember IRC'ing with Christopher Hoover on this.  Maybe he
> can remember something?  Christopher?  My memory is somewhat murky.

I don't have any new information to report -- only what is noted above, that
some regression in the mtd tree about the time the CFI_DEVICETYPE_X8's
disappeared.  It was never fixed while I worked with the board.  It may be
fine now, but unfortunately I am unable to check easily.

Can we locate someone with a suitable platform and coax them into testing
the latest code?

-ch
