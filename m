Return-Path: <SRS0=reHH=K7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85447C47082
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Jun 2021 14:04:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2182D611AE
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Jun 2021 14:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2182D611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsiLpuhMI/XfoPSPMTutqv9HOWkRSq4m2yqWBE6pgr0=; b=jVVaYpuDQaMqeV
	eq9d6Y0f8c2s4m0yx/3/aVxkriFhBKM4iuO+fnrtkYRMBXY94U+oC1dgHUC+RdSPbDKkeGNUsb8vp
	FYUVEaj+pyJEjYcvTBjmcwxiO7R9TOb8hhshUFEupC3WRsGDpahFINVKa4f+IV/mvFIzn25kZp1sD
	etgg7zk4jeeYY2rFY2LWx5zRbKbfr1UsoQeaTuXxL/lMX6+D3CwvrUoKDsC/RhPRKrZp2t69XnNaz
	0vhHzSHjHJIrTvwLCI7H9ixa9906fM7RbvO9Qe6MY+hp+m5dypAi0pMgHGwnnXXRC9Dp8DXg2es3N
	Hdp5kyD2J1449OV/t+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpWtS-00Ge7C-Fs; Sat, 05 Jun 2021 14:03:18 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpWtI-00Ge60-4z
 for linux-mtd@lists.infradead.org; Sat, 05 Jun 2021 14:03:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8575C6736F; Sat,  5 Jun 2021 16:02:57 +0200 (CEST)
Date: Sat, 5 Jun 2021 16:02:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com,
 Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
 Denis Efremov <efremov@linux.com>,
 Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
 Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Mike Snitzer <snitzer@redhat.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: simplify gendisk and request_queue allocation for blk-mq based
 drivers
Message-ID: <20210605140257.GA13166@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
 <YLpNqiw0LMkYWUyN@0xbeefdead.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLpNqiw0LMkYWUyN@0xbeefdead.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_070308_363335_15931C8A 
X-CRM114-Status: GOOD (  12.16  )
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

On Fri, Jun 04, 2021 at 11:58:34AM -0400, Konrad Rzeszutek Wilk wrote:
> On Wed, Jun 02, 2021 at 09:53:15AM +0300, Christoph Hellwig wrote:
> > Hi all,
> 
> Hi!
> 
> You wouldn't have a nice git repo to pull so one can test it easily?

git://git.infradead.org/users/hch/block.git alloc_disk-part2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
