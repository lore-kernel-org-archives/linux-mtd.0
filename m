Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E75C7EE33
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puXazqhRypjHUB/0NdfCgcxwb3MpZgtL458KUstIE5k=; b=O3/YdK86hfonaJ
	RCRJiDM9DQBpYRp49KkSDl/A11JFjevkpNuVFIjxSk6tNHAOtBCYxINA9u+GA219zhxejbxezo2Ws
	zJfq3F5PegtmeQbLODaD1FrgyLcewAMK/yE20VskbFhVpb0Z1CscLBUa0Z57F0BBS1YZ1smJfCA30
	mEiQhzBrFkHle9HiT8RIa0wR/JHLIgOgrTFKuptAmwATuvaUxYfnDhTGUctVum/D/0Yo/QBwS8Wlq
	6a8eNn83WEgDIPysPghacwmlXgX5H7HOTP3dFNqWU+rsA7WOPzpvexo0pj22pjr6IFDXmWVxoNa7m
	kZw4ScmiEGyk+ERPsI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LNp-00HRin-15;
	Wed, 31 May 2023 12:56:57 +0000
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LNl-00HRdJ-2S;
	Wed, 31 May 2023 12:56:54 +0000
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
Subject: [PATCH 14/24] init: clear root_wait on all invalid root= strings
Date: Wed, 31 May 2023 14:55:25 +0200
Message-Id: <20230531125535.676098-15-hch@lst.de>
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

Instead of only clearing root_wait in devt_from_partuuid when the UUID
format was invalid, do that in parse_root_device for all strings that
failed to parse.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 init/do_mounts.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index f1953aeb321978..0b36a5f39ee8e2 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -112,14 +112,14 @@ static int devt_from_partuuid(const char *uuid_str, dev_t *devt)
 
 		/* Explicitly fail on poor PARTUUID syntax. */
 		if (sscanf(slash + 1, "PARTNROFF=%d%c", &offset, &c) != 1)
-			goto clear_root_wait;
+			goto out_invalid;
 		cmp.len = slash - uuid_str;
 	} else {
 		cmp.len = strlen(uuid_str);
 	}
 
 	if (!cmp.len)
-		goto clear_root_wait;
+		goto out_invalid;
 
 	dev = class_find_device(&block_class, NULL, &cmp, &match_dev_by_uuid);
 	if (!dev)
@@ -139,12 +139,9 @@ static int devt_from_partuuid(const char *uuid_str, dev_t *devt)
 	put_device(dev);
 	return 0;
 
-clear_root_wait:
+out_invalid:
 	pr_err("VFS: PARTUUID= is invalid.\n"
 	       "Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%%d]\n");
-	if (root_wait)
-		pr_err("Disabling rootwait; root= is invalid.\n");
-	root_wait = 0;
 	return -EINVAL;
 }
 
@@ -611,6 +608,7 @@ static void __init wait_for_root(char *root_device_name)
 
 static dev_t __init parse_root_device(char *root_device_name)
 {
+	int error;
 	dev_t dev;
 
 	if (!strncmp(root_device_name, "mtd", 3) ||
@@ -623,8 +621,14 @@ static dev_t __init parse_root_device(char *root_device_name)
 	if (strcmp(root_device_name, "/dev/ram") == 0)
 		return Root_RAM0;
 
-	if (early_lookup_bdev(root_device_name, &dev))
+	error = early_lookup_bdev(root_device_name, &dev);
+	if (error) {
+		if (error == -EINVAL && root_wait) {
+			pr_err("Disabling rootwait; root= is invalid.\n");
+			root_wait = 0;
+		}
 		return 0;
+	}
 	return dev;
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
