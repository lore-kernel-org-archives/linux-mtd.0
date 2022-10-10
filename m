Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2FAC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Oct 2022 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQ0refol/F6kx9GPRsjpFtVRMCyV1M3FjeA6hy1stX0=; b=SmaQzS6IY1mc0C
	T2TBIeb+yytNj5lfWbrfRbJ0jD+gEO8kzpAtqW5DUNiLuiTniZl/2WAo4qD5IJRadksW+6mG+ZBNa
	QX+HQ+jbVrpldY/vyI49jXEA3XkWpLkrlOwL+dUkPlisS13ijXmv2naUxFLqx+hYqzy9ii0Td1/xs
	eaTfSxjSriULXGNAqE/Ofz7HBhuF3FtR+x/7GVVH0mg3f8cMQ7lFLgSbYTdPJy6YzQBoO1/Sv11cU
	phh0l85k26HqveavRB7zYoLbHE1scCA+DuUqnBLydr6vTRrHCamKzY/52Y7Xe/Hkg3DrjezmdJQ+R
	2Of5VzfG8Nmx8po2rp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohngo-00HSKY-Sx; Mon, 10 Oct 2022 07:59:06 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohngj-00HSJR-TP; Mon, 10 Oct 2022 07:59:01 +0000
Date: Mon, 10 Oct 2022 00:59:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: ogeert@linux-m68k.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linux-mtd@lists.infradead.org, axboe@kernel.dk,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, efremov@linux.com,
	josef@toxicpanda.com, tim@cyberelk.net, haris.iqbal@ionos.com,
	jinpu.wang@ionos.com, richard@nod.at, miquel.raynal@bootlin.com,
	vigneshr@ti.com, mcgrof@kernel.org, hare@suse.de,
	damien.lemoal@opensource.wdc.com, johannes.thumshirn@wdc.com,
	bvanassche@acm.org, ming.lei@redhat.com, vincent.fu@samsung.com,
	shinichiro.kawasaki@wdc.com
Subject: Re: [RFC PATCH 01/18] block: add and use init disk helper
Message-ID: <Y0PQxdzmMzAAW0KF@infradead.org>
References: <20221005050027.39591-1-kch@nvidia.com>
 <20221005050027.39591-2-kch@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005050027.39591-2-kch@nvidia.com>
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

On Tue, Oct 04, 2022 at 10:00:10PM -0700, Chaitanya Kulkarni wrote:
> +void init_disk(struct gendisk *disk, int major, int first_minor,
> +		int minors, sector_t sectors, void *private_data,
> +		const struct block_device_operations *fops)
> +{
> +	disk->major = major;
> +	disk->first_minor = first_minor;
> +	disk->minors = minors;
> +	set_capacity(disk, sectors);
> +	disk->private_data = private_data;
> +	disk->fops = fops;

I don't like this at all.  For one major/first_minor/minors are
optional and discouraged for new drivers.  Setting the capacity is
a different thing and is done by helpers also used for revalidation
in many drivers.

It might make sense to pass the fops (and maybe private_data) to
blk_mq_alloc_disk / blk_alloc_disk, but even then I'm not quite
sure it is worth the churn.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
