Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D2DC3DA6D
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 19:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ovjuLrbDFKZbl+L2buz1RpxlAClvMgyx3tlepXv+xc=; b=wcTqxuIt59l9PX
	yGECOsRWmkTSUwi4bvaEO2iTZ0KDTxgOOqIoUOyv91r0HsEquGvbAMjmDQqOxtqeLAA8GRQncrxnt
	hQCiUm0R5iHnzKBPoTJzQ1UK5XE8+E//86lPqer/x6vOmd7A9YnHRLsjq+h/bR/l/tA3VZWyr/wVB
	TbNKtycHnsW00vHZffI/6mxiEBkA57koYW0ZsDfmkIX50xSIL35bO6G+NCqksGG3yFKWXX1YL4HPQ
	E0vczUMS5NL4nr/edvwrcNdXa/uybzob9Mgj2ZWiHDUdEdZ0KrHMgusuhR9WRPOY0kaQNztCZUvKH
	OE9huVRaTwkfvBgVOerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdx7-00000001e3q-1YSD;
	Thu, 15 May 2025 19:09:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdmo-00000001ci4-0ZYk
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 18:58:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so754390f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 15 May 2025 11:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335508; x=1747940308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uyejmtz0c+qWQ5LaiwciCgzl0ypKnF8Po4gKuJr/+k=;
        b=C63N6IY1PII5PYuafgVHCFFFDbirjOrS71+zeHDodpTMBNe7ZudUTgidZj6dkJdRAc
         YEbe7tZv0n+pz9Dn5P2XF7TN1zaUr5tH5o3Lz4MhJLXz/HaGHza2sGLUToahTAJCv61I
         UoYdmw3G3cYgeMW4691dT4MNEotXAGZOUia6kH3GsBFQ8BD5grokcSguCzHa78TEQyB3
         DCtheBBiq1SEYkyeHokanHgCoFwtSUBNsg1qMED44pQ//XaY1DTmInUygXHu+KSeERvP
         w47yf2+qUgodhhv4yhZjyBRcHYVPGG7VGHPpIjC+Rpc8/szG4lt6f4/vNLRa4K5MTtez
         hOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335508; x=1747940308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uyejmtz0c+qWQ5LaiwciCgzl0ypKnF8Po4gKuJr/+k=;
        b=cmVZgua6y+Giz7UtujRt8fzCWUn/yeJSwtXBDJs0BBN3XpqrVs661KOXLbB22OTCIo
         V9S9gTZdvWbSmay9Z42tmAujkHqK5uPLdSnMhwZxW/T05xzeOhwbYou4ZONZhByznwZ9
         aiAHykvYwggo3zwp2ELZ1Rc44OidKap4OwKlVaIo0voqZ1Y8eKed/KvUlRJa9S7HXU03
         Zq9FqaBbx4j6eNOl2Ogczb5tbHSYbadqsNJwgk/RUPMiedvMoJBOkyKMhWsD7wV/aH3r
         DhYLtGNzHDvU/2d77ei4eLwb2wmNHJ64UtJ3SWOcbMpy8BuWGdxy45PkNLoNkxnfhJeM
         hj2g==
X-Forwarded-Encrypted: i=1; AJvYcCUf/vOgO04aOyuxOBvwsrMCMw865fq5VcUWk5LfGYUDi/wwj0/I7ST2WIaGr01RrbmHqDXjP1vdjfs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzD5eDZI6LRti/MtHv/3+IXfWAf5/DdtOYymVymEcPgSDPHXqMl
	wFPgBj2T4CyBATyPCpsRqwQs0Xvkr7GFSyl6229+94JxOSnw0L46L/V4
