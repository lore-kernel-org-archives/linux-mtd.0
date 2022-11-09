Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44266C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 13:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gp2acgg0lAg+4dnzBSxn7SoT2P9RRKhloE/T43lkO+U=; b=EYK+8EvEW5e3x/
	2O+BYlv17hgqpTgegPEBar49VtaVxuSbfNY+nyUZmg0IOuFyyQY+UllvUXe2MawL+7E+ihSXSWFSb
	w9ln+Hgl2FKaz8gwJLtVTB71Jz7DSGtNb6JPVqduPPLnkB7ShJZUVg7JvK0QExrx/oqYw87AAjzYc
	JYQW527KdnC9IopIp0Z6GWoYwE/nv1bGaDpQ4qK59WGeqk8KgkBXYNiDoQGSfVnXdtobQ4hOk9lsi
	OF9KhXZ184+SqEVjUMc5U4EdDjKN7KQm/lF0s7qrReX81Bxzkn0EpDq5e24/QWZVTJToJOhoZ1VsI
	AXcsGy21FHpu4pC3aBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oslb5-00E0Hy-2z; Wed, 09 Nov 2022 13:58:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oslb3-00E0Ga-MS
	for linux-mtd@bombadil.infradead.org; Wed, 09 Nov 2022 13:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4VpRHLspr5DIHc7t4t1HYUCiM3aAiSiNI2OEfUU8cU4=; b=pCUS5y6P7N1AyeFOOeR6NkwUBM
	o7SFa1YK/Ev7FSLtVhVBmdQxGv553RSadfJIkfJ768FKs/KKeqtIspPSo9SOHi/78zGMTPgWd46h+
	XCkdozXIeQzXhqA18C7ZUrlxMHqEA7huMsm6GQbyNrSloJCnLm54X9+F37Sqo9qiUxXMPeE30e8w3
	2YzLhBTf4x2LkKUqxVjlLxnGW79Av6bIpO0+XB/zHAp2qbmP5KYHkwuu5Zo99ZBfh78coLR/FP8fG
	7Lje7P7Fsutf5ELtj7q5oXUS4b2IV9PlmZ+JcnyzlB8BDij/0UaD1MuHPvntDLA8lSoal/Xe1POpM
	il7/hZYQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oslb3-00BEj0-Ll; Wed, 09 Nov 2022 13:58:29 +0000
Date: Wed, 9 Nov 2022 13:58:29 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 2/5] block: add partition parser for U-Boot uImage.FIT
Message-ID: <Y2uyBYyQOC4O5iep@casper.infradead.org>
References: <Y2rgNEQlxKgiIDdk@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2rgNEQlxKgiIDdk@makrotopia.org>
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

On Tue, Nov 08, 2022 at 11:03:16PM +0000, Daniel Golle wrote:
> +	/* map first page */
> +	page = read_mapping_page(
> +		mapping, fit_start_sector >> (PAGE_SHIFT - SECTOR_SHIFT), NULL);
> +
> +	if (IS_ERR(page))
> +		return -EFAULT;
> +
> +	if (PageError(page))
> +		return -EFAULT;

Why are you checking for PageError?  You won't ever get a page with an
error back from read_mapping_page().  And you have the real error in
'page', so why return -EFAUlT, which would indicate a problem copying
from the user.  Also, this is a great place to use the new folio APIs
instead of the old page APIs.  So:

	folio = read_mapping_folio(mapping,
			fit_start_sector >> PAGE_SECTORS_SHIFT, NULL);
	if (IS_ERR(folio))
		return PTR_ERR(folio);

> +	init_fit = page_address(page);

	init_fit = folio_address(folio) +
			offset_in_folio(folio, fit_start_sector * SECTOR_SIZE);

> +	if (!init_fit) {
> +		put_page(page);
> +		return -EFAULT;
> +	}

page_address() or folio_address() can't ever return NULL, you should
just drop this nonsense check.

... actually, why can't you call read_part_sector() and avoid all of
this?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
