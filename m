Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FBDC2D0A3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 16:35:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF510206CA
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 16:35:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FlGUpmgn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="d4dBLLnd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF510206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZ8qPmfzZaAmOgwVFcvecsA9voYNcsLCoU6ePfgVmqY=; b=FlGUpmgnmdECc8xkSgcAHfIccZ
	kdA3WBMDx6jQFnI2CmsR0JUfnG9bT8cjqFsUElr4rLkqDX9cVBkw/SnkYeDTtXlHf/wZKOUZ82T+V
	vBlmIqwlppLET+afuS6xEEfwdx+j6HzbbF38VYlrb5GiW77Ww0E9aEv7detz9SYV9iDYU7jR+OuEG
	XaUyHk0Ca+q59Iur1KYy2P18hey1Vv+d42zR1x9ojfXfNzqwv09FKIeiM18FKhtoIUqYsbFSqXRfJ
	R6eCqrBVgIacIrBh/x/+tK/RMG8QqzalbTcYdEqOietAKwE08bEZBi45nXoTXpU6V4A1Th/FOXKJu
	S3OURx+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaLk5-0004iU-Qa; Wed, 04 Nov 2020 16:34:37 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLk2-0004hl-9q
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 16:34:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604507675; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Dh5YK17Yc8Kt2H/U5xETpatLIq1apVHrUbVOsvEsyC4=;
 b=d4dBLLnd+Kn6/0igEkhkpS/4JDAY0geUSCngeZo0TdzByfqx2AXgoOuTXHsEB0acZTJpmoxD
 O/5OZ/RXui+24hchcHMN++kBaASDHnJ3cqxMwfcMnQVErKKqU60KrkSVXjSP2Ao2iFxg8uOz
 KYL3o/1mQZKshT7Vn99di3s3ass=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fa2d8168dd4beedee975114 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Nov 2020 16:34:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4800EC433FE; Wed,  4 Nov 2020 16:34:29 +0000 (UTC)
Received: from kathirav-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kathirav)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B2E75C433C9;
 Wed,  4 Nov 2020 16:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2E75C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kathirav@codeaurora.org
From: Kathiravan T <kathirav@codeaurora.org>
To: agross@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org, sivaprak@codeaurora.org,
 peter.ujfalusi@ti.com, boris.brezillon@collabora.com,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/1] Add QPIC NAND support for IPQ6018
Date: Wed,  4 Nov 2020 22:04:12 +0530
Message-Id: <1604507653-24999-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_113435_438855_B029E67E 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: kathirav@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

IPQ6018 has the QPIC NAND controller of version 1.5.0, which
uses the BAM DMA. Add support for the QPIC BAM, QPIC NAND and
enable the same in the board DTS file.

[V2]:
	- Rebased on v5.10-rc2
	- Replaced "ok" with "okay" for status property
	- Dropped the MTD and dt-bindings patch as they are already picked in MTD tree

Kathiravan T (1):
  arm64: dts: ipq6018: Add the QPIC peripheral nodes

 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 41 ++++++++++++++++++++
 2 files changed, 57 insertions(+)


base-commit: 3cea11cd5e3b00d91caf0b4730194039b45c5891
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
