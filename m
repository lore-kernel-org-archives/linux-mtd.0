Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9467C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erGzrhk45CGBvdUr1yHv8kwZUqc2nc3JgqavOfa30P4=; b=eDtjINIEolGs+I
	xZmgLagPUVwrXxV5OXu4KKmcYgWceF9XkVdq6vng7gPcXI/0V6kxUqkNqd1sQiji8qiTUZHoYt2cY
	ofvLCEWFRaG7bsA7HaqhDRzJey99yYnXR1vRj5kkALot255ysPkbIs5GGqcN3ck96iUbPYfvHo5GN
	Z1i0B/yXbxktphjQxuzKyVuXcKqeb8fEPk6Nex4mEdG76izmmN7dXJL5KTiCAJhE2ObKFcGWpc0I7
	5Q1/5Ex2RJRRcopP9NL8nkcBUicaL9LB4XUrhPXAVika6b1pio1u+mzmWKgD4+KXJICMyKJUAtEdp
	6ObKno3t0XWMxfX9cAiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKk-009V4H-2F;
	Wed, 26 Jul 2023 07:53:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKg-009Uxy-1Y
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fd190065a7so55346365e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357993; x=1690962793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGJKtRw4TvIjPpcEW3YYZgR3twL7SAYz6w/Nk+vj+ZE=;
        b=w5N02p5SiiYJzQLFwwFAOX+7CvxBIy0/op/fP7rzRTUMU0q9f8p7MQQURBZj4jmMwb
         ps3gfl6B3efxxCc9Rcm6T0DCVvNrXD60wCEtEg/3dHSkKuI3Wkg8LoEbKuXmJohWUYwd
         v3n5m5yVcBLJdQbf4gZkS9SaHcbJOn3KVu6ovu+vDqY5U1qLZ3+jUDaxdyLsIHqJAcFd
         CG9dEpcSmvtCvkrsSU/DkYFOCkGIOE6Sc2zS83joAyacLwSAcf53QJdm8GiQD7scsbbh
         ncrZnYFIryqFqNh20v0sATflY58Ri13I8pr8jQX4owbRd3imaUsrEdZkZiZ6su2JyQqf
         8Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357993; x=1690962793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGJKtRw4TvIjPpcEW3YYZgR3twL7SAYz6w/Nk+vj+ZE=;
        b=ePIk0s5i/ClhppD4HzPX7M6Jjh3D9iI2U7AN0HsxaAy1p5IafP+FJFJAJKn8wC5+8A
         JPjDV1/g2Greb6Xj8X0vGW2hpQIaXUEin/R+yGN5lqnaNr2YJvVXzmzymoAvkfAi3BOe
         p/uo+7GK1LBbtX7LWywkmw6vCFgSPu8oadAo1g1WNLv0LwyeeP6To/4eLoAgDwdbc8mY
         UuORvDn6FA6JV+306KdaHDqLS5Md3L9Kt3rK0KczDzUC2kA9qVDY4t2lYzbpVCsIZO4g
         efuCHNweziWMed/sUNo3H2gFcGpLtn9VtepL2gOYEIu9jiQTWAV8u+kdpOT5OtfW0uNt
         iP9g==
X-Gm-Message-State: ABy/qLYvOue8/yoLxON0qYy82e25qWYXK6D+u/+sTWpJvDMJ25TEZlAi
	UisyxpfBkyX22zIIvxN4qAsxIw==
X-Google-Smtp-Source: APBJJlHuqlDegBijDnUs0fV12jGszcpfU+t1gDU97/q7LSp4HP8yLabBB+6uJmrtZfykKzX4uMVLMw==
X-Received: by 2002:a1c:4c1a:0:b0:3fc:80a:9948 with SMTP id z26-20020a1c4c1a000000b003fc080a9948mr767283wmf.19.1690357993248;
        Wed, 26 Jul 2023 00:53:13 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:12 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 07/11] mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
Date: Wed, 26 Jul 2023 10:52:53 +0300
Message-Id: <20230726075257.12985-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=tudor.ambarus@linaro.org; h=from:subject; bh=+Z4bxTGyJ9/9zDwMM8hBMtji+B4a+ORn3JZ7mTF+ybY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwNDYGHy/s6o006qFtWZQ3anN1qewblLvDmIB3 scXS18pCACJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDQ2AAKCRBLVU9HpY0U 6TWfB/9+5mfv0gOBgUZej7KRxVVtTF0Ls2oliPm9WOBhfe1lEk3zgrtBubIoDbS6zZbhof3gLKf xRCCopSCMllajAXkrKpjHJaieEAP/V6cyndfDmBQDTduen+TPQ5uBJVZ3cXIvH7IE5EhNN41BYq Ad8tF+zawYIicKhuL0ZXsNYASZY0OuSTBuEqatYmyvhqqkRFKMQ8TUK2kXbcZdV+A6CMaSHSsPn Hl9k4cEdF6fnjVn7DARZLc35vf9+J8bmj39cY55Ow2yGhVcDFEKe8w31lznDcv6NDKhSHfTNTOZ GuViUy7bNO3W7ZMFSrVKdRKRq7XY9c2lqVDdtG1JwwxnGvom
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005318_532794_68CD7561 
X-CRM114-Status: GOOD (  11.68  )
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

S28HS02GT uses RD_ANY_REG_OP to read status of each die. In Octal DTR
mode, RD_ANY_REG_OP needs dummy cycles (same as params->rdsr_dummy) and
data length should be 2.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b3a710985f84..d7aa0a90949a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -102,11 +102,17 @@ static void spansion_nor_clear_sr(struct spi_nor *nor)
 
 static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes, addr,
+		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes, addr,
 					  0, nor->bouncebuf);
 	int ret;
 
+	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+		op.dummy.nbytes = params->rdsr_dummy;
+		op.data.nbytes = 2;
+	}
+
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
 		return ret;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
