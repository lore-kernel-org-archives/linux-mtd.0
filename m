Received: from panic.ohr.gatech.edu
	([130.207.47.194] helo=havoc.gtf.org ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1573d2-0003ld-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 00:19:20 +0100
Message-ID: <3B1C1872.8D8F1529@mandrakesoft.com>
Date: Mon, 04 Jun 2001 19:23:30 -0400
From: Jeff Garzik <jgarzik@mandrakesoft.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Cc: bjornw@axis.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush.
References: <13942.991696607@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:
> I was pointed at Documentation/DMA-mapping.txt but that doesn't seem very
> helpful - it's very PCI-specific, and a quick perusal of pci_dma_sync() on
> i386 shows that it doesn't do what's required anyway.

What should it do on i386?  mb()?

-- 
Jeff Garzik      | Echelon words of the day, from The Register:
Building 1024    | FRU Lebed HALO Spetznaz Al Amn al-Askari Glock 26 
MandrakeSoft     | Steak Knife Kill the President anarchy echelon
                 | nuclear assassinate Roswell Waco World Trade Center
