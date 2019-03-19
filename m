Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26455C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 15:08:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECEF520828
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 15:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHKL3Ri3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="Z07DzWWM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECEF520828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3Yy9od3E59Mej17kqCU2vq7hEM/Ei2Vyv5WiivO+p8I=; b=qHKL3Ri3NxYj6909hJ4Zw48IeB
	6Pzqt0vSWyalTySgTzawx4VZ+ZDl8gEOjgzCREtwU5bkQyqGjbSaA1KSpaZFB4w4VkqenQqyA/Vzq
	SmqY+51W6y7l4HUm4LHahx8BC6gAgZSHz2+YCgd0ZZDSdl2w/j0BcMH6TBwavKlZtbM+pbkwLnpdY
	tvucwn1cO+3wgB8ORlUiGxpibts28n/bOoSOLhbc7EJEbDS5hOKwlMcSU+g1DDKlxe0tOwc7CJzV9
	B2EN+1ZV6PU/JJYJxoAWYXnmFJmCrztzhREhgknNRYdzcexVua4fMOBUsGSRb+sWT1xFP1ec1rHRQ
	Hps81hWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6GLe-000184-Vv; Tue, 19 Mar 2019 15:08:14 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6G8D-0007rD-Lg
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 14:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1553007260; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=txBGNL3WV5PLBSLwOCKqka4x+d588iuGk/YjkJGGM6U=;
 b=Z07DzWWMw60WSjcJu+9E1fnMfKEvoFHfbQHOuVCkGICEO+4A93QSM6PzeJoou5758KEgoZ
 Zyqfp2vKpkVq6NXRk+r5EnZJ3DgGdnRYTn2pJQjMB8/A+JJJGxIfQQ7nRJFEEhQHI0jDe7
 iyKKRVwcT4HFXZKGT7Mu1wKiPT7pmkA=
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v6 13/13] mtd: rawnand: ingenic: Move BBTs out of ECC area
Date: Tue, 19 Mar 2019 15:54:03 +0100
Message-Id: <20190319145403.31627-14-paul@crapouillou.net>
In-Reply-To: <20190319145403.31627-1-paul@crapouillou.net>
References: <20190319145403.31627-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_075422_249652_B8F44702 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The generic layout for BBT markers will most likely overlap with our
ECC bytes in the OOB, so move the BBT markers outside the OOB area.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v6: New patch

 drivers/mtd/nand/raw/ingenic/ingenic_nand.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
index d32d68ef0dc7..ad0c905a03ba 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
@@ -282,6 +282,13 @@ static int ingenic_nand_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
+	/*
+	 * The generic layout for BBT markers will most likely overlap with our
+	 * ECC bytes in the OOB, so move the BBT markers outside the OOB area.
+	 */
+	if (chip->bbt_options & NAND_BBT_USE_FLASH)
+		chip->bbt_options |= NAND_BBT_NO_OOB;
+
 	/* For legacy reasons we use a different layout on the qi,lb60 board. */
 	if (of_machine_is_compatible("qi,lb60"))
 		mtd_set_ooblayout(mtd, &qi_lb60_ooblayout_ops);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
