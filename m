Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C1FE98E10
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZ1GyQi+ZlisK8u7pX3BNn0JGAF0UouWf1wDYR4Vlzw=; b=lqIS27QcvKJjNg
	bbCLA+Es95qrOiOjhBRsKasXufay2BCHIE6mluFwWv94Oi+WTIviRWjuMzeYf7/f7iabVvD45frdK
	+ye5INI2WZzYbcZd0z0S8iz8GCzPC8ArDcd3Q1UFewVmdF2K77tjze8vixPErjGvSGwLJ9IU8BSj4
	0KGL7npRB6HUtaHNo5ESkq+0t5wMPk6y6bbVDQwQJ/0V+gqgHzE3PA7nuD4TkRVtqZQ0WgNsaZlmr
	WgR3t7ZkG5BKcXtQpA4yDVxTVpGGdPPNoQnUWxmIozLDVDrwwTo1RW+Imcju2HdKYkG4tb49Kw7ho
	mWgVMWwEYr151aLtpp5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT0g-000000001gv-3epW;
	Mon, 23 Feb 2026 10:17:50 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT0e-000000001gD-2xP9
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 10:17:49 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c626bd75628so1437142a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2026 02:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771841868; x=1772446668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68kFT9M+v1YFr8fLxiUdg7OyCK95BGAep7GJPhPQZJ0=;
        b=K9/sletzmHYdX5rRCnAKVYG2jlTRzDCz/HNWlHg8zKw7kFvuB1J5yqViIQNE3b6ZDw
         kLqcZpYEeZaeAcxHjmherYhdsvngRXDrCRmHM8RU2qa1G4c+ZwZGjPXQuRlwVX2xY7Mf
         o+1iXU84DVy3zl0fVaYJ4w+zMnGo/WKS0yOTQDEwNNrPogJXLMawz3AtfHNJ6tMuyDhL
         VrvZDzoYHQTYQzdZ4bPYHIV3RX8m8AbHMuylrSCal28WGmo9gUNcTAA40UEENGCo0H9Q
         7hpWp8vfEau2nsNW+4XdjoCwU/cIbh9bYgVy9Gf5jRDdVqgYniVy+pHmojCxkPlqaql5
         dGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841868; x=1772446668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68kFT9M+v1YFr8fLxiUdg7OyCK95BGAep7GJPhPQZJ0=;
        b=DBpV9XF1PXXp0o6b9/IV8YZoJTHX6/SrMKuVnBg10na/j7PoEaUa02ily1XtTmR6sR
         Y4qrMqIpYafOU49S6ivZPdOymw2UDpLak0k05U2tmWfWbTcXMxe1gJWOEJZbtLpGKVLm
         Hzar+78Hc9NVp5rWp3bcBzqJOSVi7iC0LSSaryT9bN87fR+KImnMzhPldzpkZkklloWo
         uVVP66F7PP6eeYJKfDamQXkCMmHDNGRKMLZW8btnVdDPOu8NsGGQepC71TG9fqMNh0ia
         lbUzV7bYVJzGDKtmK0xzLMBhGe3TuPVVjeJkKpbz1HFRNV+Wd7+HRl6AAdyUlRtQA8/y
         Q4UA==
X-Forwarded-Encrypted: i=1; AJvYcCV4foaFgJBIvHX4sVkuyxdvgvqYh2SUtvymnt9maOR7ke+k+4obLEUiwcitc8tQuDffgu8ytz5IVmo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxao5aIlH75hfnhHk1SQGN5/QjqPA9wAFVPnZ3r8fgrIRp02V1
	/cxhgnvhNQ2bYQG+tlkCmdSjmhT5tGd+8BGEucHtqWdoNa67nD2S4yWL
X-Gm-Gg: ATEYQzxu6d3ojScBr0enF1ZADVoJHP8BXsR/8Wmo8mdx9e9iGTYy3DBP3PM6z4qLSfD
	5J0aFt3VFjbTafy8BzRkaVBP2TicLNa//un/5WdENonVOBTZthZOjZ7aEQi14oM/8nAtWPR4MLw
	Ic6eiQhHkHlfJJslh4PkONTj6WYuqNd7RmfTTAnSk3MYpNKeqda5cd4BfMwKJuKPRzZ5cz11gm6
	axNqRkUE3ARCgIWF2ICC+gYCSddQ07buEVx4k8ceQRwBiYto8KzdmKqzRI5ABvt4BMcflfK0/BO
	ZJHEpPdpPFVwyZCg5aFLlF/2SyP2lmPH8uJw2TKVvBTV7EDLhNtcrlqOdgvtyylukSFIpcvnPhK
	vGjC5KtxLqZHBpNjxCPHl332y4ScOfpwBim/GJVtoU5AjyxzrHh5PHdBKsIbwuI1SNmijKdoNX9
	IXhk9uPo7Q3bzQozMQau03nfCsFXa69JJhyM7ZjkGC
X-Received: by 2002:a17:903:2c05:b0:2a7:d5c0:c661 with SMTP id d9443c01a7336-2ad7443a1c0mr70941425ad.15.1771841867797;
        Mon, 23 Feb 2026 02:17:47 -0800 (PST)
Received: from c6dfb3cc7c9a ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e3425dsm66574795ad.16.2026.02.23.02.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:17:47 -0800 (PST)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: mwalle@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	sanjaikumarvs@gmail.com,
	sanjaikumar.vs@dicortech.com,
	tudor.ambarus@linaro.org,
	stable@vger.kernel.org,
	vigneshr@ti.com
Subject: [PATCH v3 1/2] mtd: spi-nor: sst: Fix write enable before AAI sequence
Date: Mon, 23 Feb 2026 10:17:17 +0000
Message-ID: <20260223101718.89-2-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223101718.89-1-sanjaikumarvs@gmail.com>
References: <20260220094236.28-1-sanjaikumarvs@gmail.com>
 <20260223101718.89-1-sanjaikumarvs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_021748_836623_3915704B 
X-CRM114-Status: GOOD (  13.68  )
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

From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>

When writing to SST flash starting at an odd address, a single byte is
first programmed using the byte program (BP) command. After this
operation completes, the flash hardware automatically clears the Write
Enable Latch (WEL) bit.

If an AAI (Auto Address Increment) word program sequence follows, it
requires WEL to be set. Without re-enabling writes, the AAI sequence
fails.

Add spi_nor_write_enable() after the odd-address byte program when more
data needs to be written. Use a local boolean for clarity.

Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
Cc: stable@vger.kernel.org
Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
---
 drivers/mtd/spi-nor/sst.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 175211fe6a5e..db02c14ba16f 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -203,6 +203,8 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	/* Start write from odd address. */
 	if (to % 2) {
+		bool needs_write_enable = (len > 1);
+
 		/* write one byte. */
 		ret = sst_nor_write_data(nor, to, 1, buf);
 		if (ret < 0)
@@ -210,6 +212,17 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		to++;
 		actual++;
+
+		/*
+		 * Byte program clears the write enable latch. If more
+		 * data needs to be written using the AAI sequence,
+		 * re-enable writes.
+		 */
+		if (needs_write_enable) {
+			ret = spi_nor_write_enable(nor);
+			if (ret)
+				goto out;
+		}
 	}
 
 	/* Write out most of the data here. */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
