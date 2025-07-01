Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F259C8303A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jul 2025 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fPY4h8Rq4q4jztD0RRx8W6Jk4eeMNCpBx3rg2g2coAk=; b=LQUZdXHZhmm5Fp
	V+UeAEY+L7WMLjIHNPmrSRp3IblTcU9m04nkLfU4JccBzzcqX/1lG0qTaFKtBu1RnMk28fY2e7rjn
	QkaYWJyKBd8pn5Snzb03pVLgLd25FhiGZX8gKx9WLUNUMR7X8U0YoYjXXbuOOy3tIq2Bw5xwzhOdy
	cJ065Rcs7klk/hfn3pTIgHE+2qzsr2Rq/lmef5Jmb4OVuevD6T+g7kN6IUaV5tRHXdVHndTK4+uiM
	7zskO+1VpUfZkxkmvcNTspQC34IyXR7saSofn6FGAd8qK1/8Qh2uslVHlVgl+ZEC7J9wVjho0YAg5
	o6YhWgm2xjaIEilsd/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbDA-00000005Y1m-3tew;
	Tue, 01 Jul 2025 13:39:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZag-00000004waL-1P1j
	for linux-mtd@lists.infradead.org;
	Tue, 01 Jul 2025 11:55:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso696128f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 01 Jul 2025 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751370957; x=1751975757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0crR4urJGV/Fg0thNgQt+VQTmzooZUpBcqRvRqhXIEU=;
        b=W/4IEMJivNUz73DF9TdGFzUiMQuhS8SruXuLo3VOXfMJ/TsFon2Tpwy84Ox7bR/Y6U
         er4+ASo2p4Z5PrDhhuBpR99gWHwIQizTBNep43wpHkoOvUyf+gY+T5Oknzj5WE58hCrE
         UI158lfn4cyGmlH6eC78gLulKFBkUVVjjZoN8MC/6BRAfYNwVXORqYTSRpdzdsDrVnGS
         CM902iEbUCE4nMbfXKKO/qWKNVrfhLL1NtmtbA9gMpUCR4HcJGgFgedcMvab6OAXAPgP
         m/91O80aRFKJ7ari4HgP6spkFCfU3B21xllewjOJ6Qw3fDcP/Q9kSephCg/SUFMeWWKm
         sjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370957; x=1751975757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0crR4urJGV/Fg0thNgQt+VQTmzooZUpBcqRvRqhXIEU=;
        b=ZfUpsyw1qs4glO6e+X/IZS2xrvympk6CzOUEgLuvwUXLL+k/H+vCDfwvCyYJvByetM
         RDFsM6PpETrTRzl0xyBKW9Pbuc/LHtDAZm57BpviWvkD2XF2Tw64nWcC3BI2P9KVnfif
         QmQqhnJV2GW/aueWIaqQ+vhrH8Nz0Fauzl29wg9QUO76S5BaMspNcThMjzOtFbaKSxRH
         +S8JUG7+6hdAqnYOM3Wjd71AuxX4z73YAwQhqNtXIqvx9lcn1vEEHH6OpGoNmzUZeUI6
         Ah482NgdM3AIRMb5BKEKAIzmyoLf4AzJy0zYPz7UG1Ewzt2ctRC45oWhCiepZcwQBS1m
         mzxw==
X-Forwarded-Encrypted: i=1; AJvYcCXolsZIY2+JoDwtxzrEnkOG4pw9aAU6d5P2ujQ35Fgv5efrvm6zbpcqcYRvZB5jR4gEBAPcswF8Jow=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTarDjal42/1spJS2LbG24z9FaqACzC4XPSevhKJpyC3xeCu2X
	O6sQWOhbiFHQfpFh+Hwyulj+dsmIjRtRc7/fqxfl1fHq+v5MjNPjCyVu
X-Gm-Gg: ASbGncsHg7Hw16kRQ6g7owvnPQxgguSqVFFYnWfX/dnRE9o4jnPKpObrSfIdvzeJJMo
	ngjVrmoLDpxWsfwvxUwVsGvsoaso5SHW/FTHDPxoDyRodbcovuvYIx4dVwQmQ9BJD39kf4X3Qrr
	bt+EEqowDBAg9zYbnH8rW3CEsSaDV5kAPxR/aQrtMox2/ozqnah9i3u4UZgPzzd2yKvQeE3PF3q
	03TibRifL+VC6L+ADLAZDODeubC+4shl2gJFQAJUGEdJqCU2krJ/mshdXWsrjmJAzTq0hrZOwdY
	PxnTucWLxSBSNyHSdEXblJzAlBLy3SmiBguzF6nqMcsxandLdfgr8xFUO2IzNlEIoRbCwyTq7Fk
	VIBDIuhQCfbaXkh4=
X-Google-Smtp-Source: AGHT+IFUgOwN6HRPQ2oh9QIMJWDgV2scfdtq+n58TvAbFdfbar7HSe8AWWiZ661Tf2jpQCOod0aXag==
X-Received: by 2002:a05:600c:1c20:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-453a8151482mr10474815e9.6.1751370956326;
        Tue, 01 Jul 2025 04:55:56 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:a723:4386:e2f6:bd22])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453823b6d50sm196398295e9.30.2025.07.01.04.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:55:55 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
	Vipin Kumar <vipin.kumar@st.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand/fsmc:  Add missing check after DMA map
Date: Tue,  1 Jul 2025 13:55:15 +0200
Message-ID: <20250701115519.30772-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_045558_373314_0C868C2F 
X-CRM114-Status: GOOD (  11.12  )
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

The DMA map functions can fail and should be tested for errors.

Fixes: 4774fb0a48aa ("mtd: nand/fsmc: Add DMA support")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index d579d5dd60d6..df61db8ce466 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -503,6 +503,8 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 
 	dma_dev = chan->device;
 	dma_addr = dma_map_single(dma_dev->dev, buffer, len, direction);
+	if (dma_mapping_error(dma_dev->dev, dma_addr))
+		return -EINVAL;
 
 	if (direction == DMA_TO_DEVICE) {
 		dma_src = dma_addr;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
