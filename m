Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FD6C982C1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 05:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wB0EAQBjpCNNpaZVbmkVirt3wGOBS7fPmFtl/p5sNOo=; b=VBS9sPAdZ5Stis
	Fn2PFUMAd8uVRNI+zbDA2Jd6A/e6Z/klikGAASjgU1FGSlfrLtkXe7u5A/HfdKreRZibXkZWISD9n
	MBnp1lFCOu2cfmEt683Uc04eHSyisKv07mNBqQTUgI9onpW5xvWTrPY80JQ1435mfBPjvbJz0L5u1
	tgo7otiAMLv/t64J+WWBqoACTLA9JLxEHGAvoUXSQVBMSKq5kYTMv/9YMN6E43Pg1lyFVlfA9C+be
	YI9UN4BHyKHCrjAR44SZkuJU6uj2NWk1YHrDpllpHsMT6ImiJJskJbhczHS/E7eK5boGwYp38r8qM
	jITnmWa1cXdiFhANuY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74GV-0000000AaIX-1149;
	Thu, 17 Sep 2026 05:02:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74GT-0000000AaIE-3tyI
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 05:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05E6F60A54;
	Thu, 17 Sep 2026 05:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5AC0C2BCB8;
	Thu, 17 Sep 2026 05:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789621348;
	bh=b1ee6i6SmotwB95caa+DvKJNA5MPuT8KDx3JzIoVyF0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sPbiH2KNA6+i1SHQVXAUHje1Jo6pat8My9LGWk76CndSZDEtVw4BCX3MGmJW5D2mu
	 s069SDzIdYyODHU8jPwMgS6ykVHFUMlHO95jg7HHWWIOQaZ2UgyDUqO5oZLtGN/Ehu
	 F3ZRNsTXzXYZn8W0EoLxdXpYRAwum4YkkcahfBpO0lvTTSbEJQJOmtA7FzzW0OeNY/
	 h66nqsovURw60z5KqQabniKJqAaP4BBteJR0DA4A/doyV3Z3khvM14qlHFv2u4I4Dd
	 FHl99beWziMv2AHJnuz8N81txiGNxVG0/OFEfxhEODcdJEpIKuLMHCcCUv3vubo/g+
	 n/yZYnmS3m5Ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E28C982D0;
	Thu, 17 Sep 2026 05:02:28 +0000 (UTC)
From: Takahiro Kuwano via B4 Relay <devnull+takahiro.kuwano.infineon.com@kernel.org>
Date: Thu, 17 Sep 2026 14:02:15 +0900
Subject: [PATCH] mtd: spi-nor: sfdp: Increase SFDP data size limit to 16
 KiB
MIME-Version: 1.0
Message-Id: <20260917-sfdp_size-v1-1-c1cdb1003f48@infineon.com>
X-B4-Tracking: v=1; b=H4sIAFZ0q2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Nz3eK0lIL44syqVN00yxRTg+QUA1NjyxQloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loAVFtAnm0AAAA=
X-Change-ID: 20260917-sfdp_size-f9d50cd0539d
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789621347; l=1832;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=jgdfCpo97xb3riAigqfD6paumJXjsCSiN5EBCeoaUd8=;
 b=EYyWvTs7HkUROsN5diVtZwPfmb2LAcsPLbkL0iMzPO9AymQzBW+5TD0aj2cK07tiktx2QJBK/
 f/1qsUw8CyaDgSVnWlSUe+PDsMRdrkst37+t75YXntzbuawrrFDhLtn
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-Endpoint-Received: by B4 Relay for takahiro.kuwano@infineon.com/20250227
 with auth_id=566
X-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
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
Reply-To: takahiro.kuwano@infineon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <takahiro.kuwano@infineon.com>

The size of SFDP data read and cached is limited to avoid allocating
too much memory. The current limit is PAGE_SIZE, but the Spansion S25FS256S
has parameter tables at offsets beyond 4 KiB.

Increase the limit to 16 KiB to support such devices by introducing the
SFDP_MAX_SIZE macro.

Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 641f17ad51a0..5d5bb6e587bf 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -115,6 +115,12 @@ struct sfdp_bfpt_erase {
 
 #define SFDP_4BAIT_DWORD_MAX	2
 
+/*
+ * Limit the total size of SFDP to a reasonable value to avoid allocating too
+ * much memory just of because the flash returned some insane values.
+ */
+#define SFDP_MAX_SIZE	SZ_16K
+
 struct sfdp_4bait {
 	/* The hardware capability. */
 	u32		hwcaps;
@@ -1594,14 +1600,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 				  SFDP_PARAM_HEADER_PARAM_LEN(param_header));
 	}
 
-	/*
-	 * Limit the total size to a reasonable value to avoid allocating too
-	 * much memory just of because the flash returned some insane values.
-	 */
-	if (sfdp_size > PAGE_SIZE) {
+	if (sfdp_size > SFDP_MAX_SIZE) {
 		dev_dbg(dev, "SFDP data (%zu) too big, truncating\n",
 			sfdp_size);
-		sfdp_size = PAGE_SIZE;
+		sfdp_size = SFDP_MAX_SIZE;
 	}
 
 	sfdp = devm_kzalloc(dev, sizeof(*sfdp), GFP_KERNEL);

---
base-commit: a96edc3f0b4f036a5b6ebc9b1eca4273ef5ce2d0
change-id: 20260917-sfdp_size-f9d50cd0539d

Best regards,
--  
Takahiro Kuwano <takahiro.kuwano@infineon.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
