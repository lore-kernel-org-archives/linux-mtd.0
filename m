Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E388ECA0EC3
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iAFQ+Y129NubW7tI/IUraa+9cA10Lwo5As6XZCH1heg=; b=VrPelYi4dxwYBo
	gtW+vHIRsoNgYct9isU4+eufk6gpwzcWnA724GxlKe4FB4d2B2dkyuX2Un617Z3CYJJtJfc2+iA/z
	2j4GsRQCXq/fzx1+eFtFIGi8oIxhBripMaTHgic5nsRYjzHUU9mFJzIEq557Yc23LpsMvXnJg3wm7
	VMihgbI8rFmas2MuCE6W44/xZKfvjdZyJoJg7GVjNqf2BV/Kf5qaemCTh3tcWqq1gniJTfoP+8Ifh
	pAYhTJc3qYBb77XCGsyE4HlcbpE318kUpJeVTKJbW1+Ix37OUXC5Q2fIELgQxQqDptHaJpQFPyirj
	c6uoI0NS9x0moiYpAYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKcV-00000002asM-32CT;
	Fri, 08 Aug 2025 10:46:43 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukK6z-00000002XVD-3qko
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 10:14:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3b8de193b60so1117797f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2025 03:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754648048; x=1755252848; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlopvggkmWltQy9MW6Am3UkajqZswoegEQEmKjx/+LE=;
        b=GB9RoP/fvdscz7w6y4QY0g86Q2suTAZrdHkIGf/LGd/a3Ug7Uv8DT0IJhQY58o+zDD
         ntxnoO6ejQ9XycBjZdRNaenW0jOQmo9KQkYf23WzOy/mwa0j84wB1wzxJa5cZ829ryuF
         FlIPwswRy8fBKwtAT+19VijkKcBQX2qRYjArFQE//2YhvGD0a7yy26UCCWG6dA8zPKjd
         zdoNQCgyPmX63azsAHQj1BYxA2XV6QddLHzz2Ht9NUBRMvAvMuk7DKlN9k8hl0n9p+Wj
         rjftxVkgvWzxGIeUrZhPGg2wspXzZpCeDNibdtbrimbnsvR5Ca+xootvBb5MnuTS4FKD
         qUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754648048; x=1755252848;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlopvggkmWltQy9MW6Am3UkajqZswoegEQEmKjx/+LE=;
        b=myvoRp69TiK4Cz/ULwkAjEizvqx5OBDOjXLIkNUF/d3TzAL+/ChlBH/OU3ObpeHynM
         y2Hezox5xlxk13unWM8E358/zKc0agEmJY2FQ7TRZY6QfoXj8D/8XX2OG7hVxLc1dnMu
         3t6HfnuiaTNSlEzKepQ83PX+KsVXFLBICDGq4GZjeABWM+m1zbkH1gAv5NvFmJ6B3UZL
         aj6S4TQikq7hEZjjkG4ITNaC7n1xMfUqeoPQ/P7683I6dr1SX8OiC2HWeD/x3oXwkmMp
         RL39ei4CLiAOc0CLhOBZEDCDO22i+c1E78LmlWey7QAx7y2zPq191QOyYwIRCvxTA/eY
         u9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXEGY9Xjjn0FLxxvNex0qM1GadSvt9LjzmbBAicT5HbCZjA1J9DhFjG9TEMXUPGRAR/wEvdTUnxqUo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3KucRGJmY8xSqkXBkxRrR4ErSEeQw+eCeBtwy6l7ucgbMdUoB
	r0h5cBJCKi/jViLIDu1r4MK05UUrwaXKNa6dta3V0hX2cUqqza4iUmJz
X-Gm-Gg: ASbGncuVdltLQLeA7NNZdi19T0/0Gwu/pbz/wZW5folmhpXNvPSyEfCwopxBwHWTro+
	qKUX1MwPACAibyBNzibtx/QXwZdPCh4AAvNWMRcIlbMgz8cuHcdVvQjHX8Y5EGXb7/ZgpyviBBD
	pGBhi9XDTp7fjNFLYTZZ8CfRM4BJHH7c/EcngbhXY2N0H1Cj07tPOpMKzanZ3AVxE4n2gt2DqMW
	qwHTH3lsnSAzhM+QuKdNp3mP5HpnQpahyXorLf+mGYbLntXXn7ZGYzc7rmIyyWRUqAZce/eR/fy
	lFcgLZpTDQh39JuKim37Aduo1TQjHvc2f625BpCD3/LhvAf9vf7pG2uMVrGbpDsOf5/knVqLyZF
	uMVJ0/3kDbTC8Tc4Fr1ay4CAs4C6a2qmMEGWOot43seTHG7mloOQ=
