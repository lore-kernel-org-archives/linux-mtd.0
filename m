Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCC2C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 23:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7MA3nMsmBruJttMXemjidlob/05bJgImQHatuIbQ3EY=; b=4FAtMNYyrvblgW
	LBwmhpjVN8p8VeXB3aBgoyUK5NzjWNWp6ewxTHMko44MonN4i1egU2n9WNSkoe+83odwGd5sQtSPY
	eficoQ6vTPHevnZbaBFJlqeLVxX5RBbFdsoxpv5V4yXj7o2XYo3fZ0mDaBfA22V3qNXniw/bJUZrq
	w9phZzLNvHjqD6BxIE9bL6Tb7QIy7Dek80fpWmylUQXC9h8RdHWvO4BDxdWaSEeUcSuA/0jenVvdK
	PSL5wEuiW0S7pg7Kt6Z69dUtwC0H3DAo4h3ls91Mi/l+PwPYcjzG39a09RAuvK9IERcA80Qtg2bXK
	tROEiyuv3Iivmj9+gj8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q49Bc-00FXEO-2O;
	Tue, 30 May 2023 23:55:32 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q49BD-00FX22-2o
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 23:55:13 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7F2C82C02A9;
	Wed, 31 May 2023 11:55:04 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685490904;
	bh=rYPBxqvtp0wIOTTAPOhH2Lr7A6SahJQpVsGE6juPgK0=;
	h=From:To:Cc:Subject:Date:From;
	b=EWgXHpk7vrpJrTKeDH4PjH3iLwlaWHVhkBm5FczTqI6JH+D0hYOM6jsc/x/1nBpK+
	 nubABTgsVJHkvZqCR2i5QDgcjpN6gIraB5Tfn0EdoUnpVXyLSY0gfSVEHQIM3Far9b
	 MMvDY+mKi3JlLcIV9fpTa8Q5GWYbIGDSL1pbSrvejbJDVarizATsmdD54H8dWCy9Ac
	 U2cDvcdQDNfuWR06AyVgEQN1kE6//VN5rnXBhZj8TNsHuXVp5Tqyb5aOBy+9f7e9iz
	 0GkNZL4k5lPlgH5d3hjL83tanjKzAM3EhSNtN2rRBsLjPsr3/dubChQ5cA+URo/RT/
	 m6m6hv+En3sig==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B64768cd80000>; Wed, 31 May 2023 11:55:04 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 5713513EDD5;
	Wed, 31 May 2023 11:55:04 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 5442E280AFE; Wed, 31 May 2023 11:55:04 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	enachman@marvell.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 0/4] dt-bindings: mtd: marvell-nand: Add YAML scheme
Date: Wed, 31 May 2023 11:54:52 +1200
Message-Id: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=YqPRQZ2WnNP4KUIKbxQA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_165508_432812_CF08916E 
X-CRM114-Status: UNSURE (   9.99  )
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

Add YAML scheme for the Marvell's NAND controller
to validate it's DT bindings. Old txt file is deleted,
not included the compatibles and properties which were marked as
deprecated.

Also fix node name in cp11x DTSI acording to nand-controller.yaml

I've picked up this series to hopefully get it over the line. I think I've
addressed all the feedback from the last round of review.

As of v7 I've re-ordered the patches so the fixups for the device trees come
before the schema so if the series is applied in order the various checkers
should pass cleanly.

Chris Packham (2):
  ARM: dts: mvebu: align MTD partition nodes to dtschema
  dt-bindings: mtd: marvell-nand: Remove deprecated compatibles

Vadym Kochan (2):
  arm64: dts: marvell: cp11x: Fix nand_controller node name according to
    YAML
  dt-bindings: mtd: marvell-nand: Convert to YAML DT scheme

 .../bindings/mtd/marvell,nand-controller.yaml | 218 ++++++++++++++++++
 .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ----------
 MAINTAINERS                                   |   1 -
 arch/arm/boot/dts/armada-385-atl-x530.dts     |  14 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   2 +-
 5 files changed, 226 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt

-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
