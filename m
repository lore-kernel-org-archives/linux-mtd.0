Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A7DC169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 22:07:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B14852087F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 22:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lo0q1y3c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="LV56v3ZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B14852087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrTCSlkqcVEDAB+DvVmM/b6qlV6eLauFEwLcofZd9o8=; b=lo0q1y3ckXLEda
	/Pdjos7iR8vPVF6zy6v0XKRM11dtlpyECjHtUz6oq0v62YAyHMuU9bfL0yFWBHVBfMGxsWdOOgF62
	+JP6sDhpiVFMSJqr9pQu/yiSMTEQi+2+tnWArhLOW06kBcHEGhbkyDj0Ri6ZTCHGUS9HNVYTj7eMk
	eThFLfpePRK+NgcysGs0kocbbJnlmsvsUKF7hR0YNVCur1kvLZdRhDkPPsoZPGcfZ5EIuOfBQcw8T
	drhOYSn53t0wxDhTOmGYniUwh6cW6awn+R3oFHO3/mQ/N15h4xLRIBuWlAvMkGUCEfJMZ61vhnAGN
	eqyA5Y0xIGMA+npCOHuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gobXZ-0007gB-VG; Tue, 29 Jan 2019 22:07:33 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gobXN-0007Tl-IG
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 22:07:23 +0000
Received: by mail-lf1-x143.google.com with SMTP id v5so15840535lfe.7
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2019 14:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwEn0VUPS4yAlxgmTug+AiutfS7qN92R/nvx9mRbZLQ=;
 b=LV56v3ZJtNMapUVJhJjd90Xe/pdDorGpzaXjijw2w8VX8dNOVV/daVcRHdth8W8scq
 0xtXK6QvfU14ya7vh0aREsE5gBIpBqe4AcWDBSeI++Sf555QFdCZulXjkZyThjEcNMvs
 iyDxyTIEh6u8JaJJjXeRMHr0YGgSsssIIiPDQIPAlK+PkEHByrEbgngakRkNRHmf8Hyp
 XMOPl7KNNmhw1svczcrSBiSjpa7WiIbzJqxQpm+WYl5ztRj8OB+yxS6TBjObHGWjoOhl
 OEHeqGHkCxhCz2+N4k9oajG7lT1ZR6qbj24KIiCjq//oFKK4gXX7OORaL6waUYOairE7
 Vkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwEn0VUPS4yAlxgmTug+AiutfS7qN92R/nvx9mRbZLQ=;
 b=tXxOlvBADAKDrIXuQiCR00RVX4PK7RXQXxzU4RI944vfqCBiYhoyI2IXaZtdWmQ9Gq
 JsXpHvIJKfZNNvrJ+COnOrsaPj7amOeDOOdkp1R3pRx4hCJ4EPz+zqAz9zRYQk10IyEB
 pmaW5Zq9WT1yP7t6j7TKbtz91OPZB8yyIw/fZogBuJWmxI15H4tuhQ4qE4TZ+5R7ROJS
 d9BHj/Enmoc4kp2L5ZImAuMpt+vX8fKgryYlhYqCH36dgTZNQkRyq+Rz6e0YtQDs5VvD
 ZXWM+Z9ft5hoIlHrhVBkWQbmRH50WdYrJmYGtWkHmKZQJR4fZpAfloNqMTPsbpve8ZyG
 qRGw==
X-Gm-Message-State: AJcUukfG83s5UUD4P63/Qzs7yxQ1ff5dR99oedwp6zET5Q7soNq9gTCd
 YJ8sYZ0q8ZB8G+iwDKZR0e3KUyHT0fk=
X-Google-Smtp-Source: ALg8bN7g666bQTYd4tGRVQyvIxegbQDFxDWxxKzgbptYm6qv4wb1tr69+fKHH0aUBEsFyhg2Mbe81Q==
X-Received: by 2002:a19:e601:: with SMTP id d1mr22955699lfh.71.1548799639039; 
 Tue, 29 Jan 2019 14:07:19 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id c15-v6sm3821045ljf.76.2019.01.29.14.07.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jan 2019 14:07:18 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Date: Tue, 29 Jan 2019 23:07:03 +0100
Message-Id: <20190129220705.5143-2-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129220705.5143-1-jonas@norrbonn.se>
References: <20190129220705.5143-1-jonas@norrbonn.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_140721_669364_78AA6634 
X-CRM114-Status: GOOD (  18.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Jonas Bonn <jonas@norrbonn.se>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The status register bit SRWD (status register write disable) is
described in many words in the datasheets but effectively boils down to:

i) if set, respect WP# when trying to change protection bits;
ii) if unset, ignore WP# when trying to change protection bits

In short, the bit determines whether the WP# signal is honored or not.

It's difficult to imagine the use-case where the WP# is connected and
asserted but the user doesn't want to respect its setting.  As such,
this patch sets the SRWD bit unconditionally so that the WP# is _always_
respected; hardware that doesn't care about WP# normally won't even have
it connected.

Tested on a Cypress s25fl512s.  With this patch, the WP# is always
respected, irregardless of whether any flash protection bits are set.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
CC: Marek Vasut <marek.vasut@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>
CC: Brian Norris <computersforpeace@gmail.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Richard Weinberger <richard@nod.at>
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/spi-nor/spi-nor.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 13a5055e5f3f..4c8ce2b90838 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1231,9 +1231,6 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask & ~SR_TB) | val;
 
-	/* Disallow further writes if WP pin is asserted */
-	status_new |= SR_SRWD;
-
 	if (!use_top)
 		status_new |= SR_TB;
 
@@ -1313,10 +1310,6 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask & ~SR_TB) | val;
 
-	/* Don't protect status register if we're fully unlocked */
-	if (lock_len == 0)
-		status_new &= ~SR_SRWD;
-
 	if (!use_top)
 		status_new |= SR_TB;
 
@@ -3898,6 +3891,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
+	int sr;
 
 	/*
 	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
@@ -3933,7 +3927,14 @@ static int spi_nor_init(struct spi_nor *nor)
 		set_4byte(nor, true);
 	}
 
-	return 0;
+	/* Always respect the WP# (write-protect) input */
+	sr = read_sr(nor);
+	if (sr < 0) {
+		dev_err(nor->dev, "error while reading status register\n");
+		return -EINVAL;
+	}
+	sr |= SR_SRWD;
+	return write_sr_and_check(nor, sr, SR_SRWD);
 }
 
 /* mtd resume handler */
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
