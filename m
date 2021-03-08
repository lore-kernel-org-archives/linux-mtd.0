Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C609FC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:00:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 635456512C
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 635456512C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YPaiHhOuct6BU9SOfBzMZ5UT1fgvRDboDz2oinRu28M=; b=SbMlHQcV6b/K++NRx6TyoBehGP
	3WFO/4RhkfR8MrQeCYqbktsgGuDDlUxzexmQHz8smpHeRBvSq9Qxn+ZlUYdI5M/QYFMMBaqNgQnYy
	qG/G5zr2kL6rB6OJButGEVhr9QRPEh8raLu/u1cz+nacX3DHDz7SRhDbPGBw2yEj5uXoJ1lr1veOe
	od6MG9f36V6iiZb1BXJkhX2VmIQZUOeJhdKOkWTI3sYPqCe2JRlt8GFlZYQ3Nz8kCKVz7cdnSSd/O
	IwFGd7E/4nv85k9jJ2kR2CNwybDb5g2O9zbxBTWLEVFpzVI1/t+XuYP5Fsx1gh4xP94rlgjauDiwV
	hbxU8BIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJFUL-00HIFT-II; Mon, 08 Mar 2021 12:59:57 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJFUF-00HIC9-Dk
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 12:59:53 +0000
Received: by mail-ej1-x631.google.com with SMTP id dx17so20211947ejb.2
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 04:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dpr5xVOaFmMjODGnJjMY7OqN1xd+khdM0y5I8FRubPA=;
 b=geH1Ul/cV5hLxqBX0XkXb4dBkPiM/9Mqz9uoI+a7pprcNubJ3bRZ7COrGx2r5bPjlx
 5Pcw3WsreYu2Au5CZmknilargIfoXhwlwaijYCJuk99eW624bDRkgBiCuEGRiwlaOMwS
 /w51l+LTR7KXcz3NkjbaiLOSlibO4gbtlRwF+xpPiYXErlB1P85G/BucxfsLcCtRYjSH
 B8U6kItfNgIab2pgKd1lb8J9LAfSNAiS3csXhSZZA0ujkMOuTtVaRxUUW7tn+R2pvkME
 5De2dMW0P9sekmHG4gXf0qHbXfhWiqlORhvz3WsRN6lGS4sSy9ZJx3O5Rp10P/rV5kQS
 2huA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dpr5xVOaFmMjODGnJjMY7OqN1xd+khdM0y5I8FRubPA=;
 b=JsY7uT1xwotPVzOdoRg7BsYRTpbE1FwbcPdsw+/kK36BNTw38HdCfMDaZ+23hO+Ido
 op5p74+XcJlhxEjhKqF4SqK3WO/8m1p+ANiQJkpTX3DZ2lgI2xY1Ed9j+7ez53mNnPKm
 j6+40yI2BXQpxp+4TAZlXFA2hko4GWs4S89z0nm04jsGwCvdLSNpnyWSYyc2DMw8sVGR
 D4j2Xe4lE9ySphWLcq4oEErmWD0PlsOCnA626VFdAuZzyILI18Z1rIEgfHGztSrof2fz
 Svi6N/QThuhqYKn40oB7q/dggj0FzKHzV6hLKHqAKMnyKboC8UL5KLCywzilR5BHVezx
 jc6A==
X-Gm-Message-State: AOAM530I2/c83PkSbvvhj8iIX8+ioD1XXbs2YwLlasdTt/2fumMfarXk
 3wB+Lq8AXyBKil+yFWCTbyNJ6wpyvOus2g==
X-Google-Smtp-Source: ABdhPJxHMDPwiiksDkrCfK7e9TbCXcVTfLQh1CnYGisXep5HRBKTcRVCAU2g0Mh0JZw7Ul7PWCxfMA==
X-Received: by 2002:a17:906:379b:: with SMTP id
 n27mr7094304ejc.182.1615208389557; 
 Mon, 08 Mar 2021 04:59:49 -0800 (PST)
