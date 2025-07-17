Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C20C83F22
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jul 2025 02:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1UM8Lghb9Z0zI++f92lvt2i0E+hyf5bgK9x8OjhDho=; b=hQcenDrYgC1FWg
	FMa/FsH5q3Y7GMLD8KhKgu+WrFn14BRjOTNrDNEIdyriKnWZGMvOeqJ1XdE4VVfj5t1eiAwJs2ynO
	LgyQNxbygOW7f1ifzWUYs2PGxRauOwcc2AN4B0SdNsboPLop52vG35UPLF+kxDOpn3Je7XUvzzhqr
	qo/8KY8WOD+pxTJ+WwQYfgn2BVA38+bZ1juv3iv5LAeAZTJt3dmGE6c9TFx8m8Q46Du5STIZD+wzL
	5TWhFeHVocP0F1bYWqUWWvnBb/j+1FTNueLqN0O6URKpg7ptqIy1YE3mLJeJaExLiVpRdS8qAFTYU
	aAa7p3bGMIslKBt/RR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEh1-000000095Fo-1voT;
	Thu, 17 Jul 2025 02:49:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEgy-000000095Ev-3zaR
	for linux-mtd@lists.infradead.org;
	Thu, 17 Jul 2025 02:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A53B2A576DD;
	Thu, 17 Jul 2025 02:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1B0C4CEE7;
	Thu, 17 Jul 2025 02:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752720591;
	bh=+3M7g91K1wbKWaHCHWCVlTkf6dVFqoCHka6+sKX8uc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dxj0Av8D5AZtIisXh2L9yJig4uXBQuxbS9ixY/JMlxvl70bIPu8iWlVqGEzCoOgUi
	 +5jU7iXSPRY863B1eVwqkKI4XyGU8N1oiPiSPYP3NlYWjMsCzjY3/zNUSeI4PfvJj0
	 n7GfspSMnUer51mMfjRjFN8s+TltBz1xAqzFf/4SamHGdauI6kCAc8//1mfU95Af06
	 zzmzEaGEDSNSTgcJHuXYUJGBMCRzfTCgpsxnK/GcWE+60f/gZxYXyl9b+IaN0vufU4
	 oIMmh0U1QCuDEp6Cvy24xlk5jGum/YFcnprJ1x7H5mudjZboZP0UCU72iFYOMe7L+u
	 czU/b0esZtW6Q==
Date: Wed, 16 Jul 2025 19:49:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	linux-btrfs@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	linux-erofs@lists.ozlabs.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	David Howells <dhowells@redhat.com>, netfs@lists.linux.dev,
	Paulo Alcantara <pc@manguebit.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
	linux-cifs@vger.kernel.org
Subject: Re: Compressed files & the page cache
Message-ID: <20250717024903.GA1288@sol>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <f4b9faf9-8efd-4396-b080-e712025825ab@squashfs.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4b9faf9-8efd-4396-b080-e712025825ab@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_194953_122780_442EC904 
X-CRM114-Status: GOOD (  25.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jul 16, 2025 at 11:37:28PM +0100, Phillip Lougher wrote:
> > There also seems to be some discrepancy between filesystems whether the
> > decompression involves vmap() of all the memory allocated or whether the
> > decompression routines can handle doing kmap_local() on individual pages.
> > 
> 
> Squashfs does both, and this depends on whether the decompression
> algorithm implementation in the kernel is multi-shot or single-shot.
> 
> The zlib/xz/zstd decompressors are multi-shot, in that you can call them
> multiply, giving them an extra input or output buffer when it runs out.
> This means you can get them to output into a 4K page at a time, without
> requiring the pages to be contiguous.  kmap_local() can be called on each
> page before passing it to the decompressor.

While those compression libraries do provide streaming APIs, it's sort
of an illusion.  They still need the uncompressed data in a virtually
contiguous buffer for the LZ77 match finding and copying to work.  So,
internally they copy the uncompressed data into a virtually contiguous
buffer.  I suspect that vmap() (or vm_map_ram() which is what f2fs uses)
is actually more efficient than these streaming APIs, since it avoids
the internal copy.  But it would need to be measured.

> > So, my proposal is that filesystems tell the page cache that their minimum
> > folio size is the compression block size.  That seems to be around 64k,
> > so not an unreasonable minimum allocation size.  That removes all the
> > extra code in filesystems to allocate extra memory in the page cache.
> > It means we don't attempt to track dirtiness at a sub-folio granularity
> > (there's no point, we have to write back the entire compressed bock
> > at once).  We also get a single virtually contiguous block ... if you're
> > willing to ditch HIGHMEM support.  Or there's a proposal to introduce a
> > vmap_file() which would give us a virtually contiguous chunk of memory
> > (and could be trivially turned into a noop for the case of trying to
> > vmap a single large folio).

... but of course, if we could get a virtually contiguous buffer
"for free" (at least in the !HIGHMEM case) as in the above proposal,
that would clearly be the best option.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
