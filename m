Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NqERG-0001ub-J6
	for linux-mtd@lists.infradead.org; Fri, 12 Mar 2010 23:38:48 +0000
Date: Fri, 12 Mar 2010 23:38:20 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Patch] fix MTD CFI/LPDDR flash driver huge latency bug
Message-ID: <20100312233820.GH6491@shareable.org>
References: <1267894137.18869.0.camel@wall-e>
	<20100312142344.174bd46f.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100312142344.174bd46f.akpm@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Stefani Seibold <stefani@seibold.net>,
	David Woodhouse <dwmw2@infradead.org>, "Kreuzer,
	Michael \(NSN - DE/Ulm\)" <michael.kreuzer@nsn.com>,
	linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Morton wrote:
> On Sat, 06 Mar 2010 17:48:57 +0100
> Stefani Seibold <stefani@seibold.net> wrote:
> 
> > This patch fix a huge latency problem in the MTD CFI and LPDDR flash
> > drivers.
> > 
> > The use of a memcpy() during a spinlock operation will cause very long
> > thread context switch delays if the flash chip bandwidth is low and the
> > data to be copied large, because a spinlock will disable preemption.
> > 
> > For example: A flash with 6,5 MB/s bandwidth will cause under ubifs,
> > which request sometimes 128 KB (the flash erase size), a preemption
> > delay of 20 milliseconds. High priority threads will not be served
> > during this time, regardless whether this threads access the flash or
> > not. This behavior breaks real time.

I agree that's a problem, and it's not just real time that's affected.

I've just realised I have a video player with ~1.5 MB/s bandwidth
64kb/block flash attached, and this might be the reason JFFS2 activity
makes video play less smooth on it.  44ms is even worse.

> > The patch change all the use of spin_lock operations for xxxx->mutex
> > into mutex operations, which is exact what the name says and means.

It would be even better if it also split the critical sections into
smaller ones with cond_resched() between, so that non-preemptible
kernels benefit too.

> > There is no performance regression since the mutex is normally not
> > acquired.
> 
> hm, big scary patch.  Are you sure this mutex is never taken from
> atomic or irq contexts?  Is it ully tested with all relevant debug options
> and lockdep enabled?

Including from mtdoops?

-- Jamie
