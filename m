Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6D5C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 02:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZrSmN6cfRsAf/VfLq5+MQmCwDrDFCYDbuFDajMjzy0=; b=j9PxE5NMexIM3Z
	mKXJMG5U2wOlN6oH3AYAggPnRc3C9Ehw1RsRubSp+1VM6QNstVtxSd5UHa88eHBvg3r5wpaYqq9VM
	JGNBshJz7KDTmybN649uGBRigbrMT/UDI5fyY825pYWE77Dz4OtNW0xFo5IGDH/l8v2ZFO0gVKMZU
	g4zRk/aOOYC/6OCSCMZyLe0Es0tw1XZWML/lKUrO/sFGCukbu6HWAXZAPN4S8JjqpUuJIBffjo5zh
	obB3XrYAuKdg73Vmr4iDbz88q2xz/HI3VLEe4rOGTTn2BmBl/QeLmb3iSU6ptxCz+QTJ9FyhzixV7
	zVo6LzdajigQpTctfj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4C3M-00Fr41-0n;
	Wed, 31 May 2023 02:59:12 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4C3H-00Fr1E-0F
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 02:59:08 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C70F82C05F6;
	Wed, 31 May 2023 14:58:59 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685501939;
	bh=fnLWAwzW4HcUaGPzX4yrZBg7arlSfGoZ0Vz/F6qEpwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=x0/oU9/EXZFR89hamM3kfhnzjMQAr/ddbbpKpCU+DBJ2I3CfO5TXR0OwdUvrcum9M
	 o2xDG3iUyHTauJn5yqnoZ8N0MajEP234FOV2ccFCAcSxWV7px0J5w/JDNwQWAJ0F0u
	 NeB4XAFJ0Lh6xB14D0q+wLawpbfsE53bb5SIRC/BSvCtnrkCnnjE4k3uuetk815duO
	 2SEoYWzvYjo4ZzK8BJ96fIh4CZMxP7UfdvO7FeS55i1JWpuY0En9mpr+loh8IdyhpB
	 AnPZ7SmY+D4513TlsjII5UEqyhDk34+298BMoKVBaIHp//ZcBQ1EcZdi5RQpP+tdLj
	 d7FjQoWJjOutw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6476b7f30001>; Wed, 31 May 2023 14:58:59 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 6AF7B13EE43;
	Wed, 31 May 2023 14:58:59 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 64E5A2804C4; Wed, 31 May 2023 14:58:59 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	daniel.lezcano@linaro.org,
	neil.armstrong@linaro.org,
	f.fainelli@gmail.com,
	christophe.kerello@foss.st.com,
	liang.yang@amlogic.com,
	jdelvare@suse.de
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] dt-bindings: mtd: Add AC5 specific binding
Date: Wed, 31 May 2023 14:58:46 +1200
Message-Id: <20230531025847.1284862-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531025847.1284862-1-chris.packham@alliedtelesis.co.nz>
References: <20230531025847.1284862-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=0frGRbVW35lbK5GUCdUA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_195907_579753_0B0BC38B 
X-CRM114-Status: UNSURE (   7.11  )
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

Add binding for AC5 SoC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../devicetree/bindings/mtd/marvell,nand-controller.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
index 80ce854291cb..c09efd7a0043 100644
--- a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - marvell,armada370-nand-controller
           - marvell,pxa3xx-nand-controller
+          - marvell,ac5-nand-controller
 
   reg:
     maxItems: 1
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
