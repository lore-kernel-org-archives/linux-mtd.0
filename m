Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KiAzN-0000Ig-Pr
	for linux-mtd@lists.infradead.org; Tue, 23 Sep 2008 16:43:50 +0000
Date: Tue, 23 Sep 2008 17:43:38 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] mtd: Export the ROM enable/disable helpers and use them
	in mtd
Message-ID: <20080923164338.GA12167@shareable.org>
References: <20080923172510.37419440@lxorguk.ukuu.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080923172510.37419440@lxorguk.ukuu.org.uk>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alan Cox wrote:
>  EXPORT_SYMBOL(pci_map_rom);
>  EXPORT_SYMBOL(pci_unmap_rom);
> +EXPORT_SYMBOL_GPL(pci_enable_rom);
> +EXPORT_SYMBOL_GPL(pci_disable_rom);

It doesn't _sound_ like the sort of thing tied into the kernel enough
to deserve an EXPORT_SYMBOL_*GPL*.  Any particularly reason?

Cheers,
-- Jamie
