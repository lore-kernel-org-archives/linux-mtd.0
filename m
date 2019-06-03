Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F01CC04AB6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 08:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2596527D53
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 08:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oiV5/t5M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2596527D53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eglWcYfiHxJaI8rPiwu9ajTF0MBp73oZgxsVKJcrdzc=; b=oiV5/t5M67f/AR
	6wOcMLpNVBWuEvkMTGou7tS2WtbjgSmEnlfUPPVEYLFcnssfpGEhANYcfOkond3NfoPhtgOXYtuwZ
	4xBH/CouJTglk4bDTcnuJ476SsMxMw0dTfBzBd/rK4tt16M/aV/gEcWTRUjXh8oiUvTMqe1takw5T
	aaSh7LWb4I1MAN6AxxxFNgnxhEIbgWn+VvbBAEhOeuzYyOW6e2j4ZS09dmYQCsTV4Emm+Ss5MvvuU
	RCGjgjuFqqcjPV0ZZUsC4X8Pm2tcLhRvdTv2Hn29r8eKYoVhAGzwxlJMQFvgIROn/Jtdj5ZZ0aqRN
	I334Ac8IJy9zgQNzX6dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXhyD-0002yZ-KF; Mon, 03 Jun 2019 08:05:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXhxU-0000ms-PJ; Mon, 03 Jun 2019 08:05:17 +0000
X-Originating-IP: 90.88.144.139
Received: from localhost.localdomain
 (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C38E7240068;
 Mon,  3 Jun 2019 08:04:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>, miquel.raynal@bootlin.com,
 richard@nod.at
Subject: Re: [PATCH v3 3/4] mtd: rawnand: mtk: Add validity check for CE# pin
 setting
Date: Mon,  3 Jun 2019 10:04:36 +0200
Message-Id: <20190603080436.28793-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190507102541.34341-4-xiaolei.li@mediatek.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: a63bf71a17c44ef60cd53fe6c6a18d5b6ee30f5b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_010445_704151_7D0443D2 
X-CRM114-Status: UNSURE (   7.32  )
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
Cc: linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2019-05-07 at 10:25:40 UTC, Xiaolei Li wrote:
> Currently, we only check how many CE# pins are set in device tree.
> But it should be necessary to check whether CE# pin setting is
> duplicated or if CE# pin index exceeds the maximum CE# number that
> controller supports.
> 
> So, add validity check to avoid these invalid settings.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
