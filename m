Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19MsIT-0005Ks-C7
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 17:36:33 +0100
Date: Mon, 2 Jun 2003 18:37:04 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030602163704.GC679@wohnheim.fh-wedel.de>
References: <20030530144959.GA4736@wohnheim.fh-wedel.de>
	<002901c32919$ddc37000$570486da@w0a3t0>
	<20030602153656.GA679@wohnheim.fh-wedel.de>
	<1054568407.20369.382.camel@passion.cambridge.redhat.com>
	<20030602155353.GB679@wohnheim.fh-wedel.de>
	<1054569564.20369.385.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1054569564.20369.385.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 June 2003 16:59:25 +0100, David Woodhouse wrote:
> On Mon, 2003-06-02 at 16:53, Jörn Engel wrote:
> > Maybe lazy allocation.  vmalloc() it with the first write(), which
> > should be never in production use.  So the extra overhead doesn't
> > really matter.
> 
> Seems reasonable.

Patch is in CVS.

Not 100% sure about the correct return code, if the lazy allocation
fails.  Can you check that?

Matsunaga, I guess that the extra memory you now have on your machine
has more impact on performance than statical allocation would have.
Translate the saved memory into a monetary unit and you even have a
lart that works for managers.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
