Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913C2C001DD
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 03:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgiQ5KUabmAAN1MJoy8wEzw79xjVgnAL63+gsjKjW8c=; b=GgjI20G4IvAqK8
	1uO8TENVnZ5JS7HaqGFW1hfjWL2jiHoHHSAkForW6oH9wyvRaYHnt6z5WJsTsHERj151Vxa7XAPaS
	kIwkCvlHalOKFR+FUdCALM6/3hGj83hDdh0U4xhNaO9pMQz+9FRDHhesDF0jmfnDxCsbRPiZAknJ+
	4AlUuw7J9kDlWo+PGRio8wE+pcLoxnCqEK2s8KsKVe0tTHlsLm/lFiUl58BfGo2jUR9RY3ME17MQ0
	VtyXNcRpFB6WMwYVEhjGsqR9MbmfAI/0cf2SsPwkEEKptIgA2Zv5OkNq+O9l6E8DBlxd4E2OJvZXY
	ES5FtAgarO/4QvODGyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDceU-009DEI-1o;
	Mon, 26 Jun 2023 03:12:30 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDceQ-009DBX-2e
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jun 2023 03:12:28 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C24362C0124;
	Mon, 26 Jun 2023 15:12:20 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1687749140;
	bh=eMOEgUa0E7z5p8qfBp+CWlp5a+uQqNd4H4SB3Ukp/sI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIUNGZmGgGMYtCfI7k9W+Tkqud2W9P9ld6G9+cL2sKP5ipW3oVSGHltSOg51f24gc
	 xm0j9dZueRrYl7qzbompeuTj/ugt+EU3kTjR1XOliLsejmwF8lSrqEb2xI6p1xxUHi
	 EtRGCXXCnxyrBHHFCzlG/E3iw6Rj76SO29KuNJqtzpujmHPxbmId970OhZJalSt4GW
	 4EFAmZjTbD9TFXS1bWfjUJWD6+31xPJ/dRqpKwMIDc/GFXuAGoOBw1FkXY8HvQOXfv
	 6tQvCdgG5Gt05a3yqghMzDXkYdUjJ51g+k5flW5S2kLyFqLEHocUnp2e2zB6yvr57C
	 tVADcqSF0AH1Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B649902140001>; Mon, 26 Jun 2023 15:12:20 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A0D8B13EE52;
	Mon, 26 Jun 2023 15:12:20 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 9F556281AA0; Mon, 26 Jun 2023 15:12:20 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com,
	pierre.gondois@arm.com,
	arnd@arndb.de,
	f.fainelli@gmail.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/3] dt-bindings: mtd: Add AC5 specific binding
Date: Mon, 26 Jun 2023 15:12:15 +1200
Message-ID: <20230626031217.870938-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626031217.870938-1-chris.packham@alliedtelesis.co.nz>
References: <20230626031217.870938-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=of4jigFt-DYA:10 a=uX4zeqIseCYJFCGchTMA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_201227_378568_74168680 
X-CRM114-Status: UNSURE (   7.60  )
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

Add binding for AC5 SoC. This SoC only supports NAND SDR timings up to
mode 3 so a specific compatible value is needed.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - Keep compatibles in alphabetical order
    - Explain AC5 limitations in commit message

 .../devicetree/bindings/mtd/marvell,nand-controller.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
index a10729bb1840..1ecea848e8b9 100644
--- a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
@@ -16,6 +16,7 @@ properties:
           - const: marvell,armada-8k-nand-controller
           - const: marvell,armada370-nand-controller
       - enum:
+          - marvell,ac5-nand-controller
           - marvell,armada370-nand-controller
           - marvell,pxa3xx-nand-controller
       - description: legacy bindings
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
