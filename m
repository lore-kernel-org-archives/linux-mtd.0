Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nr0b6-0007su-FD
	for linux-mtd@lists.infradead.org; Mon, 15 Mar 2010 03:04:09 +0000
Date: Mon, 15 Mar 2010 03:03:38 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Stefani Seibold <stefani@seibold.net>
Subject: Re: [Patch] fix MTD CFI/LPDDR flash driver huge latency bug
Message-ID: <20100315030338.GR6491@shareable.org>
References: <1267894137.18869.0.camel@wall-e>
	<20100312142344.174bd46f.akpm@linux-foundation.org>
	<20100312233820.GH6491@shareable.org>
	<1268483744.6339.25.camel@wall-e>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1268483744.6339.25.camel@wall-e>
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
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

Stefani Seibold wrote:
> Am Freitag, den 12.03.2010, 23:38 +0000 schrieb Jamie Lokier:
> > Andrew Morton wrote:
> > > On Sat, 06 Mar 2010 17:48:57 +0100
> > > Stefani Seibold <stefani@seibold.net> wrote:
> > > 
> 
> 
> > > > The patch change all the use of spin_lock operations for xxxx->mutex
> > > > into mutex operations, which is exact what the name says and means.
> > 
> > It would be even better if it also split the critical sections into
> > smaller ones with cond_resched() between, so that non-preemptible
> > kernels benefit too.
> 
> The problem is the memcpy operation which is very slow. A cond_resched
> wouldn't help, since the cpu bus is blocked during the transfer of the
> word.

I mean split the memcpy into multiple smaller memcpys, so that the
total time in each memcpy is limited to something reasonable.

The check in cond_resched() is fast, especially once cached.  memcpy
speed depends a lot on the attached flash and how everything's
configured, varying from 2.5MB/s up to hundreds of MB/s.  So how about
doing cond_resched() every 256 bytes?

-- Jamie
