Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570DEC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2024 17:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HY15/AhXE5zElpkZqbde2wNcaIQeQ+lgBVYwYCrIPA=; b=CrL3f/JI6h3M6Y
	8aJBqY5CBNOO7sq72AXf/rp1YbMlEMLYypn/cxpRvjUUCRl9jfBNApuxfWm3PjTTtEAno9ULJhI2q
	B7RZWLrKb7mk8GFdHbTGIm2hbYa3SurcZdVN/RobGj33CGGpCjw9B+8jbq1yqaQMzAgq1vK5zVPA9
	94T9OXlPCQ8KlqsvRrdDBRFdOlXBEA1S1MlPDcnDwJx/E1q6NVOON5WHpmZExLL4OlX7a74PpkcQA
	JIfq2n4e0NTB9+vlEfR1i73mpTo1diXzzY41yzgigngVQ35FxJTk7RsGMGAKI9Nb3rfTf0q5H8/BO
	PGrZCI+4meQnfvhxjQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLnQg-000000004n2-2HrF;
	Mon, 24 Jun 2024 17:24:34 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLnQd-000000004mM-2Dui;
	Mon, 24 Jun 2024 17:24:33 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id C072868CFE; Mon, 24 Jun 2024 19:24:25 +0200 (CEST)
Date: Mon, 24 Jun 2024 19:24:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
Message-ID: <20240624172425.GB22044@lst.de>
References: <20240617060532.127975-1-hch@lst.de> <20240617060532.127975-15-hch@lst.de> <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_102431_912815_2B234A7F 
X-CRM114-Status: GOOD (  12.22  )
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

On Mon, Jun 24, 2024 at 11:08:16AM -0600, Keith Busch wrote:
> On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
> > -#define blk_queue_nonrot(q)	test_bit(QUEUE_FLAG_NONROT, &(q)->queue_flags)
> > +#define blk_queue_nonrot(q)	((q)->limits.features & BLK_FEAT_ROTATIONAL)
> 
> This is inverted. Should be:
> 
>  #define blk_queue_nonrot(q)	(!((q)->limits.features & BLK_FEAT_ROTATIONAL))

Ah yes.  And the sysfs attribute doesn't go through the macro and
won't show the effect.  I'll send a fixup.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
