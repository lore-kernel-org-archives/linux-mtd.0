Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E587BC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Nov 2021 16:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EkBLlT7moANW/173CVwMvPfEn/Wx0WnKQ44ivESOeJo=; b=pbykv/Jgt4fqyn
	M45a3y0exwUU9udEKUVjKiAWpKpoDmYtnj/hBpquUy9skXC9H959Y1ILsFKJ5SE85E87ke59MtYPC
	qhUKKIOhMn/717mDRpv7jmCnHNdU7lNrxtcN/I89WMdvskT4iw31qEM3qDylT258Sj9C8eK53Mokm
	9+v1MyXYydle/9zYECqRHRAYk7M/eLIpwnIGc1PhFeo0bPcDoKfmpQy4CCDRXeZfI63XJV594XhAU
	dG/ElqYhuXC3c6J+/xoICaWFvJEL3XQv/8JQuGKsnoCHbQuR6lQFiASZSxyTJ4BPZ+jMkk/p26uIn
	rv1LTS0D53XPRkeL1Fiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mopFg-00DsQn-QD; Sun, 21 Nov 2021 15:59:36 +0000
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mopFb-00DsPC-J9
 for linux-mtd@lists.infradead.org; Sun, 21 Nov 2021 15:59:33 +0000
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id opFKmFXqaf6fnopFKmxINg; Sun, 21 Nov 2021 16:59:18 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 21 Nov 2021 16:59:18 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mtd: gen_probe: Use bitmap_zalloc() when applicable
Date: Sun, 21 Nov 2021 16:59:12 +0100
Message-Id: <a6fe58dffe553a3e79303777d3ba9c60d7613c5b.1637510255.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_075931_820779_388BEDF9 
X-CRM114-Status: UNSURE (   9.57  )
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

'chip_map' is a bitmap. So use 'bitmap_zalloc()' to simplify code,
improve the semantic and avoid some open-coded arithmetic in allocator
arguments.

Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
consistency.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/chips/gen_probe.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index e5bd3c2bc3b2..4d4f97841016 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -61,8 +61,8 @@ static struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chi
 	struct cfi_private cfi;
 	struct cfi_private *retcfi;
 	unsigned long *chip_map;
-	int i, j, mapsize;
 	int max_chips;
+	int i, j;
 
 	memset(&cfi, 0, sizeof(cfi));
 
@@ -111,8 +111,7 @@ static struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chi
 		max_chips = 1;
 	}
 
-	mapsize = sizeof(long) * DIV_ROUND_UP(max_chips, BITS_PER_LONG);
-	chip_map = kzalloc(mapsize, GFP_KERNEL);
+	chip_map = bitmap_zalloc(max_chips, GFP_KERNEL);
 	if (!chip_map) {
 		kfree(cfi.cfiq);
 		return NULL;
@@ -139,7 +138,7 @@ static struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chi
 
 	if (!retcfi) {
 		kfree(cfi.cfiq);
-		kfree(chip_map);
+		bitmap_free(chip_map);
 		return NULL;
 	}
 
@@ -157,7 +156,7 @@ static struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chi
 		}
 	}
 
-	kfree(chip_map);
+	bitmap_free(chip_map);
 	return retcfi;
 }
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
