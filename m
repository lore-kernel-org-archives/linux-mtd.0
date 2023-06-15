Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F29EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 04:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X+V27sGvYTY+uli8sooWguCsYdm3YB604XFqYNJmJXU=; b=ZnGXyGUW5F9Obb
	c55MvsObnP5moR4i2rcCNJYUfehtCiyovykG8v2TDI3lZt1nsic9gZn5ffGzUp89n53MFtFgaKaGl
	Ex1fi9Z2vYVAED64kXHXKZr6JEjkkCRA1ld+LwJpCshZydqD+wsvdGhkh195k2Ozgzdi7kXU47t2x
	GJuTCpDebmgBLU/Bm9FtgiQlaGWIyJl5YTTcehYlicBfeHL2aGJKfGpk4MOP1UfcCHNtB5QjrPDzY
	r2wRd9usExBV2BmmOpS6Di9Fhfjv6nSEy83if+LILT6XTlf4M24yN/xWWplnEJkuyd0i+VEfh272A
	CX4QZ9t1UN0aonPMpdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9eEM-00DXmL-1Q;
	Thu, 15 Jun 2023 04:05:06 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9eEG-00DXj7-0K
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 04:05:02 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3C4FD2C0295;
	Thu, 15 Jun 2023 16:04:54 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1686801894;
	bh=SUSkUWLnjDnM6Q1oJEeOM0aUpiPD5yy/VyS5vIjY4aY=;
	h=From:To:Cc:Subject:Date:From;
	b=G2m16jUiT3PJFc1WNePThzY2fSHOUZuMC7YTahnqrmDYTKF/c8fBz7e75bxyrNZmk
	 PyZxSlCPIsULxUj2QPRAgwHeCM95FXxSr6VhePS6q+vVYVJZXZTYBcbzqzMtiPWJkf
	 BYZoMT+RLMVUOJBgMuAAiFUaCS7/x24NDbDI/1XlAHj3KCTtAYA12TQYTKvn7KXJTG
	 JNqWFkgQ/u0kjvbC5RPMgqJ/YUZTw3IOA4bAbelXZ5qs2g/NbybVfftRLcmhZKI2hu
	 4NPHAE6ENtLg+1htfyTh6BOoiEbKxbDBY1PlnjWrJTNtTQ8f2ge0cHoHWMkQw1t239
	 DO7QDmXlk8EOA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B648a8de60000>; Thu, 15 Jun 2023 16:04:54 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 1573313ED5B;
	Thu, 15 Jun 2023 16:04:54 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 12C3D2815D4; Thu, 15 Jun 2023 16:04:54 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v9 0/3] dt-bindings: mtd: marvell-nand: Add YAML scheme
Date: Thu, 15 Jun 2023 16:04:44 +1200
Message-Id: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=of4jigFt-DYA:10 a=L0yewt80EUckiTMxMrMA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_210500_636037_F97A3E8F 
X-CRM114-Status: GOOD (  10.67  )
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
to validate it's DT bindings. Old txt file is deleted.

Also fix node name in cp11x DTSI according to nand-controller.yaml

I've picked up this series to hopefully get it over the line. I think I've
addressed all the feedback from the earlier rounds of review.

As of v7 I've re-ordered the patches so the fixups for the device trees come
before the schema so if the series is applied in order the various checkers
should pass cleanly. This is reliant on a series from Miquel tightening up some
of the requirements on mtd/nand chips so the checkers may complain unless those
changes are picked up too.

Chris Packham (1):
  ARM: dts: mvebu: align MTD partition nodes to dtschema

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
