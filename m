Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B726C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 24 May 2023 05:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfEWgQmNyQwGzdr7Nv+l/03zBNH4B/3gQzyYHuScCRY=; b=r1u9Y3yU3HjwA2
	BuJ/PdvtIlabVzOFaJdraefJnW3vAMUU6j8tM34L3bUsOUyGYNOzjDL1jWBTYLqYj2hFzutTgGKPB
	NvkPFZub7xRN9bgSyfDJHLiI8/dYG4viVc0XmSnhc1iQj7MtlF0tkt4vQz3cukRyKTG4iyniI8JPX
	grzdh8ImzVjfdLSHUr3eFJ8KPUeAwDFSBhLdDQG5giX1ty7ZJWrh/QHvT/2/Yb4z5qvjSkQne74Hf
	1Kk97VoEuixLLwps8jcfFi97oGEe0AWQgPPjxmY4WdJMMoZfaIZJDsPk+YH4geckemUkoAXEQmPP4
	vYx+kwCfWfTLCDLN7Apg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1hVj-00CRpu-0d;
	Wed, 24 May 2023 05:58:11 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1q1hVh-00CRpm-1c;
	Wed, 24 May 2023 05:58:09 +0000
Date: Tue, 23 May 2023 22:58:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@axis.com
Subject: Re: [PATCH 1/2] ubi: block: Fix use-after-free of gendisk
Message-ID: <ZG2ncaTjxCnRWcUZ@infradead.org>
References: <20230523-ubiblock-remove-v1-0-240bed75849b@axis.com>
 <20230523-ubiblock-remove-v1-1-240bed75849b@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523-ubiblock-remove-v1-1-240bed75849b@axis.com>
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

On Tue, May 23, 2023 at 03:12:16PM +0200, Vincent Whitchurch wrote:
>  static void ubiblock_cleanup(struct ubiblock *dev)
>  {
> +	int first_minor = dev->gd->first_minor;
> +
>  	/* Stop new requests to arrive */
>  	del_gendisk(dev->gd);
>  	/* Finally destroy the blk queue */
>  	dev_info(disk_to_dev(dev->gd), "released");
>  	put_disk(dev->gd);
>  	blk_mq_free_tag_set(&dev->tag_set);
> -	idr_remove(&ubiblock_minor_idr, dev->gd->first_minor);
> +	idr_remove(&ubiblock_minor_idr, first_minor);

I think the real fix here is to implement the free_disk method
and free the idr there.  That ensures the ID can't be reused until
the disk is entirely freed as well.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
