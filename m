Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD27C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:16:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF1F02184E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qgLAhjoM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="ypmR7FV0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF1F02184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMlEiCu+6bw5KBTYBL9vxpmEYxqNC4mIrK3TAp/Rcmc=; b=qgLAhjoMCaqWqs
	JsQ/M2BD/flnqQcGcrCozLiYRqNV1Hwq1ym2+rawqyK2497NB8r/HX5WVLNmfR/yAL8WwQkiYmv1r
	Zk+G47c9JBpFNLEai/FtF5lA9bffRjjBsrWliXpLzx4mIeOdlzWuirPQtXdj5cn5pl+ov1QZD+Abj
	cLYGxZD7hBhyA0OlTbwOup1Qv8o2khKWRKgxakUaVMls551Z2HFb7LEHIN6nE/3TBc7hrrtceRPDx
	Yn20BhSWCwX3nNnIOBiXUJW0xFV6KoI8IOXbAqql2XTQygTsyCqQiQdbopCGnh249WZqAXCw6gwr2
	aVCLNdeoV/AkcbAa+TGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6VSW-00089a-K3; Wed, 20 Mar 2019 07:16:20 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6VSN-0007zy-C7
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 07:16:12 +0000
Received: by mail-lj1-x241.google.com with SMTP id v10so1296868lji.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2019 00:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SDcucLpKy0HETn4RIW/Rbo5BGUYk8Hlk+vbBPciX9hQ=;
 b=ypmR7FV0ELbSakiEXj6cp1UesFMkAz1U3m35k62m+2CU8VpZgvypYNhDJKzNiGbV5G
 /y8cmSrGYEwDvRygf9Uv68MdZcd7Tis/uoRyU6vuon/bewe9leOHu9czCl1l/JgMCvI+
 CsWLRDsZs1kE4k+F1BHIKjRvpyaVjR0TsdQ0fp+k0M8aI/FXumT1w1D8lc0g12rtocTK
 BlmzBVJsT6YC++EVNIZ2e2W2fMUmWq4SfTWm2H8vATE7naguPRFucIjlCD2i4KEBYZsc
 Sj9GEXPhmLPui/ToyrBflTAyNmfHUmASckNBeJQtQf8nnVpDor5as0VZVqtu3opwjkWT
 6HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SDcucLpKy0HETn4RIW/Rbo5BGUYk8Hlk+vbBPciX9hQ=;
 b=n3eSLwpT92MdqOTyXKpI6Pk0OuglZgLAzCAmNgDFMvgScq0UJ0F6TY4DEbao9Ly/Xh
 wyOXiDQAE0Uxvp8Fm4T0tiV9UjUwCTtk+mjzVbv/Ha+SXFT2QnT8yia+2B6bqRxeQh9w
 oBRYk7O4VYzUJsP5v5TTmHK1kOHzoHtXlFyrHlxIeciFnXppb12yDkUTQUpUKlq7XTYX
 TzIk8MALPbLcbqFin+4Pukz1rEGdO+hR1mqCJ0HCO7oVo2ADDLJH4xeFRCi9YyzVAe2G
 nM/egwlvPREKHHnszLei9YIRIrklKi7RZ0PY6PZhq4IL4pbkbfVFb44+Qz7lVfJJcuv0
 aoZw==
X-Gm-Message-State: APjAAAXRp2VWmAD1egDicbzlL+p5wRQVvynHwh/SDk6s4vMwQxKsK6gA
 i6mMCgqGjzk1KGGK5seyOHQFzbFZ3IM=
X-Google-Smtp-Source: APXvYqwX6Y0ms+rWxy2Hc7/24axu8AQ1h9XMzvbtQNr1FvXI3SwHY7Rb7bdbc+ySgpe3G5mNEah04Q==
X-Received: by 2002:a2e:719:: with SMTP id 25mr16213139ljh.122.1553066169115; 
 Wed, 20 Mar 2019 00:16:09 -0700 (PDT)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id s14sm217243ljh.0.2019.03.20.00.16.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 00:16:08 -0700 (PDT)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 1/3] spi-nor: always respect write-protect input
Date: Wed, 20 Mar 2019 08:16:03 +0100
Message-Id: <20190320071605.4289-2-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190320071605.4289-1-jonas@norrbonn.se>
References: <20190320071605.4289-1-jonas@norrbonn.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_001611_412366_3105A8A9 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: Jonas Bonn <jonas@norrbonn.se>, tudor.ambarus@microchip.com
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
---
 drivers/mtd/spi-nor/spi-nor.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fae147452aff..0cc0ef4fbf3a 100644
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
 
@@ -3909,6 +3902,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
+	int sr;
 
 	/*
 	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
@@ -3944,6 +3938,16 @@ static int spi_nor_init(struct spi_nor *nor)
 		set_4byte(nor, true);
 	}
 
+	/* Always respect the WP# (write-protect) input */
+	sr = read_sr(nor);
+	if (sr < 0) {
+		dev_err(nor->dev, "error while reading status register\n");
+		return -EINVAL;
+	}
+	sr |= SR_SRWD;
+	return write_sr_and_check(nor, sr, SR_SRWD);
+
+
 	return 0;
 }
 
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
