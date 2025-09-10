Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A220CCAC58D
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 03:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ii+gpmFbkxABfASn5lpFFGymvbnbBvcEBmqkU9gCc7Q=; b=Q09wG2a1BtdF0W
	HZvgyhNij+4SzaxTRMBo7N2uC9qWF4mWOQvAw6fUJpS3f8XOxvadCEHnGOz/sIiVjTu0d/P9wfOOH
	t0Nn7ZjWZj40MuG1Gms+PWtAQza5Kftnb+bYSN881VyC+01KFs01PYGyqExqjvYkCTUI4H8XCohji
	/I6mya4O4aC+pEmEg2JYv/+J3uW47AWjFx74VF81m6mU4Q4DEdFrNrBvo98mUDOx/XCrBgWPY2Me4
	BWBwVPmv65SpiVsCyzwRoh/1xKkDplhA9UW6TLpiAQR4MemWb9WOIdZV4luN0Rem9hv9asytwJVZK
	uEtkk1GmQvkEPsStIzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB9t-0000000BnO9-2NU2;
	Wed, 10 Sep 2025 03:06:09 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB9q-0000000BnLz-2ugH
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 03:06:07 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so7339856a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 20:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757473566; x=1758078366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTD4jfZ+v4XVtMAIsHdMuiuSYceyzDlRY16CdCXeB+w=;
        b=FXFHqXDrIXBrTfZ8zQ4F4K1xwlf6WRlBu4B7gVcJOnMHOzIpu0t723b60CAX155biX
         UXszEFzwIczMHp2mYythvCxMbjTTBaf+ZvXzSd7qzFIOzsTutKkFNL+R0fSSHMTVRQIr
         +i/8TRkWrDjiSG6sn2aM9uOhgCD5InsVWuq4dr7RWYnZqCDh9YgHLxgNQCLUzO0on4JV
         cJQJSiiZ+U2GEaCcpRgoS5rIvCO89OaDto/2tL0H31YG6ZW/PogffS+L8M9mwB4tQTqS
         EL/Il2OH+tcpFkxRtkUH7T7t3Rn9UicHuj3gYXezdt7tf9RauP7PNLdFQp/7qwE9jlfc
         q0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757473566; x=1758078366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTD4jfZ+v4XVtMAIsHdMuiuSYceyzDlRY16CdCXeB+w=;
        b=I+9RBV0De3umMpDR1Sn/mcI9C64CnoXswax/V4UCIAdCaoaNdVnC45tsz67CE+F+cX
         o9C0fkYlF2IUqcUrh0DdfS8iv7nEFuuq5T8vID1bh3nfr3AwawrHVi1syIQYwIAAtDdI
         BTFhmmmT4fUiXlxGackL0VJ2aPrGfuNYGhv1qsfnncIRZ4tu0W8GntajeHAIaI8lloeW
         vnkHA8DjyzKN+/iQAEqyui3aEa5bkqJ/P8uM5BKqIZCNu7i9XM4uN8DHCWKnpjCTlRSO
         9vBP29WEQeGHc5BOwPi2fj2dUJR8V++HB2ASnwC69jpilujIO9Jl9YjoEBUsJmoj/217
         QmTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeGDSY0YSndGvsBczpJvq7TzDHmBcjElDek2DbYvkwAM1pHmrm/32l1z9li3A0FbiYkXfajp68CFk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAJbgLwpvA4hpuyVKQuSf61QO8KrjhQKmHmiGYhJ6HdQJw3IMV
	rJk7JlDTj41cb779Bby3k0Ut0AOb3N7uSn8YyusNncV6ZQWD0WfYAOJw
X-Gm-Gg: ASbGncuQy9lsOTtZ+kmFfC9wQh3MiwbJlz5SlDsncV7zX/vwH40PJnaAStSda7f6l1t
	fhto5+V2IFs67rdr38Mgw7Ou4FYXwpbZyAlDMe2I8/pttcXPOBpZ45NuV1hEGBTfWAZezUTSDyF
	tNORvbh4rRf6aHGtoa1QjUNmgRm2QBP/Y61xCmtNPHMZaKlk0X78alFxinS2U37gqP8UHRp0aqY
	SML7CzGl02O/V/X5ZxON6L9f/ZXk6UTZ2wdnf+3J9uxzXb9gIwbuW6wOFwvvpI0aFkMuoHCHu7y
	37nwiuoxM1ojKVnRZw/x4gY2bkBymCQRm5vhr+Q3pKWWRJ0vcvvJfm+jrqAOYfVYAGkp+lUQQlw
	T8LvJuH0wcRu3Olpu2ICx2midS4PR9LgTjB2s4OlCnMTKyUsHyprdg6cRnSiH6IqexpKk190lli
	zXKLIIEump0zr+Flzn5tCsgWNYxr5JKlK3abP2XqP0/g1qbET6WmY2obY=
