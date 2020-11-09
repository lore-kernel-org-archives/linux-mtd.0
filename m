Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4E1C388F7
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:24:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEACF206A1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yi4TR7AV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLj/b9i2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEACF206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vy4267y1dxmsKTG69egEMnfQs7HYYHRodKLsTENFz9c=; b=Yi4TR7AV9dWem0Nj9SWAFvUrE
	O/I5MDYkftdFz6Dmai3awkHgSzmF4hINxUpTlWV0f03vujMVTFD45qc0/zMracS0d+ABkUjlgCWyI
	y8OFWUEhVDZNSNWf0B+I0RC/sYQYo+XKIJR9yqZH0d3GRRbOfK/UcPiYSvYz+qv1oGjgNd4W0HK+t
	uRZ9fqc4xd0DPYagZGXhxaIHOKqFuiZel5MdS8bb2FSaNS8u3XqXHPgN39Ou9a3kSLI7Il3lYakfQ
	vyZ5OTrSwFHUHcp1mVw7RiqeN+LOlSlmWtv14YJKohD8RHldsJtePp6TXZnuqJMW07JymeJQDjyTv
	pXOPn5hMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBop-0001BR-Lw; Mon, 09 Nov 2020 18:23:07 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoA-0000pb-O4
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id p19so436189wmg.0
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/HSXbLD6nqQi0zyF0AV9ugs6EBiM6o8rIQYPcXPYEB0=;
 b=FLj/b9i2Zy4p8huivBf9LP0kU7ppNFuEM3LX1lt9lGu787iQs513Vfmapi1LhRjrau
 BLdR1O6bGDu0xSXvJ1MqeuoOu6nQrfwmTDEx6wRcnQfQWwUZwMG9YDwT55gX6eWY2NWc
 mLCIMEWWhP6TVGA0R/D6vl5awrmI00Ln1ttaJMzTLuNE7bR3tRULSOgp4VWjUjUZmYTT
 a98XhH2Ga0H2kZ2hmn+1fKcPqkefoqt0Hukhr0VR9XGr/FnpSnPDLwu3dm07NiibN/0L
 Qc3ImYpeYWKYaRMTunXbDK9wH98FmruKYpu6V96IPuyldrcR/Ltg78qn88ci75am3Rvo
 vStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/HSXbLD6nqQi0zyF0AV9ugs6EBiM6o8rIQYPcXPYEB0=;
 b=hTOMg6n02Wd+sRn1K2R+8lqyaERb+ZDrBmuGYJYTIzq+seccAYIkP0jjeCzSyDlgZn
 ss7nVNBA/BWiqP5frMTpz4WD+3wT0rh+o4IPOoBTh/CnY9d3CzQ9yDTZoAsps/9XIzez
 8dYM+d8I/174vejj4+q9e0ur8g7wTNKRGnt8YtHWVth38Loxb2hk89Y23tZqj32KmZOf
 R86TMN7zRwJ9SY01Qb/VcDjCd8nxt7m+ko2dljS56oMbaHnm7YZWI6TtdrUipfypag0f
 md+3Yu+wY8UvYY3bMYD7eu/UiLKuCkW94OOkVNXzDrnrEghalhLF2j8jjLSf0YDD6jbO
 FVLA==
X-Gm-Message-State: AOAM530aB26PXrIvdOziVEuvA8mqPffgjwiZUbf68qm6NPVZv5JV6rwv
 IK4+U+MTG1cwfEseSKP5O2Cwrm0q8RUEetNA
X-Google-Smtp-Source: ABdhPJyQ+mLrmjWtuwxQkAH6J9GltDMW0ka+19/wYcoOD4FYTq/zqrEMTKL5AhYYd0+sVSQTNTSX1A==
X-Received: by 2002:a1c:6508:: with SMTP id z8mr491052wmb.80.1604946145584;
 Mon, 09 Nov 2020 10:22:25 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 05/23] mtd: Fix misspelled function parameter 'section'
Date: Mon,  9 Nov 2020 18:21:48 +0000
Message-Id: <20201109182206.3037326-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132226_936838_A496549F 
X-CRM114-Status: GOOD (  16.81  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Alexander Dahl <ada@thorsis.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/mtdcore.c:1592: warning: Function parameter or member 'section' not described in 'mtd_ooblayout_find_eccregion'
 drivers/mtd/mtdcore.c:1592: warning: Excess function parameter 'sectionp' description in 'mtd_ooblayout_find_eccregion'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Alexander Dahl <ada@thorsis.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e9e163ae9d863..31d1be4b22617 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1578,7 +1578,7 @@ static int mtd_ooblayout_find_region(struct mtd_info *mtd, int byte,
  *				  ECC byte
  * @mtd: mtd info structure
  * @eccbyte: the byte we are searching for
- * @sectionp: pointer where the section id will be stored
+ * @section: pointer where the section id will be stored
  * @oobregion: OOB region information
  *
  * Works like mtd_ooblayout_find_region() except it searches for a specific ECC
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
