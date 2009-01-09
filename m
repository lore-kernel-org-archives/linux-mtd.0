Received: from tundra.namei.org ([65.99.196.166])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LLHZd-0001Mz-C2
	for linux-mtd@lists.infradead.org; Fri, 09 Jan 2009 13:38:53 +0000
Date: Sat, 10 Jan 2009 00:38:38 +1100 (EST)
From: James Morris <jmorris@namei.org>
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [regression] jffs2 gc thread oops in set_dumpable()
In-Reply-To: <20090109142148.35f3a99a@hskinnemoen-d830>
Message-ID: <alpine.LRH.1.10.0901100038100.24230@tundra.namei.org>
References: <20090109142148.35f3a99a@hskinnemoen-d830>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Howells <dhowells@redhat.com>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@cam.ac.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 Jan 2009, Haavard Skinnemoen wrote:

> Hi all,
> 
> The following crash has been observed on an ARM platform (intelmote 2)
> and an AVR32 platform (ATSTK1006). In both cases, it's a NULL pointer
> dereference at virtual address 0x150 from set_dumpable() called from
> one of the jffs2_gcd_mtdX threads, and both boards work fine with
> 2.6.28.

This patch should fix it:

http://marc.info/?l=linux-kernel&m=123141356005033&w=2


-- 
James Morris
<jmorris@namei.org>
