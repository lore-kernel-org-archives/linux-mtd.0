Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW81E-0004wH-SN
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 11:07:57 +0000
Date: Thu, 21 Aug 2008 12:07:50 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Message-ID: <20080821110749.GA1926@shareable.org>
References: <48AD00C4.6060302@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48AD00C4.6060302@gmail.com>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
> The biggest improvement is in the way AXFS allows for each page to be XIP or
> not.  First, a user collects information about which pages are accessed on a
> compressed image for each mmap()ed region from /proc/axfs/volume0.  That
> 'profile' is used as an input to the image builder.  The resulting image has
> only the relevant pages uncompressed and XIP.  The result is smaller memory
> sizes and faster launches.

Sounds great, really nice idea.

How does it fare with no MMU?  Can the profiler and image builder lay
out the XIP pages in such a way that no-MMU mmaps can map those regions?

No complaint if not, it would be a nice bonus though.

-- Jamie
