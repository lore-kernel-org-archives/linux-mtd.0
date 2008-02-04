Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JMANQ-0003MD-Mp
	for linux-mtd@lists.infradead.org; Mon, 04 Feb 2008 23:05:30 +0000
Date: Mon, 4 Feb 2008 21:32:01 +0000
From: Jamie Lokier <jamie@shareable.org>
To: llandre <r&d2@dave-tech.it>
Subject: Re: JFFS2: file contents in case of data CRC error
Message-ID: <20080204213201.GA5159@shareable.org>
References: <47A1FD3F.2020102@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880831@nnsmsx411.ccr.corp.intel.com>
	<47A32600.9000807@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880BCA@nnsmsx411.ccr.corp.intel.com>
	<20080201174332.GB14032@shareable.org> <47A4A459.2@dave-tech.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47A4A459.2@dave-tech.it>
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	mattjreimer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

llandre wrote:
> >I'm thinking the only way to detect this with high reliability is to
> >store summaries of the existence of blocks in another part of storage,
> >with checksums and serial numbers - like some of the latest disk
> >filesystems begin to.
> Can you name these file systems?

ZFS, HammerFS and Btrfs, I think.

-- Jamie
