Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27019C2B9F4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 08:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E484C610C7
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 08:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E484C610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fs2mbb/1o75FpLtuoiLa6NhP503m3GM3XgbOCKi9T+Y=; b=OpVkHUOVy+oKjR
	MJ5rTnEYW7oCU6HTfG4sIUGCWjbkLUZ9s70/2MSeM2qb9YWk0552T3noGH2kaStw6npxR8/p4dmYr
	uE91yo9q2GzoyeFIJ8JxB77kY4v+TMNugOokoZgH4JGg1fHz5h+1rGIb8INroS8FR/XXSoeBMmfbY
	jJoa/tANLGarjPoPxb41d7C3pVmFG43hlTZbAtw0XY9iPSbscLQENr5v6sNIXI2VuAMy6Hak7MaL3
	yIiYPgzte92AGXOszw8Rtl2DdSxWVPBRPMb9gc0cKGGC9P/t06ZoBOimrjZTGf2MD+h3/VnnmOEF6
	008zmzfkFJWX1unz8t6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvbYR-006CMZ-Jh; Tue, 22 Jun 2021 08:14:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvbYP-006CMF-EK
 for linux-mtd@bombadil.infradead.org; Tue, 22 Jun 2021 08:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CJeA0+MEt1zElZXSqf4pwES0ZCFoCyVJFjupde8Xr4w=; b=OjR+ufqxV8O1RtS05VwozlyVXX
 hQRgmWESL+3o1aESP0duhCGlBQ7Sy5UPRpN5EXeOhpaxYkBX0JCRz13MqGQTLeiocyssy1I9aUu8D
 Y/OSMjLgBxveHcZvW1LXBGLCNBGtGJ0nqAOR68+jkopdRMqOWYrt9FH0jUzavalm+dlt0GlF99exS
 91tm5VarRfkLBllzAg36Kb2v0GRMOyZ6wC73IYw6ZPuz2pEqwZHxoGqnW6TwSJvwp3d3Qcy3s/SYH
 IzbyfECIi5sD8FFVizPeCd7Pvvc1PA+JgRQxno7NoNnqQrLlEE3t2WsCySFXj8xzUGtt1b5YMyRtA
 And6scOw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lvbXw-00E2pk-HK; Tue, 22 Jun 2021 08:14:19 +0000
Date: Tue, 22 Jun 2021 09:14:12 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-block <linux-block@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 yukuai3@huawei.com, chengzhihao1@huawei.com, alexander.sverdlin@nokia.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: WARNING: at block/genhd.c:491 __device_add_disk
Message-ID: <YNGb1CFGWljoKmsU@infradead.org>
References: <CA+G9fYtbNfqqM6Hs9XpweFjYALHGTJ9yo3xkg8O3=Lq2grFDSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYtbNfqqM6Hs9XpweFjYALHGTJ9yo3xkg8O3=Lq2grFDSQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Tue, Jun 22, 2021 at 01:34:25PM +0530, Naresh Kamboju wrote:
> [Please ignore if is already reported]
> 
> Regression found,
> 
> The following kernel warnings reported on Linux next 20210621 while booting
> arm64 hikey and db410c and arm BeagleBoard-X15 devices.
> 
> This crash is always reproducible on these devices while booting with the
> provided config link.

https://git.kernel.dk/cgit/linux-block/commit/?h=for-5.14/drivers-late&id=7059d7cf150a1387ee72403976b81c2bf10af015

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
