Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29241C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 13:00:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E737821900
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 13:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PsXJhwoA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E737821900
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yh+t/XsIoDD3eJ2IbPrYWctcOiOupsV2uudxF1RhAEY=; b=PsXJhwoAuS2994
	bXYpy/HG6+3eqHDvIZIO3BPeKOfQJJIvq7F6V/B8aqWOzTF7dtfEtb1aHzjMhZ39jln4YVCdYnkgN
	LS5g6zQAWa/VYp3vOF6AKTH59GtGWSaeFEKdnxaaVci2ewlQeH7Y9xvCR7uoSu0PZTqJ1t7LwIvNt
	Ls52IYbDftMfq4DFhZ5mDMUUfyvPA8Ll7nh0CY1Qy8NB2c3Acg1b/9a+yzUTNslDTCvVSmgd6aEJE
	K7dw7RkYqaRwo+iN9cvxH4xu41mW4gVsjVf3LvyUgQlqcW25zi2t9MhAAGVIg6sdu7OH+e5BIpACY
	AidlFTukes7Es5D3rAtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guGcu-0006dG-2N; Thu, 14 Feb 2019 13:00:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guGcj-0006Ih-9T
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 13:00:19 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6FB6C27FE95;
 Thu, 14 Feb 2019 13:00:14 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vignesh R <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Tudor.Ambarus@microchip.com
Subject: Re: [v6,
 1/2] dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
Date: Thu, 14 Feb 2019 14:00:11 +0100
Message-Id: <20190214130011.29845-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190212083809.6534-2-vigneshr@ti.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 70b64604fef0fb6fbc3bf6fbd9cd90b73ab0dfa8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_050017_463498_45655653 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

On Tue, 2019-02-12 at 08:38:08 UTC, Vignesh R wrote:
> AM654 SoC has Cadence Octal SPI controller, which is similar to Cadence
> QSPI controller but supports Octal IO(x8 data lines) and Double Data
> Rate(DDR) mode. Add new compatible to support OSPI controller on TI's
> AM654 SoCs.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
