Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCE8C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5FF2082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:17:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YtrFuuwV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="H+gv57Id"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5FF2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gZR6Efpug5ruI5yBIA5LiqtZrdbEnvncdgRq4I4hLw0=; b=YtrFuuwVLFVN89IcQorsc0kXej
	s7Fag3TpNyPirIWsfGri8vrrOdPrBIZYW/dD1RIE/JC/jgSz+Nqli8wZw25pRxLP2jscSgl/S2n/A
	PUJe70U6L3kzdQfnXTA9F3QFeQKGsmNuM7Ctqv0ZrT1pdMsLaUBY/peTAP/CDsFZhOlAqR+CHQI2S
	aHyoK+XMKugdVEJ37qw0HTvUOL80lY6GI93sqO4MFl8jdyonBmZD96HLQQUOdocB5IgFJNCyR6GSm
	+cg12d2z0JEA2YjjPvXzdV4ha50li7whG6D/58HCZx4AwBNPEywKR1pgRGlGrVN43t3AuUB5FV96f
	fo24+ROA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqioV-0003sa-BD; Mon, 04 Feb 2019 18:17:47 +0000
Received: from nh503-vm2.bullet.mail.kks.yahoo.co.jp ([183.79.56.188])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqimC-0001Wl-FI
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:35 +0000
Received: from [183.79.100.141] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:15:22 -0000
Received: from [183.79.100.133] by t504.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:21 -0000
Received: from [127.0.0.1] by omp502.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:21 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 980883.50557.bm@omp502.mail.kks.yahoo.co.jp
Received: (qmail 97143 invoked by alias); 4 Feb 2019 18:15:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304121; bh=LcHHEG/eNr6F9tW1SFYY2jskH1baflxTtbY7kiyWSqo=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=H+gv57IdidUHaasxQk/EhwguUMyqB+NhOeTCj7ldqM7bf9AeqLASiGR/JehigdLkc9t2gCojdIamlPDxfc403NQaO6BN1LK86l69aKn4HU762fC8bW/Gdk7hwCkKgG7pLy1pylsHcHxDatuSY1put2i8TqcDde5Wbbo34KpteH0=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=N9+fnXptchfNJEkpie1tJMat57bK5whgNwiI6HJ2RA6t6kCaKE+zO1FYJkAxmMzVt/7lGYDN9wu69vOhwWwty1rAS8g1t86XVOCJP3bll3WcsYWe7yBU4Uu/rMTVYt37/8BWcevGvHgFglQ1IJTWTvb6QtAlh8VMJQQbl64wHH8=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:21 -0000
X-YMail-JAS: kJkpLooVM1nhyIVxLqv32eLbKa89e3a_wqG0I.KOLRuQoO6Bs67r.UeY5IBCNJYyu8D0vJZDvPnSME5kfVhwD.XduZWBu9BD1CMPJHWv8cdCHkckOrDzJMaUfEjeSfl_VITNxly5pA--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: O0JLdLIVM1kRdZ0N4Imq9MUr30EL8jFCDaPAeAv3ODRN.W_
 3tOg0.j9pmVKpeFbCkQ2dKRn05kE.5NgOPWAuE1b3OjOyOVca7ZI6Tvn1AAl
 D8Kx6aBqVgoVFTnQCkvwH50559nSCQKf2tc1YHki5b.55gDGD1_IAmvVv0zV
 EfYaL4ltxTSdUighAhrdgjh.ujFC.xlWsR_kPVA2bnh0SivHE6cN12OYE7MO
 HKOLEmbBoDAs_uvzgiaKqa1xlbwI4Ki.7pdzEzl0eOsYaVjZ5mQwvk_Ws2S_
 7znJ5c0D1TGfz_dSYAb._lIZ31z2Tz.y2qoivtL_Zfla9HeCj1ahHl2xeyew
 aW0jIJVZQRS27Fz2DU6bxQDjuUIwmR43CjS.5c6Wisdac_COYm59t1pO3vtr
 f_RQKY1X3s3nzRhuA_uLu_hCIGr26_8VR3sdyTzwBXyZADRIvoutWyl38i8S
 tYusxVgDGne5WvXqP3ZYJ4SEtSxB1rDfGJ36aJtFLZUj14AKrY1_SYOWDl1k
 570ug4agMuRF7NMWw74eMFGtxfozt4wartZ_wub6pXfE0w7UgQxqRSbDEjfq
 yrR7BeFs02PL0uvhIyv6lwBdIzjQgkx9Xc2nnVQeaTKBf0SLI
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 11/11] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce exit paths
Date: Tue,  5 Feb 2019 03:15:05 +0900
Message-Id: <20190204181505.29841-12-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101524_916559_8A460C17 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Tokunori Ikegami <ikegami_to@yahoo.co.jp>, linux-mtd@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The do_write_oneword_done() is called twice at the exit paths.
By splitting the retry functionality it can be reduced to call once.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 39 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index da48b4c..21ba6d6 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1643,25 +1643,16 @@ static void __xipram do_write_oneword_done(struct map_info *map,
 	mutex_unlock(&chip->mutex);
 }
 
-static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
-				     unsigned long adr, map_word datum,
-				     int mode)
+static int __xipram do_write_oneword_retry(struct map_info *map,
+					   struct flchip *chip,
+					   unsigned long adr, map_word datum,
+					   int mode)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	int ret = 0;
 	map_word oldd;
 	int retry_cnt = 0;
 
-	adr += chip->start;
-
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n", __func__, adr,
-		 datum.x[0]);
-
-	ret = do_write_oneword_start(map, chip, adr, mode);
-	if (ret) {
-		return ret;
-	}
-
 	/*
 	 * Check for a NOP for the case when the datum to write is already
 	 * present - it saves time and works around buggy chips that corrupt
@@ -1671,7 +1662,6 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
 		pr_debug("MTD %s(): NOP\n", __func__);
-		do_write_oneword_done(map, chip, adr, mode);
 		return ret;
 	}
 
@@ -1691,6 +1681,27 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	}
 	xip_enable(map, chip, adr);
 
+	return ret;
+}
+
+static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
+				     unsigned long adr, map_word datum,
+				     int mode)
+{
+	int ret = 0;
+
+	adr += chip->start;
+
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n", __func__, adr,
+		 datum.x[0]);
+
+	ret = do_write_oneword_start(map, chip, adr, mode);
+	if (ret) {
+		return ret;
+	}
+
+	ret = do_write_oneword_retry(map, chip, adr, datum, mode);
+
 	do_write_oneword_done(map, chip, adr, mode);
 
 	return ret;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