X-Gm-Gg: ASbGncvf7LJrH+R3Y2B0jRfraAPwqBJcJyq6UK1RhwbFQ4DcrhnoaISXF52WdbEbQio
	3vWS+QoSup1Ri/LFQNdtuPA69KSiyVQn3bSKnsjfMft8RPCmilgtaLnHvwKAi4L9a/kFbralMRc
	uofH0QOujMbfUcQ0sBOQ3pzUXO/H2DGAC2oXexOvAvXW1NR5fYXhrGnF6/C++RSsDQekFYzGF1k
	cto692xpEWDQFoTwoF0pjxnZ74l5/vtJALUyNldbYLTW/aC8tdsDw+ieEXM2hPsH3vUKLJmekuR
	+S6gPTc2gmP6HZRC9G379xBwc9tTnjT2BNHmOByL3gROh3aZAj4LO5OqQYBR2SReXNFIjoVCz3k
	BJN6i
X-Google-Smtp-Source: AGHT+IHaF5/8q+je2iW1pwj88K62M744soT9y5wHNJ4gvYxacC9IaeaSHOljAqzLiWm7Ak+nx/AzHA==
X-Received: by 2002:a05:6000:1446:b0:3a1:fe77:9e0b with SMTP id ffacd0b85a97d-3a35c843f52mr1022650f8f.16.1747335508447;
        Thu, 15 May 2025 11:58:28 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a857sm335778f8f.32.2025.05.15.11.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:58:28 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 15 May 2025 20:58:06 +0200
Subject: [PATCH 2/2] spi: spi-qpic-snand: extend FIELD_PREP() macro usage
MIME-Version: 1.0
Message-Id: <20250515-qpic-snand-use-bitmasks-v1-2-11729aeae73b@gmail.com>
References: <20250515-qpic-snand-use-bitmasks-v1-0-11729aeae73b@gmail.com>
In-Reply-To: <20250515-qpic-snand-use-bitmasks-v1-0-11729aeae73b@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_115830_184197_1F7883E4 
X-CRM114-Status: GOOD (  12.20  )
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

Large part of the code uses the FIELD_PREP() macro already to construct
values to be written to hardware registers. Change the code to use also
the macro for more registers of which the corresponding bitmasks are
defined already.

This makes the code more readable. It also syncs the affected
codes with their counterparts in the 'qcom_nandc' driver, so it
makes it easier to spot the differences between the two
implementations.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index bc45b834fadc5456eda1fe778e5ca8b16177465e..ad01bb456a88b54f0ffc801dd14eb3fa2708ec2e 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -130,9 +130,9 @@ static void qcom_spi_set_read_loc_first(struct qcom_nand_controller *snandc,
 					int is_last_read_loc)
 {
 	__le32 locreg_val;
-	u32 val = (((cw_offset) << READ_LOCATION_OFFSET) |
-		  ((read_size) << READ_LOCATION_SIZE) | ((is_last_read_loc)
-		  << READ_LOCATION_LAST));
+	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
+		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
+		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
 
 	locreg_val = cpu_to_le32(val);
 
@@ -151,9 +151,9 @@ static void qcom_spi_set_read_loc_last(struct qcom_nand_controller *snandc,
 				       int is_last_read_loc)
 {
 	__le32 locreg_val;
-	u32 val = (((cw_offset) << READ_LOCATION_OFFSET) |
-		  ((read_size) << READ_LOCATION_SIZE) | ((is_last_read_loc)
-		  << READ_LOCATION_LAST));
+	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
+		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
+		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
 
 	locreg_val = cpu_to_le32(val);
 
@@ -352,7 +352,7 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 			       FIELD_PREP(ECC_MODE_MASK, 0) |
 			       FIELD_PREP(ECC_PARITY_SIZE_BYTES_BCH_MASK, ecc_cfg->ecc_bytes_hw);
 
-	ecc_cfg->ecc_buf_cfg = 0x203 << NUM_STEPS;
+	ecc_cfg->ecc_buf_cfg = FIELD_PREP(NUM_STEPS_MASK, 0x203);
 	ecc_cfg->clrflashstatus = FS_READY_BSY_N;
 	ecc_cfg->clrreadstatus = 0xc0;
 

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
