Return-Path: <SRS0=3D+l=5R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB70AC2D0F2
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2020 10:03:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF8D72078B
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2020 10:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JUwUaeLH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF8D72078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rHG9nE5x/pIW+a4w2Q75WoggXrwUsADP7Tr0GoWZnCs=; b=JUwUaeLHgavpI6
	Yfz66FGTu4a7jU4swdoGibIg9AqlQ0PhHpPDABDVbyZ8AxbzIgWau4VnjVlvTu1HPnr5ZJQJb5Eb4
	xBk9Fe/l6Nz/mZNZs//D96t1zFcc9cEYpWhlV6W83q6qAQWnBUikg6hkUjt41GFkGEz1NUUZ4JLr5
	PLi0GT9yNcAViE4S05k2mgjeRDIRqmuQ+Etjm6KmuuBMv5SMXKBZjwZiDNjZ0uSA7hxAnSm0ZSn2W
	vJH9q2WrTVJHVj5J+SzyLqE6ine/jCKcNcT9pc9oYe2LS98m7glMHi2zdCRvLS31LzCx1L7nQI56N
	gpp15dzZubstn06+RL9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJaCv-0004gf-5m; Wed, 01 Apr 2020 10:02:49 +0000
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJaCs-0004gG-54
 for linux-mtd@lists.infradead.org; Wed, 01 Apr 2020 10:02:47 +0000
Received: by mail-wm1-f66.google.com with SMTP id t8so2515440wmi.2
 for <linux-mtd@lists.infradead.org>; Wed, 01 Apr 2020 03:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l+NuImXGHyqbLPK7qk/fnkfWqM1yyeCrvbhKbbFgkRc=;
 b=XyYN/z++yox7yS2xsdPrIjZdBC1Tm8GHHAr24XTtsq3mTW8VLa75nuOJ5ozBmxTmQb
 zFSYXR0Lc4sSimz4jX7BmUwgcvBBrjOgVN/esFgyfv2l84kM/3Igywss9A+a0N4WehU0
 WtgZRTLfyF5qsJP9Z5dcww1VRYxvJG/rz8nZL9t4K5xqRCkaBZs/Si8VrvHvs+GGerZf
 Ih9p5tqG4SFMz0CAYThLFTwzAPC5zSI5fLyssxJiN2xqQtg4OjWtzf/+ZP7blrK6il8g
 LKMDnshvNiY2v5pnvU+1TbZTJiUeUbHcYCl+K0w+gFX/oLn6I7xYnSay1SxCRg66xJ+o
 ymaw==
X-Gm-Message-State: AGi0PuanCCLB7y/xIMK5JA0UyK/aVCEJY8JKtdH34XCtSdKx8JdqiTMf
 m3HevdPDoyc07+drnEx2DkI=
X-Google-Smtp-Source: APiQypIWkniodw9O1D8mDGzIsjhoH6bNEgJBg8D5BpaUzTdYR6XpQEs2xXMX+iFlm/oIBarcX4mQeg==
X-Received: by 2002:a1c:6505:: with SMTP id z5mr3761401wmb.137.1585735363958; 
 Wed, 01 Apr 2020 03:02:43 -0700 (PDT)
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
 by smtp.gmail.com with ESMTPSA id f62sm1901272wmf.44.2020.04.01.03.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 03:02:42 -0700 (PDT)
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: Fix mtd not the same name not registered if nvmem
Date: Wed,  1 Apr 2020 12:02:40 +0200
Message-Id: <20200401100240.445447-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_030246_191811_2BF3ECFD 
X-CRM114-Status: GOOD (  16.57  )
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
 drivers/mtd/mtdcore.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5fac4355b9c2..7653d45a470a 100644
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
@@ -569,10 +598,15 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 			mtd->nvmem = NULL;
 		} else {
 			dev_err(&mtd->dev, "Failed to register NVMEM device\n");
+			mtd->nvmem = NULL;
 			return PTR_ERR(mtd->nvmem);
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
