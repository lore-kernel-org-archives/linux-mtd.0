Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1573if-0003m8-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 00:25:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B1C1872.8D8F1529@mandrakesoft.com> 
References: <3B1C1872.8D8F1529@mandrakesoft.com>  <13942.991696607@redhat.com> 
To: Jeff Garzik <jgarzik@mandrakesoft.com>
Cc: bjornw@axis.com, linux-kernel@vger.kernel.org,
    linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Jun 2001 00:29:22 +0100
Message-ID: <14147.991697362@redhat.com>
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

jgarzik@mandrakesoft.com said:
> > I was pointed at Documentation/DMA-mapping.txt but that doesn't seem
> > very helpful - it's very PCI-specific, and a quick perusal of
> > pci_dma_sync() on i386 shows that it doesn't do what's required anyway.

> What should it do on i386?  mb()? 

For it to have any use in the situation I described, it would need to 
writeback and invalidate the dcache for the affected range. It doesn't seem 
to do so, so it seems that it isn't what I require.

The situation is simple - I have a paged RAM setup and I need it cached. 
All I want to do is flush and invalidate the cache when I'm about to waggle 
whatever I/O ports I waggle to change pages. 

There are other situations in which I need the cache flushed, but the above 
is one of the simplest.

Even flush_page_to_ram() doesn't seem to do what its name implies, on most 
architectures.

--
dwmw2
