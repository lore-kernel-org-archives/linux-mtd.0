Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12A0C4167B
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XThMUGp8IB2j8bMSZPV8xRqdn1agD2bFEXpscP9O64E=; b=28aN6JJ+EO4RQE
	JbBsJXWgVGqsPS2jaOsy5EFG3NG5iiijwCd58rgcGpT4j8YKv0PxL1G9LbXdnlDooju02hDaaYFce
	RrkBvpnUeXivQ/VpMl8wSKKrGntqHcxuU8ziR6Kf41cwfjzsCEA9MqHrPYXmDZ2Zr8F/bj8vxk+6Q
	RU900MiByQ+Cu6ejTkG9CJTRd6iExuGkkdfD32gciwSkziqufapJNz0ts+mG4lf/RvdLiquLLmbxn
	34gFY5/6Dlt9nINmYPwIuU5AbtqnFhdBNVUBCNME8LFf1TuXIslnhGJySMbEXifNe5UHZJhG1aPFM
	PawvB3czTMNJMAoM+NYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13AG-0063YP-17;
	Thu, 09 Nov 2023 11:25:36 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13AB-0063Uj-0b
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 11:25:33 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1f0f160e293so438672fac.0
        for <linux-mtd@lists.infradead.org>; Thu, 09 Nov 2023 03:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699529129; x=1700133929; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypE+Qzvt1gTVx9DZDy2dJJ+msX4RkhEYGySvFwz3Rtk=;
        b=Q7Y5SRLItTsoyAxhjjp3e+GIJU0ZtjoJF+ClDHG5DjzCka9Vj/8W8hA6TfsR5W57LE
         rIAdgLryluN7lSUa3xx6uTJT+VB/klemFV7tjR0jX+0moSp9z+a3HsRZhJGiTSXmhMdJ
         6BT9YjRpZpcW9MG8iASgJgMJkb6FUNA/rxWTxrMlaSTUswJJA4VeGabQberV3QCNZj/D
         NgdLcoxyHZdHTLGzb+dUCpHGJwuiB+ejACYdf1KP7wQfoN7+HUm4mftTRIN70to1bdZT
         /1mkMJ0dIzUaYOUFRvvUfqESZEYeQ0VKGnqL9FmTELp+03a3HDf+hTrEvS6iE7TzbErq
         fuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699529129; x=1700133929;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypE+Qzvt1gTVx9DZDy2dJJ+msX4RkhEYGySvFwz3Rtk=;
        b=qh9t0rgFhLwncjLG2x5W9CeR0NJeOMZT0RW0TJrbNyo7+5lDtfeJ+b2DkcHC0ZbtUK
         kuWmwe6O3rFLKfh62vio8zaHFK4VWW4ogsrtJeXfxFWRow/47hNNG9Z9kWVvwuG/8s9D
         YIbnwKKKFewnZfbrm1YMw+4hb++7MjTHKamlz1AettixG48KTRLBQ2GrOQLL8kefkArf
         EGkdm7sGpsHZJJi1KDrLb9zii7rlTCRcTxZMlfUwYGOMULIvKgx3za7OINKdr9Mrg7qy
         t9Me58FirXrf2lmDgzE/4+tyap9oTHSIbTRpFWJM9jmLr2G7CMOf5mQ2rb+UPJEeVDUc
         ZsKQ==
X-Gm-Message-State: AOJu0Yzn/tVwAQEe10jfI59ICrLyWcQWpZR/bwJIS8RcdNlE9mI39Qh8
	q5vQn+Na8aG7nwlKoXB6uhuIFTd27Qg=
X-Google-Smtp-Source: AGHT+IGkfRwcoNspq+YllcJae0kcoegnaVUYs8mFjq8oEAEaLhfiVwHx2LVjpsCt/x5TYZhypy3HNw==
X-Received: by 2002:a05:6870:1049:b0:1e9:bda0:771 with SMTP id 9-20020a056870104900b001e9bda00771mr4132854oaj.4.1699529128834;
        Thu, 09 Nov 2023 03:25:28 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id y36-20020a056a00182400b0068790c41ca2sm10455953pfa.27.2023.11.09.03.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:25:28 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
X-Google-Original-From: JaimeLiao <jaimeliao@mxic.com.tw>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com,
	angyanyu13@gmail.com
Subject: [PATCH v3 3/5] mtd: spinand: Add continuous read state
Date: Thu,  9 Nov 2023 19:24:58 +0800
Message-Id: <20231109112500.4966-4-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
References: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_032531_230398_1DCB62EC 
X-CRM114-Status: GOOD (  11.02  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add continuous read state and initialize state to
default false.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 8 ++++++++
 include/linux/mtd/spinand.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index cfc295f5e31b..33ad401d3a34 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -193,6 +193,11 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static void spinand_init_continuous_read(struct spinand_device *spinand)
+{
+	spinand->use_continuous_read = false;
+}
+
 static int spinand_continuous_read_enable(struct spinand_device *spinand)
 {
 	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE,
@@ -1307,6 +1312,9 @@ static int spinand_init(struct spinand_device *spinand)
 		goto err_cleanup_ecc_engine;
 	}
 
+	/* Init continuous read */
+	spinand_init_continuous_read(spinand);
+
 	return 0;
 
 err_cleanup_ecc_engine:
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index bb9288ffd898..263420b2338e 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -422,6 +422,7 @@ struct spinand_dirmap {
  *		because the spi-mem interface explicitly requests that buffers
  *		passed in spi_mem_op be DMA-able, so we can't based the bufs on
  *		the stack
+ * @use_continuous_read: record the continuous read status
  * @manufacturer: SPI NAND manufacturer information
  * @priv: manufacturer private data
  */
@@ -450,6 +451,7 @@ struct spinand_device {
 	u8 *databuf;
 	u8 *oobbuf;
 	u8 *scratchbuf;
+	bool use_continuous_read;
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
 };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
