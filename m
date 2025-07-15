Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6508DC83F27
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jul 2025 21:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddRupGRbSZOUYOYdpwXntOJpkctuIw2yfOBCvH66EcY=; b=3Q6Dyi76cFx3iN
	tJ1daLmyQ66H7uZY81bXwT4oEAZ91+iZ5LVQB727WZ4mIt1mV/r0+vf7/S+Xh1BX+jgzTf1ncXqkU
	cYtKGMNxA0RH/20ljP9IqhSqOU4aFKWkt6Gq9cvCYh0AykRkaC+QONYN9fuToLK/5oBkLM0fJmXDn
	BUkWX4FS3hHEvTq+dz6Jd+B1MrnxTnpaPTvM/KihHBi9AU2YlRcvpZWnZp+VB8KYPZd66/p+08Wnq
	/zZWAzJDlEsGfE01WhTvkkgrbNis8xLJUndEdZ8YjtfuUatXnsLgHI9oSZfJKDqdpAkI8aj6SDja5
	RvWxJFy6JPqep3hbJ7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubn5I-00000006FPN-1GhM;
	Tue, 15 Jul 2025 21:21:08 +0000
Received: from flow-b5-smtp.messagingengine.com ([202.12.124.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubn5F-00000006FOU-2Wyt
	for linux-mtd@lists.infradead.org;
	Tue, 15 Jul 2025 21:21:07 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.stl.internal (Postfix) with ESMTP id 62E9B1300E65;
	Tue, 15 Jul 2025 17:21:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 15 Jul 2025 17:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bur.io; h=cc:cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1752614461; x=1752621661; bh=UYHWhle+vh
	Soss1fvdZ2btqEJcq1ge5i+HAEGBVMw8w=; b=lRkCdsfVtMWMwLHZr39F7f/8mX
	921zmhadMTq7JcDH40jPOUA3zEj3R8hvQ31WXo8U+bDofR3ATiX4rwN3fcki5uL8
	IVnPSyWwglK5YOStOSWQGsJlswe1a/bgW4B6uDqK+n0gpg8LHvZFjWWUcG7ZIsD5
	DxuALrsh3O1VydYoDvs9AOccGag8gaCIl8ND1nBlAyE/w+1pho7we6cRkuD9WWhE
	xvf2bWjKL1ux0lIVVQDBG+eZ6QqsFwW0BaE/VyP+OkDaIWye4XLGehVLoILn5kDJ
	+xXs4v++Br2DKNV3PlvDZcRaf9VjLw6d6OD6ws8kKE331gCAlGxUn4d88x9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1752614461; x=1752621661; bh=UYHWhle+vhSoss1fvdZ2btqEJcq1ge5i+HA
	EGBVMw8w=; b=Ce9F+IH1uvDNbsSwJIOP/rG/i042S/gMBWsX56WO7ElW3Brcxmj
	c1JjYLwvXBU+k0VWWkBnSh50U7X4rUP8GAZWPiuGETvDoibxN2/HRM1Plm8bl8qY
	vu50j3amKiU4VMH4HzDgz05hzNo5aTorV31PNArsuFQBCWB6HMYcxYwQ+jobOedV
	NtLRKYyUhzppcTmuTu6k1K/7xHIEtx1/XKMnqfGHQQN6ixZ5iJGW4nMdFVcc4zMi
	eK+JRLEKsiUH6f6pZTdSS6m/cJmNYwKQ9XszzgDD598L05RWFPyW0ezHAewLufF9
	C1jEE3fzp1bmaBf72mOvXoP8C7TURS3nvUw==
X-ME-Sender: <xms:O8Z2aBb2o3WSeJkNDpvVK_1CfhO4HXwOqnefRuxSnSagyMaVbJ7BrQ>
    <xme:O8Z2aGPom1oJq26vkt0eDfcvv5b9IgnfKOZSLKeR1XIUY2ArbYSHbT7-Yl8HRO6Pg
    CPMcXGd7bN_Xioq4Do>
X-ME-Received: <xmr:O8Z2aE1jUd0BIG6M25PzLxIX8T39DGUUxYmmeFZKMyQVOs9BWD3JTG-OHP0aibjjwSIvQ21iW1vsIlJSisds4TExpqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehheeklecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhrihhsuceu
    uhhrkhhovhcuoegsohhrihhssegsuhhrrdhioheqnecuggftrfgrthhtvghrnhepkedvke
    ffjeellefhveehvdejudfhjedthfdvveeiieeiudfguefgtdejgfefleejnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghorhhishessghurh
    drihhopdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegtlhhmsehfsg
    drtghomhdprhgtphhtthhopehjohhsvghfsehtohigihgtphgrnhgurgdrtghomhdprhgt
    phhtthhopegushhtvghrsggrsehsuhhsvgdrtghomhdprhgtphhtthhopehlihhnuhigqd
    gsthhrfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitghosehf
    lhhugihnihgtrdhnvghtpdhrtghpthhtohepgihirghngheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheptghhrghosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgvrhhofhhssehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:O8Z2aKl8sgIcZ83waB3ooxuEhOSaVUsZcdWFiIg6hl8aj7u3eVSUsg>
    <xmx:O8Z2aC6he-On3LWoKqy9AnQ59r2GaSw5CGT9VR3Z3zM5QWA25DXqJA>
    <xmx:O8Z2aLnJYp_POSGdFf9OLum21MHWKvZ7zEj6d5IqEt_FNGLQPwIRKA>
    <xmx:O8Z2aMRfslUUz8n58RzMU71E6Do8GJBcqd7ZWglxBBPvoJasm0MSFw>
    <xmx:PcZ2aBt1WhpTWdR5pXv9pupYXwxThC7C0L11zr9gt1KsmEnOtMWynpYe>
Feedback-ID: i083147f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jul 2025 17:20:58 -0400 (EDT)
Date: Tue, 15 Jul 2025 14:22:33 -0700
From: Boris Burkov <boris@bur.io>
To: Matthew Wilcox <willy@infradead.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
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
Subject: Re: Compressed files & the page cache
Message-ID: <20250715212233.GA1680311@zen.localdomain>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aHa8ylTh0DGEQklt@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_142105_911397_8002A4A7 
X-CRM114-Status: GOOD (  29.74  )
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

On Tue, Jul 15, 2025 at 09:40:42PM +0100, Matthew Wilcox wrote:
> I've started looking at how the page cache can help filesystems handle
> compressed data better.  Feedback would be appreciated!  I'll probably
> say a few things which are obvious to anyone who knows how compressed
> files work, but I'm trying to be explicit about my assumptions.
> 
> First, I believe that all filesystems work by compressing fixed-size
> plaintext into variable-sized compressed blocks.  This would be a good
> point to stop reading and tell me about counterexamples.

As far as I know, btrfs with zstd does not used fixed size plaintext. I
am going off the btrfs logic itself, not the zstd internals which I am
sadly ignorant of. We are using the streaming interface for whatever
that is worth.

Through the following callpath, the len is piped from the async_chunk\
through to zstd via the slightly weirdly named total_out parameter:

compress_file_range()
  btrfs_compress_folios()
    compression_compress_pages()
      zstd_compress_folios()
        zstd_get_btrfs_parameters() // passes len
        zstd_init_cstream() // passes len
        for-each-folio:
          zstd_compress_stream() // last folio is truncated if short
  
# bpftrace to check the size in the zstd callsite
$ sudo bpftrace -e 'fentry:zstd_init_cstream {printf("%llu\n", args.pledged_src_size);}'
Attaching 1 probe...
76800

# diff terminal, write a compressed extent with a weird source size
$ sudo dd if=/dev/zero of=/mnt/lol/foo bs=75k count=1

We do operate in terms of folios for calling zstd_compress_stream, so
that can be thought of as a fixed size plaintext block, but even so, we
pass in a short block for the last one:
$ sudo bpftrace -e 'fentry:zstd_compress_stream {printf("%llu\n", args.input->size);}'
Attaching 1 probe...
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
3072

> 
> From what I've been reading in all your filesystems is that you want to
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

btrfs has a max uncompressed extent size of 128K, for what it's worth.
In practice, many compressed files are comprised of a large number of
compressed extents each representing a 128k plaintext extent.

Not sure if that is exactly the constant you are concerned with here, or
if it refutes your idea in any way, just figured I would mention it as
well.

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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
