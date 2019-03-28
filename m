Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D33C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 14:19:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D27672075E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 14:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IQ1xeLpH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gvs+l9wn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D27672075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3IPU0ECFOqUnNiWf+u+KOaeubY9oSRf6PNQdV4H24Xo=; b=IQ1xeLpHK3IuU/Rt1junJ4FSd8
	giAYxDINejaD1VodOvTCBpUZjwvvmS6811iWdEg07Mukh8XP9lXRccD9InE9dpvzegccDyLDas/dD
	rSycwAelPKbgBWBah9NRUoPtx/xmFba7qvEw92J+0+gKnglNP8X8SJ+YSxsYJFsLUaMMwnDZzwRiV
	VnhfH+2QtUkBZdmYhX6R6JDBifPUq0Dkpy10bq7ASmLyRssTWF+8k6lXKLBwOKBg/dJTrNvBHrQ5v
	Z0T1n8yCShNQreuK92PdeY1oVGDqHcepuaB4e3h6QdSnB/Mb/17zd1k5+MRdl5HhemjgH8IM55LBz
	oiUO0ccg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Vsd-0002UZ-PY; Thu, 28 Mar 2019 14:19:43 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9VsE-0001uN-SG
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 14:19:22 +0000
Received: by mail-wm1-x344.google.com with SMTP id q16so3771067wmj.3
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I4NBnrPcBLSmBLDLCMVl3UePqPRGaV+p6WB2tvNcQqI=;
 b=Gvs+l9wnTKifah4+ommEMdCF3VyDMDjGXizrqqKCOYZK/7aEwDCAXuUu4qPgMCdAZE
 hpaOAf4eYDuFj9bfpAR2rHQy5NACX+B8QHwfWqLVVZ++hcl/l8WKsQW4tzP7cb5OYrMx
 jzkqiSXDXLQWEdYetcyTmd7c0Md4usPnC/WLFS/Y2Qyel+uRhM+Lgs31gkseKsMnL8WX
 mu0ysgSNuzu6O6FAgzwn0ZDAqzrkIGD+V/xQcBRBR4rUp7s3486FhHxg0ufbG57U2h1r
 hWwZLycAgb/c4+YALbuH37rMlWIXcDj0TDm7SrGUUQCSwWcYCRCpy7wNpjWGuTg9ksJ+
 bpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I4NBnrPcBLSmBLDLCMVl3UePqPRGaV+p6WB2tvNcQqI=;
 b=sqHgZH3FDcEsw2Oif2r2OOaPkitblrMwT6knZ8CdP0+kGnvxVXNsM5HgfsfX1Gb4iT
 jgtAJQ/glOyNH8a8OcTRKRlCbbN10CjbL7D+tp9e0SlwcQ1ayDHnn6npuRRZIXvmWDNA
 rkAOKfSd++srgaoHLgjM9M4SloNiqroiDWuwIOtGLH2i5LrgRKRQexkfdFScvVenNDAV
 3V3OOz/5fm784zf80bF/T8vDXB5y/tB96pL5UkhJFgWJrGk+uIyG1gTPrF0HuGV97QhM
 Z8lik58YTjRTYEMCC+loFWYcmth04/TE/kidy/506czKUztVeSbvT/+nccb1L5lyJ9fK
 dnkg==
X-Gm-Message-State: APjAAAV8mT42479lJNKQrh2ediBn2nUDIM+WpjMq5LGimg7Qymkuhnyt
 uPnjibtCiqKdUuuL8Nno1rY=
X-Google-Smtp-Source: APXvYqxj4yMMTwGZN3jZrKa2nblQ2yJaLcEzHuCyH5j8jBTWePtOYkl+bCKoeKihHUVa8ZZqop8AiA==
X-Received: by 2002:a1c:7dcc:: with SMTP id y195mr156864wmc.13.1553782756991; 
 Thu, 28 Mar 2019 07:19:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
 by smtp.gmail.com with ESMTPSA id t2sm51802879wra.9.2019.03.28.07.19.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 07:19:16 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH V2 4/5] dt-bindings: mtd: describe BCM963XX ImageTag format
 and usage
Date: Thu, 28 Mar 2019 15:19:09 +0100
Message-Id: <20190328141910.5723-5-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190328141910.5723-1-jonas.gorski@gmail.com>
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_071919_289876_79D9B7AF 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Describe how to use the BCM963XX ImageTag format in a mixed flash layout
environment.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../mtd/partitions/brcm,bcm963xx-imagetag.txt      | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt

diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
new file mode 100644
index 000000000000..f8b7418ed817
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
@@ -0,0 +1,45 @@
+Broadcom BCM963XX ImageTag Partition Container
+==============================================
+
+Some Broadcom BCM63XX SoC based devices contain additional, non discoverable
+partitions or non standard bootloader partition sizes. For these a mixed layout
+needs to be used with an explicit firmware partition.
+
+The BCM963XX ImageTag is a simple firmware header describing the offsets and
+sizes of the rootfs and kernel parts contained in the firmware.
+
+Required properties:
+- compatible : must be "brcm,bcm963xx-imagetag"
+
+Example:
+
+flash@1e000000 {
+	compatible = "cfi-flash";
+	reg = <0x1e000000 0x2000000>;
+	bank-width = <2>;
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		cfe@0 {
+			reg = <0x0 0x10000>;
+			read-only;
+		};
+
+		firmware@10000 {
+			reg = <0x10000 0x7d0000>;
+			compatible = "brcm,bcm963xx-imagetag";
+		};
+
+		caldata@7e0000 {
+			reg = <0x7e0000 0x10000>;
+			read-only;
+		};
+
+		nvram@7f0000 {
+			reg = <0x7f0000 0x10000>;
+		};
+	};
+};
-- 
2.13.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