Received: from seven.fritz.box
 (p200300d37f017f0052c48f3822e3043d.dip0.t-ipconnect.de.
 [2003:d3:7f01:7f00:52c4:8f38:22e3:43d])
 by smtp.gmail.com with ESMTPSA id c20sm6553513eja.22.2021.03.08.04.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 04:59:49 -0800 (PST)
From: Henri Roosen <henriroosen@gmail.com>
X-Google-Original-From: Henri Roosen <henri.roosen@ginzinger.com>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	Henri Roosen <henri.roosen@ginzinger.com>
Subject: [PATCH] mkfs.ubifs: Fix runtime assertions when running without crypto
Date: Mon,  8 Mar 2021 13:59:18 +0100
Message-Id: <20210308125918.18496-1-henri.roosen@ginzinger.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_125951_710591_73E4C712 
X-CRM114-Status: GOOD (  11.77  )
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

Running mkfs.ubifs which was build without crypto triggered the
following assertion:

mkfs.ubifs: ubifs-utils/mkfs.ubifs/fscrypt.h:166:
inherit_fscrypt_context: Assertion `0' failed.

A previous commit-cc4c5e295f54 ("mkfs.ubifs: Enable support for building
without crypto") added a check for an existing fscrypt context before calling
functions inherit_fscrypt_context() and free_fscrypt_context(),
however did not properly do this for each call to these functions.

Fixes: cc4c5e295f54 ("mkfs.ubifs: Enable support for building without crypto")
Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 8211ada..c3a909c 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -2092,7 +2092,8 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 		if (S_ISDIR(dent_st.st_mode)) {
 			err = add_directory(name, inum, &dent_st, 1, new_fctx);
 			if (err) {
-				free_fscrypt_context(new_fctx);
+				if (new_fctx)
+					free_fscrypt_context(new_fctx);
 				goto out_free;
 			}
 			nlink += 1;
@@ -2101,20 +2102,23 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 			err = add_non_dir(name, &inum, 0, &type,
 					  &dent_st, new_fctx);
 			if (err) {
-				free_fscrypt_context(new_fctx);
+				if (new_fctx)
+					free_fscrypt_context(new_fctx);
 				goto out_free;
 			}
 		}
 
 		err = create_inum_attr(inum, name);
 		if (err) {
-			free_fscrypt_context(new_fctx);
+			if (new_fctx)
+				free_fscrypt_context(new_fctx);
 			goto out_free;
 		}
 
 		err = add_dent_node(dir_inum, entry->d_name, inum, type, fctx);
 		if (err) {
-			free_fscrypt_context(new_fctx);
+			if (new_fctx)
+				free_fscrypt_context(new_fctx);
 			goto out_free;
 		}
 		size += ALIGN(UBIFS_DENT_NODE_SZ + strlen(entry->d_name) + 1,
@@ -2158,12 +2162,14 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 		name = make_path(dir_name, nh_elt->name);
 		inum = ++c->highest_inum;
 
-		new_fctx = inherit_fscrypt_context(fctx);
+		if (fctx)
+			new_fctx = inherit_fscrypt_context(fctx);
 
 		if (S_ISDIR(nh_elt->mode)) {
 			err = add_directory(name, inum, &fake_st, 0, new_fctx);
 			if (err) {
-				free_fscrypt_context(new_fctx);
+				if (new_fctx)
+					free_fscrypt_context(new_fctx);
 				goto out_free;
 			}
 			nlink += 1;
@@ -2172,20 +2178,23 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 			err = add_non_dir(name, &inum, 0, &type,
 					  &fake_st, new_fctx);
 			if (err) {
-				free_fscrypt_context(new_fctx);
+				if (new_fctx)
+					free_fscrypt_context(new_fctx);
 				goto out_free;
 			}
 		}
 
 		err = create_inum_attr(inum, name);
 		if (err) {
-			free_fscrypt_context(new_fctx);
+			if (new_fctx)
+				free_fscrypt_context(new_fctx);
 			goto out_free;
 		}
 
 		err = add_dent_node(dir_inum, nh_elt->name, inum, type, fctx);
 		if (err) {
-			free_fscrypt_context(new_fctx);
+			if (new_fctx)
+				free_fscrypt_context(new_fctx);
 			goto out_free;
 		}
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
