Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157GG7-0004ge-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 13:48:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <15132.54565.311995.865807@pizda.ninka.net> 
References: <15132.54565.311995.865807@pizda.ninka.net>  <15132.41562.879696.484467@pizda.ninka.net> <15132.40298.80954.434805@pizda.ninka.net> <15132.22933.859130.119059@pizda.ninka.net> <13942.991696607@redhat.com> <3B1C1872.8D8F1529@mandrakesoft.com> <15132.15829.322534.88410@pizda.ninka.net> <20010605155550.C22741@metastasis.f00f.org> <25587.991730769@redhat.com> <25831.991731935@redhat.com> <14071.991744970@redhat.com> 
To: "David S. Miller" <davem@redhat.com>
Cc: Chris Wedgwood <cw@f00f.org>, Jeff Garzik <jgarzik@mandrakesoft.com>,
    bjornw@axis.com, linux-kernel@vger.kernel.org,
    linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Jun 2001 13:52:41 +0100
Message-ID: <17788.991745561@redhat.com>
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
>  How about flush_cache_range_force() instead?
> I want something in the name that tells the reader "this flushes the
> caches, even though under every other ordinary circumstance you would
> not need to". 

OL, then. I would have thought it made more sense to have the
flush_dcache_range() unconditionally do what its name implies, and to have a
separate flush_dcache_range_for_dma() function which is optional. But that
decision was already made - I suppose we can't change the semantics now.

--
dwmw2
