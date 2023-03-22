Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64588C6FD1C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yuql/mCeZ2BKxppTS10kM8gfoecgTnh7J/YPTK4vFgo=; b=p31hA3c/N3qZsv
	zSuGlN2YuxaSHsa23LToV0b6rrSrOHLGVvAQv+/6bXeFUa08PS6bpxz24aSMP4Uf1ddqa2N2oVvs/
	xKu/l1rlYhA6m/eRNP7twZmn50Y4h8a3NENY+hrMYXRUPXAdoRQaG+Chbow5ielPBfSnSyNbQeVdT
	ulNzm3JgaW7dOrgKjslj4d83aYEKbkJIMsRkJvCWMVErkEXGcMaM54WUUSFIFS9WsEgDNU67FXEE+
	l8ltY6YnWIBsXaJ9w7/mwnooddTb06pPqaMEQoY0tqZPU8WpWvO5R8lzp3uBS3P0PZ+WHq3ppQ9P5
	ubq/JKkUdiQ6WpGziuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9Q-00Etp2-0H;
	Wed, 22 Mar 2023 06:40:48 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9K-00Etl0-29
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:43 +0000
Received: by mail-lf1-x12d.google.com with SMTP id q16so11212848lfe.10
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxz/5hnL2T7rNNpiPeZo7eIaeTKEHB7uXS6/jbC9PHU=;
        b=v+kPJMRJo1rQREWsNHIc9ZOfW9W4JUMXNoruq6ACxJ+y8XA1x0Ij4qJb7WVc0AtjCL
         yODyRwyU9PJKa3DShgHmzxs2t46D9W3SuVIb/ipRi754mWES3fu71jG8gpELb4lBZrNj
         mfs7Xt21ETj+Kgek445U2ysnqWzq9YbmypaiCc0SPhf8S6D1kkXVSbRJqjCey831Cvsj
         nniXhNZ7vMLe70dnsm+tJqWIQzlLylsFo4zuu9rlijzs9CH9K+l4kgebVSuNpsF4NVWm
         EZ8OR7gD6e/xofa7RWD5k5KBwWFEVOKQegdcgS93MimKFWyq/xkCSavYJZQTuWtKPfNy
         Ftrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxz/5hnL2T7rNNpiPeZo7eIaeTKEHB7uXS6/jbC9PHU=;
        b=DgphrLuW1uebdxH++zcazmn0h/VR4LIHtuOY55dxlu5joFn9UxWYjn/VEK7QRWSoUO
         t0OsKewT7XSnCgOuMyDDaCaCejAMdQd5keahKqddfydcOHutSMZyPTQLtn+tpAd43Yvn
         ydY5CFXzTfSSwAja2cyXAlbUuJBceIyoOMwGC62yaCVSHJyaNE3j64NLjrFDsuYCINlL
         03tV0GV12tiX4WskNqhgr1OhjvpPlWJWgAh9ON1wJ632xyh8RRsarmdiXfUcS4M5AtOr
         L6OhkJ79+Y3r6x7W5KOzIKEabfmFv1Ptske64ZE7Fp8DDet0qA1hAbSHS6csNZd5YkzD
         rBvw==
X-Gm-Message-State: AO0yUKXX9hIOZ0EE6938o2ujQ3TmzqChbjyqrrNvGs0zM4ILB0VTQioE
	lTjlc34rDA8HCGcwyOruydBKgg==
X-Google-Smtp-Source: AK7set/4hxkITfYD5g8YTDG4mtdd/X3KLEWegGCwXWTJigSb1WfNYd725qkEj86RzXzmzo1Ec/rcwA==
X-Received: by 2002:ac2:434e:0:b0:4d5:8dd8:75f9 with SMTP id o14-20020ac2434e000000b004d58dd875f9mr1763398lfl.24.1679467240702;
        Tue, 21 Mar 2023 23:40:40 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:40 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 05/11] mtd: spi-nor: core: Make spi_nor_set_4byte_addr_mode_brwr public
Date: Wed, 22 Mar 2023 06:40:27 +0000
Message-Id: <20230322064033.2370483-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234042_703970_0010DCE8 
X-CRM114-Status: UNSURE (   9.96  )
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

This method can be retrieved at BFPT parsing time. The method is
described in JESD216 BFPT[SFDP_DWORD(16)], BIT(28) and BIT(20).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d80366f8a7e9..e212cc3c630d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -579,7 +579,7 @@ int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor, bool enable)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_set_4byte_addr_mode_brwr(struct spi_nor *nor, bool enable)
+int spi_nor_set_4byte_addr_mode_brwr(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 7961b81262db..394d251450f7 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -637,6 +637,7 @@ int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode_en4b_ex4b(struct spi_nor *nor, bool enable);
 int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor,
 					       bool enable);
+int spi_nor_set_4byte_addr_mode_brwr(struct spi_nor *nor, bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_lock_and_prep(struct spi_nor *nor);
-- 
2.40.0.rc1.284.g88254d51c5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
