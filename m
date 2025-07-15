Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25B3C83F17
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jul 2025 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pTKWvojoQ8CM/E+umVdoGFtRbl7k32ija93OP2lymXQ=; b=MuJec49DXtCyHq
	Wotmdq7H6bX0W1kK+BVx7b31/Oz6C0BuAAjzXMG1zXWPfzR89LsHOWaEhBW3eGfl7uteshbxOmvQA
	C06Cc/Yjlhuq+kXyyD0EAf3l/wpAEkGOACIzNoTrBh/Mu2fsYYsdosNm0VWl0Zf+9R354Bew04nd+
	GyDi2HJu/QaKcEoOj4BDKGEFKFCddm573EjoiMmtsdyTurG8AoYWD5uJYtMTB3wUmgxz8YrLm0avk
	o45710iJP8gyOICDPH3GoyU6/flHnyZtZDuoVuUS62hvt+BL2KPC0XGrG98bn3JCyrhQCML58wwVK
	Am6MdZSZsiiNwXqpWnpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubmSM-00000006BtT-0c6w;
	Tue, 15 Jul 2025 20:40:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubmSK-00000006BtL-1CWa
	for linux-mtd@bombadil.infradead.org;
	Tue, 15 Jul 2025 20:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SYy7+JhvSNYS+NgaNxt53BfDsD6DTcsBMQgVgtXAnMw=; b=rkI+4BNOMXmHOlYzssTyZGMoyL
	aI4+mtJLryNxKiCc4W+ld08C0+bphxREcY/dxe5wfC8vq1Jm/gkORw00fkrVN1wN9ZebXvUZdsASi
	zm/TWcijb+f/QGxCr7JAj8hN/eD1ZF8y8US+BmVKcsXKcioWHpvbobjpz6cJAgAK7CUS1qNhk4uFL
	tjWrM8+Ywd756Z75jpjjjhA98m3aZFKJrVLHToG44C24SvMEzbGkUiMb11sHEeqIF4vneMyjl5vwU
	TzrTkImLRsy3P+dQk+EBbDZjxoBwbifTvRQpCJk58iDMe6EFuJx0uQ/0H2pK8Hk2W4Z21ZbGxiHf4
	6wuu3xaA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubmSA-0000000DkmQ-22ck;
	Tue, 15 Jul 2025 20:40:42 +0000
Date: Tue, 15 Jul 2025 21:40:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	David Howells <dhowells@redhat.com>, netfs@lists.linux.dev,
	Paulo Alcantara <pc@manguebit.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
	linux-cifs@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>
Subject: Compressed files & the page cache
Message-ID: <aHa8ylTh0DGEQklt@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
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

I've started looking at how the page cache can help filesystems handle
compressed data better.  Feedback would be appreciated!  I'll probably
say a few things which are obvious to anyone who knows how compressed
files work, but I'm trying to be explicit about my assumptions.

First, I believe that all filesystems work by compressing fixed-size
plaintext into variable-sized compressed blocks.  This would be a good
point to stop reading and tell me about counterexamples.

From what I've been reading in all your filesystems is that you want to
allocate extra pages in the page cache in order to store the excess data
retrieved along with the page that you're actually trying to read.  That's
because compressing in larger chunks leads to better compression.

There's some discrepancy between filesystems whether you need scratch
space for decompression.  Some filesystems read the compressed data into
the pagecache and decompress in-place, while other filesystems read the
compressed data into scratch pages and decompress into the page cache.

There also seems to be some discrepancy between filesystems whether the
decompression involves vmap() of all the memory allocated or whether the
decompression routines can handle doing kmap_local() on individual pages.

So, my proposal is that filesystems tell the page cache that their minimum
folio size is the compression block size.  That seems to be around 64k,
so not an unreasonable minimum allocation size.  That removes all the
extra code in filesystems to allocate extra memory in the page cache.
It means we don't attempt to track dirtiness at a sub-folio granularity
(there's no point, we have to write back the entire compressed bock
at once).  We also get a single virtually contiguous block ... if you're
willing to ditch HIGHMEM support.  Or there's a proposal to introduce a
vmap_file() which would give us a virtually contiguous chunk of memory
(and could be trivially turned into a noop for the case of trying to
vmap a single large folio).


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
