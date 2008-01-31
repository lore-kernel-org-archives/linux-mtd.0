Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKjm5-0001Q7-Gr
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 00:29:03 +0000
Date: Thu, 31 Jan 2008 22:57:42 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Matt Reimer <mattjreimer@gmail.com>
Subject: Re: JFFS2: file contents in case of data CRC error
Message-ID: <20080131225742.GB26188@shareable.org>
References: <47A1FD3F.2020102@dave-tech.it>
	<f383264b0801311142h3cbcbc91pb4e0d3a60fc78f4f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f383264b0801311142h3cbcbc91pb4e0d3a60fc78f4f@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, llandre <r&d2@dave-tech.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matt Reimer wrote:
> On Jan 31, 2008 8:54 AM, llandre <r&d2@dave-tech.it> wrote:
> > I have a JFFS2 partition on 32MByte NAND device.
> > When reading a specific file - see below for details - JFFS2 reports a
> > Data CRC error but function nand_correct_data never returns -1, so I
> > assume ECC algorithm is able to correct errors.
> > However the file is not equal to the original one that has been written
> > to NAND. In fact, in the middle of the file, I see a 4-kByte "hole"
> > where all bytes are 0.
> > Anybody can help me about understanding if this is the expected
> > behaviour of JFFS2?
> > Thanks in advance.
> 
> I saw exactly this problem on an s3c2440 board back in October. It
> turned out that the ECC correction code in the s3c2410 driver was
> incorrect in a couple of ways, resulting in corrupt data being passed
> up to JFFS2. I'm not sure, but I think what happened from there is
> that JFFS2 failed to decompress a block and instead of returning an
> error it left the page zeroed. You can use jffs2dump to correlate the
> offset reported in the CRC error with the problematic inode. Check the
> thread "bit flip" in October 2007.

I've seen similar things with cfi_cmdset_0002 on NOR flash, with Linux
2.4.26.  Occasional bit flips on reading flash, resulting in zero
blocks in the read file from JFFS2 - no errors reported to the
application.

I have reason to think our board timings were ever so slightly out of
spec, and haven't seen it in newer board revisions.

-- Jamie
