Received: from www84.your-server.de ([213.133.104.84])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NqQYt-0004GH-6Y
	for linux-mtd@lists.infradead.org; Sat, 13 Mar 2010 12:35:27 +0000
Subject: Re: [Patch] fix MTD CFI/LPDDR flash driver huge latency bug
From: Stefani Seibold <stefani@seibold.net>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20100312233820.GH6491@shareable.org>
References: <1267894137.18869.0.camel@wall-e>
	<20100312142344.174bd46f.akpm@linux-foundation.org>
	<20100312233820.GH6491@shareable.org>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Sat, 13 Mar 2010 13:35:44 +0100
Message-ID: <1268483744.6339.25.camel@wall-e>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Am Freitag, den 12.03.2010, 23:38 +0000 schrieb Jamie Lokier:
> Andrew Morton wrote:
> > On Sat, 06 Mar 2010 17:48:57 +0100
> > Stefani Seibold <stefani@seibold.net> wrote:
> > 


> > > The patch change all the use of spin_lock operations for xxxx->mutex
> > > into mutex operations, which is exact what the name says and means.
> 
> It would be even better if it also split the critical sections into
> smaller ones with cond_resched() between, so that non-preemptible
> kernels benefit too.
> 

The problem is the memcpy operation which is very slow. A cond_resched
wouldn't help, since the cpu bus is blocked during the transfer of the
word.
