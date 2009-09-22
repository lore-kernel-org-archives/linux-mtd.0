Received: from ey-out-1920.google.com ([74.125.78.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqFCt-00045G-67
	for linux-mtd@lists.infradead.org; Tue, 22 Sep 2009 23:55:43 +0000
Received: by ey-out-1920.google.com with SMTP id 5so578042eyb.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Sep 2009 16:55:37 -0700 (PDT)
Date: Wed, 23 Sep 2009 03:55:34 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/6] mtd: m25p80: Convert to device table matching
Message-ID: <20090922235534.GA3796@oksana.dev.rtsoft.ru>
References: <20090731003957.GA23982@oksana.dev.rtsoft.ru>
	<20090731004100.GB8371@oksana.dev.rtsoft.ru>
	<200908031954.50955.david-b@pacbell.net>
	<20090922141705.b5d31e24.akpm@linux-foundation.org>
	<20090922230150.GA27593@oksana.dev.rtsoft.ru>
	<1253663027.27055.528.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1253663027.27055.528.camel@macbook.infradead.org>
Cc: ben@fluff.org, benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
	grant.likely@secretlab.ca, lm-sensors@lm-sensors.org,
	David Brownell <david-b@pacbell.net>, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, khali@linux-fr.org,
	Andrew Morton <akpm@linux-foundation.org>, avorontsov@ru.mvista.com
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 22, 2009 at 04:43:47PM -0700, David Woodhouse wrote:
> On Wed, 2009-09-23 at 03:01 +0400, Anton Vorontsov wrote:
> > 
> > And the two patches I sent on top:
> > 
> > http://lkml.org/lkml/2009/8/18/364
> > http://lkml.org/lkml/2009/8/18/366
> 
> Got versions of those which apply to the mtd-2.6.git tree (which I'm
> about to ask Linus to pull)? 

I'd love to, but they depend on a bunch of SPI patches that are still
in -mm tree. As soon as SPI core changes hit Linus' tree, I think
Andrew will send all m25p80 patches to you anyway.

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
