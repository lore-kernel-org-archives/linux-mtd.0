Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20903C52D72
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Aug 2024 17:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFNH6rLZcRbqSC/M7jX6e7cne+Ib0SWNir99onyphDU=; b=1E0B1IqPQXKq0V
	8MbhfviuDKD/T0brBFm88KtxlgKo26f6TjgxHqU/ZGczmAtXRZorHKWMqn8HjB8aT+FKZk2vZCxZR
	qya7mmXUP6oU+aWLXAr7HPKz0jzN4STbm8JWdLV+LY0m0IHwq5uN1uMMPgxy6d8Yk/hmvJhjyqw07
	bkTpAvRANV6atXvPdSYYZCRY4xjFZDj7kX1uiQPbZrSBDwDoR8LcNSoSl0TUPov+w6EuBd1G9rygZ
	JWSqE/T43QUp10I0Q0NqlLJ0arAfcRGyJZlx+umQu/A9X0YoQr5y3el33/2KKD4SmeVfPkuMqIURb
	Z9SkKN9mY+xaRqUEQesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1safHe-0000000Dh0N-2HS9;
	Sun, 04 Aug 2024 17:44:42 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1safHb-0000000Dgx5-1tYD;
	Sun, 04 Aug 2024 17:44:41 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2f040733086so110276741fa.1;
        Sun, 04 Aug 2024 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722793477; x=1723398277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AwITVf2WPGSBxmw93SjsOJVEu1oqZyIKeUGfTrfzs4=;
        b=V7kKbc9KQ8FDDDL/NF0V8g329mi5CeoOfdZFQAA3nWrxWwAxSNU+TtGwh/YsOAmA9X
         hpdmqhMLlJSSesPubSsvz1u7qtxZ+OK8pCg7KQ64DDxLh1yqoWCMlCXnvY2YX6+3Xngj
         Fk/yCsnueOOdGKdSP7kIdB6e5PfJHpjTZIg+YKs2nRbymOwEhg1kBU5v9kscChZni7g0
         KIWrCUc6lRPCKV6TQcJcNqLIJpKm1LO7aBASejCCC4nbAZTJgGuCpDARoYLUuOFKXqfR
         1U5Luk1FLKQEEPuhCdEmI/nnLN9z4Kg1X7/SEQEoM9ZjXycfFbe9T969rixV8L3/lfIv
         5exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722793477; x=1723398277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AwITVf2WPGSBxmw93SjsOJVEu1oqZyIKeUGfTrfzs4=;
        b=lCtu6GiVVZX/fM6oGD3UE2/r6ATUtD7JXovkB1+rkCwHEEG1OHBBOZTsBalHi688Bi
         z/7KJ2quRvfmTp3jYBr0rtWoxxA4pzQx2Tq7/H50zDmIlSDSDkSydHOcWodP/ZnYR/rH
         1Jy/gPSwOY5omIM+XQaWPFgFsGEJ4B5nyefYui77+Vv71c9jLvNN8tw25O6fwsYOQKAR
         4nABPKAf2iyD+8gzLAfTsXtF9PnXVEyMO38Jok8akjjV/7l5zjYvrQHLiGXpKpAJqYo5
         zROpwkX7W1o8op5TIHuy0YfbLZQEUWGgmcXdosZqZ8z4D8CJRuB+2xZ2JY3E6jGLARD9
         Y0og==
X-Forwarded-Encrypted: i=1; AJvYcCXBn+yNDuFg06hKZGD60VcCcDBTb/43JZ7DP8Ob5ibSB1kbA3VNwhwSQl8bd3oJhGMh5xDQyjueNoQYOeK7ZdDosBysJwXVyqAh++AxJ25/JHofM+Ln98xsiXbzMbsELv3MF9hlxeq59C/u69WI
X-Gm-Message-State: AOJu0YwFNiBHv0otaizM7QjMhLvy87cxhMPYr43x0CYbX8cKNoNZyir1
	c+S6/vkLT8hmM+LzEB2jhah6QNLgzyd9FqAgu5G2CKPoMlXuLZwPaPtnCw==
X-Google-Smtp-Source: AGHT+IHwTmhJSwb0UG1rOpSRK6ekgmxd5y81uHXMaKyWlIHKHAQERVOHMSA2nnFtlJccl0EgNbQB/Q==
X-Received: by 2002:a05:651c:213:b0:2f0:1ead:b72d with SMTP id 38308e7fff4ca-2f15aaa3e9amr61952151fa.12.1722793477247;
        Sun, 04 Aug 2024 10:44:37 -0700 (PDT)
Received: from localhost.localdomain (host-87-6-196-30.retail.telecomitalia.it. [87.6.196.30])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-428e6e0357asm109530485e9.12.2024.08.04.10.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:44:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Joern Engel <joern@lazybastard.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH v2 4/6] block2mtd: attach device OF node to MTD device
Date: Sun,  4 Aug 2024 19:44:08 +0200
Message-ID: <20240804174414.18171-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240804174414.18171-1-ansuelsmth@gmail.com>
References: <20240804174414.18171-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_104439_543162_01FC7DBC 
X-CRM114-Status: GOOD (  16.60  )
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

Attach device OF node to MTD device if defined and the root blockdev is
being used to add support for partitions defined in DT node.

This permits the usage of fixed-partition or alternative parser with the
use of block2mtd module.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/devices/block2mtd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index b06c8dd51562..8ff9787edc24 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -265,6 +265,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 	struct file *bdev_file;
 	struct block_device *bdev;
 	struct block2mtd_dev *dev;
+	struct device *ddev;
 	loff_t size;
 	char *name;
 
@@ -324,6 +325,15 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 	dev->mtd.priv = dev;
 	dev->mtd.owner = THIS_MODULE;
 
+	/*
+	 * Check if we are using root blockdev.
+	 * If it's the case, connect the MTD of_node to the ddev parent
+	 * to support providing partition in DT node.
+	 */
+	ddev = disk_to_dev(bdev->bd_disk);
+	if (ddev == &bdev->bd_device)
+		dev->mtd.dev.of_node = of_node_get(ddev->parent->of_node);
+
 	if (mtd_device_register(&dev->mtd, NULL, 0)) {
 		/* Device didn't get added, so free the entry */
 		goto err_destroy_mutex;
@@ -337,6 +347,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 	return dev;
 
 err_destroy_mutex:
+	of_node_put(dev->mtd.dev.of_node);
 	mutex_destroy(&dev->write_mutex);
 err_free_block2mtd:
 	block2mtd_free_device(dev);
@@ -515,6 +526,7 @@ static void block2mtd_exit(void)
 		struct block2mtd_dev *dev = list_entry(pos, typeof(*dev), list);
 		block2mtd_sync(&dev->mtd);
 		mtd_device_unregister(&dev->mtd);
+		of_node_put(dev->mtd.dev.of_node);
 		mutex_destroy(&dev->write_mutex);
 		pr_info("mtd%d: [%s] removed\n",
 			dev->mtd.index,
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
