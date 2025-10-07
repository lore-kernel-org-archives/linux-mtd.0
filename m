Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61508CCA476
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Oct 2025 22:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gzeQgUd18tsBv5zmGHiGN1fOkEV4Mid0dJgqZqCd/eU=; b=q8xeMNvy6tSf0G
	7ryGRmEu+eStlh7p1vAdoJO7Rr5dTa64fPXo4Gw4XHSzoa0M2EP+ZipJVy4Z/c4CzOu2jwkPIVGuy
	eP35KzqktO42g9tjFyx0rPj0ZDT3+H6D+o9mU0OCfBnENjXLmXU3uRjx2Ebg7DXIE0wy69O6Sybnt
	g6w4NpmLfyex8Dr75Xjs3kaVnAAAIaYMY0yPyV71IWL/FNWGUzmAobIC8tE5pTWmR6ZgTGHATSGvf
	M02elT7cruLxCh/DxLh1571UdLL9ACFrL5QH+Sun6Z/6qdYFoGwZP3CKoYeOzBjWxNOY1mJ9bs9qq
	NhPrLlf+2BJmf5AZrYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6GMp-00000002tTo-2Lu4;
	Tue, 07 Oct 2025 22:41:11 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6GMm-00000002tSu-34xN
	for linux-mtd@lists.infradead.org;
	Tue, 07 Oct 2025 22:41:09 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-74572fb94b3so4016098a34.2
        for <linux-mtd@lists.infradead.org>; Tue, 07 Oct 2025 15:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759876867; x=1760481667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IBfCBek8M+CyleueLSM0/f7MhRf1ZAzzj8LCZK7gE+I=;
        b=EKwrY6cGmCkqMjSkF6LSN7IF5l8swBP/Wyf/ITaQRWADGr3g1kZPD/wEEkL6G28zBo
         xGUjR632fhUzgbwdWd4mokKDYcR47jlJ6W4Ht6XFQDGNrL2gMVI+6Xde3n3lOFn4kjGf
         aP7w+pefg6d+uvKjviKDJdokSyznktHKYYfHpsYWwrvegS7iMsPGvbnP6RePy1/HKqvO
         A3/C1ak/PFv7aCNbqrcV+Ugn3TJid4bDMUM3pARquXW2tf19/sVfTZwnY2DAgFfWkwB9
         yM+iX0JDzPWiNB8/xvPF/fUUIJZ44NYEVc0DXs+6U0efSn/dGNiZe8QDLttwNIDMupgE
         ZAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759876867; x=1760481667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBfCBek8M+CyleueLSM0/f7MhRf1ZAzzj8LCZK7gE+I=;
        b=cF4ObgUyAS2s7dSwuhGfsE4MQtZxSb1cGZlugMAu0Bi7Vhw8EXb6MtrGToqPkoeteZ
         QAvh7DkneY617WCbsIEBZNWVZladpcLyNIm6DFLUzdCYDufwLAqXbifZ0I/huzdIjztG
         4UXmNJMpdubnVI+5ucptSLr5Y0gkhHqWL7hJHu6ZAXqzvoZJ+kNHmhig4FVT3qOspSBz
         Prs0+BxTcPUDvB13JdnTCL+OPOnI9pgV6JtU0tn3HfjyCOHeyLF6Ijcnguzwxqz8b4kO
         MrTtKyzRv4KLyvGF38OGq8p8wNCRH2LcitN+ZM40qyrBqhSZlv/1iGTw3lXrLvJ5BGJU
         9rVA==
X-Gm-Message-State: AOJu0YweG+kCcEjTPEIteIfQGizQqyew1OzIldyqgSoFSqJiMmowHbeI
	jXZ6zzHL/U1whtdWztyjDV61zFZvjiwYgU2TsX9wtinah2+cHJUpM95zGoiMafdB
X-Gm-Gg: ASbGnctVOpo7IEVsDXXBPjXSgNY2f22LYrLATIbyXaLsJSm7BDyRvmiw5rNwhHZ06S+
	ED+HNO07sOIMWAZd4QCOUiH2dZ6Cd4DhYij8trTv8FzfVQBlZWtL0/1cS8dRWiVKSkeVWeM5yK0
	uPrDyCm/rewbH7ciU4vSd7FPz3jCwpTePE1fS1iPloFTjEVL8ZO+UwQAoHIEwSjxo2Op9qrP+RS
	bmGsYxfDYbFhoAudXrrWmv4sDjqHybQKsCU7cv6du+9AIWiT1gfPx06qTomWK4Obp0wG0NkSHIm
	Bw+bns2TePOqTP1hEfglO+xCGN5YH7gG1cypCraXAHILsBbLB3KnB8+XP3dDSrTD2hR65YA3P7J
	WSxhzawJ2q8JA3W2Qt1fRFa7txxMRjPjqiuPtMW1SJDhM4/5I1zPbhhLbh2iBrQ1/j/eNb4DciE
	bzIMmjjIt76n5NJU8sVK8f2+jquo37bFriZ8wyhP4vv+ccW7p80MOydteyl/x6JdadFwXC/G/f
