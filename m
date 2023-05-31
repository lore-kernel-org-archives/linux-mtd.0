Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56107C7EE23
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 23:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KmoQNQAKn51zvlTuq90w8W2e1dihfJqO+ImaceQiGvM=; b=q9PS0XE3uW6gxL
	tjerq1xivLFRtm4qVwAcs9re598TP/q/sjcffsROmztIGzog6kaPuET1wREJmVvU5PQx2u3pUD67T
	0EYQuRbKwI+CqHj1OAncD2KaQ6OBQN2DOyF3aJIJmec36yKnQhY+16aK6nnzK74HEdBdRAAil4nkF
	dugM5fhhpNKIeySnvWy8tSSnUWYepeo8KJUK2yodG5GOupd+EohTDNRC2galI7DgqTZRixDtng1OZ
	5VoOZVu7sturVdIJ8QLc4z/m579b3s0HcFFUlSdGEOdtANSlu7IdrXRJH8p2HcvRZr/DbBmFOCd3r
	HkRFJATw0xpjj1k3YHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4VZd-001V7o-2W;
	Wed, 31 May 2023 23:49:49 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4VZQ-001V1s-1x
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 23:49:39 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E79532C00B8;
	Thu,  1 Jun 2023 11:49:29 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685576969;
	bh=JIh3FKEV4AmqhnmtnVLTx9kvmjGqUSmH2UcfmnCgf5Q=;
	h=From:To:Cc:Subject:Date:From;
	b=TEGwcpmjIiHaKlSngTD6pAfAxAPpnq3bj0DpgQgAF9wEXgGM9rrmzqMa+xwesJKj3
	 uwnwSbeU5oOVk4Ov7RCu2DugdW0yibkI031ijCU4Vs03tZSNOEk9pX9sTtFfuZx9zx
	 IxB3ne6RRYblOb2d4dqIfLYQN+BJ2aAZ9dX6SHb4TapH5qZkdeV3H5IJKSQzN+MnB5
	 9r+35DJJNNw8+gwY0/HQQbrx/+1YrX57IYjwhzyZr5WfgqF50gRjZf30OTEah0FPfZ
	 TW8QCdyRE0JuLaCMKV0t1yHN8WBwnnJOHbg+RP2wMlZMYq8kjWqHkLOeAcOQoSlIv9
	 qiuMO6tgAbTUg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6477dd090000>; Thu, 01 Jun 2023 11:49:29 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id ABAA213ED2D;
	Thu,  1 Jun 2023 11:49:29 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id AABE7285285; Thu,  1 Jun 2023 11:49:29 +1200 (NZST)
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
Subject: [PATCH v8 0/3] dt-bindings: mtd: marvell-nand: Add YAML scheme
Date: Thu,  1 Jun 2023 11:49:20 +1200
Message-Id: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-SEG-SpamProfiler-Score: -1
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_164937_150873_55E82820 
X-CRM114-Status: GOOD (  10.48  )
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

Chris Packham (1):
  ARM: dts: mvebu: align MTD partition nodes to dtschema

Vadym Kochan (2):
  arm64: dts: marvell: cp11x: Fix nand_controller node name according to
    YAML
  dt-bindings: mtd: marvell-nand: Convert to YAML DT scheme

 .../bindings/mtd/marvell,nand-controller.yaml | 223 ++++++++++++++++++
 .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ----------
 MAINTAINERS                                   |   1 -
 arch/arm/boot/dts/armada-385-atl-x530.dts     |  14 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   2 +-
 5 files changed, 231 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt

-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
