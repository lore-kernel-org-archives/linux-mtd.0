Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GHcr-0008Lo-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 11:42:05 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021125120649.GB18046@codepoet.org> 
References: <20021125120649.GB18046@codepoet.org>  <20021125111843.GA17562@codepoet.org> <1319.1038224945@passion.cambridge.redhat.com> 
To: andersen@codepoet.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2.c rework 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Nov 2002 12:12:33 +0000
Message-ID: <3752.1038226353@passion.cambridge.redhat.com>
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

andersen@codepoet.org said:
>  Hmm.  Ok, your're the boss.  I guess we can pretend it's always 4096
> as long as the kernel code is doing the right thing.  It looked like
> the kernel code was assuming the block size matched the page cache
> size.  No big deal. 

We assume that no node crosses a page boundary. It's fine for there to be 
nodes which are _smaller_ than a page, just not larger. 

>  I suppose so, the code is pretty clean now I think.   Whats a
> cleanmarker?  :)

Small node written to the beginning of each erased block to mark it as 
being properly erased. Otherwise the JFFS2 code will erase it again just to 
make sure. Currently we do this for the free space in a partition after 
it's first mounted -- if our jffs2 image is padded to the right length and 
has cleanmarkers in, we wouldn't need to.

I don't think we want it to be the default though -- we'd have to ensure 
the erase size was correct if we did that. 

--
dwmw2
