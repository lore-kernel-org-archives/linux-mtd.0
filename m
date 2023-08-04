Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857ADC04FE0
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLQZWEtPKieXQKUIDIx9EJM8vkARw5pYWDu35lm2wSM=; b=i39JU8b8wHXRIc
	0T4ISpWKZUhZARlGh/cFaUBnu119f+TWqQCqRUkUuIiqR4k5bWUPY9b7Y46erBVRFGFRAprQDRoCs
	2hFJ8zZEOudjtu0wZ2IHHDZBbqFSVoP0BB/wD7TtSpMo30VFcOJgUhhE6tshRX8wTp6wjxOQNfI13
	RkY+J817V4cWvl6EfwFqDfyPXMDloujpLHj1VZyg01UJOYn8z33mhzP/0+w8FEvaFJ22asTh41bW8
	v8G6mznGqxvh7XRSgTDMqR6Ww9vtGIFCEtYhrIwpPNgaMHmY21ivDtnFZRJiv284Tuo57d4qDwkfb
	DEBOBAfZn01X3YorVT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWS-00C48u-2V;
	Fri, 04 Aug 2023 09:55:04 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWO-00C45V-0y
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 09:55:01 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bbf8cb694aso16150475ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 04 Aug 2023 02:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691142896; x=1691747696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXRqVMmk9q4HSeeommpGOVPd1xQDaUcJBHSKyY9RqnM=;
        b=jXzW+7cy0b8iY6WMw2q6OdmHJ01g1/u6n1VUtvjzy9yQxKgd6E6tJwhBPPqyQByL7q
         G32G1RH37nK5EZvABnwk5jEXU0MZYZxkw3d1jx3qtIt2XDjkJYTqvJqggusQ1g2LKxQD
         Fdgy5rUqfyDVu8NuPcaICVSUWRJQKZsCOKksix9r2B1pOe+vtXc9Ea/iVPpeWSHMrKga
         vritOFFJUz6ac2PN3FtZabp4NwDW4asF1nUCF1R+gyyVALb8TkLkR4zB5PGfNosR/pgd
         HSuw3VumNzvtETG4hSzvitlYkyTHxq8daPA127RcZ6rP/KbNT/azSWgZICD+xbC4JQmY
         LDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142896; x=1691747696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXRqVMmk9q4HSeeommpGOVPd1xQDaUcJBHSKyY9RqnM=;
        b=hmav8UJIm6k0XZNH+ibzUw6fFqNiWDdK5l7p479z1fJkKpsZNhVDVQ9fpyK4af5tpP
         adtgMJlRr3bb8rm/Rq/DmPV5H+BS2jwu1Dk98IlAiuKJPdE5KZqQW+Wj8TZ+2175xzRo
         bakrd2bxNv7b4eh0txGFojXHTi3SzD0gI9cXuLMONhpNE5Ak93ABsNgrdpMq9BgqNlbz
         Zi76syV+9/JUmXAgIWKwoMua4hkO7hoTK/s73HxdTCHtEpGMjRft/1aKiQ6x2q8xux8f
         LV/R2pZOFQW6k63HSZYLtyhBIvJdQ0ryZli0IseQ5ZAbKp1b741qmj95G2O1+Pdqbn+e
         pq7Q==
X-Gm-Message-State: AOJu0YyGgGI9M6Yfd6XdtWhze3dr2rUjZucU9ObQS+Ms+d+fd+shb+5F
	5Uhu/8lu78XF9NROIiA0yw63pGVpgJQ=
X-Google-Smtp-Source: AGHT+IFAdSY6UjVN/NbwS76hfIXdEjbQIrbqCzCYNGxscOpqc14KVWDYIsVAS0KpghUfDOMajBgOPQ==
X-Received: by 2002:a17:903:2286:b0:1bc:16cf:fc30 with SMTP id b6-20020a170903228600b001bc16cffc30mr1605665plh.63.1691142896627;
        Fri, 04 Aug 2023 02:54:56 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id je19-20020a170903265300b001b9dab0397bsm1349371plb.29.2023.08.04.02.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:54:55 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id A26BB8056F;
	Fri,  4 Aug 2023 17:53:43 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v3 3/5] spi: spi-mem: Allow specifying the byte order in DTR mode
Date: Fri,  4 Aug 2023 17:54:07 +0800
Message-Id: <20230804095409.278419-4-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_025500_340909_1F98741A 
X-CRM114-Status: GOOD (  15.65  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

There are NOR flashes (Macronix) that swap the bytes on a 16-bit
boundary when configured in Octal DTR mode. The byte order of
16-bit words is swapped when read or written in Octal Double
Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
Swapping the bytes may introduce some endianness problems. It can
affect the boot sequence if the entire boot sequence is not handled
in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
back to have the same byte order as in STR modes. Fortunately there
are controllers that could swap the bytes back at runtime,
addressing the flash's endiannesses requirements. Provide a way for
the upper layers to specify the byte order in Octal DTR mode.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-mem.c       | 3 +++
 include/linux/spi/spi-mem.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index edd7430d4c05..fd6b1c69ab9b 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -171,6 +171,9 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 	if (op_is_dtr) {
 		if (!spi_mem_controller_is_capable(ctlr, dtr))
 			return false;
+		if (op->data.dtr_swab16 &&
+		    !(spi_mem_controller_is_capable(ctlr, dtr_swab16)))
+			return false;
 
 		if (op->cmd.nbytes != 2)
 			return false;
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 8e984d75f5b6..9da6d53a29a3 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -89,6 +89,8 @@ enum spi_mem_data_dir {
  * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
  * @data.buswidth: number of IO lanes used to send/receive the data
  * @data.dtr: whether the data should be sent in DTR mode or not
+ * @data.dtr_swab16: whether the byte order of 16-bit words is swapped when read
+ *		     or written in Octal DTR mode compare to STR mode
  * @data.ecc: whether error correction is required or not
  * @data.dir: direction of the transfer
  * @data.nbytes: number of data bytes to send/receive. Can be zero if the
@@ -120,6 +122,7 @@ struct spi_mem_op {
 	struct {
 		u8 buswidth;
 		u8 dtr : 1;
+		u8 dtr_swab16 : 1;
 		u8 ecc : 1;
 		enum spi_mem_data_dir dir;
 		unsigned int nbytes;
@@ -290,10 +293,13 @@ struct spi_controller_mem_ops {
 /**
  * struct spi_controller_mem_caps - SPI memory controller capabilities
  * @dtr: Supports DTR operations
+ * @dtr_swab16: Supports swapping bytes on a 16 bit boundary when configured in
+		Octal DTR
  * @ecc: Supports operations with error correction
  */
 struct spi_controller_mem_caps {
 	bool dtr;
+	bool dtr_swab16;
 	bool ecc;
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
