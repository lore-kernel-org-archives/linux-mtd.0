Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KWb8Q-0007YX-1I
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 18:13:18 +0000
Date: Fri, 22 Aug 2008 19:13:14 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Message-ID: <20080822181314.GB24179@shareable.org>
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
	<6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
	<48AE0476.80109@snapgear.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48AE0476.80109@snapgear.com>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greg Ungerer wrote:
> One thing for sure is that many people who do non-MMU setups
> are interested in XIP to get the space savings. These are very
> often small devices with very constrained RAM and flash. (For
> whatever it is worth single NOR flash only boards are common in
> these smaller form factors :-)

I'm using XIP on a device with 32MB RAM.  The reason I use it is
_partly_ to save RAM, partly because programs start about 10 times
faster (reading NOR flash is slow and I keep the XIP region in RAM)
and partly because it reduces memory fragmentation.

-- Jamie
