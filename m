Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A30C761A6
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4slsFXfPzZjbiVkNVRwMpq6bYv0+6laP1Zyy92QByM0=; b=UQaDapDaBfIi7K
	RGE7jwVrlpEWX9seBETjbmsaNMJEeCF8uMULaV/wb4/9LO6C9XcG+C+VBlRFxI5pADFHwOimHLcbq
	vDMcUAWbHOyHgmMM+I9S8+R32zeZMbeniVMQY46jaCM5d91YuNf2naLcpl/bunuKplRXsch4XkX0D
	qJyGAbz2NzHkH3CphCnX+9pH+IM3fEQciJaVdZs2W6DtsXWxV38y5MrGEt21DA4ZSQkVI1kngWrBH
	M3ltYEz2aAbshVaomi8mVtKXu3BM7oJqy1KGc3azUAd0m2YJ2vXwMB84exhjefVAXj9a6L+q1i/1i
	iCASZLP1Wf82E1MJwXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9V-00EtsJ-0v;
	Wed, 22 Mar 2023 06:40:53 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9N-00Etjw-2R
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:47 +0000
Received: by mail-lf1-x132.google.com with SMTP id j11so22027627lfg.13
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiEhw/MYHGHqYkcULW44qvOE1f5BKxwdN9TbdhHpk2k=;
        b=BBaAP+qofU6gmMoZlFnCXX5iuME7bAK/wwLkOJ2EcO8w35hd21eorA711U2+NkSE4S
         w+wQs0/U5LhpKGGHGuv4FfUpvh2uYVqm5ngOKU9v+dayckn9I6DTisjrE5a78OR3Q/hn
         RQ5nyrPPfAyKHcgqgdwK1/U3W1DPhw9Rw9oYPLS8SGX42riKBlsh8rbob3BvhBmuoQ9K
         mPaktuupbfiZ7Gbp5WDnswM1DTGpEVy/Agr7lceidC9nW5BKWMqiOdkSCFW3d/a7B4Qe
         Vgb5Bcl2DmLLsyxc6bfcvECAcAInt/jzF22HK6lSJ8UvtjFCg4oTo1Skdu1WmI19gjYK
         BRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiEhw/MYHGHqYkcULW44qvOE1f5BKxwdN9TbdhHpk2k=;
        b=p7OzmSTQYkOLX8a2YC24zw0uNe1MnOSzthIsXJvtW771jOlqLZe/oJY0KPONXm8YsZ
         kR8wLo+gaCobt619rT+rK1Zw5Q7+n6Tuun71GncmkW8vt4/jeuQvVjF0++oVA3gBqvVi
         7vj/Dozkziwptc8MzTxzK6NYMph9FHHly06B0nRtMCaHmOhiP2bOL1paxUuFrdYaTm5g
         +5ibkX426AYxj6Ph+vPzoGObKUq0JdAFIwq9eGyBdpW4P6t8on1c7lJXJNIw18M+WRpz
         ONkmUhkXpF/O5QfMvxJunAGLtcWT56574Tv8dYxTAxwRYxacBajTVPY9Wl9RIKFUoeus
         j6EQ==
X-Gm-Message-State: AO0yUKVf60/ScxaEE6MZcKPYj3El3OTABVKCxm3k7PHW5724IVdbjNsa
	SS/+FZkykYI/VWfLIHACDG+nPw==
X-Google-Smtp-Source: AK7set9mwp/p2VqPULgSXCe1sfhlNyAc9FbRP4BC0wGsaqvFqr85PMyc+ebH+CiHqgx0/P+pMV3taQ==
X-Received: by 2002:a19:5210:0:b0:4ea:d6c7:c897 with SMTP id m16-20020a195210000000b004ead6c7c897mr1608728lfb.31.1679467245271;
        Tue, 21 Mar 2023 23:40:45 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:44 -0700 (PDT)
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
Subject: [PATCH v4 10/11] mtd: spi-nor: core: Introduce spi_nor_set_4byte_addr_mode()
Date: Wed, 22 Mar 2023 06:40:32 +0000
Message-Id: <20230322064033.2370483-11-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234045_810976_ECA3C065 
X-CRM114-Status: GOOD (  17.79  )
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

Make the method public, as it will be used as a last resort to enable
4byte address mode when we can't determine the address mode at runtime.
Update the addr_nbytes and current address mode while exiting the 4byte
address mode too, as it may be used in the future by manufacturer
drivers. No functional change. spi_nor_restore didn't update the address
mode nbytes, but updating them now doesn't harm as the method is called
in the driver's remove and shutdown paths.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 35 ++++++++++++++++++++++++++++++-----
 drivers/mtd/spi-nor/core.h |  1 +
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 868414017399..4b2a6697a192 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2767,9 +2767,35 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 	return nor->params->quad_enable(nor);
 }
 
-static int spi_nor_init(struct spi_nor *nor)
+/**
+ * spi_nor_set_4byte_addr_mode() - Set address mode.
+ * @nor:                pointer to a 'struct spi_nor'.
+ * @enable:             enable/disable 4 byte address mode.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
+	int ret;
+
+	ret = params->set_4byte_addr_mode(nor, enable);
+	if (ret && ret != -ENOTSUPP)
+		return ret;
+
+	if (enable) {
+		params->addr_nbytes = 4;
+		params->addr_mode_nbytes = 4;
+	} else {
+		params->addr_nbytes = 3;
+		params->addr_mode_nbytes = 3;
+	}
+
+	return 0;
+}
+
+static int spi_nor_init(struct spi_nor *nor)
+{
 	int err;
 
 	err = spi_nor_octal_dtr_enable(nor, true);
@@ -2811,10 +2837,9 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		err = params->set_4byte_addr_mode(nor, true);
-		if (err && err != -ENOTSUPP)
+		err = spi_nor_set_4byte_addr_mode(nor, true);
+		if (err)
 			return err;
-		params->addr_mode_nbytes = 4;
 	}
 
 	return 0;
@@ -2933,7 +2958,7 @@ static void spi_nor_restore(struct spi_nor *nor)
 	/* restore the addressing mode */
 	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET) {
-		ret = nor->params->set_4byte_addr_mode(nor, false);
+		ret = spi_nor_set_4byte_addr_mode(nor, false);
 		if (ret)
 			/*
 			 * Do not stop the execution in the hope that the flash
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 394d251450f7..7152688d3985 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -638,6 +638,7 @@ int spi_nor_set_4byte_addr_mode_en4b_ex4b(struct spi_nor *nor, bool enable);
 int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor,
 					       bool enable);
 int spi_nor_set_4byte_addr_mode_brwr(struct spi_nor *nor, bool enable);
+int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_lock_and_prep(struct spi_nor *nor);
-- 
2.40.0.rc1.284.g88254d51c5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
