Return-Path: <SRS0=nDBX=5X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D54C2D0EC
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2020 20:39:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0112074B
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2020 20:39:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LbBpuxJW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="HiO9K4BF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0112074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lxqu3a1p2d3LW3w8/VPAuRT5Mln1mH1s3W/omeJXFSo=; b=LbBpuxJWXkuU6o
	6bblgWGyZkhFI/1FE48OVAMgzSsDXYMTvfs72r8cx/coa/GRaxtkdwQt2liqE3spc8ONS/IQhYuD+
	hBIhl+sijdHAxKgPY3vsZTJV285vPRcgpQI5kxvwM5QsAxAEtQhFj66FrRvmYIehQUGecudOSEW/f
	3S0GcX5NxmMVViVAmejlVV0W7/TuELhVErhkSx58Dpk/1qkEF3wzggYOY7kj/4hQVXhBs840PYHai
	+HE8F8qMQOm0tGPaQ33SSgBGlCAtpo55/y0X0/3d54Bi6FfymFKrNSkDC0lv24AJeNazfs0XZm3lg
	U7UuvKHn4w5lxutmWNeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLv0B-0004BN-FZ; Tue, 07 Apr 2020 20:39:19 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLv08-0004Ax-MP
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2020 20:39:18 +0000
Received: by mail-lj1-x244.google.com with SMTP id g27so5214805ljn.10
 for <linux-mtd@lists.infradead.org>; Tue, 07 Apr 2020 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=VPY5v6ZzgWualN0qMBfGuP3SYLv3vPSOU4crA73tm3w=;
 b=HiO9K4BFLHWwvLnRHg9zS5FwhSPhKSZ6M2E2G/0O/PU2d3zl90DcMJGNGd8h5FogZE
 iMpeYt7pqRemXwGpxiKB859l+PLj1w5yW5oFQNzwKrOsJ0mb7pin3So3rlFYIhjN0J0h
 WZ+SmNl3LwZQU7StJePmCN7Z9XnY0Aow1A1MPjouT+otT+tqT6RY8s3aqE8b+Wa67nVs
 k3okDueoBQU72nzS+gv/wz4U1xDkm0a6THZ/8HNfsWmaQuBa1ozEOEhMjtMTy2hJ9OYl
 UlOb+OB4JavZDPQgtaLLcyDADbzFoLLRBri1DuTcQZ3jnpzVk6GXjkUar0S4v3Fp8Vk+
 mVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=VPY5v6ZzgWualN0qMBfGuP3SYLv3vPSOU4crA73tm3w=;
 b=pxvOMgBBFqI8/K7o2jmY+hI6HvIjDyqs1m2bwis4L9sxtvuRWa36V7Kj+eOGENbYdz
 UxzEbBsTOiiRf0RBkg6fvSAMwrVkLw0dvXtRSgh6/KbMaiV/QhykmM5lb14WhKPqP/QI
 DSetBkObYqAxtxEyI6IdPrKd4aaqQB6h3Ui13XFB+FGCpnLaAhu5nzrvByKFtMG68NWc
 X9skcUT0QI810v2mlKSczP68v7B4iVvm+xY+dPHz1j7y6AO1MKVA3tDks2tNMMt7mjNp
 sGxHzWRjJMfyMTsgRRZo/47hMiiE9AVk9AiH4uZEvBkQfUl9JpEByhR91dEb0pEExRmw
 riCg==
X-Gm-Message-State: AGi0PubrE5Cdcgp5dofn/3BYxGR6wUtPa67jmgYoXy28i+MihBiC+9oh
 FJ4X4i//fN/btVY7XdVPP/V5qg==
X-Google-Smtp-Source: APiQypKDcGAJSrXRObbu/sFG2pa2RuDQnxfFeWqSuvZIMLtKm7au96/enK6YUxqLpFnQEGqFiBuKTw==
X-Received: by 2002:a2e:b0eb:: with SMTP id h11mr2877180ljl.85.1586291954440; 
 Tue, 07 Apr 2020 13:39:14 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:44c8:4ead:6627:2c4b:d1ac:b6e2])
 by smtp.gmail.com with ESMTPSA id y29sm12345765ljd.26.2020.04.07.13.39.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 13:39:13 -0700 (PDT)
To: Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mtd: spi-nor: move #define SPINOR_OP_WRDI
Organization: Cogent Embedded
Message-ID: <a191e8f4-6953-4c84-6e45-204dea079bd7@cogentembedded.com>
Date: Tue, 7 Apr 2020 23:39:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_133916_884960_DEB4CAD6 
X-CRM114-Status: GOOD (  14.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The write disable (WRDI) opcode is not really specific to the SST flashes
(anymore?) -- move the #define to the main opcode group, just after WREN.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is atop of the 'spi-nor/next' branch of the MTD 'linux.git' repo
plus 5 kernel-doc fixes posted last week...

 include/linux/mtd/spi-nor.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/include/linux/mtd/spi-nor.h
===================================================================
--- linux.orig/include/linux/mtd/spi-nor.h
+++ linux/include/linux/mtd/spi-nor.h
@@ -20,6 +20,7 @@
  */
 
 /* Flash opcodes. */
+#define SPINOR_OP_WRDI		0x04	/* Write disable */
 #define SPINOR_OP_WREN		0x06	/* Write enable */
 #define SPINOR_OP_RDSR		0x05	/* Read status register */
 #define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
@@ -80,7 +81,6 @@
 
 /* Used for SST flashes only. */
 #define SPINOR_OP_BP		0x02	/* Byte program */
-#define SPINOR_OP_WRDI		0x04	/* Write disable */
 #define SPINOR_OP_AAI_WP	0xad	/* Auto address increment word program */
 
 /* Used for S3AN flashes only */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
