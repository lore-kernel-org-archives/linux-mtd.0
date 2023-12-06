Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D701C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0aOOg/6RXDOA7RJ1sFdtzUkzWfVIXp/OQb/zoW7Rq8=; b=DASbHJLoQIzOhf
	IFn6wHe3dv+/WGLntWq3aFbgiUn7rBr9H+uzwz80gK/W/e+tAx4m79BIP4aPWuVDQ65MVsTVGEM0I
	L5i+1dh/8JcT/Bk1pajrRVxiSdTDL2Pz72z+82VZFfChX4QlI6HMLA1D43w75tconEPpd+RevK7PS
	1zpgunWO4WO90JmWgTAzpnVzWxzbJgjOwZUXCB9WBRPA1lNJPg2SW4FFx3e6TFqDjtrnwn/OIJIzd
	UrWfQq4/lVFbuy7o6qZ2HFXnT//iAzLye2ar4ICXnsMI9t/tiU5Epceifs5FPyMMIgMo6XeOyk3ZZ
	6Tkf0sv1EiW9a0DlBv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAtMb-00AZgN-1Z;
	Wed, 06 Dec 2023 14:59:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAtMZ-00AZfh-2X
	for linux-mtd@bombadil.infradead.org;
	Wed, 06 Dec 2023 14:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s+7kV2NOaPEBmhFkJpDv/pC5Llv4VXEE9i8fdKbvmjw=; b=ojDk7+bvhmkVaj86d9uPvOhQaz
	kbAJJlz3eiFA7yxHtxf02BCaqsNM5pS9C8k5lXRoPly3/N/e0u5QADIgtZKFOwGOJtwsI5ZzSsYPS
	PKyktYqelsFB3E+G8W+4/yQSFmaQ2jHSWEigX57CwcwQszQ0bDoxOOqdU2sc0+ZoE3Ff1wwcpqslV
	VWLgXJnu2MrDZGBo0sVLqXRdAvGI+d1WdlsXWEVkM0crARzZz5+nD3AR2Avd8/g6eRde0hkW/FoXX
	agEz57imZpOlmdW73T5pzua0TfxBEP/xRZ/WXwPlD7/tpJRN5cqF7OvXJrtIdGRYW6omWvwYwBXvA
	OJr6nVaw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rAtMN-002zkJ-Nc; Wed, 06 Dec 2023 14:58:47 +0000
Date: Wed, 6 Dec 2023 14:58:47 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
Message-ID: <ZXCMJ9skAAgPm4z3@casper.infradead.org>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205123728.1866699-2-yukuai1@huaweicloud.com>
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

On Tue, Dec 05, 2023 at 08:37:15PM +0800, Yu Kuai wrote:
> +struct folio *bdev_read_folio(struct block_device *bdev, pgoff_t index)
> +{
> +	return read_mapping_folio(bdev->bd_inode->i_mapping, index, NULL);
> +}
> +EXPORT_SYMBOL_GPL(bdev_read_folio);

I'm coming to the opinion that 'index' is the wrong parameter here.
Looking through all the callers of bdev_read_folio() in this patchset,
they all have a position in bytes, and they all convert it to
index for this call.  The API should probably be:

struct folio *bdev_read_folio(struct block_device *bdev, loff_t pos)
{
	return read_mapping_folio(bdev->bd_inode->i_mapping,
			pos / PAGE_SIZE, NULL);
}

... and at some point, we'll get round to converting read_mapping_folio()
to take its argument in loff_t.

Similiarly for these two APIs:

> +struct folio *bdev_read_folio_gfp(struct block_device *bdev, pgoff_t index,
> +				  gfp_t gfp)
> +struct folio *bdev_get_folio(struct block_device *bdev, pgoff_t index)

> +struct folio *bdev_find_or_create_folio(struct block_device *bdev,
> +					pgoff_t index, gfp_t gfp)
> +{
> +	return __filemap_get_folio(bdev->bd_inode->i_mapping, index,
> +				   FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp);
> +}
> +EXPORT_SYMBOL_GPL(bdev_find_or_create_folio);

This one probably shouldn't exist.  I've been converting callers of
find_or_create_page() to call __filemap_get_folio; I suspect we
should expose a __bdev_get_folio and have the callers use the FGP
arguments directly, but I'm open to other opinions here.

> +void bdev_sync_readahead(struct block_device *bdev, struct file_ra_state *ra,
> +			 struct file *file, pgoff_t index,
> +			 unsigned long req_count)
> +{
> +	struct file_ra_state tmp_ra = {};
> +
> +	if (!ra) {
> +		ra = &tmp_ra;
> +		file_ra_state_init(ra, bdev->bd_inode->i_mapping);
> +	}
> +	page_cache_sync_readahead(bdev->bd_inode->i_mapping, ra, file, index,
> +				  req_count);
> +}

I think the caller should always be passing in a valid file_ra_state.
It's only cramfs that doesn't have one, and it really should!
Not entirely sure about the arguments here; part of me says "bytes",
but this is weird enough to maybe take arguments in pages.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
