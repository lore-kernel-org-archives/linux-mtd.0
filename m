Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587BACCFA03
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tL/IH5AhEx5mb+swuBt9hBxkZ8B8L/r7BOWMn7BRqs=; b=RZlLB+4K9++sAw
	huEWA9ye2YPeRv8rDu6lzhqzJCrGdbwUwvOsKYw15f81EyQZ1M2oL9KAmnOiMFbkO6aEv+ilWE4tP
	pYWZ2yKWj8NPn3NBQG2zCLP8+loz/Or1muwpldI18L2l6tSUs9+a1QD34pzRLSmLBrfuFgD/ynvBo
	9pWekE/z4KDV05DQJv1LxdgRj39YtoMx5E328/+LK99fEOM7NAoolrLAeYZRmgzSrgAyRcn72V1T9
	Efe9L8Ir5hzHF3nEVr3qu9xhUOwqQpDcz400p6Sih+wn9imAppfMbfjXfDDYiL5Dl6ZysRfY0hLDU
	Kny2EwzTNMbyuOt9s2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stZqP-00000006bBu-27iy;
	Wed, 25 Sep 2024 21:46:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stZqN-00000006bAQ-0190
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 21:46:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso2262755e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 14:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727300801; x=1727905601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T9c6jNuxQUPP/Rbzo55YkzEPcrdsPIICvkg9bn4/tM=;
        b=ZSbYlBfHMsHKvbGCbpLtsUKH6CVn9dhxB4SMQweSr8pVeuVvcF7xbj33Yef6V7Jnao
         ZjjbQRpW7ycD+yX6shnR8+7rO5aTMMq0nfU31EOAB8PkNL9ot+Dbkd5XJXYqm97M5eDX
         nDep/wrvEvbrMr+JP/2+KA26rx1Gye4+qrg46o89egFXfxmX6x2T3NB3yX2C9wcAMxed
         lhHG2jDr/hj8h4GAg+4JBow6o9LwiYzpJqkNkQMRtArf0GcBMlDnXJHGWi6+7nExfBlO
         CrlatnBQWXUKJnGCyQTbRxt58rwYu98zHl77hN6nTAjeUUzYQ4/rVh7BpSFTDSz5KdeO
         lAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300801; x=1727905601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T9c6jNuxQUPP/Rbzo55YkzEPcrdsPIICvkg9bn4/tM=;
        b=gYVDQN8o1tpSomtVIiTXjMpYY9cw/GNHtjLjJiW/ocbVsAHqbvhP+APF1H50HqMgFB
         h+2Miuc+6n3RId8FTqWYOiweOYY2LwIMiAAcElpWCEKS0Z9GrZZLVHJUZn5/VXHww8oH
         8rjz0IMpkw3rBYu4U5n61Rjlwnl61wLcjtT/VIbYb3jMAjGRLAZZynsZ/CdARGpFuQ8t
         k8lIE4AMTrIa0enmfHAbexRJFxm8khL3Qe2hbZptTlg1NTT5dxlz8AHlrswgyXrLImO9
         J9GhSlyCwF48QCO/LokXad8pU5sCKqjjqTQeXW6GygEnz06iAb/AsVIDLAv/WnoSdZKp
         A+Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXel2O7BnIwFjByZlIKC1g4/d5SX1pHjqDbS8Q3n9JW33tgHhHW/gzwhE2Rhm/j/kIRgPcF3CT9spA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJW9X9XuPfoW8EX/7iMS4LUokwWRbzAk5G1DAV7hmMEyseuUuQ
	efjcJu3LYPFIF5g8swdcuGVutw561kPJkQMEJDR3wVZSeu+rUxAF
X-Google-Smtp-Source: AGHT+IFoBL1R6dV7SQmlZLkBLTdCPdCS80FZbnIfOFtYbfTr6iXHb66aYiNtJGIPYb/itJ2vx6/jEQ==
X-Received: by 2002:a05:600c:8a7:b0:42c:c003:edd8 with SMTP id 5b1f17b1804b1-42e96953e43mr23751955e9.6.1727300801042;
        Wed, 25 Sep 2024 14:46:41 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a1f2aasm28802565e9.45.2024.09.25.14.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:46:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Simon Glass <sjg@chromium.org>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Li Lingfeng <lilingfeng3@huawei.com>,
	Christian Heusel <christian@heusel.eu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Subject: [RFC PATCH v2 1/5] block: add support for defining read-only partitions
Date: Wed, 25 Sep 2024 23:45:21 +0200
Message-ID: <20240925214544.6114-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925214544.6114-1-ansuelsmth@gmail.com>
References: <20240925214544.6114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_144643_064291_3CB6E5E8 
X-CRM114-Status: GOOD (  16.92  )
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

Add support for defining read-only partitions and complete support for
it in the cmdline partition parser as the additional "ro" after a
partition is scanned but never actually applied.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/blk.h                | 1 +
 block/partitions/cmdline.c | 3 +++
 block/partitions/core.c    | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/block/blk.h b/block/blk.h
index c718e4291db0..f300212d3e98 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -558,6 +558,7 @@ void blk_free_ext_minor(unsigned int minor);
 #define ADDPART_FLAG_NONE	0
 #define ADDPART_FLAG_RAID	1
 #define ADDPART_FLAG_WHOLEDISK	2
+#define ADDPART_FLAG_READONLY	4
 int bdev_add_partition(struct gendisk *disk, int partno, sector_t start,
 		sector_t length);
 int bdev_del_partition(struct gendisk *disk, int partno);
diff --git a/block/partitions/cmdline.c b/block/partitions/cmdline.c
index 152c85df92b2..da3e719d8e51 100644
--- a/block/partitions/cmdline.c
+++ b/block/partitions/cmdline.c
@@ -237,6 +237,9 @@ static int add_part(int slot, struct cmdline_subpart *subpart,
 	put_partition(state, slot, subpart->from >> 9,
 		      subpart->size >> 9);
 
+	if (subpart->flags & PF_RDONLY)
+		state->parts[slot].flags |= ADDPART_FLAG_READONLY;
+
 	info = &state->parts[slot].info;
 
 	strscpy(info->volname, subpart->name, sizeof(info->volname));
diff --git a/block/partitions/core.c b/block/partitions/core.c
index ab76e64f0f6c..abad6c83db8f 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -373,6 +373,9 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 			goto out_del;
 	}
 
+	if (flags & ADDPART_FLAG_READONLY)
+		bdev_set_flag(bdev, BD_READ_ONLY);
+
 	/* everything is up and running, commence */
 	err = xa_insert(&disk->part_tbl, partno, bdev, GFP_KERNEL);
 	if (err)
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
