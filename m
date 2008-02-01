Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JL1Lx-0005Q4-6e
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 19:15:15 +0000
Date: Fri, 1 Feb 2008 17:43:33 +0000
From: Jamie Lokier <jamie@shareable.org>
To: "Korolev, Alexey" <alexey.korolev@intel.com>
Subject: Re: JFFS2: file contents in case of data CRC error
Message-ID: <20080201174332.GB14032@shareable.org>
References: <47A1FD3F.2020102@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880831@nnsmsx411.ccr.corp.intel.com>
	<47A32600.9000807@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880BCA@nnsmsx411.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <523F3D8D8C97554AA47E53DF1A05466A01880BCA@nnsmsx411.ccr.corp.intel.com>
Cc: linux-mtd@lists.infradead.org, mattjreimer@gmail.com,
	llandre <r&d2@dave-tech.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Korolev, Alexey wrote:
> So JFFS2 performed scan on read - found CRC error in node 
> -> JFFS2 marked node to be obsolete
> -> As result hole in the file has been formed. 
> -> You read 0x0 in the middle of the file. 
> 
> I think nobody considered such tests before. I am not sure if any file
> system may be reliable in such a case with temperature tests.
> 
> Unfortunately I have no idea how this issue could be solved :).

If the corruption makes it impossible to detect the node corresponding
to a block, then indeed how can it be solved?  If the bit flips happen
in the node header, not the data, there really is no way to know that
some data is lost from the right block.

I'm thinking the only way to detect this with high reliability is to
store summaries of the existence of blocks in another part of storage,
with checksums and serial numbers - like some of the latest disk
filesystems begin to.  Then missing nodes are detectable and can
translate to I/O errors in userspace.

The other way, is for apps themselves to store checksums of their
files.  I had to do this, because we were getting occasional zeroed
blocks from JFFS2, and that happened in the middle of executables, so
we had apps which would run and occasionally crash or go wrong because
part of their code contained zeroes.

To avoid random wrong behaviour, I checksummed executable programs
before running them.  It does seem it would be better if the
filesystem offered better integrity or error guarantees.

-- Jamie
