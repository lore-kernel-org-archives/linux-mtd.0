Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126A2CCD184
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Oct 2025 19:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbN5rFM8B4VTqG+mSTqC1EoXANriHvibX9KaY9eEbvU=; b=TUlugdcGZdA0Pm
	n0YAPD1dgIgKsdMyLGp6K7VM8d/QkL4gyyawPNCmFXLSN+nmpB5Mf0FhojQtYscXukgftoekv4cRl
	Rjk2gNf5AufISMrOASiBH/Vli5Yh7m2kZgEOXTG0HQunPx3wHYL/9+4ZkWDwhPgFhytT1mDq2anmF
	FZihjdsl9VpbKAPFeaBFfBqbKBM99z/LJtiq/1aDWDJSfira7bdegcQbNxaWyG9v/OrtxSg9LX7Ts
	TKPBr+D57ogkCgTCZxzIM66xmAQ3NB7F8NH2+OXwG+XGczXKv2SptKnVBvmZijehr1FJjBzIuA464
	/1PKmdIQKxPXRutbhnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kfH-0000000HGKL-3H44;
	Tue, 14 Oct 2025 19:26:31 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kfF-0000000HGJV-3MWn
	for linux-mtd@lists.infradead.org;
	Tue, 14 Oct 2025 19:26:31 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-646e4209599so1655283eaf.1
        for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2025 12:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760469988; x=1761074788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHj2o7EikP5ncHLSx75L5WIqeqxqTpkWVTbaajhRFdY=;
        b=T0mp/291x6IBMFYVkXOSKUGoOzgAr1dvyx9bJFZcvxDN+Rn0Dt72m/BgQEa2qtEf6+
         75fXBifl3GNvW7DFBeobQHKjyB70AxfGCC9+mJuKuXDRP4cr8zdu2z2U/8SzwWcBscjx
         NqG/KVCY3aXNk1yByhzrpjVV1lU0tmXU2NbEPNh3niFu6RTH6wC+dPV27kCWq0DK9m40
         boOjrik6Qw+ByPf87fqWUpgSPfInMRhpI8w1K+ANyXAslD7kQyuKuJImfDO0fsOPj3fd
         7MSfCU2gUpw5gUkr0nvK+ZHlb3J7DnUzBLcVSqmIF4FJS3tWlLLCllNWIA5WvFjO3KVV
         fU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469988; x=1761074788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHj2o7EikP5ncHLSx75L5WIqeqxqTpkWVTbaajhRFdY=;
        b=OVBrYqwadSTIlt5tXnL0Sn1rr53yKo4sm2FkSznhYDSbXulPEAgimpwAr0p+LM8Gk/
         2r/TNxz1lA7MRjtBrGo3wbXr0DK12DRKz/U9rlfE9wraxJhMQoYCkJA+HB9synq28Hgi
         YzbmVo7mNUjOTccI+Jd7DaIDn9V6TWPUiOAYm4kF+85T74ONK7+EBD9PJVB//ThSbAd7
         9FbZ08TL53OmQnhFH6wb2SMbXf4RWahpDZYACvUUXuZba+Zjv7o+s4+jEP5yh1a1bhBp
         sFKUvSdaeUJcFez4kEvBp7+667Ep+M1a+JIkdep4lMKEy52UB9lILX9vTq0nveVZQ5Qd
         e9BA==
X-Gm-Message-State: AOJu0YzQiJON+XWCw5lXKbgWgzaaBg1CJ0tVpak6K6sciybjmEWihJm3
	4c87Xx9APBA054fBzpwn5AWgfy53lKJ/8bUUmNE3Jn2yPkddvDg0G6f0
X-Gm-Gg: ASbGncvo5vEWzrBdGxqxYM8a00EXONQ9ccaVQD0Bc7Wre3+ini8HU4Qjd8LbON7DIv0
	yNvds+86Se/ZfrzX9c9jxuL7pQWbVuaMwMte0BiKFMgGuo7HVUeqvdRPB+R/We9+k/hrHmMIvz3
	frZi6DDboNajFwJSOu8MbQma6EfAvQiRYpjHlpIOGPIy4jxfzuNJXsY9YeuLTKuBtGQdwr/3PKu
	kHdeJAZ+S9iX/fuvYBOqpfuioevYsJbXiHP3mYIjY0xylMxOVSSnn8CRRANlFYxc1GjPVadsKRB
	8O6S+0qmgtHjO7yRyIzqVxVt0XO9QhoxYuqYGz2nwa32LylAaBjskCBI0lsM9DGirtR+MJ/JXDQ
	hJuI6fEQ1cFnMAPF8t4H05elW7kNnLGlVZPzzwLa0kV4hW6ejIZRGis4rxdZV1tHGPBxvO8fUjz
	iri7Q89tA6P7JWbl0w+SYviz95eD4xnr1d6vf+qMGXKGK5nv1CC2SFmzi3VtAp9BwUpxWueIAPC
	sfULA==
X-Google-Smtp-Source: AGHT+IGpw9Z0DqqqaYc7jrfIT4qzqxvoATfSl2lPXdgh0jkAvhk0Wy0FALGUWrAmivzsiW51YvVpGw==
X-Received: by 2002:a05:6820:4dc7:b0:650:4db7:22ed with SMTP id 006d021491bc7-6504db725b3mr87792eaf.0.1760469988343;
        Tue, 14 Oct 2025 12:26:28 -0700 (PDT)
Received: from uacde259c55d655.ant.amazon.com (amazon.com.bear2.houston1.level3.net. [4.1.110.174])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65018200f2csm3597157eaf.18.2025.10.14.12.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 12:26:27 -0700 (PDT)
From: jayxu1990@gmail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	avnerkhan@utexas.edu,
	rdlee.upstream@gmail.com,
	Jay Xu <jayxu1990@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] mtd: core: Add nand_id sysfs attribute for NAND devices
Date: Wed, 15 Oct 2025 03:24:55 +0800
Message-Id: <20251014192455.4007534-1-jayxu1990@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007224049.2798233-1-jayxu1990@gmail.com>
References: <20251007224049.2798233-1-jayxu1990@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_122629_848964_5D9FC004 
X-CRM114-Status: GOOD (  23.31  )
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

The NAND-specific code is conditionally compiled with CONFIG_MTD_RAW_NAND
to ensure clean builds when raw NAND support is not enabled.

This enables userspace tools to reliably identify NAND chips for
health monitoring, bad block management, and device-specific
optimizations.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510120356.STGKDkA5-lkp@intel.com/
Signed-off-by: Jay Xu <jayxu1990@gmail.com>
---
 drivers/mtd/mtdcore.c | 66 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5ba9a741f5ac..215e316194b4 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -34,6 +34,9 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#ifdef CONFIG_MTD_RAW_NAND
+#include <linux/mtd/rawnand.h>
+#endif
 
 #include "mtdcore.h"
 
@@ -339,6 +342,56 @@ static ssize_t mtd_bbt_blocks_show(struct device *dev,
 }
 MTD_DEVICE_ATTR_RO(bbt_blocks);
 
+#ifdef CONFIG_MTD_RAW_NAND
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
+#endif /* CONFIG_MTD_RAW_NAND */
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -359,7 +412,18 @@ static struct attribute *mtd_attrs[] = {
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
+#ifdef CONFIG_MTD_RAW_NAND
+	&mtd_nand_group,
+#endif
+	NULL,
+};
 
 static const struct device_type mtd_devtype = {
 	.name		= "mtd",
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
