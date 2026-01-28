Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B8BD46C0F
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 23:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BRhQFIQflgtF7fEkONCSfm45jQ034rcYm1cuGVLmMzo=; b=RFL5EhrKOHcHsg
	DEAStkKGXcIfqHCyr8MMfNcbDqCG/6m3y0rla/R+kL9xSvWB/+Iu3NwPO1LYEnyhxOJQeDPgskrd2
	P8rczOGGWss2EwK/Th/lZeDprmozvosvQBax1TPE+sa0dcc3PxVe45GEJ9bEWDwepmc5Xiaf0RAyP
	ZwYEAf6SvCxGLUxJmGufD5wlktGr+jFZD81JTME9M4BOKftlehTOzWqgwJ6nBhCix9T8Yqst8va14
	jt0seP2921ik0vzdP+WWG8B5xKE0tzL478ELXLjQKKOhUutxdpRY0K3cNWAmrSgmfsN+5cA6ZKnS6
	z22+rcKyMLE4AJzBSaAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFNj-0000000GwmX-38hy;
	Wed, 28 Jan 2026 23:55:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFNi-0000000GwmR-3aHb
	for linux-mtd@bombadil.infradead.org;
	Wed, 28 Jan 2026 23:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=ByPSypS/3orLNZsReukY2LhaUKvo/mJCjxaIVPvifZ8=; b=k2k7hzBNO2EXUsRPaHNfXxTG92
	4Iz2j5j6vmzzQNErXKOhR5YSKRtAreYpX+z9bzRrxzSMwWiL2AD4DXgWt0GLGJaxv1dGO8x99i7pJ
	6030s0B7kvIW7kaBYg0EbgMHHNG8Jnlv7Hb/+SbkffenS8iy8T6B6lKbnFdz9mWmxWX7Iqjq7POsE
	aqiScoOOu/FazP2pkU3t5rHjbPFMw95Nfs9hJ6OQsnZtCCu+mSx95lK3TKzl5s0sGJ3f3sjlT597q
	fYiPzswGi+8koRAmv+4YW9mMAY+MvhhwrQHJ9xtn6FR0WeAsPO034TQFupzhX+f5KEjOvIOF1JDYY
	vkr53J3g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFNW-00000009Xlc-0XCv
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 23:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADDD74006F;
	Wed, 28 Jan 2026 23:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E621C4CEF1;
	Wed, 28 Jan 2026 23:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769644512;
	bh=s7A0Tzj7ErJlKlFHuKI9CYmUoiWlxYJEwaFedsfitR4=;
	h=From:Date:Subject:To:Cc:From;
	b=BfD9HATNr45W7a6TFwECCLGRXeFJuBDiqcPiQH8GrC77GI8EEEJfzc62hrP+8cs0V
	 qSTHafRSYpoJODY2iXi9zr+4FYuCRxPLJ+XpQdkcu4IcLYceUqgzur94LIu5IZeULv
	 UVftadEqfsXqn0G4Vr38YLypJLlJp8jBbX7T20i62jQ79T2gpUOJmw7DLzLPQfJNjS
	 kWTm14FOUOcjExyewTgz5N0sWgBB2IfNhuKvERVW1UDqErRZ1ECnBQxsqVR+Wmhw6F
	 YxGHKiPdke+NYiOUHxI8UE18AOgzJeduXrunerCtPW2gSpVGYEcyRSN3vyhquWbm40
	 vHRiilLhWt64A==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Jan 2026 00:55:09 +0100
Subject: [PATCH] mtd: physmap-core: Prioritize ofparts for OF probe
MIME-Version: 1.0
Message-Id: <20260129-gemini-mtd-of-partition-parse-order-v1-1-c209dfd7c0ce@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBBFryKz7oBOSqFeRboI5sfOwkQmoRTEu
 xvdvbd4/+9UYIpCY7eT4adFc2oyPDqavz4tYA3NSXp59YO8ecGqSXmtgXPkzVvV2pqLCjhbgLF
 3DnGO7ikSqC1thqj/+2X6HMcJRn6+THUAAAA=
X-Change-ID: 20260129-gemini-mtd-of-partition-parse-order-a33efcf3422d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_235526_421576_C348ABE9 
X-CRM114-Status: GOOD (  12.40  )
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

Place the ofparts before RedBoot partitions in the OF probe
path: this makes it possible to override any existing
RedBoot partitions with fixed-partitions which may be necessary,
such as when you need to repartition the flash from Linux'
point of view but not necessary from the bootloaders point
of view.

This happens when a device such as Raidsonic IB-4220-B has
three partitions named "Kern", "Ramdisk" and "Application"
that we want to merge into one for more efficient use
of the flash memory in OpenWrt.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/mtd/maps/physmap-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 2bd7a1af898c..0dcc25b7ff98 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -268,7 +268,7 @@ static const struct of_device_id of_flash_match[] = {
 MODULE_DEVICE_TABLE(of, of_flash_match);
 
 static const char * const of_default_part_probes[] = {
-	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL
+	"cmdlinepart", "ofpart", "ofoldpart", "RedBoot", NULL
 };
 
 static const char * const *of_get_part_probes(struct platform_device *dev)

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260129-gemini-mtd-of-partition-parse-order-a33efcf3422d

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
