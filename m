Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D0DFD3774
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZIyYzQKODH5+wHK50lk92f4a/vGVbiR49/BLrdBNho=; b=VjWQ6cT4bFgvDy
	x5vhht9S5gw+CB8KnLHRt+opWK72KG+0vXZvt4isa/48+asyWjk5Oh85VJmCVPcxc6bUgBGUNWke7
	GYNdPEoFN5IZF0lqkzpeNtL46iClZvrD0wT55/etSvv70RdT1TuGWkLLxg0IY06xL9CM14QZVpBTw
	zM3ceT02DgTPmjF5lgUJAw3g4VW+JCkX2usJlwArz4AyZ2CwMwBUEXl0dA5zPW4U9SF+YQIBdnF39
	rfLu++P0Pv5fjSFHpzVEdzg6xu0pY6TzAQ7DMMD4TiqEQVGkNLzynCm8crizHp1IeiMy7zp4Xu4W0
	i6qgBcr0Pf3WwkNuev3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHh5-00000004ViR-19SK;
	Wed, 25 Feb 2026 16:24:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHh2-00000004Vg0-1q9K
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:24:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F29EBC40641;
	Wed, 25 Feb 2026 16:25:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5A845FDE6;
	Wed, 25 Feb 2026 16:24:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BA17103692E7;
	Wed, 25 Feb 2026 17:24:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772036694; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MKKB01c323/N361DE3aK7dkvikONqWPVusDTWKCcQ6M=;
	b=pSd7uyJiT1q+6QGosFTN0Hxk7mXrKShFzABq8Mb550h3hhZiikVLks23xfqqUi4MEWh5ai
	58I0h8s4xFkzMZAnZZ0BYmnr57mvMGc3Ty/q/0Gl7LGO3PijQm4E9cbA8XSIAGGtXZyGPA
	b5elmcVeuzXWI8qtf90wrSJfyzNwQJEHGRBqqHDjqikaXiye/rS1qomX+2L9JuMqkGIRMX
	gExBv/tNodG0lmMObNN5vCbapWDF5h65VHR/4+/ljg2kqmPjsQ5e4QLy1daTrFCS6TJGu9
	S1+NtFFBWLh8rdCFCXISAzlNIRg8YaWFYpWfu4jPhuaLxAY8vuhGHi+xIiQS3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Feb 2026 17:24:45 +0100
Subject: [PATCH 3/3] dt-bindings: mtd: st,spear600-smi: Fix example
MIME-Version: 1.0
Message-Id: <20260225-perso-fix-spear600-smi-yaml-v1-3-8ef3d205ab3a@bootlin.com>
References: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
In-Reply-To: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhila YS <akhilayalmati@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_082456_619542_DB916730 
X-CRM114-Status: GOOD (  10.58  )
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

Example is wrong, the reg property of the flash is always matching the
node name.

Fixes: 68cd8ef48452 ("dt-bindings: mtd: st,spear600-smi: convert to DT schema")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml b/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
index 62d4359908f2..e7385d906591 100644
--- a/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
@@ -76,7 +76,7 @@ examples:
         interrupts = <12>;
         clock-rate = <50000000>;  /* 50 MHz */
 
-        flash@f8000000 {
+        flash@fc000000 {
             reg = <0xfc000000 0x1000>;
             st,smi-fast-mode;
         };

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
