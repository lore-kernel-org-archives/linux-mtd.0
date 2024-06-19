Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03796C2BA15
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2024 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/9aBmqtCAw+lw0gISXXp+hTmkgNHf5pPCxIze6vuQo=; b=3x1e5HfFHJNAcq
	OM0vdgMHl0Qj/lbms2w7zJuzYbvO4gLKCbICmwRkO1SVTRkDcCE9sbLz5gm3KRZA5hBOY4NwPTI93
	knv4ieAtHdDDP5zCzqF344M4dwdA91XKfN6iisfODzM2UBhB54qAtAIc5HocMQRdkt7KHTLZQwT9R
	A+ZZ64RI2PavMOcpN8ZKsXTxZpT/kGPsTN6u2OsD4lttUhk2hITs4SlQT7hzkCAQyTiQr6n0kdVzJ
	qifhxXevh/qYJXS2FO55Qu1l0S4kx4GXXXcYbCrSNGcUvtoNROlEu6DWSDLM53VtQ2HNXavoMWgyo
	BTmFze9tnPNoAJoFgPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwEB-00000001VP9-0Qyy;
	Wed, 19 Jun 2024 14:23:59 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwE3-00000001VMH-3TgA;
	Wed, 19 Jun 2024 14:23:57 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id D67B368AFE; Wed, 19 Jun 2024 16:23:40 +0200 (CEST)
Date: Wed, 19 Jun 2024 16:23:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>,
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
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: move features flags into queue_limits v2
Message-ID: <20240619142340.GA32100@lst.de>
References: <20240617060532.127975-1-hch@lst.de> <171880672048.115609.5962725096227627176.b4-ty@kernel.dk> <e8e718ca-7d3a-4bce-b88a-3bcbe1fa32b0@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8e718ca-7d3a-4bce-b88a-3bcbe1fa32b0@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_072355_725200_F8CD9F03 
X-CRM114-Status: GOOD (  10.91  )
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

On Wed, Jun 19, 2024 at 08:21:14AM -0600, Jens Axboe wrote:
> Please check for-6.11/block, as I pulled in the changes to the main
> block branch and that threw some merge conflicts mostly due to Damien's
> changes in for-6.11/block. While fixing those up, I also came across
> oddities like:
> 
> (limits->features & limits->features & BLK_FEAT_ZONED)) {
> 
> which don't make much sense and hence I changed them to
> 
> (limits->features & BLK_FEAT_ZONED)) {

Yeah.  The above is harmless but of course completely pointless.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
