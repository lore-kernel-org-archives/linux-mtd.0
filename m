Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9619C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPOp0p5OjADsO7I53aTLD2yt0qirDdTqEkfrSfYpfIw=; b=WgxYuq2AjyOMzx
	Ql0eugDmfQ7qsDfXErgTZf7LiRBFjbin4sUKTDlWRjUZDcKBzYoLBEPFqGieOngKMjmNHWJmxyF8I
	HZxhBgPx6uIVbcQGrXH/mcikDjGgUsTGgkwhyj/z97tVDeXmQd1YE7DTf3X+MEbHt/aWOApqGF8q9
	fGnj9g1oz9VpDFPu/zPJaf0wnN83zZ59hgIkZ6eiF5NbKW1/hlBysyWsCz9uNW2JKKyR1+8E00GBZ
	0hU0jNg4CtPU3tn+MSToqy1LnxXvVkoRo8q/jlcv2Nx075WPpi3QVtzZBcHLkB6oL6LdLqkcRikOC
	I2m4hl4FLU065/V6z4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LMh-00HQwq-34;
	Wed, 31 May 2023 12:55:47 +0000
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LMf-00HQvA-0T;
	Wed, 31 May 2023 12:55:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pavel Machek <pavel@ucw.cz>,
	Loic Poulain <loic.poulain@linaro.org>,
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 01/24] driver core: return bool from driver_probe_done
Date: Wed, 31 May 2023 14:55:12 +0200
Message-Id: <20230531125535.676098-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531125535.676098-1-hch@lst.de>
References: <20230531125535.676098-1-hch@lst.de>
MIME-Version: 1.0
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

bool is the most sensible return value for a yes/no return.  Also
add __init as this funtion is only called from the early boot code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/dd.c             | 6 ++----
 include/linux/device/driver.h | 2 +-
 init/do_mounts.c              | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 9c09ca5c4ab68e..878aa7646b37e4 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -751,14 +751,12 @@ static int really_probe_debug(struct device *dev, struct device_driver *drv)
  *
  * Should somehow figure out how to use a semaphore, not an atomic variable...
  */
-int driver_probe_done(void)
+bool __init driver_probe_done(void)
 {
 	int local_probe_count = atomic_read(&probe_count);
 
 	pr_debug("%s: probe_count = %d\n", __func__, local_probe_count);
-	if (local_probe_count)
-		return -EBUSY;
-	return 0;
+	return !local_probe_count;
 }
 
 /**
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index c244267a67443e..7738f458995fba 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -126,7 +126,7 @@ int __must_check driver_register(struct device_driver *drv);
 void driver_unregister(struct device_driver *drv);
 
 struct device_driver *driver_find(const char *name, const struct bus_type *bus);
-int driver_probe_done(void);
+bool __init driver_probe_done(void);
 void wait_for_device_probe(void);
 void __init wait_for_init_devices_probe(void);
 
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 811e94daf0a84a..2fe7901b5bcfaf 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -635,7 +635,7 @@ void __init prepare_namespace(void)
 	if ((ROOT_DEV == 0) && root_wait) {
 		printk(KERN_INFO "Waiting for root device %s...\n",
 			saved_root_name);
-		while (driver_probe_done() != 0 ||
+		while (!driver_probe_done() ||
 			(ROOT_DEV = name_to_dev_t(saved_root_name)) == 0)
 			msleep(5);
 		async_synchronize_full();
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
