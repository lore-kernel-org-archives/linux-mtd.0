Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16A7gI-0002dV-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 10:47:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <614CC7C21856D1118DA30060B06B487302ACC800@SMF-NT-MAIL1.verifone.com> 
References: <614CC7C21856D1118DA30060B06B487302ACC800@SMF-NT-MAIL1.verifone.com> 
To: Eric Nelson <eric_n2@verifone.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: beginners mtd/jffs question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 01 Dec 2001 10:55:06 +0000
Message-ID: <17820.1007204106@redhat.com>
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

> Isn't it better to use plain NOR linear flash than DOC, because then JFFS2
> has complete control?

JFFS2 has complete control of a DiskOnChip. It's only an ASIC to do 
hardware ECC and a handful of NAND flash chips. But JFFS2 doesn't yet 
support NAND flash properly, so at the moment plain NOR linear flash is 
best.

> Is the DOC/JFFS2 a good solution? 

Not right now, maybe soon.

> I mean, it seems like w/ the commercial SBC's, the only options are
> CompactFlash (Ugh!), or DOC. 

> Is there some type of PCMCIA flash that meets MTD?

Hard to get hold of now - most people stopped making it in favour of CF. 
Cisco still use it, but obviously that's fairly expensive, being Cisco.
It's easy enough to make a map driver for it if you actually _have_ one, 
but most people don't, so nobody's bothered to write that driver yet.

>  Are there commercial boards w/ linear MTD flash? 

Yes. http://www.arcomcontrols.com/products/icp/pc104/processors/SBC_GXm.htm

Just looking in the drivers/mtd/maps directory will give you some boards to 
look for.

--
dwmw2
