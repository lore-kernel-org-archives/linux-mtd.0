Received: from codepoet.org
	([166.70.99.138] helo=winder.codepoet.org ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GHXH-0008LN-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 11:36:19 +0000
Date: Mon, 25 Nov 2002 05:06:49 -0700
From: Erik Andersen <andersen@codepoet.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2.c rework
Message-ID: <20021125120649.GB18046@codepoet.org>
Reply-To: andersen@codepoet.org
References: <20021125111843.GA17562@codepoet.org> <1319.1038224945@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319.1038224945@passion.cambridge.redhat.com>
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

On Mon Nov 25, 2002 at 11:49:05AM +0000, David Woodhouse wrote:
> 
> > /* The kernel assumes PAGE_CACHE_SIZE as block size. */
> > #if defined(__ia64__)
> > # define PAGE_CACHE_SIZE (16384)
> > #else
> > # define PAGE_CACHE_SIZE (4096)
> > #endif
> 
> Er, so if you're cross-building your file system on an IA64, it gets a page
> size of 16KiB by default? No likee :)
> 
> Anyway, page size isn't even always 16KiB on IA64 either, is it? Stick to 
> 4KiB default -- it's safer. If you know the target system has a larger page 
> size, you can specify it on the command line. Same logic as keeping the 
> erase size small by default.

Hmm.  Ok, your're the boss.  I guess we can pretend it's always
4096 as long as the kernel code is doing the right thing.  It
looked like the kernel code was assuming the block size matched
the page cache size.  No big deal.  I don't have any Itanics or
similar 64 bit boxen, so I don't really care anyways.  :) 

> How about changing cpu_to_target32() et al. to be cpu_to_je32() to match the 
> JFFS2 code?

Can do...

> Also, could we have an option to write cleanmarkers to the beginning of 
> each block?

I suppose so, the code is pretty clean now I think.  
Whats a cleanmarker?  :)

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
