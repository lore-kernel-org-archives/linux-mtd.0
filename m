Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3A3C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+z7TRMS3ezHl6D5v0jLNqE3hfUXlnoHVfInt3iycvM=; b=fptYoo9l/mDrBZ
	uVbuUuVeQzAAJh8LAa85Wmho3sv+sLp/wyrdpx2d93kQwMmIBABljvu3yq6xlYsDWPuBwTT+nKz8g
	/ALroaIAfqNHwrXRPP04aQuCVYQufpS765F6HX8l2WEZIoOdPdbfsHz02S+7ORCIreI15Tli+V9zQ
	bpfxTRF9+bnBs4lY0GLtzZeKccQx+TXs98hWpJTVxChUYtxlTA5h3GisgrL0Wf0SU19oIob61L8pG
	I1W40vm9NMP1xPFKrHGBmUET1CRTvHaF8ULGSLCxCeuc1qfZW36K9HFvSE6tcC+/z0WfWxg7X4fIw
	yZNUpqFiQ0doHQDQy3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LNZ-00HRWP-2s;
	Wed, 31 May 2023 12:56:41 +0000
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LNX-00HRRM-1M;
	Wed, 31 May 2023 12:56:40 +0000
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
Subject: [PATCH 11/24] init: factor the root_wait logic in prepare_namespace into a helper
Date: Wed, 31 May 2023 14:55:22 +0200
Message-Id: <20230531125535.676098-12-hch@lst.de>
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

The root_wait logic is a bit obsfucated right now.  Expand it and move it
into a helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 init/do_mounts.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index be6d14733ba02f..d5c06c1546e82c 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -606,6 +606,26 @@ void __init mount_root(char *root_device_name)
 	}
 }
 
+/* wait for any asynchronous scanning to complete */
+static void __init wait_for_root(char *root_device_name)
+{
+	if (ROOT_DEV != 0)
+		return;
+
+	pr_info("Waiting for root device %s...\n", root_device_name);
+
+	for (;;) {
+		if (driver_probe_done()) {
+			ROOT_DEV = name_to_dev_t(root_device_name);
+			if (ROOT_DEV)
+				break;
+		}
+		msleep(5);
+	}
+	async_synchronize_full();
+
+}
+
 static dev_t __init parse_root_device(char *root_device_name)
 {
 	if (!strncmp(root_device_name, "mtd", 3) ||
@@ -642,16 +662,8 @@ void __init prepare_namespace(void)
 	if (initrd_load(saved_root_name))
 		goto out;
 
-	/* wait for any asynchronous scanning to complete */
-	if ((ROOT_DEV == 0) && root_wait) {
-		printk(KERN_INFO "Waiting for root device %s...\n",
-			saved_root_name);
-		while (!driver_probe_done() ||
-			(ROOT_DEV = name_to_dev_t(saved_root_name)) == 0)
-			msleep(5);
-		async_synchronize_full();
-	}
-
+	if (root_wait)
+		wait_for_root(saved_root_name);
 	mount_root(saved_root_name);
 out:
 	devtmpfs_mount();
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
