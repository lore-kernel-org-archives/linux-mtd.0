Return-Path: <SRS0=KHzd=5S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7645C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 07:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9709C20784
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 07:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IZUsZD8X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9709C20784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kdevuLxfgnntbEGdVkQ0MQbl4F2GC4AjcRk6jHRvNk=; b=IZUsZD8XV3FLOY
	a6++QjxJhCioGaJnNMe/dky99u0Nxi+6mhyghRSRs0p7jwSw84DX1aBLApqCZ32BkbD/mmQwghLqE
	IANZK/oe4OMj1NeKKQMoIYgKGbr12TfuvJmqVp61DJscVLELJTVx8SDLArJOXQdAyiikq8tYYZZ1b
	gvH3uno/zB68ABokCbiwCBn/wjvyAO6BY6iXCgozkExIQXen+hOstc8Hqj6b+ihkSXg2PGmyUJymf
	tpvnR5KuVbvl+u2dADv8TZ89607Wo4KM4v6jVXvDjPQ6UWI9Ko/C8Q3joZL+oJL71MZ/hcjW7ZP++
	VsHWP9eCECB+nHYhL9CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJtpc-0000rS-0z; Thu, 02 Apr 2020 07:00:04 +0000
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJtpY-0000YP-4D
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2020 07:00:02 +0000
Received: by mail-wr1-f65.google.com with SMTP id c7so2817031wrx.5
 for <linux-mtd@lists.infradead.org>; Wed, 01 Apr 2020 23:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qCofxMPDs+Zd4BbgfZ7ibIUeNBtVsSVyW+wJb6YyFJ8=;
 b=cUwGmJBkwJel0YI9bCgew7dUJWnI+rjyJI2CIpnua0bd93GBR3mBNVpKAK38hRHECB
 NWh+RfMEU8eNyH07heEDffqJ3FaQGU6d/pgMaIR8V+3bMJL73tYkHFeLPwWewjwTMgZw
 6LhwsgYA2SvcwXOjUxI7LbJDpQAGmN4J0zE77E9EPqA8PXTs+yF8CUR1TawPC2SY9AQT
 +kMhhzMhPu4JgD2dVK1eMS3H+b7gnQRbVQG5e11jExPIU0DtJSLNdMHlMsBp0RM69nqd
 N3AahBMZu1VI6XjpxaiieEYVyP0sBrGAMGOXK9IuQzdeny+8Uvdnq+uJmiiXGoUshuwn
 tWoQ==
X-Gm-Message-State: AGi0PuY6lN9VeGDlsTGtunpnMviEiM9LaWivpqXr6vN6Ppswc6dOkq9M
 YpyXEN6jVtgWy7eGeA5SN6g=
X-Google-Smtp-Source: APiQypLwQtoVjWULEf+yed7mqTDJiM7gup+0FRSZGu4ydIXuDTxy7zf0dIDl1fis4S2XMMpjtDgRew==
X-Received: by 2002:adf:8341:: with SMTP id 59mr1908286wrd.314.1585810797389; 
 Wed, 01 Apr 2020 23:59:57 -0700 (PDT)
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
 by smtp.gmail.com with ESMTPSA id a13sm6214221wrh.80.2020.04.01.23.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 23:59:56 -0700 (PDT)
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: Fix mtd not the same name not registered if nvmem
Date: Thu,  2 Apr 2020 08:59:53 +0200
Message-Id: <20200402065953.9974-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401100240.445447-1-ribalda@kernel.org>
References: <20200401100240.445447-1-ribalda@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_000000_167162_12BCFFBA 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When the nvmem framework is enabled, a nvmem device is created per mtd
device/partition.

It is not uncommon that a device can have multiple mtd devices with
partitions that have the same name. Eg, when there DT overlay is allowed
and the same device with mtd is attached twice.

Under that circumstances, the mtd fails to register due to a name
duplication on the nvmem framework.

With this patch we add a _1, _2, _X to the subsequent names if there is
a collition, and throw a warning, instead of not starting the mtd
device.

[    8.948991] sysfs: cannot create duplicate filename '/bus/nvmem/devices/Production Data'
[    8.948992] CPU: 7 PID: 246 Comm: systemd-udevd Not tainted 5.5.0-qtec-standard #13
[    8.948993] Hardware name: AMD Dibbler/Dibbler, BIOS 05.22.04.0019 10/26/2019
[    8.948994] Call Trace:
[    8.948996]  dump_stack+0x50/0x70
[    8.948998]  sysfs_warn_dup.cold+0x17/0x2d
[    8.949000]  sysfs_do_create_link_sd.isra.0+0xc2/0xd0
[    8.949002]  bus_add_device+0x74/0x140
[    8.949004]  device_add+0x34b/0x850
[    8.949006]  nvmem_register.part.0+0x1bf/0x640
...
[    8.948926] mtd mtd8: Failed to register NVMEM device

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
v2: I left behind on my patch a 

mtd->nvmem = NULL;

from my tests. Sorry.

 drivers/mtd/mtdcore.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5fac4355b9c2..7a4b520ef3b0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -28,6 +28,7 @@
 #include <linux/leds.h>
 #include <linux/debugfs.h>
 #include <linux/nvmem-provider.h>
+#include <linux/nvmem-consumer.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -545,13 +546,34 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
 	return retlen == bytes ? 0 : -EIO;
 }
 
+static int nvmem_next_name(const char *init_name, char *name, size_t len)
+{
+	unsigned int i = 0;
+	int ret = 0;
+	struct nvmem_device *dev = NULL;
+
+	strlcpy(name, init_name, len);
+
+	while ((ret < len) &&
+	       !IS_ERR(dev = nvmem_device_find(name, device_match_name))) {
+		nvmem_device_put(dev);
+		ret = snprintf(name, len, "%s_%u", init_name, ++i);
+	}
+
+	if (ret >= len)
+		return -ENOMEM;
+
+	return i;
+}
+
 static int mtd_nvmem_add(struct mtd_info *mtd)
 {
 	struct nvmem_config config = {};
+	char name[128];
+	int ret = 0;
 
 	config.id = -1;
 	config.dev = &mtd->dev;
-	config.name = mtd->name;
 	config.owner = THIS_MODULE;
 	config.reg_read = mtd_nvmem_reg_read;
 	config.size = mtd->size;
@@ -562,6 +584,13 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.no_of_node = true;
 	config.priv = mtd;
 
+	if (mtd->name) {
+		ret = nvmem_next_name(mtd->name, name, sizeof(name));
+		if (ret < 0)
+			return ret;
+		config.name = name;
+	}
+
 	mtd->nvmem = nvmem_register(&config);
 	if (IS_ERR(mtd->nvmem)) {
 		/* Just ignore if there is no NVMEM support in the kernel */
@@ -573,6 +602,10 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 		}
 	}
 
+	if (ret)
+		dev_warn(&mtd->dev, "mtdev %s renamed to %s due to name collision",
+				mtd->name, nvmem_dev_name(mtd->nvmem));
+
 	return 0;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
