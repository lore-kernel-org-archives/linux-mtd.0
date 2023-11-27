Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB8BC07D5A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6+e0rbkYuw8Oc4jBlvI8JyT0JmejcH00x09gc1mLrk=; b=MFwzt0xmD4N9Ut
	bQ41fa5xigpZjfh/wHC8ygr5UoU8uCuKGcld99LZ66La2M9U11kNptQz2MJLQrusOwYGopeqerwmO
	4aNOjzCgcsGT+EP3bQ8ZkoA7tmrTjXlttHC/U+JlqIvGWqbjpSwn4Wc6Y22Ia2eQEULAVu6DnuVaT
	N9KksSuwdEGMxI9zxRTcDc0ToMHJrYtcH/pxZ1SqqFRHt/viuSj8EiZHMDHtVa5RCz4oidwWR1mkA
	o2gta667mXzAuuuOKz3wASxOrFKAcNAI7rnSrZprW06WpV86bCrhHKM8yXRdvOGLc0bR1kNEJttyx
	eb38ZZz3ZsALuO5S/1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YXF-00228N-2M;
	Mon, 27 Nov 2023 10:08:13 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YXC-002277-3B
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 10:08:12 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b837d974ecso2498625b6e.2
        for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 02:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701079688; x=1701684488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAliyeR2O2MXLT9YmjXFeOCnSHaJBvWvut6DOEGh/OU=;
        b=X+wVEoGGR4S8DN7h05zIrRtvGUqO7o9CoOiTEZvVlzDPafJQb6e8G1NOsGakmQw0wH
         7HkzTkRnETPTtv+ogLClB0KL4oOD8Fh4GBXM+dqnxBzbW5ofaHXbNt18Q3myXOcPDFV3
         iP4UCfg+aL5MBp6Igse3HRuBpcz5QaEtdVbsh1M3hfiad+qcbpkis1KR4ln4ydQqJXBO
         uN5lEemMCf3Hk/NW7Mdjxqnv1QzUvY0uTILmsYWmGNXfmhP0DqT4F0aGilr/dcmED01W
         WhGwnJS8mg4gZ/24u4BiWDZcJB44UR2OLMKPynjW730j+B4nt7G7ztby5q7Uu/kmTyjn
         7doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701079688; x=1701684488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAliyeR2O2MXLT9YmjXFeOCnSHaJBvWvut6DOEGh/OU=;
        b=OTarGDkeVC4JlHaEv7WqnZGXtIb+ht3hbiyCV4aUVZOj4zT344fohn+qAf+94IqmBS
         TCjMHejPAp3GYt86qgl44xKMakCU4qaUK8cV3zhntG9mN4DZ6LFE7aT8w3PyP6fps1pq
         YSLT8fjgTAAdsDgGAsm6nkXogxF2bIBR/Y5Eb5yT/9MWQ00/782KBDVger3U7tDigVMd
         ZiQQFgCqVWI2gYMulkdK3bYMj9o5tt8mehSVM0jNoo7ZAT1hwaif0lagMi607avNY9zb
         1jlgrbveDF/H6HwKdzh4AwOoXRYlQCrJYuo70RebnTjKzHDiswtMZGZTFBKhrI4qHkmp
         C7Ig==
X-Gm-Message-State: AOJu0YzsEWHDjjNEUDj6SZ5XZfg/0MckIdL+VKw0fcCAYEkhm1dOGAVk
	3V9bWbPzlFsy+imeIJfYQYY=
X-Google-Smtp-Source: AGHT+IE7I/mnxAc7ivYFEtgszizN0Tp1cJ75wpwJC1mBCa3aojtGoiwtPbItvDk47K5pY1F8Pvi/Xw==
X-Received: by 2002:a05:6870:9e8a:b0:1f9:67db:2d51 with SMTP id pu10-20020a0568709e8a00b001f967db2d51mr15439321oab.31.1701079688461;
        Mon, 27 Nov 2023 02:08:08 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id a6-20020aa780c6000000b006c5da6411b9sm6851630pfn.101.2023.11.27.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:08:08 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id CEC3A80527;
	Mon, 27 Nov 2023 18:07:50 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v1 1/2] mtd: spi-nor:sysfs: hide flash name if it is not set
Date: Mon, 27 Nov 2023 18:07:53 +0800
Message-Id: <20231127100756.41605-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_020811_040962_27137DFC 
X-CRM114-Status: GOOD (  12.56  )
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

The info->name may be optional when flash ID founded in
ID table but didn't include flash name.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor | 3 +++
 drivers/mtd/spi-nor/sysfs.c                             | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
index c800621eff95..6d7be97bf7d1 100644
--- a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
+++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
@@ -25,6 +25,9 @@ KernelVersion:	5.14
 Contact:	linux-mtd@lists.infradead.org
 Description:	(RO) Part name of the SPI NOR flash.
 
+		The attribute is not present if the jedec_id founded in
+		ID table but flash name didn't include in it.
+
 
 What:		/sys/bus/spi/devices/.../spi-nor/sfdp
 Date:		April 2021
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 2dfdc555a69f..96064e4babf0 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -78,6 +78,8 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
 		return 0;
+	if (attr == &dev_attr_partname.attr && !nor->info->name)
+		return 0;
 	if (attr == &dev_attr_jedec_id.attr && !nor->info->id && !nor->id)
 		return 0;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
