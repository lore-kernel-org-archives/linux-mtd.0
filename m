Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FA3C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 18:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3Tb4kUfkFgtu77svTH10Ajukl5tqboml5LFUzQ2LJE=; b=H7qiRmgGeuRWHY
	w6YUEiVadOLxs+m5NcAdHfslSJ0IycyqIrFLaJ1W9RsPtaFm827/pBYsA/5PepTJrTZvnb7eP9pvP
	Gu+PN8bfVudUytPFGBKRkX55p+gfxzxMsvBwFZ4ZRQqjUOrlRBI2otU77UYtBMFGLbZyhm2n6yMOl
	sE368NWBfYpHdA4hhfxosn6rLxoP5dUxP3tse3IJGPatp0CysSrxuyYA/utTWAjdKB90VjQSiZzyE
	0Ii5WOP9iZ4zTm5Wy6/cmsn/jdmBhYUctzUUBipiIQyAOwNe7/HylSwUpTvkFhgJNl4+fR9jJ4rj5
	Rb3n9X8G984CWMhfOXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogs3M-00A42C-IR; Fri, 07 Oct 2022 18:26:32 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogs33-00A41Z-Ot; Fri, 07 Oct 2022 18:26:13 +0000
Date: Fri, 7 Oct 2022 11:26:13 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, axboe@kernel.dk, efremov@linux.com,
	josef@toxicpanda.com, idryomov@gmail.com,
	dongsheng.yang@easystack.cn, haris.iqbal@ionos.com,
	jinpu.wang@ionos.com, mst@redhat.com, jasowang@redhat.com,
	pbonzini@redhat.com, stefanha@redhat.com, ohad@wizery.com,
	andersson@kernel.org, baolin.wang@linux.alibaba.com,
	ulf.hansson@linaro.org, richard@nod.at, miquel.raynal@bootlin.com,
	vigneshr@ti.com, marcan@marcan.st, sven@svenpeter.dev,
	alyssa@rosenzweig.io, kbusch@kernel.org, hch@lst.de,
	sagi@grimberg.me, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, hare@suse.de, bhelgaas@google.com,
	john.garry@huawei.com, christophe.jaillet@wanadoo.fr,
	vaibhavgupta40@gmail.com, wsa+renesas@sang-engineering.com,
	damien.lemoal@opensource.wdc.com, johannes.thumshirn@wdc.com,
	bvanassche@acm.org, ming.lei@redhat.com,
	shinichiro.kawasaki@wdc.com, vincent.fu@samsung.com,
	christoph.boehmwalder@linbit.com, joel@jms.id.au,
	vincent.whitchurch@axis.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, asahi@lists.linux.dev
Subject: Re: [RFC PATCH 00/21] block: add and use init tagset helper
Message-ID: <Y0BvRaVO0iUVmHgB@bombadil.infradead.org>
References: <20221005032257.80681-1-kch@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005032257.80681-1-kch@nvidia.com>
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

On Tue, Oct 04, 2022 at 08:22:36PM -0700, Chaitanya Kulkarni wrote:
> Hi,
> 
> Add and use the helper to initialize the common fields of the tag_set
> such as blk_mq_ops, number of h/w queues, queue depth, command size,
> numa_node, timeout, BLK_MQ_F_XXX flags, driver data. This initialization
> is spread all over the block drivers. This avoids repetation of
> inialization code of the tag set in current block drivers and any future
> ones.
> 
> P.S. I'm aware of the EXPORT_SYMBOL_GPL() checkpatch warn just to make
> get some feedback to so I can remove the RFC tag.
> 

*If* there were commonalities at init and these could be broken up into
common groups, each having their own set of calls, then we simplify and
can abstract these. I say this without doing a complete review of the
removals, but if there really isn't much of commonalities I tend to
agree with Bart that open coding this is better.

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
