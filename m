Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GHGA-0008Jy-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 11:18:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021125111843.GA17562@codepoet.org> 
References: <20021125111843.GA17562@codepoet.org> 
To: andersen@codepoet.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2.c rework 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Nov 2002 11:49:05 +0000
Message-ID: <1319.1038224945@passion.cambridge.redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> /* The kernel assumes PAGE_CACHE_SIZE as block size. */
> #if defined(__ia64__)
> # define PAGE_CACHE_SIZE (16384)
> #else
> # define PAGE_CACHE_SIZE (4096)
> #endif

Er, so if you're cross-building your file system on an IA64, it gets a page
size of 16KiB by default? No likee :)

Anyway, page size isn't even always 16KiB on IA64 either, is it? Stick to 
4KiB default -- it's safer. If you know the target system has a larger page 
size, you can specify it on the command line. Same logic as keeping the 
erase size small by default.

How about changing cpu_to_target32() et al. to be cpu_to_je32() to match the 
JFFS2 code?

Also, could we have an option to write cleanmarkers to the beginning of 
each block?

--
dwmw2
