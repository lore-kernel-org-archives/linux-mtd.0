Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50EDEB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 04:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CCJVImdDuUyXm9lpwcLZpMcCUyJb524OBMjyNnwzzrw=; b=khf9eWm4TetUmi
	oGsPKNX8dhRQOwvLxb34OJD+F9GnXRbYzaDpQTfjvOaYmHHBpspG9zKYhZ0ig/dooicuRXUQ2DBZl
	oGxr0vKdahScqxKNfHE0tnbDGhnwKZwM5s8fzVSimT4Wo0qopfsZEF5zLjlZrmICgJ9rGMsCNTKON
	rJOmDxMhalgJVoD/DQ8n4wislx8ODv6QIeaHAtIZMRusx1R3VHVvV3muON/3TVBwu+D6CqEGPCefW
	ulbjP0ynO8ttKuQeO/oRkVQ10WxicBAo+rapQGYoatpUYWroip5Bl8/34pgF06wVTuVH59DyS+Yeq
	qeTdsqohSXGjNeQxaDbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB6BS-007Mzf-0d;
	Mon, 19 Jun 2023 04:08:06 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB6BO-007Myb-2p
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 04:08:04 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5C9AA2C018D;
	Mon, 19 Jun 2023 16:07:52 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1687147672;
	bh=u0LwYlY+UmwjUoeVHHn56ui4IJQF/Y74vq7Rjx1yvDY=;
	h=From:To:Cc:Subject:Date:From;
	b=YwzuOYkfVD2mXP7ZfDIfkiBRcxg3qrUcNW7OhdY3GHmyerm/PZPg6DKhjKFX+zSUM
	 g7+BhEUDm9bMpvkCfxPPDNTaqD03Wtyo7yBDlLBOQ6aFFQu1DQ2BeD7mbI51P7eOdx
	 z8gQfidzrJUHKobmC8J0uS4Qg4Y1n1OhN0Y/akrQLZbaDArTMZs60oHeIrgH0FGD/o
	 frx1MQIS3H1blFvOLSyeCIwMtnwQ+NAKN9SMsZujU+oWF5Zn9/Im6xUFVZoQDOrYWJ
	 gJeTvCKEwEDbbj4XSgiAJ+uGxoVW2ae7zXB8RrdWkJZA54dWoJwHdAHZEp74CEe2jd
	 n/uAWVek6X/7Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B648fd4980000>; Mon, 19 Jun 2023 16:07:52 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 268BE13ED5B;
	Mon, 19 Jun 2023 16:07:52 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3A427283B18; Mon, 19 Jun 2023 16:07:52 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v10 0/1] dt-bindings: mtd: marvell-nand: Add YAML scheme
Date: Mon, 19 Jun 2023 16:07:41 +1200
Message-Id: <20230619040742.1108172-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=of4jigFt-DYA:10 a=L0yewt80EUckiTMxMrMA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_210803_419743_C8ABC38A 
X-CRM114-Status: GOOD (  10.32  )
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

For v10 the dts patches have been picked up by the ARM maintainers so I've not
included them in this round.

Vadym Kochan (1):
  dt-bindings: mtd: marvell-nand: Convert to YAML DT scheme

 .../bindings/mtd/marvell,nand-controller.yaml | 226 ++++++++++++++++++
 .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ----------
 MAINTAINERS                                   |   1 -
 3 files changed, 226 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt

-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
