Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15B6C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 10:43:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54258207BB
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 10:43:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lSOibpUH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TlSyaj05"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54258207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U3tQ5w/xzx8jy0eZkitoCO5oPdkYycLaaXa6j/+Z5lc=; b=lSOibpUHcRllY2JOx/EIe//1q/
	nZS8Lz6vp15eFAoGtX1qju8okFhuuAoLpSuu/ZpJyNAuBFk34LyD7K+K7N/ydsiShCpsbECJ4HF5Z
	A5py3m9xaPHmPbb8nqCyTyvbruONYsB/ajRyAfCULg8i17QTqGcGclw1hG30AsCg8MS5BNQJwKlD/
	+hIb/sAQvfxwnRhj4nEtdTrBPFYiL0N7DkP9M0WrM1sRbhLK8EBk9HN5byz87xkSERYuCceDHA2qJ
	1ZdyQ4+Zxd1ygioyz5MVeKptv4I+F58XBWcFZ9Gs9ZlPpPEtjHz1tQ2vlWcNK1sN0zY2AlQCh4MJz
	aZ/PnDkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHlx6-0000Hu-CI; Mon, 14 Sep 2020 10:43:16 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHlx4-0000Gc-2b
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 10:43:14 +0000
Received: by mail-pf1-x441.google.com with SMTP id d9so12294823pfd.3
 for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2020 03:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mShHt/IoIdL3zeM5kIPVohLF6OMC2OmAiOHFn3/ncho=;
 b=TlSyaj053NENZSrfv+oka1gshBooRj3AvapgIi6QCWmTwNyeTmetK9vMsLNNR+ozXy
 RbmBxz5ox9jH88LJ3ApAYjuFI64eDX9X0KVSqUriSwv3whAWQViYjJgECAfTT5Qvd9mm
 1DEsN4dJPRGvJPUq32DgY1RL3YWVtSBZ2L2U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mShHt/IoIdL3zeM5kIPVohLF6OMC2OmAiOHFn3/ncho=;
 b=AUbi8HL5UnhY5xUptx66xRnOOxr72VDTPKXVHE47s2LUEO8oQOjGkY8Rj/MHhJ49Ud
 0I5nvM66/9Ye8XzAqC/C16SpW7j1nohRyRPAlw7yQmb+aLlMhAEtnuiD43SOvnqY9RRp
 L0Qdfhf5LaKT3FKm8X+Q0hIzEF+b1eUQM/qzDRhpiuzqloHgLzLqf11ckfmBodP4sVlH
 XM3qa2t1URihWLAf4qwfkJS92cvHKhe90VsYl8NOYCNV18eLDbSaKxfAlx8Fl4C+jUIC
 IUji55qQHjGHlEXRtlG4Qadq3UhV09EhOLFqbWXT/LISWwEMKISaQHnm2CVDXHTz9Kg9
 +hQg==
X-Gm-Message-State: AOAM531P4GP/FnRgVWJHafVmmKraEEjVQzRXI1TAoVYs0xQYDpSeI/oV
 rEpeIJfML8/zoVEMJkf4zyEsdQUpwGC+yzBL
X-Google-Smtp-Source: ABdhPJwg/lYdcj3OZVybohSNYV5EFYCt8XkCIyDkfaxG2ud8Xq9uxHY7E0+aNG7IJevg90qa6w/6PA==
X-Received: by 2002:a63:5d09:: with SMTP id r9mr9667453pgb.397.1600080189654; 
 Mon, 14 Sep 2020 03:43:09 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id j11sm8090881pgh.8.2020.09.14.03.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 03:43:09 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4] mtd: spi-nor: winbond: Add support for w25q64jwm
Date: Mon, 14 Sep 2020 18:43:03 +0800
Message-Id: <20200914104303.830795-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_064314_146955_986EACAB 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 ST Lin <stlin2@winbond.com>, Xingyu Wu <wuxy@bitland.corp-partner.google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ikjoon Jang <ikjn@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support Winbond w25q{64,128,256}jwm which are identical to existing
w25q32jwm except for their sizes.

This was tested with w25q64jwm, basic erase/write/readback and
lock/unlock top and bottom blocks were okay.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Signed-off-by: Xingyu Wu <wuxy@bitland.corp-partner.google.com>
Signed-off-by: ST Lin <stlin2@winbond.com>
---

Changes in v4:
- drops package type code from name

Changes in v3:
- fix commit message formats

Changes in v2:
- remove duplicated flash ID (w25q32jwm)

 drivers/mtd/spi-nor/winbond.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 6dcde15fb1aa..e5dfa786f190 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -63,6 +63,15 @@ static const struct flash_info winbond_parts[] = {
 	{ "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64,
 			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+	{ "w25q64jwm", INFO(0xef8017, 0, 64 * 1024, 128,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+	{ "w25q128jwm", INFO(0xef8018, 0, 64 * 1024, 256,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+	{ "w25q256jwm", INFO(0xef8019, 0, 64 * 1024, 512,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128,
 			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-- 
2.28.0.618.gf4bc123cb7-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
