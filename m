Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157CiL-0004OZ-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 10:01:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <15132.40298.80954.434805@pizda.ninka.net> 
References: <15132.40298.80954.434805@pizda.ninka.net>  <15132.22933.859130.119059@pizda.ninka.net> <13942.991696607@redhat.com> <3B1C1872.8D8F1529@mandrakesoft.com> <15132.15829.322534.88410@pizda.ninka.net> <20010605155550.C22741@metastasis.f00f.org> <25587.991730769@redhat.com> 
To: "David S. Miller" <davem@redhat.com>
Cc: Chris Wedgwood <cw@f00f.org>, Jeff Garzik <jgarzik@mandrakesoft.com>,
    bjornw@axis.com, linux-kernel@vger.kernel.org,
    linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Jun 2001 10:05:35 +0100
Message-ID: <25831.991731935@redhat.com>
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

davem@redhat.com said:
>  One way to do this, (even portably :-) is via displacement flushes.
> Linus mentioned this.

> Basically if you know the L2 cache size and the assosciativity you can
> do this as long as you can get a "2 * L2 cache size * assosciativity"
> piece of contiguous physical memory.  When you need this "simon says"
> flush, you basically read this physical memory span and this will
> guarentee that all dirty data has exited the L2 cache. 

Fine. So it should be possible to do it on all architectures with 
physically-indexed caches - that's good. Architectures with 
virtually-indexed caches are going to have explicit cache management 
functionality anyway, presumably :)

Obviously the algorithm you describe should not be implemented in
arch-independent drivers. It should be in include/asm-*, for those
architectures which _can't_ do it with a single cache management instruction
(or loop of same).

What shall we call this function? The intuitive "flush_dcache_range" appears
to have already been taken.

--
dwmw2
