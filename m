Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9BECD3430
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NS10wB+1upuZ5yv1DUL8eh6z6zDwfI2Ot3JBExMSVyE=; b=s7sX/pBY1UIc2S
	02G6ayBj4JVtz1qVyi9/FBtOtpnBSRgyZPiOfme5qd1/1j2soQrlBWYEWstr87u/miyjVSxlU8QiH
	reKJC5+T907h5LQsYoOH/swJGh1juG/PyYhOxkRNhROQMk8FrbLgpbzH5Zp6uRIu/GVaBjviTrSnS
	OYSPkUl2/Xr1nk58lC+WTfo3vheAnoVM7FiFwHtrs0GdNj4ZvQNkYThV+emhwqeHmDSOCs4mdroZf
	VNW05+ddssdLQRKK4qmXnqEScMuQN5LndLuO52mEwvHYYzU0inY5V3AxsX5tojhBTSZ557P9oXE6A
	NStKAN0xtFPS2UNL/RRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBBd-0000000FXAH-2kVG;
	Tue, 05 May 2026 08:31:25 +0000
Received: from mail.rulkc.org ([155.212.184.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBB8-0000000FX8d-1a77
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 08:31:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCED31000EC;
	Tue,  5 May 2026 11:30:46 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rulkc.org; s=dkim;
	t=1777969850; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=q7t8MrRJBq4aCjr+OmwYrbkXqqcXSUAe/YZDL4CoyLY=;
	b=LDKs5+2p55RIdcaZBPKKFd1HBkEof4LQdtUtRhpKenHTDVNIupey72YsSSqAn877pdy0yt
	PX4IgrMLK0oiLWzTolLUNO1O1Gfu48kWtObKVYJBIu/1Bk8LrzmEi/MfLH6CepvS598YFu
	K0CBeu5n1p9sSrHMrw0fpjANVciPkXYLaRn2KYiU05b0V9gML+ff4Yfsg21wRny0j6KRtS
	C0UXMcaRI6+Ju4KGqqxZJWGTp/1XD1UwYU6lY1Imxdcoy/Vjis0X3j6QGG52K73wZrZW1u
	xp+Y2hGjIYM/w4Bb3Z0UMmWjteyJZM/CW+xkkxrmGXFLxHjwuInzqK1vukLnJg==
From: Arseniy Krasnov <avkrasnov@rulkc.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rulkc@linuxtesting.org,
	oxffffaa@gmail.com,
	Arseniy Krasnov <avkrasnov@rulkc.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: fix condition in 'nand_select_target()'
Date: Tue,  5 May 2026 11:30:30 +0300
Message-ID: <20260505083030.322528-1-avkrasnov@rulkc.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_013055_017800_6981EC4D 
X-CRM114-Status: GOOD (  11.85  )
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

'cs' here must be in range [0:nanddev_ntargets[.

Cc: stable@vger.kernel.org
Fixes: 32813e288414 ("mtd: rawnand: Get rid of chip->numchips")
Signed-off-by: Arseniy Krasnov <avkrasnov@rulkc.org>
---
 Changelog v1->v2:
 * Commit message typo updates.

 drivers/mtd/nand/raw/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 13e4060bd1b6a..edfee22f15a73 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -174,7 +174,7 @@ void nand_select_target(struct nand_chip *chip, unsigned int cs)
 	 * cs should always lie between 0 and nanddev_ntargets(), when that's
 	 * not the case it's a bug and the caller should be fixed.
 	 */
-	if (WARN_ON(cs > nanddev_ntargets(&chip->base)))
+	if (WARN_ON(cs >= nanddev_ntargets(&chip->base)))
 		return;
 
 	chip->cur_cs = cs;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
