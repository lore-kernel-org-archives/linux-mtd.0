Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ml2cU-0008TK-8I
	for linux-mtd@lists.infradead.org; Tue, 08 Sep 2009 15:28:39 +0000
Date: Tue, 8 Sep 2009 16:28:13 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RFC] extending nand_ecclayout.eccpos once again
Message-ID: <20090908152813.GC5579@shareable.org>
References: <20090902093045.GB7377@prithivi.gnumonks.org>
	<1252390415.5060.38.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1252390415.5060.38.camel@localhost>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Jin-Sung Yang <jsgood.yang@samsung.com>,
	Ilho Lee <ilho215.lee@samsung.com>, Marc Zyngier <marc.zyngier@tomtom.com>,
	linux-mtd@lists.infradead.org, Harald Welte <laforge@gnumonks.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> Can we instead assume that exposing ECC layout to user-space is jut bad
> idea, deprecate current layout ABI, and do not do this anymore.
> 
> I mean, really, ECC layout is generally not user's concern. Just do not
> expose it and problem is solved.
> 
> Is it absolutely necessary to have expose this stuff to user-space?

Let's rephrase that question.
What tools use this information?

-- Jamie
