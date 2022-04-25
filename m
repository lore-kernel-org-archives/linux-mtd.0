Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA75C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 15:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rlnUatCSPOR0P/BM1D6+0mPIFn+JvwDEKxe6DXBDiPk=; b=Fs2zpbokgA8XYn
	Dwtd1rC6zltEnrQAkb/ykguQxnOVpXiG+XKiX5Kd7VKJx8H5oWNqY2AL3yX8pd7hxQtixBxdiR7bB
	yHAy2WU+8grIpcVIKLXL6mTGpQHwKDugaaD/3CMdMliarJtPaTYkwxqv/mEE4TU/UNtu7P+1YTtlC
	sm0u50VLjOK+DVbhJoGuSpivP85A4bM+Dalodxc5Eesstv2hJFrptUZBl0goxt0/S0YANKYfregWu
	anWos5LDOJIRJwlYhAVq9uLrSivKjetRHwWYHnE8w3zxVVgjQuS0eJLRu41eUTSALNJWBhfO8H/fG
	jkDLgmNmKIFMeSPS+JrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj0CS-00A1Ab-NZ; Mon, 25 Apr 2022 15:00:28 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj0CQ-00A18m-5W
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 15:00:27 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1nj0CO-0000qd-Ii; Mon, 25 Apr 2022 17:00:24 +0200
Date: Mon, 25 Apr 2022 16:00:19 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Tom Rini <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [RFC PATCH 5/5] mtd/ubi/block: scan for partitions in case
 FIT_PARTITION is set
Message-ID: <Yma3gy3Olkr73aRR@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_080026_239420_F4062FD4 
X-CRM114-Status: UNSURE (   7.98  )
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

Enable partition parsers on plain ubiblock devices in case of
CONFIG_FIT_PARTITION being selected.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/block.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 18683d1c1bf501..b0f1f4565c719b 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -431,7 +431,9 @@ int ubiblock_create(struct ubi_volume_info *vi)
 		ret = -ENODEV;
 		goto out_cleanup_disk;
 	}
+#ifndef CONFIG_FIT_PARTITION
 	gd->flags |= GENHD_FL_NO_PART;
+#endif
 	gd->private_data = dev;
 	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
 	set_capacity(gd, disk_capacity);
-- 
2.36.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
