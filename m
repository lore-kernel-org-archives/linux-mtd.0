Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MqFKU-00064d-Us
	for linux-mtd@lists.infradead.org; Wed, 23 Sep 2009 00:03:35 +0000
Date: Tue, 22 Sep 2009 17:02:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: avorontsov@ru.mvista.com
Subject: Re: [PATCH 2/6] mtd: m25p80: Convert to device table matching
Message-Id: <20090922170215.b5c2d02c.akpm@linux-foundation.org>
In-Reply-To: <20090922235534.GA3796@oksana.dev.rtsoft.ru>
References: <20090731003957.GA23982@oksana.dev.rtsoft.ru>
	<20090731004100.GB8371@oksana.dev.rtsoft.ru>
	<200908031954.50955.david-b@pacbell.net>
	<20090922141705.b5d31e24.akpm@linux-foundation.org>
	<20090922230150.GA27593@oksana.dev.rtsoft.ru>
	<1253663027.27055.528.camel@macbook.infradead.org>
	<20090922235534.GA3796@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: ben@fluff.org, benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
	grant.likely@secretlab.ca, lm-sensors@lm-sensors.org,
	david-b@pacbell.net, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com,
	khali@linux-fr.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 23 Sep 2009 03:55:34 +0400
Anton Vorontsov <cbouatmailru@gmail.com> wrote:

> On Tue, Sep 22, 2009 at 04:43:47PM -0700, David Woodhouse wrote:
> > On Wed, 2009-09-23 at 03:01 +0400, Anton Vorontsov wrote:
> > > 
> > > And the two patches I sent on top:
> > > 
> > > http://lkml.org/lkml/2009/8/18/364
> > > http://lkml.org/lkml/2009/8/18/366
> > 
> > Got versions of those which apply to the mtd-2.6.git tree (which I'm
> > about to ask Linus to pull)? 
> 
> I'd love to, but they depend on a bunch of SPI patches that are still
> in -mm tree.

oh, is that why I queued them up where I did.  Sigh.

> As soon as SPI core changes hit Linus' tree, I think
> Andrew will send all m25p80 patches to you anyway.

Or David can ack them and I'll send 'em up.
