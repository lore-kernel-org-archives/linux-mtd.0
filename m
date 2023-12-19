Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6537C46CCD
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ry7EzoMPw027SYvrcl2tN9FFDzc/kgqBDNROz/9TGqQ=; b=ApSnPCUz1muQ0h
	R95nRY4UgWJ8qnDNm7lUmgL4p4YYVRIQZQoWxxeFXm6WUTiDec6RZ7fxRIIsVRCP+CMCtzYg2Dt0+
	b9h6Z6deXUcPn+NBueSN659g7cvObrnCnpBGApeEdgMw/HZWQVPr4U1qI1a0bGs95MuLsUAYwFAJJ
	wuwsnc7e+VwNQr+gCCt/I3udJxsxo3vGHRv2hVkrgr7sImDPirBcuINjyvyrwuSKa75WuK9E42076
	r+4+1Ltr4OFrwbboL+6Xek+v7xwuvo+STvvYA1r0xnf1gtnTgA6+o7UQ/cEE7OucAmGEtdNqN8Uo8
	471FAhkdipyZezjqXBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFXE7-00DYZf-0T;
	Tue, 19 Dec 2023 10:21:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFXE3-00DYYb-2S
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 10:21:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d3c394c1f4so9771525ad.2
        for <linux-mtd@lists.infradead.org>; Tue, 19 Dec 2023 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702981282; x=1703586082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X1RCtKioa/i2IDiGwXD/NOei3wncxs0pxsUcNFn+qwg=;
        b=JruVxCRwMl1rjx2iLulXQ9BQOTjKnm/+AvxUuEEmtl5aQNcq+y0jUY0HsnuK7XFa3v
         58ha1Nl66OQZWVkcmZKm/Bz6hEMJXSnhkRZ8DqiMO63sZ0nTZ1v0H/tLrrFVI58TQQvm
         8YHK7EIOn4DS+uBTuY0ZXCxwCe1VOrbEP95Gmvml/m+GT3PYH+xB3XL9xgVgg0dby2p5
         zG87Th63dafHOegNi+1rt4LxJEyrnLhvsc5QsOWIMGJ8eIvsoL1emVkEf/S52GQ5GIAP
         4TunbNvVNkYIXIwMBl+e95DlyLyMdLqIuXB4Dv41JO+637UDMrVHjXIhFrQqV9ImbmY5
         lMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702981282; x=1703586082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1RCtKioa/i2IDiGwXD/NOei3wncxs0pxsUcNFn+qwg=;
        b=FuqCGjr1n5t36153EffDJKwWw+JvAoXXTt+CUZUzqzZyv+wVTfB7RmJNZZdPONGN+/
         fhIqnD9aT/qyvenVTBKa/1WfXad7WLqqI9ldkGAwRfuWEh51hCEQnQkz0DRKkpDoMR3q
         QQ4oj2FTtws60NLSuF12jMTKSFm7HqKGCb+Q7Go4WIPjuUaf7g2BJG2OM3PYmOP4acRB
         YMnarrOrwC1TAJw/OOHDKl14F67p3WpHbHkTUakvz1Jq/kz2YtJRMjTe99l8IbkUMrqd
         YEhGW1F5am9wWq5pGLCssRwbfXxO/VpeBkk50f4VT98+Bf2KcCHP+P1VEp3KfbOm/LHf
         /J+A==
X-Gm-Message-State: AOJu0YxdJavs6j/9KQSilF8wMnl0qPMWW40ALcBJkZe2w4MhLCK2nhcD
	pZwa/bY1swfh1dj0LxAkpbU=
X-Google-Smtp-Source: AGHT+IEO1GEsXB2B+Mb1ZQcNyvKR7rVdWCo8ot34C4qxbgpCKKVfPd27UwAl4UP/72htn+8M/Zx80g==
X-Received: by 2002:a17:902:d58e:b0:1d0:c20b:9e9 with SMTP id k14-20020a170902d58e00b001d0c20b09e9mr11337505plh.64.1702981281856;
        Tue, 19 Dec 2023 02:21:21 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id b10-20020a170902a9ca00b001bde65894c8sm20523915plr.268.2023.12.19.02.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 02:21:21 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id A55CB80422;
	Tue, 19 Dec 2023 18:25:32 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v2] mtd: spi-nor: core: Discard HW capabilities if no enable function
Date: Tue, 19 Dec 2023 18:21:02 +0800
Message-Id: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_022123_796127_D58BFA4E 
X-CRM114-Status: GOOD (  11.81  )
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
changes in v2
 - Add SNOR_HWCAPS_8_8_8_DTR
 - Restore the enable function judgement in spi_nor_set_octal_dtr()
 - Restore the enable function judgement in spi_nor_quad_enable()
---
 drivers/mtd/spi-nor/core.c  | 7 +++++++
 include/linux/mtd/spi-nor.h | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..14359101c6cf 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2621,6 +2621,13 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 	 */
 	shared_mask = hwcaps->mask & params->hwcaps.mask;
 
+	/* Mask out Octal DTR if no enable function */
+	if (!params->set_octal_dtr)
+		shared_mask &= ~SNOR_HWCAPS_8_8_8_DTR;
+
+	if (!params->quad_enable)
+		shared_mask &= ~SNOR_HWCAPS_4_4_4;
+
 	if (nor->spimem) {
 		/*
 		 * When called from spi_nor_probe(), all caps are set and we
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d..78a119192ee0 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -266,6 +266,12 @@ struct spi_nor_hwcaps {
 #define SNOR_HWCAPS_PP_8_8_8		BIT(22)
 #define SNOR_HWCAPS_PP_8_8_8_DTR	BIT(23)
 
+#define SNOR_HWCAPS_4_4_4	(SNOR_HWCAPS_READ_4_4_4 |	\
+				 SNOR_HWCAPS_PP_4_4_4)
+
+#define SNOR_HWCAPS_8_8_8_DTR	(SNOR_HWCAPS_READ_8_8_8_DTR |	\
+				 SNOR_HWCAPS_PP_8_8_8_DTR)
+
 #define SNOR_HWCAPS_X_X_X	(SNOR_HWCAPS_READ_2_2_2 |	\
 				 SNOR_HWCAPS_READ_4_4_4 |	\
 				 SNOR_HWCAPS_READ_8_8_8 |	\
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
