Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A634AC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDa60iWEbvu0ROUhpCbRk6JeH9dZKaU39z3UBSAY/yg=; b=uKFEkZe9t/SJ/m
	gBVUUoJO3+Bs+PACKt+Ws0tQ5WFPNs0lEQinIJAXKI/3BqvGQboiP9/AP4y7Nk8/1HC+C6BzlcXrz
	IkkE5+E3uwRNF/mSelF52RgObsgUtqe+moeW9Khdewijs2VByDGSduaHFPxIUZ8qsMS+Qd7pC3vTu
	M1C6t1UUoEZUI4hD7DD89JqXsjxtW5vHKB+9swCruEWdA6UOiqJjKQfpwF2GD1u5PDYeUqpJcC6xb
	PEkex4YxbY51lAusR+L8PUYh3HKdOJoJXcTlV9Tbkidlf0Drn9oIbFw9TIZqmq4n7r4sy6ZtqSLDA
	guLnpBxFn3+KOU2EoDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgk-007gpf-2W;
	Wed, 01 Nov 2023 14:59:22 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgZ-007gfl-0E
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 14:59:19 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9becde9ea7bso200444466b.0
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698850747; x=1699455547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cc2RTGlWARp3griB6t8kpC6hCXGRaWKDTaju6cr+XBI=;
        b=ZUWlLANPRu9zAYpnvoFeoyj3cChkdNP05gJAhaU1qoFh7mLln+Tt9wjdMS6ikvrm4J
         z0Onlny5L7AB4A4PLLjHeI+S0TA9Mdx1I0UAmFjAxOkqbXCJtUWZ08ZM/q43SBM6QwSc
         VWucvZVCLzQIDJAlmU9gS823Mhgz09Eb7MV22WbR/TfNPB8Yxp7VH5hvD/jg1vdZY+vI
         qPIj/C2LHXDKcTTqtdULqzViSnRmNVhxEHOLMleukZ0NF2DBbn1MbjOOq/iPuUwLsHiE
         rijVCGRvRKjTBacwAJyzo92+RabLwKLse0Wowo6KCDF+Jh7V5fYr1ePmEqh4V7mEeoUs
         D27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698850747; x=1699455547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cc2RTGlWARp3griB6t8kpC6hCXGRaWKDTaju6cr+XBI=;
        b=Tr0Xfp8GNTHrIiGO+XItq+mRqYHS5ToLYOui+3gUTZFC3s6DPQh9rFa+gcbK5GHyyO
         r++ablANoBQbj1hbNQInvPFbps5fUlzZYgt1F2/2S8taDZAd4akMfZVu8dC3Yg4KEH9N
         Hd8FHKjJYlcNCAAy5Wg+pDnp4/2ZM9cxBNJtLR+llOTd8XmhQw1UTacJUdczcwoDnQPi
         dCdGpwqr56M32qArDiHS0ZNjwkPcYhfnty7+vzwA4COlVHAO+kgrgzV086AfqNB/lmYd
         DBjnbvyb5FeSUQn+LDYvya0slZyDSrEVcVrG5HsORGu+fnQoh/bTv5CU/0deQ8P32dXA
         y4Nw==
X-Gm-Message-State: AOJu0YzUwWWL6789UMEhRd7H3M+cY1UOMGJEPAcnXAiU5mhGC3E5jYOq
	Bcd4ubDV9VMI/E4KnBMUVPKQ+A==
X-Google-Smtp-Source: AGHT+IFeHd2qAYY0FBzh63fvqvnbs/U3KH/28ZQtZLMHKMAnCTOsRCvAWN/9IFwyxwrP+OVaU3T+Sw==
X-Received: by 2002:a17:906:b11a:b0:9aa:206d:b052 with SMTP id u26-20020a170906b11a00b009aa206db052mr2270730ejy.27.1698850747065;
        Wed, 01 Nov 2023 07:59:07 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906115200b009ad8acac02asm20448eja.172.2023.11.01.07.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:59:06 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 6/6] mtd: spi-nor: micron-st: Add support for mt25qu01g
Date: Wed,  1 Nov 2023 14:58:53 +0000
Message-ID: <20231101145853.524045-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231101145853.524045-1-tudor.ambarus@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_075911_106448_E10F5E21 
X-CRM114-Status: GOOD (  12.20  )
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

From: Fabio Estevam <festevam@denx.de>

Add support for the MT25QU01G 128MB Micron Serial NOR Flash Memory
model.

Datasheet:
https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_01g_bbb_0.pdf

Tested on a i.MX8MP based board:

 # dmesg | grep spi-nor
spi-nor spi0.0: mt25qu01g (131072 Kbytes)

 # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 08000000 00001000 "30bb0000.spi"

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
20bb21104400

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
st

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/partname
mt25qu01g

~# xxd -p  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff84000102800000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520fbffffffff3f29eb276b
273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
03e1ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
ffffffffffffffffffe7ffff21dcffff

~# md5sum  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
9d28d1b11de8b15ba9152644219d9a78 /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp

Signed-off-by: Fabio Estevam <festevam@denx.de>
[ta: introduce die erase]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/micron-st.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index ab8a53f0c99f..42daa2116752 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -203,10 +203,24 @@ static int st_nor_four_die_late_init(struct spi_nor *nor)
 	return 0;
 }
 
+static int st_nor_two_die_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
+	params->n_dice = 2;
+
+	return 0;
+}
+
 static struct spi_nor_fixups n25q00_fixups = {
 	.late_init = st_nor_four_die_late_init,
 };
 
+static struct spi_nor_fixups mt25q01_fixups = {
+	.late_init = st_nor_two_die_late_init,
+};
+
 static struct spi_nor_fixups mt25q02_fixups = {
 	.late_init = st_nor_four_die_late_init,
 };
@@ -449,6 +463,11 @@ static const struct flash_info st_nor_parts[] = {
 			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
+		.name = "mt25qu01g",
+		.mfr_flags = USE_FSR,
+		.fixups = &mt25q01_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
-- 
2.42.0.820.g83a721a137-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
