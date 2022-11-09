Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EF5C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 23:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/mEYzG0yBAgIq5yzAvDYjeW7vWRBDi1Vop8hvrgFjEM=; b=mtyWbXWrdfx4oP
	jSle6ZEzE/m4id4oZoGvY3erE3zdEc1aRFumQ9OE7UxHIsCiriJTzLYpapKBGRGiilJZxwLzMpZTs
	StwX8Wpz8l1TEt9aO9NIndPOhuwtILB1oOf54DHZiLkBe/834Cm7Pjy3R1+LRDIf5h/GqWrRJaC9x
	ohIjG0bbydx/mWkp2wHm2tGr4HCiC7bdQ2KIhODY03pPFitwYFjuih0cTIcRhqdayiWwhp45E+5Ud
	SDRLJEw6zCf86LjLAm1G6WY2Ezvp4/jsgx4Ll+p3oAH9CP38IO4LoLpoPG0Kh7tYYE67u41XuPeSQ
	tW3sCbMT/hP35lZMNwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osuGV-000bDc-7C; Wed, 09 Nov 2022 23:13:51 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osuGQ-000b8T-1E
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2022 23:13:48 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5FDBD2C03E7;
	Thu, 10 Nov 2022 12:13:34 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1668035614;
	bh=P8T3lEOrjoAqXTOdxr01WwdvPOBHveqH+VNjMz34/Hk=;
	h=From:To:Cc:Subject:Date:From;
	b=tPPZ5lxatzQMI6d2kGA4qvqqRElCOdqqbuJyCGwOE/fJcZVjT+DWMI7PLDt0tMkZQ
	 mKlsycOdP53Yyjt0D8bBNqSGhTp1x0+DkWWLnzAJ7K3AEFlIujKKOCgAVHJ+3P/sCr
	 2MRWshXsUb1tit78VHfAa0+rr1fF4ABlPh4yiWqNy61Qk4pblNlUhHTSbdbBhWDl/X
	 bNpXQRCuCL+7UazoUrSQBwZJKpulRIogMvJHw2HI/RdP2hyzFiPga1sgbY3qF8sHBP
	 Ay0e8Bb91xLGBvfNtliJVGLfZKA01OBnr2C6Q5QhQiEYkps4gek8dGg+p9/X5isKyy
	 Cr+emQW6bEHiQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B636c341e0000>; Thu, 10 Nov 2022 12:13:34 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 2FC0313EDD7;
	Thu, 10 Nov 2022 12:13:34 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
	id 2B4132A1BA6; Thu, 10 Nov 2022 12:13:34 +1300 (NZDT)
From: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: chris.packham@alliedtelesis.co.nz,
	linux-mtd@lists.infradead.org,
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH] mtd: rawnand: marvell: Enable NFC/DEVBUS arbiter
Date: Thu, 10 Nov 2022 12:13:25 +1300
Message-Id: <20221109231325.7714-1-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=PqrtkDE3 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=9xFQ1JgjjksA:10 a=kAMSiAi_OzIwPVRQGqcA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_151346_577239_84900F28 
X-CRM114-Status: GOOD (  11.72  )
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

The CN9130 SoC (an ARMADA 8K type) has both a NAND Flash Controller and
a generic local bus controller (Device Bus Controller) that share common
pins.
With a board design that incorporates both a NAND flash and uses
the Device Bus (in our case for an SRAM) accessing the Device Bus device
fails unless the NfArbiterEn bit is set. Setting the bit enables
arbitration between the Device Bus and the NAND flash.
Since there is no obvious downside in enabling this for designs that
don't require arbitration, we always enable it.

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/mtd/nand/raw/marvell_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index b9d1e96e3334..42c64dcea767 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -114,6 +114,7 @@
 #define GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST BIT(20)
 #define GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST BIT(21)
 #define GENCONF_SOC_DEVICE_MUX_NFC_INT_EN BIT(25)
+#define GENCONF_SOC_DEVICE_MUX_NFC_DEVBUS_ARB_EN BIT(27)
 #define GENCONF_CLK_GATING_CTRL	0x220
 #define GENCONF_CLK_GATING_CTRL_ND_GATE BIT(2)
 #define GENCONF_ND_CLK_CTRL	0x700
@@ -2880,7 +2881,8 @@ static int marvell_nfc_init(struct marvell_nfc *nfc)
 			     GENCONF_SOC_DEVICE_MUX_NFC_EN |
 			     GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST |
 			     GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST |
-			     GENCONF_SOC_DEVICE_MUX_NFC_INT_EN);
+			     GENCONF_SOC_DEVICE_MUX_NFC_INT_EN |
+			     GENCONF_SOC_DEVICE_MUX_NFC_DEVBUS_ARB_EN);
 
 		regmap_update_bits(sysctrl_base, GENCONF_CLK_GATING_CTRL,
 				   GENCONF_CLK_GATING_CTRL_ND_GATE,
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
