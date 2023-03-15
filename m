Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03328C61DA4
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Mar 2023 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uqf+ds+Ej6j5Xaoox2Eepsv+JO93SbRB0ogA1mdeFZ0=; b=g6dy/ccIcRxZTQ
	tKWDL+VPI0DAfLnkFaPNS3nm5c3m6SWvEO42MBOqUGOfyoGJ+uIye6ZJEd5G2RtiSyjN4/Yz2XyC9
	kZD8i3++Q6kRmYclrA9yrcsbEP1dBVu4tu5vQv9s4l0QB6rWFhwpl0FDBd5Dq8vG3ZRi8nJP/bSoF
	zCfvkXYiYyEkrFiCoe/ykUPOFiowS7u0hQxFamneVLC69mXvXVo/1/6dvROWbEY9M/qJbXLAtkzzo
	jgb3QE7QoCx/V9FAOus7ouz80Ip5He9aCxESgTDZ0A7HN/MD1NQm2/ItGNmR7QcadpQmKzE6ZIjY6
	NPxpPfS1EMYXq7zY75+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMa5-00Cn8n-2a;
	Wed, 15 Mar 2023 08:33:57 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMZz-00Cn7k-2a
	for linux-mtd@lists.infradead.org;
	Wed, 15 Mar 2023 08:33:56 +0000
Received: by mail-pj1-x102c.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso2973215pjf.0
        for <linux-mtd@lists.infradead.org>; Wed, 15 Mar 2023 01:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678869229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kqfTjDRNDA7HL2U/+ErFbXMzpUZHQ4Incc6ZrH7tXs=;
        b=d/A2Rf7N8Djb7T7NXckFADmCttxjHtyHwIcB2UC8srjv3ooAKaoITV6TGbvFFAASjk
         pH+j5ciGYyTM39NuNpTVyDF7jPpTyfJFXixqSaw2zHioHZHfEGGOKZqFkFrYStOen9aa
         bi/e57sLtNlZFUn+UiTid8Frm6WqSI2bUJ99ie+38HEPAnLsRf5uryDpDfmrcO4PIs+5
         2y9uuz+n+ise00yVwhc7awpCNocOhO7cKTi+Dmcx0PB48o6WRSfOxzKcYHPbP+vWwtYR
         fheghbK74b7OKOw3vKlcwl4/8oMq4TOQmzCV/EEjU99XkT7B4SgTiJ+2eqb3I2NlH58t
         I6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678869229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kqfTjDRNDA7HL2U/+ErFbXMzpUZHQ4Incc6ZrH7tXs=;
        b=wq+3ThXWCXt+npPhFFgPUhVZuc0NTDL4V/27uzqPg5pcCRo4W/izUzrtFHgr7mUBHo
         Go3+QOl/l0ZGPtJg8ws5yp4ahi7rBzrIO8CxOig8ZZxGh9ioTNghrZaRpPHpnphkG0b1
         ZDC5tvSEOYGximLB63CCH7VmuVQuoLgTuKQ0EZHUfCnUCJ3P/JP9y5ehOtBNHmwbYrpt
         g5IaoOEqPNRksWrreGSbrf/UF3asxozZvNpHnoEteKO6T1hK1GH4v6/iAkw1P6mwk0p2
         IWfJxfKlx23t9l08E82jJpLMiZti+0iW8+G6XIeAeFdQxlhUm7ToOMit3Ho7VgrQMPI3
         casA==
X-Gm-Message-State: AO0yUKXnJAa/obuujs7kwgqrvpkUX7HrM4G9GgRfE/6c0ieMuwMDdoiF
	1epeCWX5dqfMKJm2tBN54zrMv9bDm1ADZw==
X-Google-Smtp-Source: AK7set/pLe2jrWXrhO9fOjpA5HYOlTbjOZEzZX1sVoD/IkkuuKFIa82gjw9X5M6go7EEdTOII/873Q==
X-Received: by 2002:a17:902:cecb:b0:19f:2dff:2199 with SMTP id d11-20020a170902cecb00b0019f2dff2199mr1968091plg.68.1678869228701;
        Wed, 15 Mar 2023 01:33:48 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id km15-20020a17090327cf00b00194c2f78581sm3025584plb.199.2023.03.15.01.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 01:33:48 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH] mtd-utils: flash_erase: Adjust jffs2 cleanmarker size for min_io_size
Date: Wed, 15 Mar 2023 17:33:25 +0900
Message-Id: <20230315083325.8362-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_013355_629936_1CBCD8F3 
X-CRM114-Status: GOOD (  11.75  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

JFFS2 supports buffer mode for ECC'd NOR Flash and the size of cleanmarker
is rounded up to mtd->writesize. The flash_erase utility should do the
same when it writes JFFS2 cleanmarker.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 include/common.h         | 1 +
 misc-utils/flash_erase.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/common.h b/include/common.h
index 31b6cd1..4b9b661 100644
--- a/include/common.h
+++ b/include/common.h
@@ -46,6 +46,7 @@ extern "C" {
 #define MAX(a, b) ((a) > (b) ? (a) : (b))
 #endif
 #define min(a, b) MIN(a, b) /* glue for linux kernel source */
+#define max(a, b) MAX(a, b)
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
 
 #define ALIGN(x,a) __ALIGN_MASK(x,(typeof(x))(a)-1)
diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
index 49a880f..6ff4b93 100644
--- a/misc-utils/flash_erase.c
+++ b/misc-utils/flash_erase.c
@@ -212,7 +212,7 @@ int main(int argc, char *argv[])
 		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
 		cleanmarker.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
 		if (!isNAND) {
-			cleanmarker.totlen = cpu_to_je32(sizeof(cleanmarker));
+			cleanmarker.totlen = cpu_to_je32(max(sizeof(cleanmarker), mtd.min_io_size));
 		} else {
 			cleanmarker.totlen = cpu_to_je32(8);
 			cmlen = min(mtd.oobavail, 8);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
