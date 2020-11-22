Return-Path: <SRS0=A4L3=E4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2426C388F9
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 00:16:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2774D2075E
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 00:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ulz4dO9I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="fXRXiPQt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2774D2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RA3abTWjyEJEp30PPJrk4Gers/wkPAnIBfIW88M/Lx4=; b=ulz4dO9I68gaS0H2sXLzasE0KY
	vXGjoAXiO2su5dy+gyjHKVko9Vzs5b6wAxMcMiCmQmSFwx8NCM4v/J44svmAy03YSBabhO0/0JMpv
	D25RGzUk/0OAROiY0pa5SBeQ3DGXzH0AtO8SB8Q1HfQ7FwO7ipGp0P4sdWRY57hppA9cuKueO2zXY
	9t1/TRFjUEtLIqUgZ+7tTT0r+PBmPc8Vtk8dwvW4df5khH/Dg9eWM0PSe+wsRvXPVelZN7rj8Wtjm
	qKTqhfCQyvJp/ViXpURiKBHfSWTYu+oKZmGaKI6X/JzD0i+bRALZoj3Br0QlWjFxLq5BwFKQo7Bv7
	u6m8SEhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgd2f-00024b-Lg; Sun, 22 Nov 2020 00:15:45 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgd2e-000249-7j
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2020 00:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1606004142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=q1jTAvJLwm5J0ETpw+kxt2VclqNRxlp+bUv5ZKH/Kfs=;
 b=fXRXiPQt1cJvTEkazWBtbazHYLpsE1HOP5vFv/hSir1cZd43Goacps8RqeXIv34uwnOXtH
 hrXnMam2PGoRBF4CagwVXopKMgru0FlrGesBK1x04Q7Lwz1jEMWEjgMzDkqIJjDJsDNjx7
 PZKeXE+ttdro7c1GnMWyK4sdfLUCwvI=
From: Sven Eckelmann <sven@narfation.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: parser: cmdline: Fix parsing of part-names with colons
Date: Sun, 22 Nov 2020 01:15:33 +0100
Message-Id: <20201122001533.985641-1-sven@narfation.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_191544_408708_8F30AAB5 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: vigneshr@ti.com, richard@nod.at, rminnich@google.com,
 boris.brezillon@collabora.com, miquel.raynal@bootlin.com,
 Sven Eckelmann <sven@narfation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some devices (especially QCA ones) are already using hardcoded partition
names with colons in it. The OpenMesh A62 for example provides following
mtd relevant information via cmdline:

  root=31:11 mtdparts=spi0.0:256k(0:SBL1),128k(0:MIBIB),384k(0:QSEE),64k(0:CDT),64k(0:DDRPARAMS),64k(0:APPSBLENV),512k(0:APPSBL),64k(0:ART),64k(custom),64k(0:KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive) rootfsname=rootfs rootwait

The change to split only on the last colon between mtd-id and partitions
will cause newpart to see following string for the first partition:

  KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive)

Such a partition list cannot be parsed and thus the device fails to boot.

Avoid this behavior by making sure that the start of the first part-name
("(") will also be the last byte the mtd-id split algorithm is using for
its colon search.

Fixes: eb13fa022741 ("mtd: parser: cmdline: Support MTD names containing one or more colons")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/mtd/parsers/cmdlinepart.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/cmdlinepart.c b/drivers/mtd/parsers/cmdlinepart.c
index a79e4d866b08..655c6d59bd05 100644
--- a/drivers/mtd/parsers/cmdlinepart.c
+++ b/drivers/mtd/parsers/cmdlinepart.c
@@ -226,7 +226,7 @@ static int mtdpart_setup_real(char *s)
 		struct cmdline_mtd_partition *this_mtd;
 		struct mtd_partition *parts;
 		int mtd_id_len, num_parts;
-		char *p, *mtd_id, *semicol;
+		char *p, *mtd_id, *semicol, *open_parenth;
 
 		/*
 		 * Replace the first ';' by a NULL char so strrchr can work
@@ -236,6 +236,13 @@ static int mtdpart_setup_real(char *s)
 		if (semicol)
 			*semicol = '\0';
 
+		/* make sure that part-names with ":" will not be handled as
+		 * part of the mtd-id with an ":"
+		 */
+		open_parenth = strchr(s, '(');
+		if (open_parenth)
+			*open_parenth = '\0';
+
 		mtd_id = s;
 
 		/*
@@ -245,6 +252,10 @@ static int mtdpart_setup_real(char *s)
 		 */
 		p = strrchr(s, ':');
 
+		/* Restore the '(' now. */
+		if (open_parenth)
+			*open_parenth = '(';
+
 		/* Restore the ';' now. */
 		if (semicol)
 			*semicol = ';';
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
