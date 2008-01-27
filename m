Received: from smtp2.linux-foundation.org ([207.189.120.14])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJ4Ow-00069y-MR
	for linux-mtd@lists.infradead.org; Sun, 27 Jan 2008 10:06:10 +0000
Date: Sun, 27 Jan 2008 02:02:47 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: davide@elpa.it
Subject: Re: [Bugme-new] [Bug 9829] New: MTD startup lock when using
	multiple nor flash chips
Message-Id: <20080127020247.cef86b37.akpm@linux-foundation.org>
In-Reply-To: <bug-9829-10286@http.bugzilla.kernel.org/>
References: <bug-9829-10286@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	bugme-daemon@bugzilla.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Sat, 26 Jan 2008 23:33:25 -0800 (PST) bugme-daemon@bugzilla.kernel.org wrote:
> http://bugzilla.kernel.org/show_bug.cgi?id=9829
> 
>            Summary: MTD startup lock when using multiple nor flash chips
>            Product: IO/Storage
>            Version: 2.5
>      KernelVersion: 2.6.24
>           Platform: All
>         OS/Version: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: blocking
>           Priority: P1
>          Component: Other
>         AssignedTo: io_other@kernel-bugs.osdl.org
>         ReportedBy: davide@elpa.it
> 
> 
> Latest working kernel version: 2.6.17 (not sure)
> Earliest failing kernel version: 2.6.18 (not sure)
> Distribution: kernel only in embedded system
> Hardware Environment: arm9 booting from 2 contiguous flash nor chip (4MB+4MB)
> Software Environment: kernel startup
> Problem Description: startup locks. I found and solved the problem, at line 115
> of drivers/mtd/chips/gen_probe.c (kernel 2.6.24): mapsize value must be
> calculated in bytes, not in long.
> I replaced line 115 from:
> mapsize = (max_chips + BITS_PER_LONG-1) / BITS_PER_LONG;
> to:
> mapsize = sizeof(long) * ( (max_chips + BITS_PER_LONG-1) / BITS_PER_LONG );
> And all worked OK
> Steps to reproduce: boot up the kernel

Thanks.  But we very much prefer patches via email.  Please send the patch
to all the recipients of this email as per
http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt
