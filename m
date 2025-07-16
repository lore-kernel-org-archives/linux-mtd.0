Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1721DC83F22
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jul 2025 22:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFL/7N/IFL9azaAqHLODupC3qAnBnrzDcQVCvoG2/vo=; b=bPZjQo1oa3RgYk54qu390p+yis
	ncks6BIrW4oHTc2cXA3B0ggk4RhuCkB5aqoDI6PTLt//qX/xxaE1a4UHgZ/4IPDXPg/kPR724zCQF
	ybnR68YSzAwAr2kr5ViSrSOOGq7febgy5kgXSSCqc3F4HRjFiA16UXGFb4608JAFwIVewixoy3TNZ
	b0rTULjAmdlhFpWjH9fKVCbvGOxKMfwtc+/EYMvSLZVg7ZWIuoqKQ/MQtOOfptOqUIStXWLfjoRIE
	EExKHYrh/FsNAGc4ZSffURynih/vOplNMI7M3uiS0JkBKy5X5ZLFqPxDMnvZ5OHggv/T++e8MP0zL
	c0I1W7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAlg-00000008oDG-1bSJ;
	Wed, 16 Jul 2025 22:38:28 +0000
Received: from sxb1plsmtpa01-04.prod.sxb1.secureserver.net ([188.121.53.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAlc-00000008oCI-3P5G
	for linux-mtd@lists.infradead.org;
	Wed, 16 Jul 2025 22:38:26 +0000
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id cAlKuoVr96J4FcAlNu4Dmt; Wed, 16 Jul 2025 15:38:10 -0700
X-CMAE-Analysis: v=2.4 cv=TYmWtQQh c=1 sm=1 tr=0 ts=687829d2
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=Z9je9KOXq8erZ9ix0VAA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <f4b9faf9-8efd-4396-b080-e712025825ab@squashfs.org.uk>
Date: Wed, 16 Jul 2025 23:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Compressed files & the page cache
To: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Howells <dhowells@redhat.com>, netfs@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <aHa8ylTh0DGEQklt@casper.infradead.org>
X-CMAE-Envelope: MS4xfF7PhqfDTvf0GLbE+ZqPgfM1AhwOJlHSpsMzx6XOcDZuT9YqsTaq8QVlGaLYbZSCACkmupuX6+moDnsLw8z6oXo/oW+NBiLgU6y5TBJWXg6tV88e5Euj
 1giZ2fZsoopVdzm/v4Tlp3z0KvSwDUxO6m0SnvjOtH9zvReYNZLA2FNMM+DrFEJFaiIkCvRrmoBmbv4h3OnUHX5sclo1/Wezm+BEj6dLaDXAyuKVHku8Kvy6
 3A9SkS3ZtrCtIQcuDoAamTotabkyq8u+NbETcu+wgZcHz79D2Cqa4hBUqSAxUGPLdjqjvKdz0Y+w0IVDS3aE1LUKcnIDytVIxDas6bwTbJD2/Yz7PsjwtKtl
 JoRL1DOXscuVOLxBvw+0xQnpDotzu0Vo1GrTRn1rfHJKD4Exmb3wOCyCD+h2AYMKaGBCjBVgXvf5G6DK3/s3MVbkLRjH09uolqpyyQAsKggrC2Moa3qwKWia
 tBwCIdLZWPpQOFc2HOlLjv7vmcMVwr97TODyoKXcYSBdRG5Aj19H80t7Vc1kPbVELOFd5EDHNfQ8ATDugkZBq2J/V21dERsOluc2pak7RNmbJyOzrPcIwalB
 Nf6fEekDRHicDoV2q2tew6sPotWewTjdjMw9iwbRhZpamiZqsp/XI9f5XhZcOQoUdsCy/ey/U995vHBeMMo6H0yRk9BNVCMpINAVKCtQmjIv7xNp+Ioo2Sxs
 gPnTBcUD++qhM8KfplNiTcJXoQ96eTIssdBe+BMWUXv1qhpWQ9GKojXGcX8mKMvEG7sKSgFMNrc3J5Xm28GieZWCzy/+ZDv2I7VwecP2j5T1w/WLBfHEUgk5
 gufg4AqEMh/tWtnL4rvSfpFcA6zbEUbuBjvPEzIYLlyjogb7n+266BU1vQZO72XCtgIJOh/KDHsuteA4LS7mxuWjWepHBR+R1mjV5Mwu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_153824_999535_41ACE717 
X-CRM114-Status: GOOD (  25.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 15/07/2025 21:40, Matthew Wilcox wrote:
> I've started looking at how the page cache can help filesystems handle
> compressed data better.  Feedback would be appreciated!  I'll probably
> say a few things which are obvious to anyone who knows how compressed
> files work, but I'm trying to be explicit about my assumptions.
> 
> First, I believe that all filesystems work by compressing fixed-size
> plaintext into variable-sized compressed blocks.  This would be a good
> point to stop reading and tell me about counterexamples.

For Squashfs Yes.

> 
>>From what I've been reading in all your filesystems is that you want to
> allocate extra pages in the page cache in order to store the excess data
> retrieved along with the page that you're actually trying to read.  That's
> because compressing in larger chunks leads to better compression.
> 

Yes.

> There's some discrepancy between filesystems whether you need scratch
> space for decompression.  Some filesystems read the compressed data into
> the pagecache and decompress in-place, while other filesystems read the
> compressed data into scratch pages and decompress into the page cache.
> 

Squashfs uses scratch pages.

> There also seems to be some discrepancy between filesystems whether the
> decompression involves vmap() of all the memory allocated or whether the
> decompression routines can handle doing kmap_local() on individual pages.
> 

Squashfs does both, and this depends on whether the decompression
algorithm implementation in the kernel is multi-shot or single-shot.

The zlib/xz/zstd decompressors are multi-shot, in that you can call them
multiply, giving them an extra input or output buffer when it runs out.
This means you can get them to output into a 4K page at a time, without
requiring the pages to be contiguous.  kmap_local() can be called on each
page before passing it to the decompressor.

The lzo/lz4 decompressors are single-shot, they expect to be called once,
with a single contiguous input buffer containing the data to be
decompressed, and a single contiguous output buffer large enough to hold
all the uncompressed data.

> So, my proposal is that filesystems tell the page cache that their minimum
> folio size is the compression block size.  That seems to be around 64k,
> so not an unreasonable minimum allocation size.  That removes all the
> extra code in filesystems to allocate extra memory in the page cache.
> It means we don't attempt to track dirtiness at a sub-folio granularity
> (there's no point, we have to write back the entire compressed bock
> at once).  We also get a single virtually contiguous block ... if you're
> willing to ditch HIGHMEM support.  Or there's a proposal to introduce a
> vmap_file() which would give us a virtually contiguous chunk of memory
> (and could be trivially turned into a noop for the case of trying to
> vmap a single large folio).
> 

The compression block size in Squashfs can be 4K to 1M in size.

Phillip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
