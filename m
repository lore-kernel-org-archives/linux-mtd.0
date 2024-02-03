Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4891C48295
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Feb 2024 00:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvS1kgExS6e7Nzs52iMgrECU7u1t+OfzNWpC9u2kxt0=; b=pnfgwjPyXhqbhy
	jcd00sdpcIqHeCoxWnf2+58c9R4RGyD+wEHT8+GG4Sd8LPUn8S/VtSe8eit1QFXxAetp+bmuB4I6L
	T12KMHe09SvayoWnmY6ZxJ0bogoCCwHH5I5Ucm3jl+XN+pPwv9xwkCxy0fU/yU3nMHOdOYPzSWGvh
	yxQfXgaa9KDpo3rkJnpcQCpL0pZ4eURQ15PhR6cm7gZc3isAa4Tv2DUhC4kngfkzO0wARFOkPuJ4i
	g0hsT9nueG7oke7JJdwAlH6lXPwR/zRyevClVDG29QBxDlU3ZFVUmRtI6EYWZ/Jo6FIIr7lMIO4x8
	JXFavn0Kh0VGwQysG4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3uB-0000000DwIM-0g6S;
	Sat, 03 Feb 2024 00:29:11 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3u8-0000000DwHR-0owb;
	Sat, 03 Feb 2024 00:29:09 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AFA6EC001668;
	Fri,  2 Feb 2024 16:29:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AFA6EC001668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1706920147;
	bh=s6uMo50V83lQTFPmBSTZbJWskTqu4gIvfj3LFjK0xHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SYsPErs/LBSgVl54vY+9OxENj5P2edKlodbbaIvSW/ld25bUWhQgOLIiuqhBX6GXc
	 eFJ61p8suOaZsO22pVY7v9NiFgsZxmy6UkwwHKGDfVtJl2L8fQ7ZppXP9aWQ6Uw288
	 JFKXakzG4zkCGo/dmKPXuVmLNi37es760zhicSX0=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 48C9418041CAC4;
	Fri,  2 Feb 2024 16:29:06 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	David Regan <dregan@broadcom.com>,
	devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 01/12] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
Date: Fri,  2 Feb 2024 16:28:22 -0800
Message-Id: <20240203002834.171462-2-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240203002834.171462-1-william.zhang@broadcom.com>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_162908_291059_8EDFEBC8 
X-CRM114-Status: GOOD (  15.61  )
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

Update the descriptions to reflect different families of broadband SoC and
use the general name bcmbca for ARM based SoC.

Remove the requirement of interrupts property to reflect the driver
code and only require interrupt-names when interrupts property present.

Also add myself to the list of maintainers.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: David Regan <dregan@broadcom.com>

---

Changes in v4:
- Split the yaml changes into three patches. This is the first one.

Changes in v3:
- Update brcm,nand-use-wp description
- Revert the description change to BCM63168 SoC-specific NAND controller

Changes in v2:
- Revert the new compatible string nand-bcmbca
- Drop the BCM63168 compatible fix to avoid any potential ABI
incompatibility issue
- Simplify the explanation for brcm,nand-use-wp
- Keep the interrupt name requirement when interrupt number is specified

 .../devicetree/bindings/mtd/brcm,brcmnand.yaml      | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index f57e96374e67..e54ca08a798a 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
@@ -9,6 +9,7 @@ title: Broadcom STB NAND Controller
 maintainers:
   - Brian Norris <computersforpeace@gmail.com>
   - Kamal Dasu <kdasu.kdev@gmail.com>
+  - William Zhang <william.zhang@broadcom.com>
 
 description: |
   The Broadcom Set-Top Box NAND controller supports low-level access to raw NAND
@@ -18,9 +19,10 @@ description: |
   supports basic PROGRAM and READ functions, among other features.
 
   This controller was originally designed for STB SoCs (BCM7xxx) but is now
-  available on a variety of Broadcom SoCs, including some BCM3xxx, BCM63xx, and
-  iProc/Cygnus. Its history includes several similar (but not fully register
-  compatible) versions.
+  available on a variety of Broadcom SoCs, including some BCM3xxx, MIPS based
+  Broadband SoC (BCM63xx), ARM based Broadband SoC (BCMBCA) and iProc/Cygnus.
+  Its history includes several similar (but not fully register compatible)
+  versions.
 
   -- Additional SoC-specific NAND controller properties --
 
@@ -53,7 +55,7 @@ properties:
               - brcm,brcmnand-v7.2
               - brcm,brcmnand-v7.3
           - const: brcm,brcmnand
-      - description: BCM63138 SoC-specific NAND controller
+      - description: BCMBCA SoC-specific NAND controller
         items:
           - const: brcm,nand-bcm63138
           - enum:
@@ -177,6 +179,8 @@ allOf:
             - const: iproc-idm
             - const: iproc-ext
   - if:
+      required:
+        - interrupts
       properties:
         interrupts:
           minItems: 2
@@ -189,7 +193,6 @@ unevaluatedProperties: false
 required:
   - reg
   - reg-names
-  - interrupts
 
 examples:
   - |
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
