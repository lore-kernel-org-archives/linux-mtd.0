Return-Path: <SRS0=mpCX=X4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD489C10F14
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 20:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A674E20862
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 20:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lIaXxxch";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Lqlz1/Lk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A674E20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y2zEIBJjqbhXQdPm/TyA7zBulWjC1RhZqYLH2vRpPXQ=; b=lIaXxxchz0zBWE
	AEQnqraUsiGF8AZhsHI+2Pdd9D5gOcyUCRiVnoKbPzCjLZ79W7NJYTW5Muw6oaNYDXy4AKORTzoNO
	g1G1tjKHBhcU5mo7GKbsIBx3PHFb+irCs7BasuL8a+P2i1MVzCnNyTrrqH6bP/AHRaJ2HyHLbuIxs
	AsxAMaO7iy5QoMY/bZ9bJFd9w9KOZk6GPtRTjwTORPVFAV7y8oFocyfG+hkFyUV8ZjD0g0RNEF5ZM
	xs8WtVbsHl4bh4BSoCKwZ+JNsgDSnBq6QjjbQs1JrI7gCrSQkiv8CUGaaL+VQtv5jfxqKmVTNbEUz
	ntCIWJmqgc5HeFVIVSMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG7hU-0004m4-MQ; Thu, 03 Oct 2019 20:27:48 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG7hQ-0004lK-HO
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2019 20:27:46 +0000
Received: by mail-lj1-x244.google.com with SMTP id m7so4214276lji.2
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2019 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=W1t98RHptsZdiAhffGLoDDQY98Ovege7aq2lyuS7lwE=;
 b=Lqlz1/Lk8ePcy0wOofg830FHh/kIySV1o+lt/AvOEC1HpyUiyxS81wRTuE9IDyQp9x
 8uOdmghKm7DiFw5Su+KheYMfNiXXjV/7jVuV5UPLHvUzQTTEv7FT3t+LFaTOF7D5w61r
 jPoD63rcAviUTl4fTTYalP0Lbhake/zhBwmk+fvvLvkvYlgqPZuq/4SdL4Zpd2VQKdj2
 IgAFhaKGqhlKG5FNGSfcTH1F/AWe3E0Mnf2ueoo/m/AskUP85Girtj88OeDkwirO9f+1
 UcEPpkc+XCu59Nv+uWVNIpC0tZD7BuFhdxQo1QXnDHepeq9GIay0dBlzxfLSXDA1EsGq
 ZD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=W1t98RHptsZdiAhffGLoDDQY98Ovege7aq2lyuS7lwE=;
 b=slPhqAsqleNY8FRD1uzF2iprBICcxL2Ai+Re2BnLrbYAJMcYykvAcUalBgwGUruz1I
 FS6VjBwLR9rPDEEfRnAK8TvnBzdws6ckaarh+c+Y4xR2mjl/rktIcRBfVsY+F0l527xC
 gvV7wSgsfKpanO/o/8yFbiEOJWPik33lkHowJCjhVDFG6/ny7qG0FoQSkH2hNgjH3SmR
 iVY5sAdonSdx22qPu4kB56uGIf+sQvToNoXNbMxxWjGYRuUfKLng1QMMkBPBSXKBnhNh
 tLRjNi5ui9a9UqQNLSveqMKcuz3N7EyAseq+N0v00SeaLc2ITVMHp1/Zs1/co505vYDz
 ebMg==
X-Gm-Message-State: APjAAAWmzybd14/gsj4qIyJODsPK1z3Xd4WzYMVCnRKo3kSv6Z6H3zuh
 k1/aUEJ6jUsZK/o4ykHifaeBS2EaBOo=
