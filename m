Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OC8Iw-0008Dr-4T
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 09:32:41 +0000
Subject: Re: UBIL design doc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <alpine.LFD.2.00.1005121103010.3401@localhost.localdomain>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
	<1273475736.2209.88.camel@localhost>
	<alpine.LFD.2.00.1005102011400.3401@localhost.localdomain>
	<1273650099.22706.41.camel@localhost>
	<alpine.LFD.2.00.1005121103010.3401@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 May 2010 12:31:15 +0300
Message-ID: <1273656675.22706.62.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Brijesh Singh <brijesh.s.singh@gmail.com>, rohitvdongre@gmail.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-12 at 11:06 +0200, Thomas Gleixner wrote:
> On Wed, 12 May 2010, Artem Bityutskiy wrote:
> > On Tue, 2010-05-11 at 21:17 +0200, Thomas Gleixner wrote:
> > > 
> > > Also chaining has a tradeoff. The more chains you need to walk the
> > > closer you get to the point where you are equally bad as a full scan.
> > 
> > Well, every new chain member reduces the superblock wear speed by order
> > 2, so I the chain would have 2-4 eraseblocks in most cases, I guess,
> > which is not bad.
> > 
> > In the opposite, moving the SB 3-4 eraseblocks further only reduces the
> > load merely by factor 3-4.
> 
> Right, but having the flexibility of moving the super block in the
> first 16 or 32 blocks is not going to hurt the attach time
> significantly. I'm not against the super block and chain design, I
> merily fight fixed address designs.

Yeah, I guess this is not a big deal to shift the SB forward a bit if
needed.

It is not worth discussing further, but to make sure Brijesh is focused
on the most important things, I'd like to note that implementation-wise,
it is OK to have a constant defined to 1 so far, and later test that
everything works just fine when it is something else, and optionally
implement the SB searching function.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
