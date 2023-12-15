Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38890C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 07:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qFl6spABtXXbf8VHp6JWXJ1XpdOBkk3dUJbBnhja1bs=; b=2XHfkFVVmvyezL
	4bGMpsEs77Vlq7jBIOpFOKvvEQ6YvZWncjdMCiXJoYVcLNwShTbekH/G1QI9NHdvhM7su3uOuQNnE
	s7jwx5dM0gBkJAVFciqU7nkcU5prxl2RTkVfEwPcWOYVBYL/SITYItVQ4CNyi6/wrUQ8rjloeDwGE
	OfVg0jVr8hEHx242sGUiVLd9kE0rO30XQyh3MP6YGf7b4ku7RWjXr/05pESqlDiINkNMaw3NSOz8i
	SBrFfDd0bPFcgaFtfJ6J7xDQxvuweMBHq+w+G14B6PO6FOcU3gvBw/leV/STHDwpTWKCx1XBtKrXn
	5PWtyW/k4QMASy6z84qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2iR-002IyW-23;
	Fri, 15 Dec 2023 07:34:35 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2iO-002Ixs-2P
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 07:34:34 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6cea0fd9b53so134263b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 23:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702625668; x=1703230468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smdAdZr38S0DqabWk1iwFI96Qct6llNA2ZnhfdlTEqo=;
        b=dRdS/upxWh9rUE5HV+VmbEqs1uNNCl9ORc4n3vdpPazXrsMUULf2IySEVNpCPYmk4N
         FfOBbwFqZ8fmDwgzuOH1UxSSmnsjxDfXbRoiwjhPzO1bPGpsYp+V5ll/W3llwI06D+v9
         apDhH/bSi4pyFoqSISs7+mF0qs8MXVTzpNWd+hXFqWksGJPA1f40jx04Bjgc4D2bcv4b
         6dEts+eOR5Qv+1/VlQTMr3JidJ1tPXSvUUpaNKlaUZwiWI2U5xQU12xZaYqocpfaINGo
         TuvPnO9ITVPdlWJ65RTcRY/0+DIwnxIS3b4zexCKvLOi0cNdModNJHdk51LoSy9h31c8
         h9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702625668; x=1703230468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smdAdZr38S0DqabWk1iwFI96Qct6llNA2ZnhfdlTEqo=;
        b=iD1nZ1pXTOAezPg7TdHfSfKpuXRs79DnVAHqvXFdNwMP+T4B7IfrUcxhS2svx36uf2
         hAIjH5dlrPGcu+U8jJ16+qAL4Vn2S+6NeVxvEwKADItYnmKkgA8Obj4lPSQClNgg1wuG
         CKDzzesFfdn1FMDN7xIqnekZTm1rkNPGNXNqo5SkWEEo2iN+GUJ3IREbRftzR9xmsv0F
         5lC+8VS0sV7CK3lgob8NMlMCYJvzDnZncDKOlUqoWyk06Tc48y3sQfxixTVLaocL1CVO
         kDJz4lF6ul1SVS4yDwbMF2InNdh48ae4+BVzyKgMEv5hTc9F6km5/MSHs4CesziB6t+e
         4aOA==
X-Gm-Message-State: AOJu0Yy4O/rRCgaSStM+oIJkWgH1444RkcbjCaxNe/B0B81szxdMwawt
	jGKQBiOAyspjkZjFPlPEmqTiV/6eUdo=
X-Google-Smtp-Source: AGHT+IGlJDPy69/pMb4TLx2PBXYLiMSc0yaLeFuI6iQP8OYEXBFSrKSsaLztLdrhCBjfHhs4pbufDA==
X-Received: by 2002:a05:6a00:234c:b0:6ce:38d4:273e with SMTP id j12-20020a056a00234c00b006ce38d4273emr6871811pfj.58.1702625668300;
        Thu, 14 Dec 2023 23:34:28 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 3-20020a630c43000000b005bdbe9a597fsm12540579pgm.57.2023.12.14.23.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:34:27 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id E1AF98070E;
	Fri, 15 Dec 2023 15:38:45 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH] mtd: spi-nor: core: Discard HW capabilities if no enable function
Date: Fri, 15 Dec 2023 15:34:13 +0800
Message-Id: <20231215073413.71443-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_233432_782676_34D07934 
X-CRM114-Status: GOOD (  12.32  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Discard corresponding HW capabilities to prevent carrying the
wrong protocol if no QUAD/Octal DTR enable function hooked.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c  | 13 +++++++------
 include/linux/mtd/spi-nor.h |  3 +++
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..a3988e8768b3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2621,6 +2621,13 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 	 */
 	shared_mask = hwcaps->mask & params->hwcaps.mask;
 
+	/* Mask out Octal DTR if no enable function */
+	if (!params->set_octal_dtr)
+		shared_mask &= ~SNOR_HWCAPS_X_X_X_DTR;
+
+	if (!params->quad_enable)
+		shared_mask &= ~SNOR_HWCAPS_4_4_4;
+
 	if (nor->spimem) {
 		/*
 		 * When called from spi_nor_probe(), all caps are set and we
@@ -3093,9 +3100,6 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
-	if (!nor->params->set_octal_dtr)
-		return 0;
-
 	if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
 	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
 		return 0;
@@ -3123,9 +3127,6 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
  */
 static int spi_nor_quad_enable(struct spi_nor *nor)
 {
-	if (!nor->params->quad_enable)
-		return 0;
-
 	if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
 	      spi_nor_get_protocol_width(nor->write_proto) == 4))
 		return 0;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d..c421018dadf7 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -266,6 +266,9 @@ struct spi_nor_hwcaps {
 #define SNOR_HWCAPS_PP_8_8_8		BIT(22)
 #define SNOR_HWCAPS_PP_8_8_8_DTR	BIT(23)
 
+#define SNOR_HWCAPS_4_4_4	(SNOR_HWCAPS_READ_4_4_4 |	\
+				 SNOR_HWCAPS_PP_4_4_4)
+
 #define SNOR_HWCAPS_X_X_X	(SNOR_HWCAPS_READ_2_2_2 |	\
 				 SNOR_HWCAPS_READ_4_4_4 |	\
 				 SNOR_HWCAPS_READ_8_8_8 |	\
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
