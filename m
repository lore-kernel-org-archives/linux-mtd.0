Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EE5C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:51:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 966FA20772
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i//5m6Xq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 966FA20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgRzJRlicsZ6G8UYExi0e7rjm5aehhASp1gdYrvZWc8=; b=i//5m6XqDRMmJf
	c771bRZ8LgQ/9KYA5oeeUVHHSujfSofuRlNGQuVaOGG1x7qGM+i2gDAhJZG27xh1KN5QjUT3HTx4W
	dVc481AH7Gow3iyWfhdcp51oPWkGZQp7YC77wjh3MgPjGptCZ5ThfbGGeAQdC182aZnUeRQBd8sf8
	OlOL5Mu3fXmq8fsfqahkdwsjthtjzAyyqK6q5xlp7X8t15nRmDnu1HIJZPBgaXFpiCKe8UtV4NAQA
	UxDez+aeyK/+t9O8sn+EinlyltJpuLCLHVl1zI0LoO3JIU6bV5IcyjFYXKque2ZyJg/dYlRqi87BK
	Gs6z8eYuNmQPEWQeYIow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgTnl-0005nf-Gn; Wed, 03 Jun 2020 13:51:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgTls-0001lN-2S
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 13:49:34 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A59162A3D7D;
 Wed,  3 Jun 2020 14:49:29 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 10/10] dt-bindings: mtd: fsl-upm-nand: Deprecate chip-delay
 and fsl, upm-wait-flags
Date: Wed,  3 Jun 2020 15:49:22 +0200
Message-Id: <20200603134922.1352340-11-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200603134922.1352340-1-boris.brezillon@collabora.com>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_064932_259237_0BB03206 
X-CRM114-Status: GOOD (  11.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Those properties are no longer parsed by the driver which is being passed
those information by the core now. Let's deprecate them.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
index fce4894f5a98..25f07c1f9e44 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
@@ -7,14 +7,16 @@ Required properties:
 - fsl,upm-cmd-offset : UPM pattern offset for the command latch.
 
 Optional properties:
-- fsl,upm-wait-flags : add chip-dependent short delays after running the
-	UPM pattern (0x1), after writing a data byte (0x2) or after
-	writing out a buffer (0x4).
 - fsl,upm-addr-line-cs-offsets : address offsets for multi-chip support.
 	The corresponding address lines are used to select the chip.
 - gpios : may specify optional GPIOs connected to the Ready-Not-Busy pins
 	(R/B#). For multi-chip devices, "n" GPIO definitions are required
 	according to the number of chips.
+
+Deprecated properties:
+- fsl,upm-wait-flags : add chip-dependent short delays after running the
+	UPM pattern (0x1), after writing a data byte (0x2) or after
+	writing out a buffer (0x4).
 - chip-delay : chip dependent delay for transferring data from array to
 	read registers (tR). Required if property "gpios" is not used
 	(R/B# pins not connected).
@@ -52,8 +54,6 @@ upm@3,0 {
 	fsl,upm-cmd-offset = <0x08>;
 	/* Multi-chip NAND device */
 	fsl,upm-addr-line-cs-offsets = <0x0 0x200>;
-	fsl,upm-wait-flags = <0x5>;
-	chip-delay = <25>; // in micro-seconds
 
 	nand@0 {
 		#address-cells = <1>;
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
