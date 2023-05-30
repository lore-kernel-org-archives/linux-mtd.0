Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7452C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 00:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G2KVPSHok1YQuyv2hDhsznPmgG9KbOlVumAz3AN2WEI=; b=Y0ukMafjvnwZFv
	SxgD1VWHaUQklBzsFcb2ClqDubnvKtIjbjnem+Aw7CfAZItshpIsr8LQoTIBCHYY8snjQ6jYhGT96
	VenKK+5sQXjxpah+1NnOVg4/ltMioeNpLFtx1GZ2Wmgue6847A90DCO8xkLzY0US/PaLs0nFlnaBw
	m7qWwxhvRiZo2tlKYIl2iQqfeOhJKufxoc7zgqVdZxJdjAlrTbQJ18XD6JVdg/p2+BkQ8u6B+mBat
	aX8zpIsQm7KHrzSoUbXtaRI8URotl4lRh2N8TGZ9G6WiDVmcL3h8uUAz7oBKVmlJ9sp/aY/MF/Fls
	l87SQuolFQhPh3SpaVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ncd-00C2cr-1g;
	Tue, 30 May 2023 00:53:59 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3nca-00C2aN-1P
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 00:53:57 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7073C2C0274;
	Tue, 30 May 2023 12:53:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685408024;
	bh=9oONG5DFPFlhzS1QB858urQ+CpfCihmaDd33W3cYZy8=;
	h=From:To:Cc:Subject:Date:From;
	b=e76VX0Oa5F2rjWhxJ9xKbie3DpqXYr0+taEfAv0B2s07Wo5aFmXkUSZPaE0nVwwJ5
	 FAwm2qYgqW3AmS4RjJi5+178eyhPe2b6wtOCEPr3LMQdRl7WkrILIvmpcgCZGZVzy8
	 csNWT0X9tPTiHAkXnE/GcZqoFoO29e3jMxIFQd7ycMjwqpYZpRO1pflC9Bz3vEjt+m
	 we/wbwzlUSgnb+rHHn6pv138f1zgDX8HGF8S3crc/C0t1gs89mP1XzimiSbBAW/t+z
	 aO31k8XI3HozoiurgLKxBn+NA2Zf6dbxx/jcJOllm0aO2H5PqPE+xVx6nIqOMdL25q
	 9M9g+iGBo7sDQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B647549180000>; Tue, 30 May 2023 12:53:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3AAD813EE41;
	Tue, 30 May 2023 12:53:44 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 38E2E283D16; Tue, 30 May 2023 12:53:44 +1200 (NZST)
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
	vadym.kochan@plvision.eu
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	enachman@marvell.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v6 0/2] dt-bindings: mtd: marvell-nand: Add YAML scheme
Date: Tue, 30 May 2023 12:53:35 +1200
Message-Id: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=YqPRQZ2WnNP4KUIKbxQA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_175356_637520_79351841 
X-CRM114-Status: UNSURE (   8.42  )
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

Vadym Kochan (2):
  dt-bindings: mtd: marvell-nand: Convert to YAML DT scheme
  arm64: dts: marvell: cp11x: Fix nand_controller node name according to
    YAML

 .../bindings/mtd/marvell,nand-controller.yaml | 190 ++++++++++++++++++
 .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ------------
 MAINTAINERS                                   |   1 -
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   2 +-
 4 files changed, 191 insertions(+), 128 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt

-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
