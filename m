Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C17C76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 07:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyj35UVLG2Dwfy8489B9sgk6m6xj0XPOLHilA5d0vTE=; b=L3LEYV7xkpHvoM
	dU2uWXhK3b9N6YqCHaHA1B92w6+cJwDqe11gBpd0cHweNFPBX4f9HQALDWty4/lwYO8rrZQR0+HF3
	LR7CPzbKoG0H02M+DUe3Bjq7c3BfuCOC5GPllbiWy3AP3HoBvkl1XDdz/cXnpBw/39WYeQuMv5BYr
	GzDdOun977Crq9CbIqe+e7YGw+elJY/7xKICt4Z7C0D4anlQDQm5K19ySUfpnUM/O27vOaYNdHmHP
	fX1tjj78EeLzekEhBd6XjhtcXI8i16ef3edyky2ZDefJJr7XUzSDD3EsSV7SZo1/vOqdPJeaLsl/Y
	BHmHLML0Hy5IQixpRt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9T7-006D8p-2N;
	Fri, 31 Mar 2023 07:46:42 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Sp-006Cun-0B
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 07:46:26 +0000
Received: by mail-lj1-x236.google.com with SMTP id q14so22125582ljm.11
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680248779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Gpe4Snyz/bF2fGxRf14cYZlO6UgYfzmd/ba/DWV9Gk=;
        b=vPj7iUbeg6atcpAE6Rmc2T3cT1CuQ6hI5sL6TzGToU3udLUOVtkSFe4aAbQEDkauGg
         UOTaUcX/VA/YEwdi/Uv/0tHEEsz3my21x0o09Y5+MMxSeV3Y/+0nCm1n/za4OHVbejob
         il5LLGPceI3Dy2br6XN05H6fddm/OfImZXd4W4xidDzWOB6pt1sifY9JJ4uzltVdf7FO
         J+tUbVDGJkqyn4QRoMRN5GtuzXwaupf1wDIVjF+aIUdMXZHm5vOU8zpcRhXktOAREfan
         ctpopLklTeOkeiyciCJnb8Oydzxd2Okqvf75PKv8FGJe23RYfOBg6Vte/c5nRfrAkxfu
         xpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Gpe4Snyz/bF2fGxRf14cYZlO6UgYfzmd/ba/DWV9Gk=;
        b=QBrMGPzN57iCXxPUJF80YO0X4J3tk/FOK+rbPKojJqN/lf4ZieKjRfgZnxBt1MP5bd
         nizfbdV56vCYN/Hs4LIovMmK1jbCCsab7Ux1PKsHPyQPKJZBg69db60ZAmZKU1vrttwl
         36KjiHlIHn8c02GpP4CIGif85VvTyLRZ4CA2S7dNF5AKYYhLes2zKy5blfnhKMGOBLC9
         b0SospTUe+qt8ucLxQXoCzg67+D73ztqqzYSGn33ZmYq0tD6jI3RRXo6h5pJ+HGihLS6
         PMQ80VWbJKEBevLa0zuzaLMthjKTv9oGII6uiPcYdIZOS3BjsKxYwwO8wyuur9mcU3HK
         F+kw==
X-Gm-Message-State: AAQBX9fQctnsPmi542LFSilsLKiZ+5Y+gI6hhv6rS33t/ArdbBmR9/R+
	wPUSdrj/Qj9LG+PXj+fwlOhezaTiby4bYsjw5Nv4tw==
X-Google-Smtp-Source: AKy350bSzjL91WtFWl1PE43B7dIJUbkMTgBFFknQ0K7k/cM/h+/38F1qZmY/xMT76WPQrlNjZa1lJw==
X-Received: by 2002:a2e:984e:0:b0:293:4b60:419c with SMTP id e14-20020a2e984e000000b002934b60419cmr2359613ljj.18.1680248779228;
        Fri, 31 Mar 2023 00:46:19 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e8794000000b0029573844d03sm241201lji.109.2023.03.31.00.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 00:46:18 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v5 08/10] mtd: spi-nor: core: Update flash's current address mode when changing address mode
Date: Fri, 31 Mar 2023 07:46:04 +0000
Message-Id: <20230331074606.3559258-9-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_004623_166283_DD580A26 
X-CRM114-Status: GOOD (  11.78  )
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

The bug was obswerved while reading code. There are not many users of
addr_mode_nbytes. Anyway, we should update the flash's current address
mode when changing the address mode, fix it. We don't care for now about
the set_4byte_addr_mode(nor, false) from spi_nor_restore(), as it is
used at driver remove and shutdown.

Fixes: d7931a215063 ("mtd: spi-nor: core: Track flash's internal address mode")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0517a61975e4..4f0d90d3dad5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3135,6 +3135,7 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 
 static int spi_nor_init(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	int err;
 
 	err = spi_nor_octal_dtr_enable(nor, true);
@@ -3176,9 +3177,10 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		err = nor->params->set_4byte_addr_mode(nor, true);
+		err = params->set_4byte_addr_mode(nor, true);
 		if (err && err != -ENOTSUPP)
 			return err;
+		params->addr_mode_nbytes = 4;
 	}
 
 	return 0;
-- 
2.40.0.348.gf938b09366-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
