Received: from hosted05.westnet.com.au ([203.10.1.219])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KXcfJ-0005RS-CP
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 14:03:30 +0000
Message-ID: <48B2BB71.3090803@snapgear.com>
Date: Tue, 26 Aug 2008 00:02:25 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
	<6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
	<48AE0476.80109@snapgear.com>
	<6934efce0808211948kd12ba76k1ee847a0e08010e0@mail.gmail.com>
	<48B2529B.8030906@snapgear.com>
	<20080825114346.GB20960@shareable.org>
In-Reply-To: <20080825114346.GB20960@shareable.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
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


Hi Jamie,

Jamie Lokier wrote:
> Greg Ungerer wrote:
>> Sort of. It actually just uses a single ->read to bring in
>> the entire file contents. There is a few limitations on the use
>> of mmap() for non-mmu. Documentation/nommu-mmap.txt gives
>> more details. With no MMU it does rely on being able to kmalloc()
>> a single RAM region big enough to hold the entire file.
> 
> That's unfortunate, if you're using FDPIC-ELF or BFLT-XIP, you really want
> to kmalloc() one region for code (i.e. mmap not the whole file), and
> one separate for data.

That is what the BFLT loader does. For the XIP case it mmap()s
the text directly from the file, and then mmap()s a second region
for the data/bss (reading the data into that region).

I was referring to general mmap() of a file case above, not
the exec path.


>  Asking for a single larger region sometimes
> creates much higher memory pressure while kmalloc() attempts to
> defragment by evicting everything.

Sure.


> But that's fiddly to do right in general.
> 
> The natural thing for AXFS to do to support no-MMU FDPIC-ELF or
> BFLT-XIP is store the code segment uncompressed and contiguous, and
> the data segment however the filesystem prefers, and the profiling
> information to work out where these are is readily available from the
> mmap() calls, which are always the same when an executable is run.

Yep.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear -- a Secure Computing Company      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
