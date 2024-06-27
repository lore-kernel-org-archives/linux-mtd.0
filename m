Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C7EC2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 10:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4q4LiUJGznNPRLZn/MQiYU9QqymBBOKSpkE5ZzruDI=; b=wOS9VAfBkooe+V
	YOTWssOt3auAsHgiOqiiI7oK0HzaDzoSCzl5/aKGfaT3zRW65/SKtX5mvxWYH/dTni+/lWNszjZgi
	5Y1kG7C9suo4UtZSe1giT65BxL0U3GJ7nzjDgM63s/NH9kV20F9b1PzGCZRYcU8+d6Jw18th/LIOk
	V7g21byYpbGkkBeY/fRrXMXcyDfmhDvF53TyfZiV2pSVZ2nQC8qAkv0zEslDzd1vnqm/2dNs1szPt
	HExz4b9Nj+FTISKcl+EPH5WBPxXwFIXBSgwI0uudRGjPwoucD0qgaILlcwVnyOEIiWjRFSkydP2Ji
	y7SiZkQAB4ldpwwHGGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmV9-00000009zG6-0tOR;
	Thu, 27 Jun 2024 10:37:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmV5-00000009z4k-3hpC
	for linux-mtd@bombadil.infradead.org;
	Thu, 27 Jun 2024 10:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jzDPCERzSFq5M+aGZPqXHKm7RdAKexupy8HzUZY5hUY=; b=dOXktvE1uHV7KC0D7n/oExIU1L
	a1FWx8Nm9dbDDRrfu9ljxvaWC0elmgJpjFs84P8vX6beDc3NeuMkUxJonMYkpHL6l6mONdTFj5I+n
	v/cAMB+vU7Kqn6kzHfTew4jTx9UbCavb00dAsjkqT55zt6lOiaGA8UgtL5o93CwOcg8boYr0/8Kgf
	LLGBuqZqqTm9/Dl5ppKI2zOj5NqmcUAN0ZruG+cRQIicnuHAH/wdUsc/AmXoM63smlmkGtDBNnZbm
	0m6UnATAydt0iYLfyUuwEgQZfjWoUhMN/V6BYMa/TdTe2vziwTtKxwck+EgR7y083qZZryoJF+zfk
	QNDizhkg==;
Received: from verein.lst.de ([213.95.11.211])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMllV-00000008ovn-3YRo
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 09:50:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4527768BEB; Thu, 27 Jun 2024 11:49:50 +0200 (CEST)
Date: Thu, 27 Jun 2024 11:49:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240627094950.GA30655@lst.de>
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de> <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_105013_832461_24F3A950 
X-CRM114-Status: GOOD (  14.48  )
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

On Thu, Jun 27, 2024 at 10:43:24AM +0100, Jon Hunter wrote:
> We have just noticed that since Linux v6.9 was released, that if we
> build the kernel with 64kB MMU pages, then we see the following WARNING
> and probe failure ...

The old code upgraded the limits to the PAGE_SIZE for this case after
issunig a warning.  Your driver probably incorrectly advertised the
lower max_segment_size.  Try setting it to 64k.  I would have sent you
a patch for that, but I can't see what mmc host driver you are using.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
