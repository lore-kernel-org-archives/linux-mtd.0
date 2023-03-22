Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69137C6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPPpEGGWVSowVGleojkKD0+elPGnECM7zDyo/2EAEuU=; b=lnE90qXuoCK9+6
	L3S6fdV+oEaaazi5su9a6smyExFU/gbNOaorScuamKrCmgoO5J/19yNGyTrr8WwcpjewhCh/h/Nqw
	4umhNTOSdBm50Z9eRqSNa0fcUxl7gfhhCfD0NDYNtOAzSauIti7Q7GXstHadITf5Fuwjm947Q7prj
	VpSgxAEDZ867uQQh5BuIJd4L0dGThZZjCm09sXt5Qa7gGvGGA9TlTn9WFhDUD1OcdHvMRRdRHvbQ5
	vWmyYmiVNL2ZcwK9Rr6VEFuF83vruqCWpT3RXIakpS4VjispWk+PzpQdF9daevtTEXE3E/jsIKmu7
	hHUTCslRqGebBK9Z9FMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9O-00EtnP-00;
	Wed, 22 Mar 2023 06:40:46 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9I-00Etjw-29
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:42 +0000
Received: by mail-lf1-x132.google.com with SMTP id j11so22027406lfg.13
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbdjw1RSh3TEpk/7p7usBCYi4BEXdtSILvnz97JipYc=;
        b=Sh9Cd9BbxyTKKZzOwojOx1zCCxqy5Farawal5XysHHeyLiixDg2zZEAvx3DSsuUTMT
         J5qsR9Xr7C2ELEZiaNIYPZfw23Cl/UUfuSYeX3550OtjgcVqPmgKZqWCbWJg60hgwaP+
         i4q5n2DW/5pcwGqnNzqQupXmMBIJVa5J8bFUV93th0Jg8iuIuzgKvFlbqEQ+ToEfn2a9
         Zv9m//fmuNrQkvSCbBY7l/l/g04xJDkUPmxX6Dc8lfA3MzfgT/EswH8ikyHm38REsuXs
         /wC+dvSlPGud69QrZqHXPIqDqR3CVPcq5AK7VhFT7jnPAoMMkVojT3041jY/jdY1mD7Z
         /xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbdjw1RSh3TEpk/7p7usBCYi4BEXdtSILvnz97JipYc=;
        b=TtlBIHNmwvk8RKI9r/ehHrewYcrCJUWw+mPjp0NGrJx2WSMoC92lrId3IRcTIrB5X3
         YCEXfvptrez92BLKhLR1I1mw42/UNOORej4Ogco1oErtO+x/mvst2X5PJTtxOngJR6ch
         iP0OJehMk0YTd5FFVHUHRy4QSUloM+GqHgNznedHw7cjoAltR5hkrVSK+kSkiKEpjqSJ
         2qDRUJtkBuPKc9+cZTaseh+2FkDhRtQ8OZu304+rVuyr543kaR7WF8O2KQ/sH8nbD0Ve
         VhaK0ZGimKKYcUF/zys4cZHdRW/aFitQ2gZf3oU4Yz0g8JI5H3I0MbrXgq4mHQ22lhh9
         ZZqA==
X-Gm-Message-State: AO0yUKVwUB/UsdOvoZDF5jRejF8Wwb3AhwuQEx8n2/LvKgiLIjb+veK9
	AxkW2PGhuXF+rUBfZPIqAfLn0A==
X-Google-Smtp-Source: AK7set/H6+Aq8gAk3QEpJ20qjtugTm4sRtXWEgnVic14jRpmQYPYNbdlWkA3NFahwpLABQCB0Afl2A==
X-Received: by 2002:ac2:44d9:0:b0:4db:ee9:7684 with SMTP id d25-20020ac244d9000000b004db0ee97684mr1609008lfm.56.1679467238677;
        Tue, 21 Mar 2023 23:40:38 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:38 -0700 (PDT)
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
Subject: [PATCH v4 02/11] mtd: spi-nor: core: Update name and description of micron_st_nor_set_4byte_addr_mode
Date: Wed, 22 Mar 2023 06:40:24 +0000
Message-Id: <20230322064033.2370483-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234040_701692_58DDFF21 
X-CRM114-Status: GOOD (  10.76  )
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

Rename method to spi_nor_set_4byte_addr_mode_wren_en4b_ex4b and extend
its description. This method is described in JESD216 BFPT[SFDP_DWORD(16)],
BIT(30) and BIT(22).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c      | 7 ++++---
 drivers/mtd/spi-nor/core.h      | 3 ++-
 drivers/mtd/spi-nor/micron-st.c | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8d246b1b439a..2cb7425b3694 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -539,15 +539,16 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 }
 
 /**
- * micron_st_nor_set_4byte_addr_mode() - Set 4-byte address mode for ST and
- * Micron flashes.
+ * spi_nor_set_4byte_addr_mode_wren_en4b_ex4b() - Set 4-byte address mode using
+ * SPINOR_OP_WREN followed by SPINOR_OP_EN4B or SPINOR_OP_EX4B. Typically used
+ * by ST and Micron flashes.
  * @nor:	pointer to 'struct spi_nor'.
  * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
  *		address mode.
  *
  * Return: 0 on success, -errno otherwise.
  */
-int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index aa44474c042a..2fc08c26081f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -635,7 +635,8 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
-int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
+int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor,
+					       bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_lock_and_prep(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3bbf65234ebd..a75f0f4e1c38 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -425,7 +425,7 @@ static void micron_st_nor_default_init(struct spi_nor *nor)
 	nor->flags |= SNOR_F_HAS_LOCK;
 	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
 	nor->params->quad_enable = NULL;
-	nor->params->set_4byte_addr_mode = micron_st_nor_set_4byte_addr_mode;
+	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;
 }
 
 static void micron_st_nor_late_init(struct spi_nor *nor)
-- 
2.40.0.rc1.284.g88254d51c5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
