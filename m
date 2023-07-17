Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEC6C04A6A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 16:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7QsRLN/dLAGM2DIgSfI4MLW3K+atOw3Aq/lOURTr0Y=; b=sEoNpjNb2Vq7rz
	udb9KTnnffm2Yt5BR7k1KUH3bbVNoie/OM9M6OQuSktq0/Q+Rf+akX+6RATCICSHD1kb11hPEkWaA
	mhrKDcEqoSPj2Xr0ToelpuyACKPNs1JNvjHZYZTOkxna5kg6U+ONL/Vf0VdUcJDHdLgGIy9XFeBAd
	C2mFKJ8EnJOsPjfuAcpzi+jfdwDWnX5TkEQGNHU9KEzOCjq2EWmEU14Dbnja4wOAHl8/1VvFzDotU
	1KJ9Hx6QCTAe+nyjIWz672GT2DIhRFj63tJval3J0mQIydSHIcFoKeB3lkZxUHUq3FFpMao1Dg1/0
	m3hdJvr+GuE0KwOvlgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRCo-004YgW-0r;
	Mon, 17 Jul 2023 16:36:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRCi-004Ye8-2T
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 16:36:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so49905105e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689611766; x=1692203766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxRhR0r73fCyJSfEpEtXqPaclv2CSQ/el9ad+l8akUs=;
        b=l9WcVXC6HdDMB4tx7zgtYXUMLlfQ0AQz3HHM6OjZE+NsImHmb0d3d3VezU1cEsm4A1
         ekmg6zBOuebenN+D5v7eZY76SanuwfIgCo/ckGXwRa1DkwODMC9hbNZnMM8E4KY7VsE3
         qtI8uhCjsWu9LiVgGYGqiXn2bG7EFBL73AA8R9bNt7Vcb9pOw+yTFnTb8LRyUObYEwqG
         h64elD2L0/C4tMWsopAENzzADUvT8JD8PjS5elXL0OjHAOGGdNiBsw3BrCj/YXKMGpEP
         XKZg3qzVGwyuGWhXMFIuTjLMSyxuOPQyJXhlFDXcBp515tENzQ3DCOCH7oImFBhYpoJm
         jNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611766; x=1692203766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxRhR0r73fCyJSfEpEtXqPaclv2CSQ/el9ad+l8akUs=;
        b=T/lnUdS+vZnlMV0ai7SdYQVOHU98BZa4Vrwh6eS4O9mq5QhrzDl31qj9rlyNQkoTUo
         q9h64D6kkcosd4edIeQEZ5jW3alOrOvoRH8J+n7EOuwkyIxHiI3eUXLNxvvq9plV4Fmc
         GUzcDjbraFvkZLLKYsiWJLeZ/TKBr7jQfQULmpq8s5RrWzgtfTAkfogaBZvFrDhgz2jL
         HF6NKPNygi/oC7ofUgr6IRkrd1nEzCQGYlqzg5o04jKMa5aPwNP1WfdF5NGAi00o+0Uj
         AAdlxXPgul+KStzafqWGKIADY5MUvCFTXmXSqIyrh/PYTTu1Yeg7H7iBt6053V+dZ7MG
         QvWQ==
X-Gm-Message-State: ABy/qLZyL9vZX/LiaLlq45lb+VHfshoKTXsc5i2LyX8ICcrFpStuGkx2
	9UtO4W1WZCC/7l0XvWjlN5f8+Q==
X-Google-Smtp-Source: APBJJlFDDluHEyFjvvRLMvIDD+mFo545IE15sH1uF1huHfdDMOWSDiwOqi1dlJi7WOh0HamPx8XPXw==
X-Received: by 2002:adf:ce09:0:b0:313:eadf:b82d with SMTP id p9-20020adfce09000000b00313eadfb82dmr10414459wrn.69.1689611766638;
        Mon, 17 Jul 2023 09:36:06 -0700 (PDT)
Received: from 1.. ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b003fb40f5f553sm8401774wmi.31.2023.07.17.09.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:36:06 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	ichard@nod.at,
	Takahiro.Kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] mtd: spi-nor: spansion: make sure op does not contain garbage
Date: Mon, 17 Jul 2023 19:35:59 +0300
Message-Id: <20230717163600.29087-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717163600.29087-1-tudor.ambarus@linaro.org>
References: <20230717163600.29087-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525; i=tudor.ambarus@linaro.org; h=from:subject; bh=jK7G8/dGKpNjblyZNdcgsS29H7EUdtJKmDLXkFoMUK8=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBktW3wRZnBIKX7MJLwCSTRLiWTIyz0hXlIKgZMI bMr/T+s2NCJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLVt8AAKCRBLVU9HpY0U 6bOqCACEhwiC1WelN0j1rCBwwmj6+cDXlWqgkMVMJAREFfkkAbllBqLEGEp495t/1wQnZNIffkb fv/fPXIjmSA+ekXchngSY0acafr4PMLytM0I+BSw0R7ynDT8r1OHiHQT66PptTl7iWoL7NyRQjf RxOdEExkfVuW2rC9TfULIiArJ0p8Y70fJ3yzLCuOkwRKYrcA9ItIuphooo3ia2ez1HAzRC1jJJi 0FpywB95NapP8ccOaium4t/2FPzaaVCth5hFrGtC4Ur1JFR9Vc9tv4JtPhI+X2HtFphpJUGb4/D m3u8O/ukd+EbTfKj5BmMaT2NUPggzGLer6xAiu12syD8qX2U
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_093608_929315_5C265B91 
X-CRM114-Status: GOOD (  11.83  )
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

Initialise local struct spi_mem_op with all zeros at declaration,
or by memset before the second use, in order to avoid using garbage
data for fields that are not explicitly set afterwards.

Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
Cc: stable@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6d6466a3436e..c03445e46d56 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -143,7 +143,7 @@ static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
 
 static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
-	struct spi_mem_op op;
+	struct spi_mem_op op = {};
 	u8 *buf = nor->bouncebuf;
 	int ret;
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
@@ -161,6 +161,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	nor->read_dummy = 24;
 
 	/* Set the octal and DTR enable bits. */
+	memset(&op, 0, sizeof(op));
 	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
@@ -186,7 +187,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 
 static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 {
-	struct spi_mem_op op;
+	struct spi_mem_op op = {};
 	u8 *buf = nor->bouncebuf;
 	int ret;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
