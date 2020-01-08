Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EC3C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:56:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A20E205F4
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:56:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RkWRjCwx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5rGatZe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A20E205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wFdg4OQa465jk/zzTnF1CcMNkPd6ET7k2e/WeMkMu8E=; b=RkWRjCwxf/pjnfgj/Ql4YwDVcD
	UbUFmWhwhHAqsmQG3Tt94jq2t6EcPo2rIhn1i0/DTqZueHAvvHsWNNolZciio3nYQkXpXFPsbk+FC
	aY42u2zqmZ5uM27cgMtHwNSJAf+hR9RnfM3gLIDOAB653Yz8OjAv3Ct5YF7md9b1HiGCGKpE+HYsj
	SLi143ZvAc7JQYkE0IWCoz+pJTkwUZJ6RB0ZmA29g/0qZiBeVWCrKmxrU6UDgK3+Do2XQ+RkA7bYy
	wDSnVW7/ZZKQQ2YiiiFmT5jovtGG6mLjRXxlJxZ9+P00OsinEL0A6DCxGKaazNcmiT8+vn6te11Mj
	Mrok7p2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipIMl-0000jc-On; Wed, 08 Jan 2020 20:55:47 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipIL0-0006Rr-FM; Wed, 08 Jan 2020 20:54:00 +0000
Received: by mail-wr1-x442.google.com with SMTP id y11so4921921wrt.6;
 Wed, 08 Jan 2020 12:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z9FpZJlsxfrtEhSFDySWhmw47lo8JbRtU9wLQFcCMME=;
 b=U5rGatZe//rnw7LVs9WeUyct2qy98AEqNUq+h00gKjRMmzUpzdKhHvMsn7GIEgXN7v
 d4ZvQYcSJjIvbv5jT6sso1Y/r+OjO7J9wyD2HSjInh2ZmHYUbsWNIDiky2JowA3yfLZZ
 LK2ZCes/u2fcKMGKO3BZw/fq/gI51a5LyGKcP83TIOENNnvKWwm824Gs++okVFTRDSPl
 GUpsSp9AfHziV5XY7P1fvMxzAilTc7NgBqHbH0lr3AQVjC/V6nNmwuH+E7KnAYmlZZka
 A0sxOEgo1F8MVyu5OhDr+lLjfZpb1gxbOu0YNEWGBRIwABrW+NuxPDU+PsyQkFHyeFhK
 wwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z9FpZJlsxfrtEhSFDySWhmw47lo8JbRtU9wLQFcCMME=;
 b=onqUrTQPvNsiDCvh6CcDlEvfH5JHrb1TpD2H9BLieZwHY1wZilPqpuhvKdQ0iO/P2g
 hsV1MS+7uP2FaTzKhFXz9wckymLj3lVXmXJ4D35Gc1hafmUXxUkGhH1rqRgns/xcHFfp
 O7EKG9bYxEHryNf7TVqJDF3zSEv1PcbDrIUq8LbxsFzVVjPPOtF0Rn0MQxMKej/uabF2
 vd2JWN/kb3bV+VoYetgIqNaw5AocQ8tjtSkscr89f3rek1kaCZFHWcprQZSwXaiY1gsH
 /CkXqDTS5DAEAWSTPBWNaZ7wU0TxwDFef1jSTZsvKMWDBBSUfYGh1rV75Dmp27w/IL7f
 xU2Q==
X-Gm-Message-State: APjAAAVfvB7CcHBPdDJdyEYV212UVH61xBpWcO2cBdoeCLUi8IWkvZFd
 PHZAamBWggA2bpK+FA7m9Vc=
X-Google-Smtp-Source: APXvYqwXzXwExy8tpSUlLOAGKe/8f/hfhE3ktWZZB/KjAShEe9kZZVaRqFTuXVzm07LUOTs/i9R4VQ==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr6734725wrp.1.1578516836849;
 Wed, 08 Jan 2020 12:53:56 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c5sm311835wmd.42.2020.01.08.12.53.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 12:53:56 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v1 10/10] ARM: dts: rockchip: rk3066a-mk808: enable nandc
 node
Date: Wed,  8 Jan 2020 21:53:38 +0100
Message-Id: <20200108205338.11369-11-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200108205338.11369-1-jbx6244@gmail.com>
References: <20200108205338.11369-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125358_540115_C6BEA4E7 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch enables the nandc node for a MK808 with rk3066 processor.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a-mk808.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-mk808.dts b/arch/arm/boot/dts/rk3066a-mk808.dts
index 365eff621..8928c9345 100644
--- a/arch/arm/boot/dts/rk3066a-mk808.dts
+++ b/arch/arm/boot/dts/rk3066a-mk808.dts
@@ -133,6 +133,15 @@
 	status = "okay";
 };
 
+&nandc {
+	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-is-boot-medium;
+	};
+};
+
 &pinctrl {
 	usb-host {
 		host_drv: host-drv {
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
