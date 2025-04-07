Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A88C3601E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3jbaan3rxTZ6kSr1ixEzsHkKOlWJQw8Ar/tJCgketaI=; b=1QW1R8z5KLUGTS
	UAJgBe+zl3yUjW8V+mPAQnGuZgKZrEreJGWeKC/GUZw4xGfKOqGu4vJVay09aVagFUajOGwxswSAC
	bpsEFiZBc7xtGO+VdggwvY3l1swp6EDmwk0ISMNneJ8MqoPKKY4EsOslP7FG8vlMwAYgbZ40b4qBc
	nYr/olaOb1RAiXE81r8y0cdm4SAdbf34JJ6QbMeRZKGDxnzrJ8WZIJ/1FIliSRf90TnTxejXBccBJ
	wJo6TP9RNa6inmIEjhBBvoNFnybMYRoVdbfR8D1jXnSPXncsi0j5TXsF1dPXIjJd8N4mKDLQQnHhs
	SDEeMWaeUobZuus/oiJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hVb-0000000GvoP-27o5;
	Mon, 07 Apr 2025 08:07:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hOa-0000000GuIt-0OZM
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 07:59:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-227c7e57da2so32843555ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2025 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744012791; x=1744617591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHCGoqHBzpIdEU6c96dPPdkpFb/y3mZAbOJiJJ57gYo=;
        b=necPOiy/m0+u7QedAJUOp4aHl/SkogMfAVgwYlVKHHalSCqZe8Uw0eKJK+UHrBpF0n
         KDaN2GnulvBHRUUd/uNHGCExopxCrgSFYRLiSDuxhaa0Lk/p870ylXg2o8vLAVUFzVD1
         1mS9MFjZNH2miYlpIFiHVdDG32tDifPq3ZHmDzwltQ5aSWuMtvWF/w3zsIhHpkhQXXRM
         wFL/88y2fjz8wIJsiHOpxnAIl+6g982gf6jJ3fmG/jz0kS4Z/2swSdymI11ocDZiizZf
         lVX27/2KccLcsoqmu3syhO+gvnhafERpmmXKR+a9PSIHNp9QQoV85zaQWzGJ5777fKEu
         bdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012791; x=1744617591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHCGoqHBzpIdEU6c96dPPdkpFb/y3mZAbOJiJJ57gYo=;
        b=B8kg1yeJE+oOF1E1Eh7EdxjOw2Ai5Hzg1AZl9MQtzkeraPIL03v+q9UfN0Ch8mJazo
         7jyxQ9wep7Rb71e2GG5tT9SU3+OizgSh3JhwuoA47FxRFcQb/Y7m2p4BZIbv7rRxL0yI
         PAQg8EKD+aCJaa9xlC+QDpC2HF/4jzr/Iwal96dy0fV4c0R4OKjT6DrKtB/HjS+uQeLX
         DmREz32AX2kaz3PqcZ/0qidXRtVozcX+j+b8P7ekzAvTEuBuT+iegXTWUe2JCxKzNRFB
         CvC8EifqBttPJgYppNJtgz1DKkrreLyoLhiTWIEBbSoRMDcFhO2Ab57WSY78T+1mh7JN
         N3/w==
X-Forwarded-Encrypted: i=1; AJvYcCVh61mvoHprBW7/EZ3rbp3UHKcJWQFTYCrCSf3QnRm3pW3JGXumKqPQW4DK6GZd/fzg7doX0/UQDgY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXngSNvdKNkftAM6XP1o2HZuyKeFm7UiWBAbMDRbeJC8h/LPKh
	CME1T0Ywr9Kbe50cPQ152WyztNKcyc9cGN2vvyv//kVswPIIP76x
X-Gm-Gg: ASbGnctTpwSi4kj1Di0PW9lfGR3/31PvPq21SVxf4XiFd+LjIBrM/n/gwjadjOnbbc2
	5PiUEOOmQXDh1glrz12fAq0VVbFlmmTKgff8LuePcicDoCmVFDZU0rq+4ciik9189apcs1DHDQO
	9N4YSbYJmD7DSrsbJGC6pJvysL/LAATS4hilxxd7IqjBnGjoqCTR3VGr7OY83QkMVj891yxtynZ
	0jbm65OZ2mOrGbxQgODWHk5QuHOEV/fEuvwOotAB4uaJ+ECtH7eO8noMnUd4BjS/+2VUtWrSr3x
	MQfdM1R5FjhkJoXtJtkyWoyoTigCj5VBwODaLNNvyFUV/+9vBHRopvSZfMgggxhsniy1
X-Google-Smtp-Source: AGHT+IGzyuInDZv9TFbIGdTJf3z2Mmyb5DI+ZYc2OErxs5yInuxDIM5hgs4/dF9aBoyig1PmN467Iw==
X-Received: by 2002:a17:903:32cb:b0:224:18bb:44c2 with SMTP id d9443c01a7336-22a8a045ff0mr131372215ad.6.1744012791242;
        Mon, 07 Apr 2025 00:59:51 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0153sm74635035ad.65.2025.04.07.00.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:59:50 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 515A880580;
	Mon,  7 Apr 2025 16:08:47 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 3/3] mtd: spi-nor: macronix: Add fixups for MX25L3255E
Date: Mon,  7 Apr 2025 15:54:00 +0800
Message-Id: <20250407075400.1113177-4-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407075400.1113177-1-linchengming884@gmail.com>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_005952_134433_245B6D09 
X-CRM114-Status: GOOD (  13.96  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

SFDP of MX25L3255E is JESD216, which does not include the Quad
Enable bit Requirement in BFPT. As a result, during BFPT parsing,
the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
Therefore, it is necessary to correct this setting by late_init.

In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
address mode. However, since the 3-byte address 1-4-4 page program
is not defined in SFDP, it needs to be configured in late_init.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 07e0bd0b70a0..4bbd3b651cec 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -58,6 +58,31 @@ macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+mx25l3255e_late_init_fixups(struct spi_nor *nor)
+{
+	/*
+	 * SFDP of MX25L3255E is JESD216, which does not include the Quad
+	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing,
+	 * the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
+	 * Therefore, it is necessary to correct this setting by late_init.
+	 */
+	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+
+	/*
+	 * In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
+	 * address mode. However, since the 3-byte address 1-4-4 page program
+	 * is not defined in SFDP, it needs to be configured in late_init.
+	 */
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_4_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],
+				SPINOR_OP_PP_1_4_4, SNOR_PROTO_1_4_4);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
@@ -67,6 +92,10 @@ static const struct spi_nor_fixups macronix_qpp4b_fixups = {
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
 };
 
+static const struct spi_nor_fixups mx25l3255e_fixups = {
+	.late_init = mx25l3255e_late_init_fixups,
+};
+
 static const struct flash_info macronix_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc2, 0x20, 0x10),
@@ -199,6 +228,7 @@ static const struct flash_info macronix_nor_parts[] = {
 	}, {
 		/* MX25L3255E */
 		.id = SNOR_ID(0xc2, 0x9e, 0x16),
+		.fixups = &mx25l3255e_fixups,
 	},
 	/*
 	 * This spares us of adding new flash entries for flashes that can be
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
