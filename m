Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFE6C3DA7F
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Aug 2024 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UG3Qk++GJsmkOgoau2Sr+O6CzV/Myi5uQSOpmnh/xns=; b=G4YuIa5xcNWZ+p
	RHzSgxD1aKHUDbDtEDqQ4MqglcSi0kfn2R8dKgPxMehkzZe/pyHktqmqbY7CayyZc6ZyBqHO58Zvl
	4LJE+fqdEDVl419Ho43dVYQkXyB1AZpwNsGnZ3cnxfmDHBGL6OKw7qASRCUu+z/nmuM5OlaUv2Om8
	U9h3SeiKMAo4lRadpwtGbQumWT3RkQBTclte2YVSPCqJX9BfYD3iYFrosabKT74YGQ8/QYE3V1GLf
	yAkSELLmRAZssa1nLKl9YdxMVdHpUeBzs2dYphoq17/x26GSg+AhYgrqby/MtBgey1fDc9xT2wfIE
	2exqZPaZo6iTWQth8ZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saZcp-0000000DAgN-3Tb0;
	Sun, 04 Aug 2024 11:42:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saZcl-0000000DAbb-1c9Q;
	Sun, 04 Aug 2024 11:42:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-367940c57ddso5120460f8f.3;
        Sun, 04 Aug 2024 04:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722771725; x=1723376525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGVXwGIeb7N3J4+10swQ61/JYCMx3W28Do3i6QPWuig=;
        b=a3lkIN7q2yN9N6AEtl/ualoTgN0y7g229nRg9b62FwCmwKKC0kKOLxvVZ4Fh66mMu0
         bUSjzWcu/BwypLFJ0/YWKcXynm7ug/aiggG4i8UjepfXfQY4KqCsM4twCAr7j4lzJnhr
         Iborj6Z6yllGyXwawT8PESTfHTQ6OyN3dFIFpCYmUgZf72ZeYPoNx5X63cMusDNk5kO6
         FBHnx8fxvSNN3RTJPXHdO4oxTSpTYsPwULGg0WFb5YSBUlC+vKmYXRfazAc3hZQSSXnk
         OsVJGMhbLFxNy2zanHl83K8gwOT40Lmc0G4lLFyS6znscLmyQ4IHqANfvTSJd7gM2ZS7
         +PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722771725; x=1723376525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGVXwGIeb7N3J4+10swQ61/JYCMx3W28Do3i6QPWuig=;
        b=D+HwU6kzd8QkO/lsvThOyiKvxZCGKskpMAOltli0CILgvoTfwTIQL5GSygKTZ1dM1c
         ZwYGSny2RHEXz4lfOZYwyCLvwgNNUfAMPW3s9pE6o/oSzn0qLpexhZ5zaDzJkT9Bkyin
         2ADeywou3d5lD3q0TXMxZhci6apxhiFz9YPGUjB6WPf+ZNfZUwDeqZHPenY8D5sXbVdT
         ilaxxk4peLwl3qkPVPo6/QmfWmaPOzGIjKNdserQr3YKzH6CYt/tQy8hb40YnTdYuafB
         jhls3hBscVs3eJBJlhJaYiov3nkroT5RoYUK0iABz7hGExoHVf9cU6kFYz6e1FBOiuOG
         Ulyw==
X-Forwarded-Encrypted: i=1; AJvYcCW/B0CRJuSsYlR0hlxiDkceIxiKCR3fUIG6ZSue8yujR++gitd9chprdu2P0cuXdoCg+LP0BrdqCCZuDthGWenGMXMD/Xt0vh4ka/F4gdwbdENKhZUlgzgv3tpTW+YxQ6e7qfPZF0QhkS5bin38
X-Gm-Message-State: AOJu0YyMHc8wbNgErA4ZtBQkc200/2jLMi0L190PlUU+177Rjc7Zi+lU
	UulSmrFqvX9KEEBCQmUlK9hr4PBTmTI3L/Drn/LjuMhe9mlz1Hvy
X-Google-Smtp-Source: AGHT+IEkEsf7rgv+FK5pMw1rjBxefAm0Wya/QF5fP5oHTqQufDhgjOYXj5NRtQfw4DJZ93Td23+0cg==
X-Received: by 2002:a05:6000:1faf:b0:368:d0d:a5d6 with SMTP id ffacd0b85a97d-36bbc1beb75mr5955215f8f.50.1722771724985;
        Sun, 04 Aug 2024 04:42:04 -0700 (PDT)
Received: from localhost.localdomain ([109.52.148.115])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36bbd01eff1sm6635130f8f.44.2024.08.04.04.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 04:42:04 -0700 (PDT)
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
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH 4/6] block2mtd: attach device OF node to MTD device
Date: Sun,  4 Aug 2024 13:41:04 +0200
Message-ID: <20240804114108.1893-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240804114108.1893-1-ansuelsmth@gmail.com>
References: <20240804114108.1893-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_044207_602247_9D1EAF1A 
X-CRM114-Status: GOOD (  15.94  )
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
 drivers/mtd/devices/block2mtd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index b06c8dd51562..0c4ecea51717 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -324,6 +324,15 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 	dev->mtd.priv = dev;
 	dev->mtd.owner = THIS_MODULE;
 
+	/*
+	 * Check if we are using root blockdev.
+	 * If it's the case, connect the MTD of_node to the ddev parent
+	 * to support providing partition in DT node.
+	 */
+	ddev = disk_to_dev(dev->blkdev->bd_disk);
+	if (ddev == &dev->blkdev->bd_device)
+		dev->mtd.dev.of_node = of_node_get(ddev->parent->of_node);
+
 	if (mtd_device_register(&dev->mtd, NULL, 0)) {
 		/* Device didn't get added, so free the entry */
 		goto err_destroy_mutex;
@@ -337,6 +346,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 	return dev;
 
 err_destroy_mutex:
+	of_node_put(dev->mtd.dev.of_node);
 	mutex_destroy(&dev->write_mutex);
 err_free_block2mtd:
 	block2mtd_free_device(dev);
@@ -515,6 +525,7 @@ static void block2mtd_exit(void)
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
