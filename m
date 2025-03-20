Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5D3C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 18:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9uMCOTEjH8XnfkezmTPBc9jXatY10rLIwi0Ct/dIbTo=; b=cX1pPxUDlkw2LX
	AUSQ29YAbLtU5thmADFXbdAulH2AvivB04JUwIkfoK642PW2P5gb64Q17Q/8R7mYXkY6rVC1kfI81
	BUb2V42+Y7zR+D1kOe1tsZkPjpJ0mZzHbUbY0HKqtJrJH6gVkD8iPReA2OvcdlUzXiaNvL3l4Z0++
	XXvt0KK8MkXvll2SCg9nZ2654UUo587dRCDiY3xLQcc/KvvwTnAQmpQA1RZToYmSvJ2gP3bV3vE+A
	Q6psr7iMXFQ0mg3L2nOkvr8i7SPQApoQO68ABG3+GQlJnHiMoGxebO3v+2ZunIeCjaHZL7CB+/K0a
	hXzNU4DJ6Tdl1zjn8LvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvKNS-0000000Cutl-451J;
	Thu, 20 Mar 2025 18:12:22 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvKNQ-0000000CusZ-0KJx
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 18:12:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3912baafc58so983957f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 11:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742494338; x=1743099138; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAj8w99nfg2slGXPfJ5zVyi4hbC1dv2j2JscG9r1JDg=;
        b=XdgwA+EIq6RpADc4LLFCWzKFVWNDYZ1wMkaDd1OGS1unTpZTw0+U1S1ZsCutYDg2RY
         /3M4H9iXzZ71gKbAqbxA+OPRHM9GJfZh7hXnOsNKc9iXhmgcJyfPgF4RICWqROqFl0Pw
         XQJe3e8EUrNYKUMiLiE7F24NjtIjtDVdR2Nc2+yPDmhOmQj/qHm6XF6VXWmaR4YFczyW
         sH1aiynVaXMLwYpKDJHmrxvUhqFpCREY0oHHyhxUx1K0dsrYGLeJlPPL3jEw6uYJWs/g
         tVxRqEWhpXCJCOPvcHlIZ2k78Ynh/U9isyYqw7E2Ti9GpEdXHOvlY2chN09BeZTUs3TF
         dmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742494338; x=1743099138;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAj8w99nfg2slGXPfJ5zVyi4hbC1dv2j2JscG9r1JDg=;
        b=MNIgZOsINioNiZV54QlJvzXckH70coKXe0jB5RCa4VQicxo7Rdi5xBX+nPwnTDD+dx
         /+ncJV4rlgwMAtG9C0tHwimT/k/nJTqUmLK5hOYuu52F51odARhuCE0dYD/DE9N2l5d9
         6OJSNDs+631B9IAMZdPxT8ngjjms88I5n7LH5IuC/RpAPw4gwhoRheoki4uBKHxF6jdv
         VRc4v0TuUTXfG4l40LSjWiUIMRuHEXSzIK06u5eRhj208CxiaP5m+NA4vko85h8nzZbB
         XDeNbxW3fPdFLgbGQuEXfUlmVmaXJAUF6GnsaHQHHE+/CdIyncBjd/A+Yq1Mdd1Cx7oG
         euEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHSckW8cmp1S/45/epSdsZXYi7GHhY0lRSOh3SoLZ/a7stFlWcgLQ6xcvDyodpdAF+uv66qQe/3xY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGSPhHG11xvIJSn+4xQ2EeX1ynOjp5l/SEa2RCJKAyce+EDbnO
	9Tit3o2VJnqVzm50yqdX1HGCV4Vzs03Uhw0e9+J6t2EY11ARYATN
X-Gm-Gg: ASbGncuibPF7wCgUZLvzyoghdhG1iO0B6Z0tU8Yp5HddIodIwMzeNbm4HliwQfnUnsD
	NUaAOhawTWXLgegmhZO7f6YcCtfEJ0zLhMkujJu54eS7GFX3FAxdFPyFxiPHDvufzCzHzO9ud6j
	BoQ7ySDDWvorsInGxOavrFu77o5jjCbB2qWkzg8uP0d4f0+Xq0oy/DqEDPuHE/GYIf3fCYtiFIi
	hiS6tUb10Zs2k/RPyg/V7BWTq+WtvABeEapAQ7FNDlGOMLbW+8myQFhJ2kFVb80kU/RC8qvLyE3
	LZ5nc/5NmsKUh9RM66qqdZ9h5Xp1VkEcLPp1rwb/35C5xTo7vh2lSFyJN+Q10oGL8AGJTKeaXYc
	dqfhcjGne
X-Google-Smtp-Source: AGHT+IFO7iQjH9/emMYq4Rm2sLpWs0UGB0cabmOue8uCKayYG0tr9zTuXMmtVUGNfuO0SoFF75D25g==
X-Received: by 2002:a5d:588b:0:b0:391:4282:f60e with SMTP id ffacd0b85a97d-3997f91d8e1mr508399f8f.32.1742494337662;
        Thu, 20 Mar 2025 11:12:17 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9e6544sm236209f8f.68.2025.03.20.11.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 11:12:17 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 20 Mar 2025 19:11:59 +0100
Subject: [PATCH next] spi: spi-qpic-snand: use kmalloc() for OOB buffer
 allocation
MIME-Version: 1.0
Message-Id: <20250320-qpic-snand-kmalloc-v1-1-94e267550675@gmail.com>
X-B4-Tracking: v=1; b=H4sIAG9a3GcC/x3MQQqDMBBA0avIrB2ICbXFq4iLdJzYoTpqIkUI3
 r3B5Vv8nyFxFE7QVRki/yTJqgVNXQF9vE6MMhaDNfZhnDW4b0KY1OuI38XP80roQktNeLf0ejo
 o4RY5yHlPe1A+Dxiu6w8mnKgFagAAAA==
X-Change-ID: 20250320-qpic-snand-kmalloc-3f6c1fb6c873
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, linux-spi@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_111220_118498_90D7B157 
X-CRM114-Status: GOOD (  12.19  )
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

The qcom_spi_ecc_init_ctx_pipelined() function allocates zeroed
memory for the OOB buffer, then it fills the buffer with '0xff'
bytes right after the allocation. In this case zeroing the memory
during allocation is superfluous, so use kmalloc() instead of
kzalloc() to avoid that.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index fbba7741a9bf336deed1c07eab8d5a94204878d7..b60f5c3fd1db84e66f9263404a52251460a4afec 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -261,7 +261,7 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 	ecc_cfg = kzalloc(sizeof(*ecc_cfg), GFP_KERNEL);
 	if (!ecc_cfg)
 		return -ENOMEM;
-	snandc->qspi->oob_buf = kzalloc(mtd->writesize + mtd->oobsize,
+	snandc->qspi->oob_buf = kmalloc(mtd->writesize + mtd->oobsize,
 					GFP_KERNEL);
 	if (!snandc->qspi->oob_buf) {
 		kfree(ecc_cfg);

---
base-commit: ad4488845193e81549c11903a5083b4c9cc19785
change-id: 20250320-qpic-snand-kmalloc-3f6c1fb6c873

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
