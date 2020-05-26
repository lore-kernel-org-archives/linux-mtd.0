Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0864EC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 20:00:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B680A207CB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 20:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AznPWmid"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B680A207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmxZL1hQTDFVc0MA/rhNoHKBAl9IWRSh5f9xFpMSFTA=; b=AznPWmidNZkzbp
	KfPdrgYcZ9UBbh/2/g5oFhhY9mImgSvEsYtfkOymIh20PMaaGspcAmH4g+ZSRFnXz2HUbf8AbiMPM
	HB3WqKzVCmTilpRVsmWXTSZkWX2Q8kLUye6vD/L+cqEZtJR7O6YAhgjQihegwvGez3HHu0Gk5dbZB
	AptjFZo07T4heaxJZr+2F0wtGBg1zERmxIY7E6DWSGF6zfiRQ7O1K3OkulW6rIWq/4tqXuLbUhmOR
	R92xkb/72U+ZqCxT+8X3ftImSBLsRZH1F0iqNZUmk7pAIIrDhpWgmg3Lf86Nks3I89kJZhRckr+Y8
	f2VIFdw1puSXo61FBrhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdfjv-0001nC-KA; Tue, 26 May 2020 19:59:55 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdfgy-0007bE-5P
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:56:53 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4E846C000A;
 Tue, 26 May 2020 19:56:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [RESEND v5 12/21] mtd: rawnand: Deprecate nand-ecc-mode in favor of
 nand-ecc-provider
Date: Tue, 26 May 2020 21:56:24 +0200
Message-Id: <20200526195633.11543-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526195633.11543-1-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_125652_362738_6BD78A81 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use nand-ecc-provider as the provider DT property. Fallback to
nand-ecc-mode if the property does not exist.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 69c1b7ab938e..7d17d52cdd34 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5036,7 +5036,9 @@ of_get_nand_ecc_engine_type(struct device_node *np)
 	const char *pm;
 	int err;
 
-	err = of_property_read_string(np, "nand-ecc-mode", &pm);
+	err = of_property_read_string(np, "nand-ecc-provider", &pm);
+	if (err)
+		err = of_property_read_string(np, "nand-ecc-mode", &pm);
 	if (err)
 		return NAND_ECC_ENGINE_INVALID;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