X-Google-Smtp-Source: AGHT+IE1J58eiP+VZ/SYqsE+VJxT4uZEnpYq5J2Eo/+1x4KBfgRwP/Uu6PgKxEpsZMKZSBrgZnKoSg==
X-Received: by 2002:a05:6830:d8d:b0:7af:1d61:1055 with SMTP id 46e09a7af769-7c0df784309mr973015a34.21.1759876867142;
        Tue, 07 Oct 2025 15:41:07 -0700 (PDT)
Received: from uacde259c55d655.ant.amazon.com (amazon.com.bear2.houston1.level3.net. [4.1.110.174])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7bf434f904dsm5265419a34.29.2025.10.07.15.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 15:41:06 -0700 (PDT)
From: jayxu1990@gmail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	avnerkhan@utexas.edu,
	rdlee.upstream@gmail.com,
	Jay Xu <jayxu1990@gmail.com>
Subject: [PATCH] mtd: core: Add nand_id sysfs attribute for NAND devices
Date: Wed,  8 Oct 2025 06:40:49 +0800
Message-Id: <20251007224049.2798233-1-jayxu1990@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_154108_780028_8C424905 
X-CRM114-Status: GOOD (  22.34  )
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

From: Jay Xu <jayxu1990@gmail.com>

[Problem]
Currently, NAND devices do not expose their NAND ID through sysfs,
making it difficult for userspace applications to identify the specific
NAND flash chip in use. For supply management reasons, electronics
products are typically manufactured with multiple storage device
suppliers, creating a need to identify which storage device is used
on a particular product. The NAND ID is a semi-unique identifier that can
be used to determine chip-specific characteristics such as maximum P/E
cycles, which is essential for NAND health monitoring and wear leveling
algorithms.

[Solution]
This patch adds a new 'nand_id' sysfs attribute that:

1. Exposes the full NAND ID (typically 5-8 bytes) in hexadecimal format
2. Only appears on physical NAND devices (MTD_NANDFLASH/MTD_MLCNANDFLASH)
3. Is hidden on virtual MTD devices
4. Reads from the master device to ensure consistent ID across partitions
5. Handles on-demand ID reading if not already populated during probe

The implementation uses a separate attribute group with visibility control
to avoid affecting existing MTD sysfs attributes. All NAND partitions
from the same physical chip will show the same ID, as expected.

This enables userspace tools to reliably identify NAND chips for
health monitoring, bad block management, and device-specific
optimizations.

Signed-off-by: Jay Xu <jayxu1990@gmail.com>
---
 drivers/mtd/mtdcore.c | 60 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5ba9a741f5ac..9290dbe04093 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -34,6 +34,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/rawnand.h>
 
 #include "mtdcore.h"
 
@@ -339,6 +340,54 @@ static ssize_t mtd_bbt_blocks_show(struct device *dev,
 }
 MTD_DEVICE_ATTR_RO(bbt_blocks);
 
+static ssize_t mtd_nand_id_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	struct mtd_info *master = mtd_get_master(mtd);
+	struct nand_chip *chip;
+	int ret;
+
+	/* Ensure this is actually a NAND device */
+	if (master->type != MTD_NANDFLASH && master->type != MTD_MLCNANDFLASH)
+		return -ENODEV;
+
+	chip = mtd_to_nand(master);
+
+	/* If ID not populated, try to read it now */
+	if (!chip->id.len) {
+		ret = nand_readid_op(chip, 0, chip->id.data, NAND_MAX_ID_LEN);
+		if (ret)
+			return sysfs_emit(buf, "read-error\n");
+		chip->id.len = strnlen(chip->id.data, NAND_MAX_ID_LEN);
+	}
+
+	return sysfs_emit(buf, "%*phN\n", chip->id.len, chip->id.data);
+}
+MTD_DEVICE_ATTR_RO(nand_id);
+
+static umode_t mtd_nand_id_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	/* Only show on NAND devices (excludes UBI volumes which have type 'ubi') */
+	if (mtd->type != MTD_NANDFLASH && mtd->type != MTD_MLCNANDFLASH)
+		return 0;
+
+	return attr->mode;
+}
+
+static struct attribute *mtd_nand_attrs[] = {
+	&dev_attr_nand_id.attr,
+	NULL,
+};
+
+static const struct attribute_group mtd_nand_group = {
+	.attrs = mtd_nand_attrs,
+	.is_visible = mtd_nand_id_visible,
+};
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -359,7 +408,16 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_bitflip_threshold.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(mtd);
+
+static const struct attribute_group mtd_group = {
+	.attrs = mtd_attrs,
+};
+
+static const struct attribute_group *mtd_groups[] = {
+	&mtd_group,
+	&mtd_nand_group,
+	NULL,
+};
 
 static const struct device_type mtd_devtype = {
 	.name		= "mtd",
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
