Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F36C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 22:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgltcyYkOELKWy/bKfbvhV2o2lOLmwwoK3CeAGQzKws=; b=OSXynmX3tRo+Cf
	YtixnaPD1pGr667AoGDNGJEKRjIM7xJYA6t/oPfCjzkeJ+Pl7DGEYSI+hsrk/tayHHm4tU0J4D78F
	ceLCEFICwk1FTlOR5Hv4Drj/8oWJDe7Oih0OUjGkANYuvLHbsyusLJwTkcFneqpWmwPIP+AULbmvW
	T/Ner75WCF7eLB5uElqTzNlIo1x/f2bPEdG2jiGWwaU/jx4k4vFzcrErZE3LMogoc7E4qRP1i01Zi
	AjhmgqYk4BVBdtwNHv42t56OwOqFLKWfoYqg1kto/3Z1XHTJhwStjUW8k7mfFGHg8ynfVSAyhlNVW
	ypkdUIcUs1kdVxBpzATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBah-00GVeD-GK; Mon, 09 May 2022 22:10:55 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBaa-00GVad-9t
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 22:10:49 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so497190pjb.3
 for <linux-mtd@lists.infradead.org>; Mon, 09 May 2022 15:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LFtZBB52hcOPQDKNHwOupwfnshIyct7Dfz26toxfj9M=;
 b=qVS3UV7JoK6EDJlni/2jazyHGNJ2ntSIBP+pbZ1pwEwp2SWCef5cHBm9oyeSMvwAuc
 4aln/i5GQKikdSYJ2XLGp0fqhgvBiwzOLs8xIYlp8NgbT8Q/IeZmq1thDogKSxrFkq+G
 g2lO6SE9nnV6H8UmfLaNo3BnUzNWAKV95OGT2DmLx+s0CvmFxW+ISb0rzGjMkvjY3ZMm
 u5aJSst7vAnGcgyoWqskAY7aINxvY3e0QSzHUYCuFknmANVOgV+VJt3qkPBU6KTJVcBt
 0xKMwIhQC/0xL99xq/CuFcO1Vr/P1FR/j8t3RTAgs9ByHQEQIOjakbZC1Cgs4odY5Wt3
 71tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LFtZBB52hcOPQDKNHwOupwfnshIyct7Dfz26toxfj9M=;
 b=hoy4btqNS1n0MCXI8JjvNO6QPufCFGZcstCnyn0Gi6jyY/CnOmFmTvJ17llK4hMpRt
 PexGabe4qDNXni4+ukLu11x7DRj85Dd78KjseOq8zc1TvV9H5rVwVRjefZw6jCZuOWjx
 NtjlFjFObLu1n6KG6vETUtGHvrri4f6rBm43MmMgd+tGLQwpTeNKQss4/onlD/riZ5B4
 VSWKPrxDwrdPWcGHQUmal9Mm3qVJsmTDjGNHKNPl+aRZ1xsLDmOiw4wwrtKKhbpRqAW9
 QbA+t326d3v2+MBmiOhBXwPK4nsPUffM0OMpdbxdm0imW3oByw0jwMZJI4kgXsQ5hvOS
 faIA==
X-Gm-Message-State: AOAM533lzfrTVV2ZmXq5sg1ei6YirIseKV31Uu9nHH0/KNVOw/xe/hZZ
 YwxbNjZa7JcuowF/y9yvJif2M8lxe34=
X-Google-Smtp-Source: ABdhPJzGIjE1qFoOxujMjenWvumzwoJvwjy1JUW1GdlBETkRJX5eCq9m/m5JDPZd3I/VSo6W1S8E3w==
X-Received: by 2002:a17:90b:1e09:b0:1dc:d3fa:dabc with SMTP id
 pg9-20020a17090b1e0900b001dcd3fadabcmr20675740pjb.225.1652134247792; 
 Mon, 09 May 2022 15:10:47 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 q27-20020a056a0002bb00b0050dc76281ebsm9043247pfs.197.2022.05.09.15.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:10:47 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, michael@walle.cc, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT parse
Date: Tue, 10 May 2022 07:10:07 +0900
Message-Id: <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_151048_394074_D517F871 
X-CRM114-Status: GOOD (  13.00  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

In 4BAIT parse, keep nor->params->addr_width because it may be used as
current address mode in SMPT parse later on.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 2 ++
 drivers/mtd/spi-nor/sfdp.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c14a95a23fd..051b26b95e2a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2664,6 +2664,8 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
 	if (nor->params->addr_nbytes) {
+		if (nor->flags & SNOR_F_HAS_4BAIT)
+			nor->params->addr_nbytes = 4;
 		nor->addr_nbytes = nor->params->addr_nbytes;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 90d7c25f7281..7240d9d74b8f 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1090,7 +1090,6 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	 * Spansion memory. However this quirk is no longer needed with new
 	 * SFDP compliant memories.
 	 */
-	params->addr_nbytes = 4;
 	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
 
 	/* fall through */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
