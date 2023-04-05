Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2617DC7619A
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Apr 2023 06:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zDWxO6T4RHrkbwW+F0IMPoRDH/lXCLUG5ql8S90bs3c=; b=Fgk0RkkiHjaKdD
	bQbJaiC2mdNhbJPyqJxVA/EoInjzGDyLjncYmeNMy1RCTXDhrtbNGICMNr7YQ81Okb/PDU+5dtQTK
	VGuKq9JmYrTCXwL/aP83dAGeSYyyKGUSaWglbdByKSAWxOI05etyRD6nFDi8VLi2Isc1WdT9e/bQG
	ncpE+pnJSoP+fkmSMW/GoM8tOOJL/E33wEfhHRJLY61RZJDmHYj4ZB0Sa0CenuD7GmQDOwzu2d/KW
	AWeR++mKD9H10g7+PMb8uc2aCE91G5Ry7yBOTU+6BMX/bBWQBd4Tz83xBFiC7SyyuzCe/1v4taa++
	mP6tp8XDdhEr5wMxdHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjwWA-003Uwg-1s;
	Wed, 05 Apr 2023 06:21:14 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjwW7-003Uw3-0z
	for linux-mtd@lists.infradead.org;
	Wed, 05 Apr 2023 06:21:12 +0000
Received: by mail-ed1-x530.google.com with SMTP id ew6so138337022edb.7
        for <linux-mtd@lists.infradead.org>; Tue, 04 Apr 2023 23:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680675670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37wf5RuLXYQ2GF/JRvIi9hQZK8An5GQBqnLDA1j+haw=;
        b=NumasAbWAKnmvMrSOJctJghuhJaRwvPkeizYxdCkdyRjm8/UkfMrY3yywTdQE85sy0
         TOfYdAUAOnnzQE1S/anBa/0mYZHBim803Mor0NGBPr+bSdFIxrhU1uN/sGFwAsWFXte/
         lxJ8g3QDZsi6escu8A6epb9CWNAFQOtuefMiqV69XTZ2reQIc+B0fDmSi8lhEZQ/GFAQ
         apwd+VdgerRvgFZ6oIHPfhOv8TX3QB/g8NQyixrxsV+mGqIQsW7vfZ6azhzNMVsdmYFP
         xFXzL7egGz+bdOvzcneanXhNdHSi/G1GsRGVUK7byUze6lWiMDvYOqJt1meDe4+SCC6y
         h6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680675670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37wf5RuLXYQ2GF/JRvIi9hQZK8An5GQBqnLDA1j+haw=;
        b=j/ZYZyFyjh/HdjpMG+APGUQuuJZYOo7crzSdw+xqbWCS41+7W8pHp8//ah2UCvWk8T
         3zrtRBiFSdQWYhan65X0wLgTddghoECVAKD9gBjgYA4qIxYoZQ+GC83+mtBAiCJyNYKH
         tldT0sajmfCAaH1vuF8RsFzHjlWogkujMlt3P99A7rQp2iUtZkvWRRJPN0EEEKv+l0Y/
         FmuNHCp7B/kmu1hZY/d2SnoJ9D4Ym50PZqFrxx3iw4eVQ8LSqEnZiSUnvrvFOtG8VeIN
         xwD7f8iA1ukxtWcdhQzBCkI2GZ221BMViEs0uWScfQ0CSG62GX+ldujToeG51xSP/9sj
         yFDQ==
X-Gm-Message-State: AAQBX9eAHYyav/0TDHCPBCNWQuzPbCzU8nVksdDaYkX91E7jDxqJqWeU
	+VpigcvuBrf++mU3oFr+sTeztA==
X-Google-Smtp-Source: AKy350blz5Rm2OmsxD9Rv+jPxdM4Rj5Ckdz2clZmFC7ODXVH6ArfnHQfModIJlXQ4wWbSg8kJuWgQQ==
X-Received: by 2002:a17:906:144d:b0:93f:fbe:ed17 with SMTP id q13-20020a170906144d00b0093f0fbeed17mr1771352ejc.62.1680675669740;
        Tue, 04 Apr 2023 23:21:09 -0700 (PDT)
Received: from 1.. ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id h13-20020a1709063c0d00b008b176df2899sm6928978ejg.160.2023.04.04.23.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 23:21:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	Takahiro.Kuwano@infineon.com,
	pratyush@kernel.org,
	michael@walle.cc