X-Google-Smtp-Source: AGHT+IEdy/jbdLYN+e27n7MEC8ya/SRxMZrvBHWFoaQjCz9Rqf1J5qSgsl1RQ6XbQSmwA1BDED6c7w==
X-Received: by 2002:a5d:5f8b:0:b0:3b7:940e:6529 with SMTP id ffacd0b85a97d-3b900929571mr2062954f8f.10.1754648047920;
        Fri, 08 Aug 2025 03:14:07 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-459e58400f5sm125834915e9.2.2025.08.08.03.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 03:14:06 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 08 Aug 2025 12:13:44 +0200
Subject: [PATCH v2] mtd: core: expose ooblayout information via debugfs
MIME-Version: 1.0
Message-Id: <20250808-mtd-ooblayout-sysfs-v2-1-fa620506d1ce@gmail.com>
X-B4-Tracking: v=1; b=H4sIANfNlWgC/32NQQ6CMBBFr0Jm7RhaAkVX3sOwKHSASYCaTiUSw
 t2tHMDle8l/fwehwCRwz3YItLKwXxLoSwbdaJeBkF1i0Lkuc6NuOEeH3reT3fw7omzSCxpj+6p
 UbWGKGtLyFajnz1l9NolHlujDdp6s6mf/91aFCil3Ve1qo0mZxzBbnq6dn6E5juMLUT8Gi7YAA
 AA=
X-Change-ID: 20250719-mtd-ooblayout-sysfs-77af651b3738
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_031409_957947_4C44BF83 
X-CRM114-Status: GOOD (  16.68  )
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

Add two new debugfs files which allows to determine the OOB layout
used by a given MTD device. This can be useful to verify the current
layout during driver development without adding extra debug code.
The exposed information also makes it easier to analyze NAND dumps
without the need of crawling out the layout from the driver code.

The content of the new debugfs files is similar to this:

    # cat /sys/kernel/debug/mtd/mtd0/ooblayout_ecc
    0      0   49
    1     65   63
    # cat /sys/kernel/debug/mtd/mtd0/ooblayout_free
    0     49   16

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - rebase on tip of mtd/next
  - expose informations via debugfs instead of sysfs
  - drop sysfs ABI documentation changes
  - update subject and commit description
  - Link to v1: https://lore.kernel.org/r/20250719-mtd-ooblayout-sysfs-v1-1-e0d68d872e17@gmail.com
---
 drivers/mtd/mtdcore.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5ba9a741f5ac3c297ae21329c2827baf5dc471f0..6a1a514021730fb4baafbf3803e900a9ed6b21b2 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -384,14 +384,64 @@ EXPORT_SYMBOL_GPL(mtd_check_expert_analysis_mode);
 
 static struct dentry *dfs_dir_mtd;
 
+static int mtd_ooblayout_show(struct seq_file *s, void *p,
+			      int (*iter)(struct mtd_info *, int section,
+			      struct mtd_oob_region *region))
+{
+	struct mtd_info *mtd = s->private;
+	int section;
+
+	for (section = 0;; section++) {
+		struct mtd_oob_region region;
+		int err;
+
+		err = iter(mtd, section, &region);
+		if (err) {
+			if (err == -ERANGE)
+				break;
+
+			return err;
+		}
+
+		seq_printf(s, "%-3d %4u %4u\n", section, region.offset,
+			   region.length);
+	}
+
+	return 0;
+}
+
+static int mtd_ooblayout_ecc_show(struct seq_file *s, void *p)
+{
+	return mtd_ooblayout_show(s, p, mtd_ooblayout_ecc);
+}
+DEFINE_SHOW_ATTRIBUTE(mtd_ooblayout_ecc);
+
+static int mtd_ooblayout_free_show(struct seq_file *s, void *p)
+{
+	return mtd_ooblayout_show(s, p, mtd_ooblayout_free);
+}
+DEFINE_SHOW_ATTRIBUTE(mtd_ooblayout_free);
+
 static void mtd_debugfs_populate(struct mtd_info *mtd)
 {
 	struct device *dev = &mtd->dev;
+	struct mtd_oob_region region;
 
 	if (IS_ERR_OR_NULL(dfs_dir_mtd))
 		return;
 
 	mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
+	if (IS_ERR_OR_NULL(mtd->dbg.dfs_dir))
+		return;
+
+	/* Create ooblayout files only if at least one region is present. */
+	if (mtd_ooblayout_ecc(mtd, 0, &region) == 0)
+		debugfs_create_file("ooblayout_ecc", 0444, mtd->dbg.dfs_dir,
+				    mtd, &mtd_ooblayout_ecc_fops);
+
+	if (mtd_ooblayout_free(mtd, 0, &region) == 0)
+		debugfs_create_file("ooblayout_free", 0444, mtd->dbg.dfs_dir,
+				    mtd, &mtd_ooblayout_free_fops);
 }
 
 #ifndef CONFIG_MMU

---
base-commit: 9cf9db888f387844e063efc6296e9fa5c042995e
change-id: 20250719-mtd-ooblayout-sysfs-77af651b3738

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
