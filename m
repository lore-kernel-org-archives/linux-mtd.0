Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F7DC43461
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 16:59:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F962074B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 16:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bbs7kRtW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F962074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+lv7LaHLn/6sZWJy544TZmKTYTKGScDtrFuQ/JEwyOA=; b=bbs7kRtW9r6/HoA1FCtSRr4pg
	PlgwkiGdv+ev5xgDMa0hEcVATCtVQgVSUPMYAd3WNZCgPW1s4kaRjVBHX8YMr98eiSKzVJqYkUG7U
	Fth1g6I6296EWLMONiu4F2p71YHfRiC1qh14mAyXyJVpL7PVT/pNThOMUvdxvdadlkqgDTX0nJDk9
	QQZXzlvoRsILt0IpL1T3gpLBkLzNlBE2a0MdTghT1bRKMKmyc/35ReoG+oA4ZidVn5/p2rWVICmh4
	yFgx0PM4ZhTOd3+JCn8Xj86L2GkY++uVmrVIJ34yalhhjob+IPStSnooRQeJ77TnkHIQzArztz3PW
	7ewxkdPQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGmNT-0004xs-Px; Fri, 11 Sep 2020 16:58:23 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGmLg-0003zm-4u
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 16:56:35 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AE1021C0002;
 Fri, 11 Sep 2020 16:56:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, miquel.raynal@bootlin.com,
 richard@nod.at
Subject: Re: [PATCH v2 2/3] mtd: spinand: gigadevice: Add QE Bit
Date: Fri, 11 Sep 2020 18:56:28 +0200
Message-Id: <20200911165628.29094-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200820165121.3192-3-hauke@hauke-m.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 02de6aefd8bc3d6e20808950ee111c0b390a835a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_125632_344622_1D38496F 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: gch981213@gmail.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 wigyori@uid0.hu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-20 at 16:51:20 UTC, Hauke Mehrtens wrote:
> The following GigaDevice chips have the QE BIT in the feature flags, I
> checked the datasheets, but did not try this.
> * GD5F1GQ4xExxG
> * GD5F1GQ4xFxxG
> * GD5F1GQ4UAYIG
> * GD5F4GQ4UAYIG
> 
> The Quad operations like 0xEB mention that the QE bit has to be set.
> 
> Fixes: c93c613214ac ("mtd: spinand: add support for GigaDevice GD5FxGQ4xA")
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Tested-by: Chuanhong Guo <gch981213@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
