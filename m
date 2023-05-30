Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E281DC77B73
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 23:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LGF8ugcXCf78kGa9JErs4Rh0Nqw/hFi0TfgGBI4Ric=; b=eTT1V6wd57gt+c
	Dt4JpHopn7bCAUy4hzqAi3VyMSNskIQBLCtJqpp73j8t7iHcPfq3At89GyvG8T0TDwLpIuMAgOYn0
	r850pCuWSih5GS04cag9/zIBXSj2yGiDbXZcqQJUqlltVkYSlzDULoZ0GcEhYiC9q2yQ/KMg7ywPG
	hEufKM2zna6oAIL/mOZGIBPmHbXjJ8XyRdOZa2WS4JhLhoMp0XW7kTfVUIu7RiaB4Nqd92PELjT+B
	SGd3lXt4o+cT9AMu9HS5URVxxqVBVFuEHxrAdqDP64wr4zjaa0w2/cjJPFjtH5YXZxusLvnB8v0Ui
	7KoYwKCv+T0bRi1z86JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q49Bd-00FXEt-1x;
	Tue, 30 May 2023 23:55:33 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q49BD-00FX2H-2o
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 23:55:13 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3147F2C0615;
	Wed, 31 May 2023 11:55:05 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685490905;
	bh=CR/D4HszLFw7g5PkmVVQf15ez0ihtAw6SzCP2pi70Bw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWOIvWVJ1cMewbloLAT4l3zII898ttc0dOOfEeoiVTv0L/Q1mAMH6E4L5PUgdAEua
	 bQ2dxk3dy0HjBRNzDB3M5sIS66uXWpSegq1k7R5BVPDkLFoCGlXkuorvYrfd83ErxN
	 ZodcnJkq3jQ4AOJFHni8YsWO8pasQE9REXI9l/rkcIL9eJlgRsICnfZ6HqrFU883cW
	 kZ1JFLCnIpaONfwTtvUCs94dH5kw3FDLVYL6zi33jconAV587dxFK+N6iuRbnQWS23
	 na6I33S0I3gRmuVOPYnetHEPvvhO0E23kNC2az3g1q25q+sDERwz5xfGrEIwnPw05h
	 mh+JI2C238gUg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B64768cd90000>; Wed, 31 May 2023 11:55:05 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id F2AB913EDD5;
	Wed, 31 May 2023 11:55:04 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id F1B93280AFE; Wed, 31 May 2023 11:55:04 +1200 (NZST)
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
Subject: [PATCH v7 4/4] dt-bindings: mtd: marvell-nand: Remove deprecated compatibles
Date: Wed, 31 May 2023 11:54:56 +1200
Message-Id: <20230530235456.1009082-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
References: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=v2geHv6J5O549XUBZ50A:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_165508_452919_714C0934 
X-CRM114-Status: UNSURE (   6.45  )
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

Remove compatible values that were marked as deprecated in the old text
binding.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../devicetree/bindings/mtd/marvell,nand-controller.yaml       | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
index 7cd4a2e99343..80ce854291cb 100644
--- a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
@@ -18,9 +18,6 @@ properties:
       - enum:
           - marvell,armada370-nand-controller
           - marvell,pxa3xx-nand-controller
-          - marvell,armada-8k-nand
-          - marvell,armada370-nand
-          - marvell,pxa3xx-nand
 
   reg:
     maxItems: 1
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
