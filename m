Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OC7tc-0002xM-Ds
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 09:06:28 +0000
Date: Wed, 12 May 2010 11:06:22 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIL design doc
In-Reply-To: <1273650099.22706.41.camel@localhost>
Message-ID: <alpine.LFD.2.00.1005121103010.3401@localhost.localdomain>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
	<1273475736.2209.88.camel@localhost>
	<alpine.LFD.2.00.1005102011400.3401@localhost.localdomain>
	<1273650099.22706.41.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Brijesh Singh <brijesh.s.singh@gmail.com>, rohitvdongre@gmail.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 May 2010, Artem Bityutskiy wrote:
> On Tue, 2010-05-11 at 21:17 +0200, Thomas Gleixner wrote:
> > 
> > Also chaining has a tradeoff. The more chains you need to walk the
> > closer you get to the point where you are equally bad as a full scan.
> 
> Well, every new chain member reduces the superblock wear speed by order
> 2, so I the chain would have 2-4 eraseblocks in most cases, I guess,
> which is not bad.
> 
> In the opposite, moving the SB 3-4 eraseblocks further only reduces the
> load merely by factor 3-4.

Right, but having the flexibility of moving the super block in the
first 16 or 32 blocks is not going to hurt the attach time
significantly. I'm not against the super block and chain design, I
merily fight fixed address designs.
 
Thanks,

	tglx
