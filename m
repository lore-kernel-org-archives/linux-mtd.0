Received: from rv-out-0708.google.com ([209.85.198.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWMhD-0005sG-1n
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 02:48:15 +0000
Received: by rv-out-0708.google.com with SMTP id b17so226220rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 19:48:13 -0700 (PDT)
Message-ID: <6934efce0808211948kd12ba76k1ee847a0e08010e0@mail.gmail.com>
Date: Thu, 21 Aug 2008 19:48:13 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Greg Ungerer" <gerg@snapgear.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <48AE0476.80109@snapgear.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
	<6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
	<48AE0476.80109@snapgear.com>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Jamie Lokier <jamie@shareable.org>, Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> That would be enough I think. If you could manually select
> which files are contiguous-and-uncompressed that would be
> useful for some too here.

So.... If you don't have an MMU when do you call ->fault?  Does the
noMMU code just loop through ->fault()ing all the pages in an mmap()?

> One thing for sure is that many people who do non-MMU setups
> are interested in XIP to get the space savings. These are very
> often small devices with very constrained RAM and flash. (For
> whatever it is worth single NOR flash only boards are common in
> these smaller form factors :-)

True.
