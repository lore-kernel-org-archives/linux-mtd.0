Received: from pizda.ninka.net ([216.101.162.242] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15767R-0003vS-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 02:58:54 +0100
From: "David S. Miller" <davem@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <15132.15829.322534.88410@pizda.ninka.net>
Date: Mon, 4 Jun 2001 19:03:01 -0700 (PDT)
To: Jeff Garzik <jgarzik@mandrakesoft.com>
Cc: David Woodhouse <dwmw2@infradead.org>, bjornw@axis.com,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush.
In-Reply-To: <3B1C1872.8D8F1529@mandrakesoft.com>
References: <13942.991696607@redhat.com>
	<3B1C1872.8D8F1529@mandrakesoft.com>
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

Jeff Garzik writes:
 > David Woodhouse wrote:
 > > I was pointed at Documentation/DMA-mapping.txt but that doesn't seem very
 > > helpful - it's very PCI-specific, and a quick perusal of pci_dma_sync() on
 > > i386 shows that it doesn't do what's required anyway.
 > 
 > What should it do on i386?  mb()?

The x86 doesn't have dumb caches, therefore it really doesn't need to
flush anything.  Maybe a mb(), but that is it.

Later,
David S. Miller
davem@redhat.com
