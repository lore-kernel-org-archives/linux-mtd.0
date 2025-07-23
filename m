Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A02C83F25
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6RtpOpOKPrcG0x0k1Jak02tNCb9dJwYQNCXZn//x5As=; b=WsuAayzuCqsG1G
	O8GzHojUh6CtWPYIejUgg04c+GE6lU07+JKXXWDB3j854tvaLKBXJYs5750dot5Wl81guaNs4nqpp
	HKwe10m4GKUG9/ySDwx4kzbCruI8WYrZHccDy9C54VHKSyDS1ntnWIB+NtpmRlXnz1avA5dmKLFib
	YJ45iHXLbvLfnJkSfDOMZ1bxfZD3iHjaFVkaDka3hAufDEPnDp6+oyWAybl+Z5b8pyvJI9rioj2SG
	LRIgbzbflb7TlSPaWEbw/KkCfoH+s4TrbBIrOaBd9QOcGJh5MaKn703GgfHAjj7pOA7+8YaGdoGu2
	u+oh1dQdcHro/OxzAo/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUlk-00000004Mlm-4Afk;
	Wed, 23 Jul 2025 08:24:08 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUV5-00000004KRr-36b0
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 08:06:56 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2962905f8f.0
        for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2025 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753258014; x=1753862814; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4hGp9dWQqyiag09FeN6D2BgolKXHwVBXU9K7yKNplY=;
        b=Ah0Ryq52VSM81gCDuukblMjB4HymZtksfl+CBERDT5CTcDA2DOmpx0e2NxisScCDPU
         0nIhoiWQT8bTEhenWjIxNB1/+BGnEwMaG+skKucQVRHrtasd7X6qVLObEcFuJkRNfkqx
         cXytKNhw7N2hLM3IYuZjwIolmIwpkMf8+WZ2ttlOHtfYYAOc/VugUIe05om0Vu+OsHXx
         VBYoixtS9HiCch2w5qdtH1duYmzHUytUz6m3q43m38MT1g7KuYwvxbaH8Hify/cyPDXh
         hXQbQ6pz11r6UdYVB5Bv2lAnRBhXesH8Wv6vAVOzhyWqmZYL0XbDj9WiYuUqSojY7KuM
         jRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753258014; x=1753862814;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4hGp9dWQqyiag09FeN6D2BgolKXHwVBXU9K7yKNplY=;
        b=Fn5R7alPa83d48YiiSaT2jm+Wmd+zQCbaLIMpEZP+WSsFUI6a6c39aoiLDYK1HVoKF
         2oL0n43QCADaz2Uqa03UtwNjDn7r+oMhKY/3VNDDy4Pryb43EY6AKUeRHhfxmfhrzE2D
         WfnbrZUjgqlIpqlCuvFvhczUL4EgXLJVawto3vCDzB/Daxivs+zwQEyDoGTGjpky/D/r
         biX4265OawqWuhoNSocabDyRI2aN1hC7ZVz5NTMAuHZCthZ0pGyWsdMRhBeNQjhGqW2g
         /YiR+DDNq15MMC+8pJRMg7Tuet2zofkdk6by6oiVkVA3Qm6RLrK7nEyJlQ45ZDPHOUaJ
         OJFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUGMJhi2YRG1lOZkPe/RuaHuMPI057+fC/ec95OXOhg0z14WCGnfF4B4oDIM/iXVaLPLxkN1TOkl0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmdUVynKBPkt97XOfdvk9hqFVKAI7smHs3/CTJft5MJEeKVYP1
	7lzJCjYjg+p7UTGJL8DiWmVW6DYUXOulVFij/tyd4hbQDm8hGlAcEeNN
X-Gm-Gg: ASbGncvFOulM0k/UR1lbnPcOYw3rAhIgeSoXh7LvWTqjAgmDGrH47fXFzLx/COIh0OD
	Dd0vz5KPzQZ6OzgmCyxr4CmI2OPKYEC04Z7ZfAmdGgbW51c+2P1ls6q8KLnJ7djZk26Mn/4lV+g
	fbY90SYq5gdr03JY/HwqHrGE/S120nuefs9NOLngxaLmr1ixTyQNzSWFMdYKLZfSdgcdxj7TIxM
	giQqAURIHjD68voFWj4ZWNaKE1zn6LOTw6znjQlidAJN6E8y0Vbbe4NGpj4O39hQCVkxW+0J5ot
	bCE55Jyfv/tr8J9UZSdbIxXiprb215msAcAtyUxYjgno8Oao+8uBr/40xXeJ0TmN6i92/pqnqOO
	E+sohlLBqcmbYI7C7rOmwYkOh2yyZDHunTmct+b2QxMbFE1zz8s4=
X-Google-Smtp-Source: AGHT+IEib0qqC+Z0x4lzasRoTtea/6+PQdl+D0+gVXii4BSRmjOi2y+wPGZYjjKAmHCqtrEeRr7YUA==
X-Received: by 2002:a05:6000:40df:b0:3a4:eef5:dece with SMTP id ffacd0b85a97d-3b768f163a7mr1507259f8f.35.1753258013571;
        Wed, 23 Jul 2025 01:06:53 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca315basm15560899f8f.39.2025.07.23.01.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 01:06:52 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 23 Jul 2025 10:06:43 +0200
Subject: [PATCH] spi: spi-qpic-snand: don't hardcode ECC steps
MIME-Version: 1.0
Message-Id: <20250723-qpic-snand-fix-steps-v1-1-d800695dde4c@gmail.com>
X-B4-Tracking: v=1; b=H4sIABKYgGgC/x2MQQqAIBAAvxJ7biGNkvpKdDDdai9mbkQg/T3pO
 AwzGYQSk8BYZUh0s/ARCqi6ArfbsBGyLwy60V1jdItnZIcSbPC48oNyURT0/bBoZ0yvnIeSxkR
 F/ttpft8PSRevKGYAAAA=
X-Change-ID: 20250723-qpic-snand-fix-steps-d69b2c7761cd
To: Mark Brown <broonie@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_010655_781638_6E54801A 
X-CRM114-Status: GOOD (  13.09  )
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

NAND devices with different page sizes requires different number
of ECC steps, yet the qcom_spi_ecc_init_ctx_pipelined() function
sets 4 steps in 'ecc_cfg' unconditionally.

The correct number of the steps is calculated earlier in the
function already, so use that instead of the hardcoded value.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index c49bf7079808a1933c8a630e0b07b5fd54dfddb6..8fb8895bc9b54f2095981c975c1f412045a5db74 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -313,7 +313,7 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 	ecc_cfg->bch_enabled = true;
 	ecc_cfg->bytes = ecc_cfg->ecc_bytes_hw + ecc_cfg->spare_bytes + ecc_cfg->bbm_size;
 
-	ecc_cfg->steps = 4;
+	ecc_cfg->steps = cwperpage;
 	ecc_cfg->cw_data = 516;
 	ecc_cfg->cw_size = ecc_cfg->cw_data + ecc_cfg->bytes;
 	bad_block_byte = mtd->writesize - ecc_cfg->cw_size * (cwperpage - 1) + 1;

---
base-commit: 69e536c93242425fc65580b02d3f781a96403660
change-id: 20250723-qpic-snand-fix-steps-d69b2c7761cd

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
