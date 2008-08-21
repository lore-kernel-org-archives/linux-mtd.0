Received: from rn-out-0910.google.com ([64.233.170.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWAsX-0007Gd-DK
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:11:09 +0000
Received: by rn-out-0910.google.com with SMTP id m7so9264rnd.3
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 07:11:08 -0700 (PDT)
Message-ID: <6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
Date: Thu, 21 Aug 2008 07:11:08 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Jamie Lokier" <jamie@shareable.org>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <20080821110749.GA1926@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
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

> How does it fare with no MMU?  Can the profiler and image builder lay
> out the XIP pages in such a way that no-MMU mmaps can map those regions?
>
> No complaint if not, it would be a nice bonus though.

Sorry.  I don't believe it will work on no-MMU as is.  That said you
_could_ tweak the mkfs tool to lay mmap()'ed regions down contiguously
but then if you mmap() an unprofiled region, well that would be bad.
I suppose you could make axfs_mmap smart enough to handle that.  I
guess the cleanest way would be to just make files lay down
contiguously, you lose some of the space saving but it would work.

I'm not plannin to get to this anytime soon.  But I'd be willing merge
patches.  Can anybody convince me offline that working on no-MMU this
makes financial sense for my employer?  This is getting to be a common
question.  How many noMMU users are out there and why are you so
interested?
