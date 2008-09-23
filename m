Date: Tue, 23 Sep 2008 18:43:15 +0100
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH] mtd: Export the ROM enable/disable helpers and use them
	in mtd
Message-ID: <20080923184315.13f0923f@lxorguk.ukuu.org.uk>
In-Reply-To: <20080923164338.GA12167@shareable.org>
References: <20080923172510.37419440@lxorguk.ukuu.org.uk>
	<20080923164338.GA12167@shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 23 Sep 2008 17:43:38 +0100
Jamie Lokier <jamie@shareable.org> wrote:

> Alan Cox wrote:
> >  EXPORT_SYMBOL(pci_map_rom);
> >  EXPORT_SYMBOL(pci_unmap_rom);
> > +EXPORT_SYMBOL_GPL(pci_enable_rom);
> > +EXPORT_SYMBOL_GPL(pci_disable_rom);
> 
> It doesn't _sound_ like the sort of thing tied into the kernel enough
> to deserve an EXPORT_SYMBOL_*GPL*.  Any particularly reason?

It's not my code so I can't change the licensing on it. If the original
author of that code has no objection I would also think the _GPL version
isn't needed.

Alan