X-Google-Smtp-Source: AGHT+IH28usqYyuiorxIFP4IsRvkvrFAv/8CQm1Kx2W+C4unMcjMCStN7qDcg/tOWpZ0Mdpz4/RywA==
X-Received: by 2002:a17:90b:1dcb:b0:329:ed5b:ecdb with SMTP id 98e67ed59e1d1-32d43fb5b92mr18030127a91.18.1757473565788;
        Tue, 09 Sep 2025 20:06:05 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dbb5f3deesm672029a91.14.2025.09.09.20.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 20:06:05 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 570A8802C7;
	Wed, 10 Sep 2025 11:10:38 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: tudor.ambarus@linaro.org,
	mmkurbanov@salutedevices.com,
	Takahiro.Kuwano@infineon.com,
	pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 2/3] mtd: spi-nand: Add support for randomizer
Date: Wed, 10 Sep 2025 11:03:00 +0800
Message-Id: <20250910030301.1368372-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910030301.1368372-1-linchengming884@gmail.com>
References: <20250910030301.1368372-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_200606_741397_84FA40DD 
X-CRM114-Status: GOOD (  16.97  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Introduce randomizer initialization for SPI-NAND devices.

According to JESD22-A117E, there is no single data pattern that represents
a universal worst-case across all failure mechanisms. Different mechanisms
may stress programmed cells, erased cells, or cells influenced by adjacent
states, and thus specific patterns such as fully programmed, checkerboard,
or mostly erased are each only worst-case for certain desings or processes.

Given that no fixed pattern can cover all cases, the use of a randomized
data pattern is considered a practical mitigation strategy. A randomizer
distributes stress more evenly across the device by scrambling incoming
data before storage and restoring it on read. This helps reduce
pattern-dependent degradation and can therefore improve flash reliability.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 24 ++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  7 +++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index ea47028d0..770304403 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -854,6 +854,25 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
 	}
 }
 
+static int spinand_randomizer_init(struct spinand_device *spinand)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	struct device_node *dn = nanddev_get_of_node(nand);
+	int ret, rand_dt;
+
+	rand_dt = of_property_read_bool(dn, "enable-randomizer-otp");
+	if (!rand_dt)
+		return 0;
+
+	if (spinand->set_randomizer) {
+		ret = spinand->set_randomizer(spinand);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static bool spinand_use_cont_read(struct mtd_info *mtd, loff_t from,
 				  struct mtd_oob_ops *ops)
 {
@@ -1367,6 +1386,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->set_randomizer = table[i].set_randomizer;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
@@ -1544,6 +1564,10 @@ static int spinand_init(struct spinand_device *spinand)
 	 */
 	spinand_cont_read_init(spinand);
 
+	ret = spinand_randomizer_init(spinand);
+	if (ret)
+		goto err_cleanup_ecc_engine;
+
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;
 	mtd->_block_isbad = spinand_mtd_block_isbad;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 927c10d78..66ea8eed4 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -500,6 +500,7 @@ struct spinand_user_otp {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: enable/disable read retry for data recovery
+ * @set_randomizer: enable randomizer
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -521,6 +522,7 @@ struct spinand_info {
 	int (*configure_chip)(struct spinand_device *spinand);
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
+	int (*set_randomizer)(struct spinand_device *spinand);
 	struct spinand_fact_otp fact_otp;
 	struct spinand_user_otp user_otp;
 	unsigned int read_retries;
@@ -579,6 +581,9 @@ struct spinand_info {
 	.read_retries = __read_retries,					\
 	.set_read_retry = __set_read_retry
 
+#define SPINAND_RANDOMIZER(__set_randomizer)				\
+	.set_randomizer = __set_randomizer
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -634,6 +639,7 @@ struct spinand_dirmap {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: Enable/disable the read retry feature
+ * @set_randomizer: Enable the randomizer feature
  */
 struct spinand_device {
 	struct nand_device base;
@@ -667,6 +673,7 @@ struct spinand_device {
 	bool cont_read_possible;
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
+	int (*set_randomizer)(struct spinand_device *spinand);
 
 	const struct spinand_fact_otp *fact_otp;
 	const struct spinand_user_otp *user_otp;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
