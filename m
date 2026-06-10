Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591D4CD8CB9
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2026 07:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p3T1kl6UdNvC4qHQKUBzfUxss3Kz9m5+3o8RwpFyCM0=; b=WGXV31m4dsAcVy
	M572fmEWUsPf4gEPcGJSNnfcZ4Iy7uRdd8yQjvZvUlgpNvF9M4ICG94TF+3mgXfG2kqa9aXv2N6Ob
	aiETAIPskXhCkRKPPQZzznT/447fqeGwFCZcF4ialH5vN733JrIcqaozZlYE42FUGO155t7Qk6XFn
	XUsqEKDokQ7quqpKZdVmdpKMRzClsghQYPQ0mmVwroq/+hxL8C7ZzGVhLnOJ0VpZfrFqH3xp7cOf1
	712B3dF1r8xu8jaVd+xPAixuJnAsASPv015v3cu59DusDhBC47jOfW+MJP5zCf8ANsmW1yBN0gOX4
	Oy/HEQ5Q8Gk0zXrELvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDGP-00000006x5v-3xzn;
	Wed, 10 Jun 2026 07:22:13 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDGL-00000006x5L-1xvr
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jun 2026 07:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781076116; x=1781680916; i=markus.elfring@web.de;
	bh=Q2eYEQq43o6gL4ohGYydr/8hwbC56vSfjNOWRv5ItX8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nf0hrcABOgsnnoHQRu39ybhsgZ9nhc0q5eqSg48BEGsea6lsVS5x71mCdFzhhfRB
	 u8v2C4en5edLSBkZdIsuNg4EAfCaEdhxtl1jWhSdeknaburklS9BKh8ByQXsEBDKX
	 RuNcxLsivqqXx63eFulYP8b6Hv7swuK0ndLVDWEybe9qFdP/Myu3yn4wg113F9V9n
	 RZT9tYoyazTo3rRqbpzpViVsoRC/mxv5EhD1C1YwwRKBc+AUdX09W3TP/SKppGogT
	 Y00J+dcYMwRalexxLCIe2+asRx0WprwIKu1mo71QTB63+Tpt7P1TdwKNSE4NJe38r
	 cQoCYT0oqNs2jvOxmA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mty5w-1xN81Y2TpE-012OLV; Wed, 10
 Jun 2026 09:21:56 +0200
Message-ID: <e3b98bb6-62e3-4370-9050-de48250a0398@web.de>
Date: Wed, 10 Jun 2026 09:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mtd@lists.infradead.org, Kees Cook <kees@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] mtd: cfi: Use common error handling code in two functions
X-Provags-ID: V03:K1:JBtsptAnfP2FfAyIIvT/gg0Jtk6LKXVjBx39XuRc6v327jTBixF
 r/ajSmS6g+GMsF6NqJYmGwN8wWWbI7s689NyXFaitu5RkDpT/QoiKus8Uh3A1WiUiYGSQJW
 OGC4zIAwbiXST3xJ/B6B+k1O3IdFpKwQ2P0MWBYJs9qmIZhE0nviHROsm1a1MX28xDwcbsD
 zkshGv3zZ522aRgX+ceXQ==
UI-OutboundReport: notjunk:1;M01:P0:sPUbCdIv6iw=;3g5cQOMXZiLS0vaRPD/3cD2kPnp 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 xPuvy+nKYF8vLpNfNucFaEaUhIkAtw5X48wOle9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_002209_902563_23BB7ACE 
X-CRM114-Status: UNSURE (   9.38  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 09:15:52 +0200

Use additional labels so that a bit of exception handling can be better
reused at the end of two function implementations.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 13 +++++++------
 drivers/mtd/chips/cfi_cmdset_0020.c | 24 +++++++++++-------------
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a38aceb6612d..517db2f2707f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -661,8 +661,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 				       extp->MajorVersion, extp->MinorVersion,
 				       extp->MajorVersion, extp->MinorVersion);
 				kfree(extp);
-				kfree(mtd);
-				return NULL;
+				goto free_mtd;
 			}
 
 			printk(KERN_INFO "  Amd/Fujitsu Extended Query version %c.%c.\n",
@@ -714,10 +713,8 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 		}
 		cfi_fixup(mtd, cfi_nopri_fixup_table);
 
-		if (!cfi->addr_unlock1 || !cfi->addr_unlock2) {
-			kfree(mtd);
-			return NULL;
-		}
+		if (!cfi->addr_unlock1 || !cfi->addr_unlock2)
+			goto free_mtd;
 
 	} /* CFI mode */
 	else if (cfi->cfi_mode == CFI_MODE_JEDEC) {
@@ -755,6 +752,10 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	map->fldrv = &cfi_amdstd_chipdrv;
 
 	return cfi_amdstd_setup(mtd);
+
+free_mtd:
+	kfree(mtd);
+	return NULL;
 }
 struct mtd_info *cfi_cmdset_0006(struct map_info *map, int primary) __attribute__((alias("cfi_cmdset_0002")));
 struct mtd_info *cfi_cmdset_0701(struct map_info *map, int primary) __attribute__((alias("cfi_cmdset_0002")));
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 6b5727eaae69..593ac65a7e2f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -174,11 +174,8 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 
 	mtd = kzalloc_obj(*mtd);
 	//printk(KERN_DEBUG "number of CFI chips: %d\n", cfi->numchips);
-
-	if (!mtd) {
-		kfree(cfi->cmdset_priv);
-		return NULL;
-	}
+	if (!mtd)
+		goto free_cmdset_priv;
 
 	mtd->priv = map;
 	mtd->type = MTD_NORFLASH;
@@ -187,11 +184,8 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	mtd->numeraseregions = cfi->cfiq->NumEraseRegions * cfi->numchips;
 	mtd->eraseregions = kmalloc_objs(struct mtd_erase_region_info,
 					 mtd->numeraseregions);
-	if (!mtd->eraseregions) {
-		kfree(cfi->cmdset_priv);
-		kfree(mtd);
-		return NULL;
-	}
+	if (!mtd->eraseregions)
+		goto free_mtd;
 
 	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
 		unsigned long ernum, ersize;
@@ -213,9 +207,7 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 		/* Argh */
 		printk(KERN_WARNING "Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
 		kfree(mtd->eraseregions);
-		kfree(cfi->cmdset_priv);
-		kfree(mtd);
-		return NULL;
+		goto free_mtd;
 	}
 
 	for (i=0; i<mtd->numeraseregions;i++){
@@ -242,6 +234,12 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	__module_get(THIS_MODULE);
 	mtd->name = map->name;
 	return mtd;
+
+free_mtd:
+	kfree(mtd);
+free_cmdset_priv:
+	kfree(cfi->cmdset_priv);
+	return NULL;
 }
 
 
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
