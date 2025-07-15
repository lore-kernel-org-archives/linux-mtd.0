Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEE7C83F27
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jul 2025 23:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvTW2hGZ/5Cc2VEMkW/BS2ZzNS0f1qrp26c5AuXhWAk=; b=FKea1zZQbysKeFkLcEgmo3s/By
	qJ4n8OCbDmz5hra2Xsp0uT4dBoS8C+b1UEgimrp9vJGXvzLC1CuKRuxpkPwS3lY19aY8UES2POYOM
	mhrYvhVEj9OkSzW6At6QilJQ/EN/Pp18XuLmlXy5ZE+xjeQfu4wvU+CV800OLMVx+oB+0QCCGxql2
	MdmgLneZJhv0RbR2ksTwz14HV57qbZeNlAwL934HJkRFxi+s3o8H3SwU++GdBr7aGfAdnxkb33Glp
	Fl7ei5FRr3JDFghLh0ZZVvlYkRYd7uRC6Q6+gtT0/sGspIBjn7ataIODxE2ZdTWQYgKfMQQszi8nO
	zgyf5OTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubp8N-00000006PeO-0YC3;
	Tue, 15 Jul 2025 23:32:27 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubp8J-00000006PdG-18Fo
	for linux-mtd@lists.infradead.org;
	Tue, 15 Jul 2025 23:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1752622338; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=nUy4PEMS4CazYHiywIu/1adtHnlC3QRDbiuwxgypLnQ=;
	b=gnFZHRIG4yiuPxKZy6hUjOGD5WEjQwAzDz8fXMyKbucLVX72jXOKe7QlKwArGWGfavmTueLPvFyRUazd+o3M0KLYpD/M3FVOVadOqF6vp9tu5mDoWdZOd2lz6mMLYVPA015bg+ipNPx4gpI5LUCjwkSLkYoSeldXLOFU02cPVKo=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Wj1gQiN_1752622331 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Jul 2025 07:32:12 +0800
Message-ID: <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
Date: Wed, 16 Jul 2025 07:32:10 +0800
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
 linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Hailong Liu <hailong.liu@oppo.com>, Barry Song <21cnbao@gmail.com>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <aHa8ylTh0DGEQklt@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_163223_982262_642ECFB7 
X-CRM114-Status: GOOD (  23.60  )
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

Hi Matthew,

On 2025/7/16 04:40, Matthew Wilcox wrote:
> I've started looking at how the page cache can help filesystems handle
> compressed data better.  Feedback would be appreciated!  I'll probably
> say a few things which are obvious to anyone who knows how compressed
> files work, but I'm trying to be explicit about my assumptions.
> 
> First, I believe that all filesystems work by compressing fixed-size
> plaintext into variable-sized compressed blocks.  This would be a good
> point to stop reading and tell me about counterexamples.

At least the typical EROFS compresses variable-sized plaintext (at least
one block, e.g. 4k, but also 4k+1, 4k+2, ...) into fixed-sized compressed
blocks for efficient I/Os, which is really useful for small compression
granularity (e.g. 4KiB, 8KiB) because use cases like Android are usually
under memory pressure so large compression granularity is almost
unacceptable in the low memory scenarios, see:
https://erofs.docs.kernel.org/en/latest/design.html

Currently EROFS works pretty well on these devices and has been
successfully deployed in billions of real devices.

> 
>  From what I've been reading in all your filesystems is that you want to
> allocate extra pages in the page cache in order to store the excess data
> retrieved along with the page that you're actually trying to read.  That's
> because compressing in larger chunks leads to better compression.
> 
> There's some discrepancy between filesystems whether you need scratch
> space for decompression.  Some filesystems read the compressed data into
> the pagecache and decompress in-place, while other filesystems read the
> compressed data into scratch pages and decompress into the page cache.
> 
> There also seems to be some discrepancy between filesystems whether the
> decompression involves vmap() of all the memory allocated or whether the
> decompression routines can handle doing kmap_local() on individual pages.
> 
> So, my proposal is that filesystems tell the page cache that their minimum
> folio size is the compression block size.  That seems to be around 64k,
> so not an unreasonable minimum allocation size.  That removes all the
> extra code in filesystems to allocate extra memory in the page cache.> It means we don't attempt to track dirtiness at a sub-folio granularity
> (there's no point, we have to write back the entire compressed bock
> at once).  We also get a single virtually contiguous block ... if you're
> willing to ditch HIGHMEM support.  Or there's a proposal to introduce a
> vmap_file() which would give us a virtually contiguous chunk of memory
> (and could be trivially turned into a noop for the case of trying to
> vmap a single large folio).

I don't see this will work for EROFS because EROFS always supports
variable uncompressed extent lengths and that will break typical
EROFS use cases and on-disk formats.

Other thing is that large order folios (physical consecutive) will
caused "increase the latency on UX task with filemap_fault()"
because of high-order direct reclaims, see:
https://android-review.googlesource.com/c/kernel/common/+/3692333
so EROFS will not set min-order and always support order-0 folios.

I think EROFS will not use this new approach, vmap() interface is
always the case for us.

Thanks,
Gao Xiang

> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