Cc: bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2] mtd: spi-nor: Allow post_sfdp hook to return errors
Date: Wed,  5 Apr 2023 09:21:06 +0300
Message-Id: <20230405062106.49594-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5149; i=tudor.ambarus@linaro.org; h=from:subject; bh=uLRlHwXswDm0+Iz8gfhM2OM4oGR74A/r+jko5VVtKzg=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkLRNSnovp0DP6aXX4UdzLh/Q6ZXe0JaFXCkjXN Db/P89QTZuJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZC0TUgAKCRBLVU9HpY0U 6WorB/4gL/5EPF9KC2mPpvKO6UcSifXGxeWLsSCUym51JOIP9TRGFc+1COrd7YZ/kMemjye/G5e f/PVnK7+w2kBj2h521hDyVCLaW6Q87yCYe9xEjxzR3z/TuwiDtDPlnk0HMeBEZpa0jW4GFm1SOc iGJFk1dSg/zoGbe78hlHFOW+OqlO3lpI8yuuQPvvhO2LnZ2AGt0GNYDEPb27k3vztWipvuVJlIA rxUwXXt47pGyOR8VIJxhEME7MIpfsUrzryDh3hkomvKqq6qsbmgLFPsxryncdnzPaYlke+BeTCH coVy97aofnBwHlCObG4kHWSSvvil7sGjQD2g4W7xodCvZHeK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_232111_348569_DE25B66B 
X-CRM114-Status: GOOD (  15.91  )
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

Multi die flashes like s25hl02gt need to determine the page_size at
run-time by querying a configuration register for each die. Since the
number of dice is determined in an optional SFDP table, SCCR MC, the
page size configuration must be done in the post_sfdp hook. Allow
post_sfdp to return errors, as reading the configuration register might
return errors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v2: Fix own mistake in spi_nor_post_sfdp_fixups, do not exclude the info
post_sfdp call when the manufacturer post_sfdp is defined.

 drivers/mtd/spi-nor/core.h      |  2 +-
 drivers/mtd/spi-nor/micron-st.c |  4 +++-
 drivers/mtd/spi-nor/sfdp.c      | 17 ++++++++++++-----
 drivers/mtd/spi-nor/spansion.c  | 12 +++++++++---
 4 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 8cfa82ed06c7..a9e5e091547d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -426,7 +426,7 @@ struct spi_nor_fixups {
 	int (*post_bfpt)(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt);
-	void (*post_sfdp)(struct spi_nor *nor);
+	int (*post_sfdp)(struct spi_nor *nor);
 	void (*late_init)(struct spi_nor *nor);
 };
 
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index a6f080112a51..4b919756a205 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -131,7 +131,7 @@ static void mt35xu512aba_default_init(struct spi_nor *nor)
 	nor->params->octal_dtr_enable = micron_st_nor_octal_dtr_enable;
 }
 
-static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
+static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 {
 	/* Set the Fast Read settings. */
 	nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
@@ -149,6 +149,8 @@ static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 	 * disable it.
 	 */
 	nor->params->quad_enable = NULL;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups mt35xu512aba_fixups = {
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 69e47c9778a2..e184b67f3c9f 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1260,14 +1260,21 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
  * Used to tweak various flash parameters when information provided by the SFDP
  * tables are wrong.
  */
-static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
+static int spi_nor_post_sfdp_fixups(struct spi_nor *nor)
 {
+	int ret;
+
 	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->post_sfdp)
-		nor->manufacturer->fixups->post_sfdp(nor);
+	    nor->manufacturer->fixups->post_sfdp) {
+		ret = nor->manufacturer->fixups->post_sfdp(nor);
+		if (ret)
+			return ret;
+	}
 
 	if (nor->info->fixups && nor->info->fixups->post_sfdp)
-		nor->info->fixups->post_sfdp(nor);
+		return nor->info->fixups->post_sfdp(nor);
+
+	return 0;
 }
 
 /**
@@ -1477,7 +1484,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 		}
 	}
 
-	spi_nor_post_sfdp_fixups(nor);
+	err = spi_nor_post_sfdp_fixups(nor);
 exit:
 	kfree(param_headers);
 	return err;
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index c937f0ac61de..519fdad79a19 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -370,7 +370,7 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 	return cypress_nor_get_page_size(nor);
 }
 
-static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
+static int s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
@@ -379,6 +379,8 @@ static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
 				SPINOR_OP_PP_1_1_4_4B,
 				SNOR_PROTO_1_1_4);
+
+	return 0;
 }
 
 static void s25fs256t_late_init(struct spi_nor *nor)
@@ -409,7 +411,7 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	return cypress_nor_get_page_size(nor);
 }
 
-static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
+static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	struct spi_nor_erase_type *erase_type =
 					nor->params->erase_map.erase_type;
@@ -431,6 +433,8 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 			break;
 		}
 	}
+
+	return 0;
 }
 
 static void s25hx_t_late_init(struct spi_nor *nor)
@@ -463,7 +467,7 @@ static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 			cypress_nor_octal_dtr_dis(nor);
 }
 
-static void s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
+static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	/*
 	 * On older versions of the flash the xSPI Profile 1.0 table has the
@@ -489,6 +493,8 @@ static void s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 	 * actual value for that is 4.
 	 */
 	nor->params->rdsr_addr_nbytes = 4;
+
+	return 0;
 }
 
 static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
