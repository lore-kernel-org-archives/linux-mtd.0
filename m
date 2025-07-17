Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA74C83F27
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jul 2025 03:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDx63K/xC9qNt86IAA7ZUYtNt7+aOwi286cTGUQSQyM=; b=4PvjCL21YaEyPq
	BssO3yY8fhFiLrFxhfS/Y3Uh5oFTC1mruQX0U2D0RaTveU0s3ltOT4BUET46bxYJg27aq9Xx07yw3
	6WJTXAkg06ZI4lBZyXeVu9dEtbEFkrf/8ChXEOADExk1TrRuk053b30RnNEtrA2IiPWkSNKkMWAAY
	98vj3vpFwJB2rVmVX98XdSaFXDiZFDnXjVDb8T17MSltTUihSEm4h98bzwK8GgyQBFsTy7ajebmKm
	JukqWHaeCSJm8mH6VtgO1FnpeR3sUYQmP1s21WkksbuOWuqfvdKv2P8ekSU77dVJVCAMeMrwnJ1wa
	crSxazjezq+A9k7Ayi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucF8h-0000000972H-1acj;
	Thu, 17 Jul 2025 03:18:31 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucF8d-0000000971Y-1xKC
	for linux-mtd@lists.infradead.org;
	Thu, 17 Jul 2025 03:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1752722303; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=4gUaF7R4/EBDJfRjJRTdp0icwbrWb7f2nyKt3jMgey4=;
	b=wmJe8OiOuM415qBivu34/a2PR77nk7SpGy1fQPwkgbP7HlhOufVWNiw+0WUlwoOUTwihazdf43Oh1ecbKe3eLY1GXW4eDUYANYVtCgu0+bh/P7jWJTUieBPr9t1tzbZ7p2yUZdYXAEvutUoGQtFudqfLm5M7iDa/1DK0AygOW/M=
Received: from 30.221.131.143(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Wj6YBs9_1752722299 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 17 Jul 2025 11:18:20 +0800
Message-ID: <51c92913-6176-4516-8b14-bd12e2a85697@linux.alibaba.com>
Date: Thu, 17 Jul 2025 11:18:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Compressed files & the page cache
To: Eric Biggers <ebiggers@kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
Cc: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
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
 <f4b9faf9-8efd-4396-b080-e712025825ab@squashfs.org.uk>
 <20250717024903.GA1288@sol>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250717024903.GA1288@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_201828_136982_A50FA26B 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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



On 2025/7/17 10:49, Eric Biggers wrote:
> On Wed, Jul 16, 2025 at 11:37:28PM +0100, Phillip Lougher wrote:

...

> buffer.  I suspect that vmap() (or vm_map_ram() which is what f2fs uses)
> is actually more efficient than these streaming APIs, since it avoids
> the internal copy.  But it would need to be measured.

Of course vm_map_ram() (that is what erofs relies on first for
decompression in tree since 2018, then the f2fs one) will be
efficient for decompression and avoid polluting unnecessary
caching (considering typical PIPT or VIPT.)

Especially for large compressed extents such as 1MiB, another
memcpy() will cause much extra overhead over lz4.

But as for gzip, xz and zstd, they just implement internal lz77
dictionaries then memcpy for streaming APIs.  Since those
algorithms are relatively slow (for example Zstd still relies
on Huffman and FSE), I don't think it causes much difference
to avoid memcpy() in the whole I/O path (because Huffman tree
and FSE table are already slow), but lz4 matters.

Thanks,
Gao Xiang

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
