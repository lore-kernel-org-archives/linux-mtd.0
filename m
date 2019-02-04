Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C150BC282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FD2520815
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CagFiaho";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="PNiS86Rn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FD2520815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gZR6Efpug5ruI5yBIA5LiqtZrdbEnvncdgRq4I4hLw0=; b=CagFiahonoBZJl+fZczGHQtUP3
	FIkOnNA76heasJVtwtJWpVrX/gVutWCRugj0rHcBS6O/QYjoop+ZywSDPRQ9YNWfJegqZ8sZ2IAEo
	+ezngRehbupo+lH04ZUzaRia5LOKtwwG6E1hfgTUgInI25D112WHP07F4zKzZHES8SyOupZcNxMdq
	OqP6c29S74nGQxCgzRCQQ3/EbvTJPsQcF+AuHj6WFM8ky86H764t773av1UzkDPL43Xvz+7ZeYNax
	vbtwVuRoTbczeANpUfTJa7LoKEQpNbrU1D2mGBoStUaffOK6siH3dEAly/RR6QTBUSIl8GIdzXBgx
	1ZA/UF6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiCa-0004Ay-Jl; Mon, 04 Feb 2019 17:38:36 +0000
Received: from nh601-vm10.bullet.mail.ssk.yahoo.co.jp ([182.22.90.19])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAp-0002Rc-0v
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:51 +0000
Received: from [182.22.66.105] by nh601.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:44 -0000
Received: from [182.22.91.204] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:44 -0000
Received: from [127.0.0.1] by omp607.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:44 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 146453.90427.bm@omp607.mail.ssk.yahoo.co.jp
Received: (qmail 78278 invoked by alias); 4 Feb 2019 17:36:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301803; bh=LcHHEG/eNr6F9tW1SFYY2jskH1baflxTtbY7kiyWSqo=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=PNiS86RnWnISpqsXg4WTbCmN9L9QVxiYMKj8GRqlpjJsGPwnxvS8jaQINsxx834Mk9iiovTGGx67agLbwN9BBw20TOo2RmRWnrpkdsuQqxtUSnm2+47jgnQWwNlHDOJGYb9dpSFRUC0LEq/KoycJE8lNqsKb0lLMhmRpxqOygtI=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=OwTm0VyuV4M5AXY77SmscAyKpkmqFwdCgnbl3Fqyrcz0hwJ3BY4zB1JQvr2y0sjGkwxDFLNxT4qIUjsOtHy+wxySjErUhosyh+gX0YLvbBo6Nn8WOGkO3gzGj4WBB6Dg8xQ8iCSQA+wox7wxbDElvg1eMlNDXugh53W9DNag4TE=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:43 -0000
X-YMail-JAS: yrjq4swVM1lv9T9t1g5HNomk3JO7tPtyWi3Rldhn6dDGM.WcKKvbqu5QXXAT_IlkszMOSNy_.57ERJU2iG8Yprks83ltnDVbCvV2v3M9cP1LaiH2pnEWcgI6gFcQawpSyd9gZ41ktQ--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: s9a0Zi0VM1n1Ncm0iCSEVtvTKuef2ULXsWSDaOL0tZkaZtF
 za4Wbe8oNFnMAEA7xOxI17ywKFj4PSC4smOVhtdYuULs2Dg8OYCbUpybDMBA
 Na_t8SrIcx93MsekYe9EuL95BDz49k6Pwzs73xUb1aNlDl94RCHHhdNoS.U0
 PiGMCFmpzCcQSs8aEGiEGJgjLwCGkR3RTdthscaRZZm7PpyDh2PxbGX9_sbe
 2kT5k7iYKMy0LE8FjdS4RqdIeaHjfkTA70UaxHlK3spUV7J8pOuwDhGLH.xD
 Wb__1R_O1dT1RI1wEjUDnOT0cEdc4JsjR_xo2gnROVqYMXbYY9bhH_wTuQGB
 S00u8v90mKPQ9u386OjMrz4_cOZibKzxqC5RbDebnAAAAoKlZ_yr3wrMECV1
 lnOEO.niR5RCaAoXjA19Qb34RmDAu1V4N_0nHWMBxQanGsDaRxB8p3uqu5zk
 k1NstiqwYigtcBCRAm0whv.Q_yECCPQnsqNoY3Dfdk_tz8ETVZDrfD0Bo4AI
 NUsUM6b29EiPRjIVMPzLWHYmN9qRsShKeAjuHvJ6ZTvlfTXROXd8sPbMTsP2
 u.5lE9a62O94iSQdbuxzk3jBG3665JeYn3ouz.S_SBlwze963
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 11/11] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce exit paths
Date: Tue,  5 Feb 2019 02:35:50 +0900
Message-Id: <20190204173550.29703-12-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093647_761824_C2BB253D 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami_to@yahoo.co.jp>,
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