X-Google-Smtp-Source: APXvYqzbe3NYthiWiBCZWipM0mK6Lh2z7b3Gv1PiHE3q8i1w+yK4KSuS/HvkixTmwY33jLLS02bs9w==
X-Received: by 2002:a05:651c:150:: with SMTP id
 c16mr7293167ljd.224.1570134461334; 
 Thu, 03 Oct 2019 13:27:41 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4289:fe73:b1e7:ad72:df1a:c82e])
 by smtp.gmail.com with ESMTPSA id y22sm661997lfb.75.2019.10.03.13.27.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 13:27:40 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mtd: cfi_cmdset_*: kill useless 'ret' variable initializers
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Organization: Cogent Embedded
Message-ID: <ef6b53b4-c85a-3447-4e3c-7467aaeb74cc@cogentembedded.com>
Date: Thu, 3 Oct 2019 23:27:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_132744_992800_0110CF10 
X-CRM114-Status: GOOD (  17.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The 'ret' local variables are typically initialized to 0 but this value is
often unused, thus we can kill those initializers.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is atop of the 'mtd/next' branch of the MTD 'linux.git' repo.

 drivers/mtd/chips/cfi_cmdset_0001.c |   10 +++++-----
 drivers/mtd/chips/cfi_cmdset_0002.c |   18 +++++++++---------
 drivers/mtd/chips/cfi_cmdset_0020.c |    8 ++++----
 3 files changed, 18 insertions(+), 18 deletions(-)

Index: linux/drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
--- linux.orig/drivers/mtd/chips/cfi_cmdset_0001.c
+++ linux/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1353,7 +1353,7 @@ static int do_point_onechip (struct map_
 {
 	unsigned long cmd_addr;
 	struct cfi_private *cfi = map->fldrv_priv;
-	int ret = 0;
+	int ret;
 
 	adr += chip->start;
 
@@ -1383,7 +1383,7 @@ static int cfi_intelext_point(struct mtd
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long ofs, last_end = 0;
 	int chipnum;
-	int ret = 0;
+	int ret;
 
 	if (!map->virt)
 		return -EINVAL;
@@ -1550,7 +1550,7 @@ static int __xipram do_write_oneword(str
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	map_word status, write_cmd;
-	int ret=0;
+	int ret;
 
 	adr += chip->start;
 
@@ -1624,7 +1624,7 @@ static int cfi_intelext_write_words (str
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	int ret = 0;
+	int ret;
 	int chipnum;
 	unsigned long ofs;
 
@@ -1871,7 +1871,7 @@ static int cfi_intelext_writev (struct m
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	int wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
-	int ret = 0;
+	int ret;
 	int chipnum;
 	unsigned long ofs, vec_seek, i;
 	size_t len = 0;
Index: linux/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux.orig/drivers/mtd/chips/cfi_cmdset_0002.c
+++ linux/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1713,7 +1713,7 @@ static int __xipram do_write_oneword_sta
 					   struct flchip *chip,
 					   unsigned long adr, int mode)
 {
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&chip->mutex);
 
@@ -1791,7 +1791,7 @@ static int __xipram do_write_oneword(str
 				     unsigned long adr, map_word datum,
 				     int mode)
 {
-	int ret = 0;
+	int ret;
 
 	adr += chip->start;
 
@@ -1815,7 +1815,7 @@ static int cfi_amdstd_write_words(struct
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	int ret = 0;
+	int ret;
 	int chipnum;
 	unsigned long ofs, chipstart;
 	DECLARE_WAITQUEUE(wait, current);
@@ -2014,7 +2014,7 @@ static int __xipram do_write_buffer(stru
 				    int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	int ret = -EIO;
+	int ret;
 	unsigned long cmd_adr;
 	int z, words;
 	map_word datum;
@@ -2095,7 +2095,7 @@ static int cfi_amdstd_write_buffers(stru
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	int wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
-	int ret = 0;
+	int ret;
 	int chipnum;
 	unsigned long ofs;
 
@@ -2232,7 +2232,7 @@ static int do_panic_write_oneword(struct
 	struct cfi_private *cfi = map->fldrv_priv;
 	int retry_cnt = 0;
 	map_word oldd;
-	int ret = 0;
+	int ret;
 	int i;
 
 	adr += chip->start;
@@ -2307,7 +2307,7 @@ static int cfi_amdstd_panic_write(struct
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long ofs, chipstart;
-	int ret = 0;
+	int ret;
 	int chipnum;
 
 	chipnum = to >> cfi->chipshift;
@@ -2411,7 +2411,7 @@ static int __xipram do_erase_chip(struct
 	unsigned long timeo = jiffies + HZ;
 	unsigned long int adr;
 	DECLARE_WAITQUEUE(wait, current);
-	int ret = 0;
+	int ret;
 	int retry_cnt = 0;
 
 	adr = cfi->addr_unlock1;
@@ -2508,7 +2508,7 @@ static int __xipram do_erase_oneblock(st
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
 	DECLARE_WAITQUEUE(wait, current);
-	int ret = 0;
+	int ret;
 	int retry_cnt = 0;
 
 	adr += chip->start;
Index: linux/drivers/mtd/chips/cfi_cmdset_0020.c
===================================================================
--- linux.orig/drivers/mtd/chips/cfi_cmdset_0020.c
+++ linux/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -611,7 +611,7 @@ static int cfi_staa_write_buffers (struc
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	int wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
-	int ret = 0;
+	int ret;
 	int chipnum;
 	unsigned long ofs;
 
@@ -895,7 +895,7 @@ static int cfi_staa_erase_varsize(struct
 {	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long adr, len;
-	int chipnum, ret = 0;
+	int chipnum, ret;
 	int i, first;
 	struct mtd_erase_region_info *regions = mtd->eraseregions;
 
@@ -1132,7 +1132,7 @@ static int cfi_staa_lock(struct mtd_info
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long adr;
-	int chipnum, ret = 0;
+	int chipnum, ret;
 #ifdef DEBUG_LOCK_BITS
 	int ofs_factor = cfi->interleave * cfi->device_type;
 #endif
@@ -1279,7 +1279,7 @@ static int cfi_staa_unlock(struct mtd_in
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long adr;
-	int chipnum, ret = 0;
+	int chipnum, ret;
 #ifdef DEBUG_LOCK_BITS
 	int ofs_factor = cfi->interleave * cfi->device_type;
 #endif

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
