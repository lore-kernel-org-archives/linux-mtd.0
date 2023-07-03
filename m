Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576BEC001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jul 2023 03:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sD5zhjeXOT5LYiQ9igar5OeK/d7sskhn2ugcaYQJV/U=; b=D+L6kepGPiSmUp
	fZKUv3byXqYhO3T7O2SF8dtUkMC+sWVlF5UbLDn7w9ojwG9wxr5U7wZYadCj8Je3Lm4i+UjD/tR2F
	zC7QxkrdNjtBIGv86+CoV0MwJL4ZWQvolpSlKrKm8omPO3iO2zBpGkkRTqmSBZMENMJ6uOFAhDO3w
	qzKBOo4Mnr4KGA/+lGbRMLjmJz+xM0OsP+M37y+VOoC8shyG73Yfn/XcwvpIW4A4GVDBSoUlSnuRB
	zUe21vL2LaHzA3WuljUiH9OdmD2HMcC+WycDBNc/wiRpKYNgaOyspgllloyMt3z6TvdHZClfQvPu/
	guh+Rip1k6vaxrnm/bNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGAac-009Cf2-2t;
	Mon, 03 Jul 2023 03:51:02 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGAaZ-009CdT-2y
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jul 2023 03:51:01 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EC60B2C03B6;
	Mon,  3 Jul 2023 15:50:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1688356248;
	bh=fFPDvwsEHFCxrfnhOHQlIvQXqw4Sj7FMlVCBiiLdjZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B4VMwn/4y7NAsbIZGk/TQzUjJy2Y6mMHh5qgHDzrvavmATvL0GNM4FciqO6fc6qZz
	 VhH/oFDwxyDIc9kmhjd7KPMvjAmZc0IdnaikZSfj9XkBYaoCYIBpAU4PqmVJcXU+sx
	 KKQ0fIbQ4sO2S8BwREZrrDV+Jj6IR35Fq0QzcrHjSnftqh1Jt7tafStyaoh3Dj3d9r
	 r6ke93IGsnoxNHEMtbMYuKxM10okXg3kUcTq2V7Q9Nvz2sAOUoyEVfi9m055vj5/15
	 MXjq8Y+EiF7xkenTWme+HWVlaX5fubjaUQk0PTFX+YxvCfr6cXlbPK9wMIMX4Pt0VZ
	 yedFmj+IL4k9Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B64a245980002>; Mon, 03 Jul 2023 15:50:48 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A30BA13EE63;
	Mon,  3 Jul 2023 15:50:48 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id A2361283B14; Mon,  3 Jul 2023 15:50:48 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 2/3] arm64: dts: marvell: Add NAND flash controller to AC5
Date: Mon,  3 Jul 2023 15:50:43 +1200
Message-ID: <20230703035044.2063303-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703035044.2063303-1-chris.packham@alliedtelesis.co.nz>
References: <20230703035044.2063303-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=ws7JD89P4LkA:10 a=AWclJRrDGzD0f9BZm7oA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_205100_121231_DF2B6D9A 
X-CRM114-Status: UNSURE (   8.45  )
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

The AC5/AC5X SoC has a NAND flash controller (NFC). Add this to
the base SoC dtsi file as a disabled node. The NFC integration
on the AC5/AC5X only supports SDR timing modes up to 3 so requires a
dedicated compatible property so this limitation can be enforced.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - Use correct clock for NFC
    Changes in v2:
    - New.

 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
index c9ce1010c415..c64aaf51deb8 100644
--- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
@@ -297,6 +297,16 @@ spi1: spi@805a8000 {
 			status = "disabled";
 		};
 
+		nand: nand-controller@805b0000 {
+			compatible = "marvell,ac5-nand-controller";
+			reg =  <0x0 0x805b0000 0x0 0x00000054>;
+			#address-cells = <0x1>;
+			#size-cells = <0x0>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&nand_clock>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@80600000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
@@ -319,5 +329,11 @@ spi_clock: spi-clock {
 			#clock-cells = <0>;
 			clock-frequency = <200000000>;
 		};
+
+		nand_clock: nand-clock {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <400000000>;
+		};
 	};
 };
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
