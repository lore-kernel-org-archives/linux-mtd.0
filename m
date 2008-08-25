Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXaUD-0006Zg-Id
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 11:43:53 +0000
Date: Mon, 25 Aug 2008 12:43:47 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Message-ID: <20080825114346.GB20960@shareable.org>
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
	<6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
	<48AE0476.80109@snapgear.com>
	<6934efce0808211948kd12ba76k1ee847a0e08010e0@mail.gmail.com>
	<48B2529B.8030906@snapgear.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48B2529B.8030906@snapgear.com>
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
> Sort of. It actually just uses a single ->read to bring in
> the entire file contents. There is a few limitations on the use
> of mmap() for non-mmu. Documentation/nommu-mmap.txt gives
> more details. With no MMU it does rely on being able to kmalloc()
> a single RAM region big enough to hold the entire file.

That's unfortunate, if you're using FDPIC-ELF or BFLT-XIP, you really want
to kmalloc() one region for code (i.e. mmap not the whole file), and
one separate for data.  Asking for a single larger region sometimes
creates much higher memory pressure while kmalloc() attempts to
defragment by evicting everything.

But that's fiddly to do right in general.

The natural thing for AXFS to do to support no-MMU FDPIC-ELF or
BFLT-XIP is store the code segment uncompressed and contiguous, and
the data segment however the filesystem prefers, and the profiling
information to work out where these are is readily available from the
mmap() calls, which are always the same when an executable is run.

-- Jamie
