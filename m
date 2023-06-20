Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7842EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jun 2023 02:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PZWuzDJTVWOCThhHUVTLhGsZSwTMg7HjvHvuuzirVWE=; b=lpSWBv1cIxp/Zt
	TzSMLo+isTCMVTwSb2FUsuqXAl/bpm2P/rVFw3oxHt9Cn5bsdvoTVA/oA00ucM5jjUYl+tsiZ56ms
	zafeRQNhjozCQJHuyqHLmMHpfOVhxm6q+NcaeHuu1tyrpHTlI5s3Rs5UdGBnbl4Pp0ggEzeEu63lS
	4vD1Ii2SDGg0xQ2dit5LJT06uLOP2o+YjVeh1cxTXq8kKXlBVgWHRi+dMRyc1VbYzo2NNtXEQDQ2h
	wClCDJhXM7heu3iFoLj0COGwoPP4sW4iG2wEWEFLpjQbIT7WTjgu70vq7uthOWXEnSgjcabwOC2YR
	4aUmK31ZppIdUD4mMKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBRVX-009zcM-2B;
	Tue, 20 Jun 2023 02:54:15 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBRVU-009zbZ-1f
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jun 2023 02:54:14 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-982a0232bdcso662823766b.1
        for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2023 19:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687229645; x=1689821645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmF587LOwFqMXh1lttGiFMK5M+juNY2ypIJHnrwjuQg=;
        b=L8RvGQJgSPQh2MjvS0dG00u6E7DNYSk1ytZtOlbI/7/in5hkIDYsTaFZN3EywkU2DZ
         /AdtRXFQLFKwt9D1bwPgFsF/49f40T5HKNp/4WzP1cQID1/TMZ/HYU5Z55v2AK7KFLYa
         cbs3KQOoBM3FTX86b8Ambg9msfsz/U7C9jbjoXGWllANzLGtP0CzNxn/oVp6NuaNWGLl
         S4IY69cWYgfE5213BLznUfbr0VkPq2Bj+hSn9uPcfV+cqNdRjCA0UjD9yplyUyduIAcO
         Jj3ABkQHlRVurmLPKF/WtyECmQItK2JuW3SR2QNXoWefvm+Jjd+zkIKelJA14Iewq05U
         YkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687229645; x=1689821645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmF587LOwFqMXh1lttGiFMK5M+juNY2ypIJHnrwjuQg=;
        b=fodU45ipkqC3+n1Z1iZQYbBmHR61W8owfCfM3KziJgBmBW/M8CLi2XtP16mb9fnWy1
         pzgra+ci9xSXgpJMkpFZIYiijPCEXHVcwVb8F1xJo+vsBSrVXnzx7zQij3eNDte3N8if
         3B/XHGnOy8+ylV72F8QsK/tETVcoRSBLS3Tl2G4NmWFRv0FRPULJ2PgQSLwq4NWpdX2h
         v9aliE84y44li0t6vCnXc61+d61u2ZLL0mleI6jNtb040511hH24Hvuhyk2FZUre3XyT
         HYAcYqadrNHlSJ5gsCrTG3VnZdm2LwMkL7xFBOjJBvGKYRw6ktO+g8pT1tiCWnWfbsuj
         hEZg==
X-Gm-Message-State: AC+VfDwplAbYKUjRicBQkQUmE/u7QhMHN4Bd5tztZYzOYms3nVBM30UY
	cErf8ELjQUClnUsZ27fc+CrRqA==
X-Google-Smtp-Source: ACHHUZ6BIsToMSEqQ4dvOIf5zfmA+a04C7SrYjaNKqsZSNn6DvWooCO20zo0SSyH6w8yoZQHWjzL1Q==
X-Received: by 2002:a17:907:5c8:b0:974:7713:293f with SMTP id wg8-20020a17090705c800b009747713293fmr10567932ejb.41.1687229645192;
        Mon, 19 Jun 2023 19:54:05 -0700 (PDT)
Received: from 1.. ([79.115.63.157])
        by smtp.gmail.com with ESMTPSA id p1-20020a170906a00100b0098242730348sm510819ejy.72.2023.06.19.19.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 19:54:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: vigneshr@ti.com,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.or,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] MAINTAINERS: Add myself as reviewer for HYPERBUS
Date: Tue, 20 Jun 2023 05:53:59 +0300
Message-Id: <20230620025359.33839-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=651; i=tudor.ambarus@linaro.org; h=from:subject; bh=MfsSdsyFNrv3ZaOzvhtgVW4EG/XKQ2SLcdx7pYEd4qA=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkkRTHezN/mpjZfsJDGHhqMAJ+hll0AcJsYHmKS FEBmbtgPBCJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZJEUxwAKCRBLVU9HpY0U 6aGuB/sECyIVCRA1K67BtTQSKbjyPuGwvkkqXmpXMiI9MIx+uVYbOaiRt6q4H2Md+WSvUDDDGIu gI/b20a0+CO7gEql8Gxr/x1YC8tf84SuQLw/lCzr+qgmDpzjxvEAsTwU1uDGRRxA1AKD/LOYWuG 00GLHXapaIX6+WY7QPpvJv9y9lboz2akjFwJh0hPtHER4BLq7QAdJHszcM+MRZY5Zt3RLlD22WN h7NAS2QlI8l7poX1r35P4MdMCdq0upwY9fX/AmGrdziQ/3J3aHUJNlc4vl2TWm+li4lx5DqYMuE ZSyumTNhgrubbfWSkQfGsovjk9YCHplfqb7dSV/xBQ/rj+dT
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_195412_574332_513DC20F 
X-CRM114-Status: UNSURE (   8.12  )
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

Add myself as Designated Reviewer for Hyperbus support.
I'm assessing the framework and I'd like to get involved
in reviewing further patches.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6992b7cc7095..df5c039fc577 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9623,6 +9623,7 @@ F:	tools/hv/
 
 HYPERBUS SUPPORT
 M:	Vignesh Raghavendra <vigneshr@ti.com>
+R:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-mtd@lists.infradead.org
 S:	Supported
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
