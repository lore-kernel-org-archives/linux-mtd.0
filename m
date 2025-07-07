Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5273EC8303C
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jul 2025 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6VnObUsJZp1aY2GOnCU/vin5ES5xz8fdaDcdxR4UQWU=; b=twiXNU8CJ3nGF2
	vQHC0D03LjfFaUjyTDTBKpWIIwo9dV83hPa5tAR8Mp4RWHBYZJEm0Xz3qjU8d58qKrQHJCE/tD2G+
	pGJwSXB6w6Ty+T6UTXmw5SeapEY8oiDp6XMbvctOogPEBU4A7pX17cg5ipMyYRy8PfWdtkakDMMOB
	qnI+79jr6qT9dsLMkmnUhcXi8m1f6f1XhP92ExTJA1L80/CkWB+QVsgSiJ5fvpClp3qCCVDcCZr2L
	8l/hTdQf6Fz/560d5sLWSk5grXZvCMyV+wggz+v74Q8WiqE+IIWqMJuCjwgcwu1Z07CC4mfAkwXgc
	zODAYaQs6HbMNTl/twJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYh1D-00000001pXo-41qS;
	Mon, 07 Jul 2025 08:16:07 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgSr-00000001iiQ-2oAN
	for linux-mtd@lists.infradead.org;
	Mon, 07 Jul 2025 07:40:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b39c46e1cfso352483f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2025 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751874036; x=1752478836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nrm1zhsxweRW1Vz623z7OAal5eScBLTdY72cStBJEjY=;
        b=l50zUqKJBXkoNzii0XpvmZkaq+ZxK36e44Pn0IteZz1eD3EhwdqyN+44ByXx0ccmJQ
         eDqDPM20KQ4KBs+06EPqkST9bTADOjeuftBzvSJ66RQf3UGtwSD1OK6wqz3yWNI83MXL
         ldv0CLzFZMywO5GpQAtUt9+fElNLC3pA50UOrYZrSoAxPbLJtjy5wty/eG1lWJMyrsmM
         nqBgUVQNXJANg80AT6ZbFvaLPlmkL/EaXV/n9VAWAEYTGwYRdK2oEWa6pg12TdpQXsi1
         ijuWoAdyaezNA56NJ9YgqEOS5p3r9TuVXx1s1y5PzrPrFFjDP8IrnL4glTsRcgomsl16
         p9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874036; x=1752478836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nrm1zhsxweRW1Vz623z7OAal5eScBLTdY72cStBJEjY=;
        b=jioTFonQrFhrL80fDq6l6VhCWLc7ahmq+Z/spb9z8I8jcuvHIN9LbUUTiFPtOzqc+l
         9LB4froY7iz+Gf+I+mAMl0yE79pfjOR8boRR3v7Kr4EIYgzoA2U58aIA8cRyCp7QBnc8
         Mdak8ERzjFF/mN06hcxYLFxhfelyAA973lCZpG9xUlrNQ5HAKf+0UYFJeScbG8d6LOCf
         n+EtVLRPyshiYcZflRumBOSnYCmNhiBO1Ya4Wn3r6PxGOTCTPDIyOLCz6vMZqe9n74qI
         megBJoLI7Vc311I5Cutc4YxGn9OehyaIWfRhMtmHMBybDJRzmJPMVvDrw2pRHZWKahwh
         zkoA==
X-Forwarded-Encrypted: i=1; AJvYcCV/fAZKiMqvQuB3b6Tk6BDJ5E4PfJirvTIjYT/+xq3kLlpwsnL3kyhlOyfkO+7STGK+7wYTkH5ss1o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5/Hl8dzbG0oyVFelT/dsAhbsYIa3DOMsvnln1lgPUUwgbhXIl
	o9qV7OytEVMTTX6BSggjWbfgX0O9Uu6RBs7ZDtprUfnGIW2mDBjSAv0b
X-Gm-Gg: ASbGncs3RvvZvwiRJqkXtZxSCLwfm22zwkzXug7J99oas0uxA1dRsqS/GohCU02e9Ag
	MchTHVdRbj4WdpivhuthPs75YC6neVoyQNGQvwYLksh/Y19V38S01iydKMe10MPjHedp3Tb74z2
	KMCjCG3Vzr+syppJOV+x74m0XjsYzcfeXV1FaBI06FwAq2EJZQXKZ3XUwx8NKcIAV3HSoeieMHC
	frk9oZ/+lSCxXj6tzlzK5t31ArQ6Afv65g7Nayp/eloIS8tlkwXBZ+8eDUIGO/x/zbuvXFus/a9
	eY8RytHR9hOW2hC4RA2KISOTG3QeMuqVDlvT9RvsBijGE+e0BYmPhUC7/kZFS8jPFMtZBff14Fr
	v7R0Y/n+MfeRKjfk=
X-Google-Smtp-Source: AGHT+IF3n+flLeuVI/pFKTChluG9p2jOYqIX7r6WUuLRebZdYWS2Stumfh3b9JF7lRWIWCNv81GN4A==
X-Received: by 2002:a05:600c:a21c:b0:453:4376:8f48 with SMTP id 5b1f17b1804b1-454b3a7bdfcmr21353395e9.6.1751874036109;
        Mon, 07 Jul 2025 00:40:36 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:ef01:c9dd:1349:ddcf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcececsm132671305e9.23.2025.07.07.00.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:40:35 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
	Vipin Kumar <vipin.kumar@st.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: rawnand: fsmc: Add missing check after DMA map
Date: Mon,  7 Jul 2025 09:39:37 +0200
Message-ID: <20250707073941.22407-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_004037_704740_C43D94E5 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: stable@vger.kernel.org
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
