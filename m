Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DB1C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 10:55:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03A3820881
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 10:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s7ldjWAH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="yWcsLctJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03A3820881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3hktHWszNWIDaSA+1fKevm0r9tyZFVJ0L7s3rVx+bLg=; b=s7ldjWAHkNfWjI
	ij/sT4g18qdgo4GpiUc5IfENMvkGEn4EVFoDWwG30IbePZxVTj2VhlvL2yox/5kRG5GMPxYextIws
	zX2+U+r29sAcSXB5ASyS7okKVntTOOWpBxNIQvU36rZonP7TPsYyOlLjGd9uMYNhEjiT71IW+kvqy
	zy1xtiKj0EKrb2uRyo1ixs2XQ7wdWmuqtI02INWYjBLY5+KrujIZP+nNf8SrNPG8v/EKfaQfGQZH8
	zK8th7n0+KbJWl6+N5GEz6Wf+uDQkQvCDxMRLF46BBC0XHoOFQGMBLWeX4g7Ro9DOZ6NVW071+EM+
	zRcgMmpYHgzoo8Yx78bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmz8n-0006Kf-Qy; Fri, 25 Jan 2019 10:55:17 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmz8k-0006K4-6h
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 10:55:16 +0000
Received: by mail-lf1-x141.google.com with SMTP id i26so6642569lfc.0
 for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2019 02:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/bqEREUNQF0lnHixYiWX5TuONOArgR+FJLmGNjXRqiU=;
 b=yWcsLctJT6Nb5vAUj5CbqC4ha9zM7VOsn0uD61e9fsWQ+Q8wkOEY6SJ5TbSSA38Veg
 GlxTyFYmsR4slBR8o4SxPtPDI/pSg8OKq5yuhOY+gvYLgZv/xuTfpcVVqS8tVe6zyxkX
 nwWjryJLF+d4vCkYfRL5zcmKhPv5SK6SEQqUpjsK7ckzNCPwmN0sNBa6s92ujZjP3V25
 uYqa7t+EF4iqk2Qz5myQ8FUlxW/23TTdmccnjA9R42HHy9d3Kg9rnTlfHUdyuxOtafR7
 ZVq0PVmha0DxF+vIDCyJ8z4in5ALZRaGqdn39XNOooxJN6fzk2cdoD7hNLnl+egWnewO
 6e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/bqEREUNQF0lnHixYiWX5TuONOArgR+FJLmGNjXRqiU=;
 b=LorhAixQnmVXr0BQALQZHgY/x0+/e6IriugtpzANVnm46Kxmlw/rsmYK1oYkgtkoUJ
 fRE28z990/jhkgKBVPgHawfE1jg+vp6rIKSLDbk/cpzZCl+aevuNbCSunOCh3+jBRWM/
 zIpNdoY5j1PlY5LP65AqOyXlYsKX480oEVAgBpZ3xDoOljqksz9Yq7FCg2UwJS4xuvFT
 1b2wwYzIGk8rXfaxuMb/rGq2XSdpJIRtsUcJ8tRkOEGZrE6oSKh2LUJ1JrOYNVatNPCk
 bTqW/lDmUnDa0G/7OEhq1K5JS1kGhAcOUlBccgPrEV7+Fu4xKMMvsNqRwe/HYxdP6S3n
 PshQ==
X-Gm-Message-State: AJcUukdOWvCLtEapTVcE47yv9d920C5+nVmbkPWXpYs0tf7TRdykYU6O
 vsXIEIvN35npYSpwebakT8maew==
X-Google-Smtp-Source: ALg8bN72lQAgHijsMPAXbC2JYyfDqOKTT6xpQcEFO/wNyj/7XjyWuoyJNJGMFoCGeV4abP8ov4cz6A==
X-Received: by 2002:a19:5394:: with SMTP id h20mr7964276lfl.75.1548413711504; 
 Fri, 25 Jan 2019 02:55:11 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id a62sm1424257lfa.37.2019.01.25.02.55.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Jan 2019 02:55:10 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] spi-nor: always respect write-protect input
Date: Fri, 25 Jan 2019 11:55:07 +0100
Message-Id: <20190125105507.2733-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_025514_301715_04F38AC0 
X-CRM114-Status: GOOD (  17.52  )
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
 Jonas Bonn <jonas@norrbonn.se>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
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
 drivers/mtd/spi-nor/spi-nor.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c6064479b614..c960c097e0bc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1230,9 +1230,6 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask & ~SR_TB) | val;
 
-	/* Disallow further writes if WP pin is asserted */
-	status_new |= SR_SRWD;
-
 	if (!use_top)
 		status_new |= SR_TB;
 
@@ -1312,10 +1309,6 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask & ~SR_TB) | val;
 
-	/* Don't protect status register if we're fully unlocked */
-	if (lock_len == 0)
-		status_new &= ~SR_SRWD;
-
 	if (!use_top)
 		status_new |= SR_TB;
 
@@ -3918,6 +3911,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
+	int sr;
 
 	/*
 	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
@@ -3953,6 +3947,16 @@ static int spi_nor_init(struct spi_nor *nor)
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
