Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA23C7EE2D
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 23:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foW48TAjgbUVuc0pJa1+o6kR3IRU+xbP3tKZ8YRnT68=; b=C1KK3sk75SteuJ
	UCosrBJLGqn7aCENyP7JMklaj6mBRjlEn2qgIrc+aqhNY1LY0TCHJqSOEdBv7QMhfXKD+rKJBWdnZ
	0SOzuKKAtpnQfMCZNwkfLj+fzt6AItVIzDt78O8aCXM3wurveUjc/4LNqWZ+R8sGLZQNvXQbfkinF
	x43wKAbgxSl1EiDU1xK2BjWIyckM8QS1FOCdxRNsCoZLRNw/JPF5MFxhcKQIbyykVSuIsrFobAvyN
	kbhJnn9ACeabe6m2wSlq5rg7HzBhEwIed/MYXTIfdIySlTXR1jyOQR0oWX6rW2nqvWBwGcWLefNO1
	wgyRw4LhybZEQ3guCfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4VZV-001V5h-0k;
	Wed, 31 May 2023 23:49:41 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4VZQ-001V1w-1w
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 23:49:38 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 188882C0343;
	Thu,  1 Jun 2023 11:49:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685576970;
	bh=J8M93mkz4vrLKdNA3BnSi6fRCGqPpXnlnyQMlwSvJpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mFPXYmfaF+ODlRXtYXClW/Z+oga0nyEn4UbSP65ZNWtQmYR9jjSBG/plDbkQiqV/I
	 FDL/LD96E1VSwi/59B/8CE+fO49Jf9oadheK7nznanlKDHigBzkGtwBN4JKhX5DF8e
	 qIQb3JdaS3pL7R2PST+52kRwejPBENMAcZwiqgI7H3+jar4NZJdf2Hy77Ax6KpfHyh
	 Lm0lVWtf0NbQbTcVmYC8ipmDnIFGc2ulBzBKgpKpWKXdweROwN0zZAgDRCf11Z7uWR
	 mVV/N5lVhXkM3sMwZx2bzokZpEtLed1Q/+b0CnYtWVcJzrhnFQYdY/5Sk6Of/8paZU
	 ADAwOqxwT1piQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6477dd090002>; Thu, 01 Jun 2023 11:49:29 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id E1B9A13ED2D;
	Thu,  1 Jun 2023 11:49:29 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id E299A285285; Thu,  1 Jun 2023 11:49:29 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	conor@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	enachman@marvell.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v8 2/3] ARM: dts: mvebu: align MTD partition nodes to dtschema
Date: Thu,  1 Jun 2023 11:49:22 +1200
Message-Id: <20230531234923.2307013-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
References: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Score: -1
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_164937_169947_09340351 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Update the node names for the SPI NOR and NAND partitions to conform to
the partition properties in the relevant dtschema.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Notes:
    Changes in v8:
    - Add r-by from Miquel

 arch/arm/boot/dts/armada-385-atl-x530.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-atl-x530.dts b/arch/arm/boot/dts/armada-385-atl-x530.dts
index 241f5d7c80e9..5a9ab8410b7b 100644
--- a/arch/arm/boot/dts/armada-385-atl-x530.dts
+++ b/arch/arm/boot/dts/armada-385-atl-x530.dts
@@ -179,19 +179,19 @@ partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			partition@u-boot {
+			partition@0 {
 				reg = <0x00000000 0x00100000>;
 				label = "u-boot";
 			};
-			partition@u-boot-env {
+			partition@100000 {
 				reg = <0x00100000 0x00040000>;
 				label = "u-boot-env";
 			};
-			partition@unused {
+			partition@140000 {
 				reg = <0x00140000 0x00e80000>;
 				label = "unused";
 			};
-			partition@idprom {
+			partition@fc0000 {
 				reg = <0x00fc0000 0x00040000>;
 				label = "idprom";
 			};
@@ -216,16 +216,16 @@ partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			partition@user {
+			partition@0 {
 				reg = <0x00000000 0x0f000000>;
 				label = "user";
 			};
-			partition@errlog {
+			partition@f000000 {
 				/* Maximum mtdoops size is 8MB, so set to that. */
 				reg = <0x0f000000 0x00800000>;
 				label = "errlog";
 			};
-			partition@nand-bbt {
+			partition@f800000 {
 				reg = <0x0f800000 0x00800000>;
 				label = "nand-bbt";
 			};
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
