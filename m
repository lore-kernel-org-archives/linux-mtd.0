Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5F8C3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 06:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWPJy5VSE4cGOJ46Sn6UBl9OaFRnrSaCDzfq4F0xEZI=; b=WIwLWEkss9zNZs
	6v7IyB4qBKfw8k2XFqOy7XPX5xXl9Poz551CWHvUz9HfByHRJCIQ8nyk08vS2dmLk4maEJMUEwceC
	xRoY/7vhViol9DVGJ9YQaiPMV8ea/ZOlT+rKXlpTEQsh7D+oK/O3tbd9+IbNEkXG/6ZiA2js5lMzB
	MMifxvXk6Xetn8Qcx7qseaRLDagmucBNdv9XG8hD6bAQqlTHad9Y/20Zl3A8a8Ae8D4gmxyk/igJR
	VMN9BYpXZM3COfV5Idln6vGs4TTsaIvaKvFpDG85xSuqsUye+m+jczCBxaIzbh3e59LMAON3vTLKH
	cfabGSi4f9j9FVRj/AGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLdNz-00G2Ll-1j;
	Fri, 05 Jan 2024 06:08:51 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rLdNq-00G2Lb-1Y;
	Fri, 05 Jan 2024 06:08:42 +0000
Date: Thu, 4 Jan 2024 22:08:42 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	jack@suse.com, konishi.ryusuke@gmail.com, willy@infradead.org,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 02/17] xen/blkback: use bdev api in
 xen_update_blkif_status()
Message-ID: <ZZec6mX1vz4ayRq1@infradead.org>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-3-yukuai1@huaweicloud.com>
 <20240104110631.3vspsvxbbvcpdqdu@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240104110631.3vspsvxbbvcpdqdu@quack3>
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

On Thu, Jan 04, 2024 at 12:06:31PM +0100, Jan Kara wrote:
> This function uses invalidate_inode_pages2() while invalidate_bdev() ends
> up using mapping_try_invalidate() and there are subtle behavioral
> differences between these two (for example invalidate_inode_pages2() tries
> to clean dirty pages using the ->launder_folio method). So I think you'll
> need helper like invalidate_bdev2() for this.

That assues that the existing code actually does this intentionally,
which seems doubtful.  But the change in behavior does not to be
documented and explained.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
