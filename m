Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B0EC7EE26
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkfnY1TCXQqoAFFs1nd5RoMYeaeaXn2XrIODb4mqUyM=; b=ccpdCeeDBVpVzv
	mFD7hhHXU7Z3cvPyfAlcqgGOuCkC57RBDP/tUZFrkItTfZ/md4t8eo9W4a8abNyZLoW+CmurLwich
	cxjkaNpcwMs+0Ft9yYR7mwUDWsafY17TJj2+GEcCAXmyStgnECzMebWiA02A6LQm/ta3UYlZT3Va9
	HDa0zB/9dWLkJcMT2Ee89sJD8PJZP9luSQI1Ajs8y6GT3sJpKjGJTZbhyXRLAUaWQPIed+grYh29B
	nzL138XPgJE6J2h7cGe5GYCfu1O0BCH13p5Roerv2w1D6rDE+SDrUobI47eTiBOGdWzrkiZnY28lr
	BGTMl/wZN5Q+QfaLI2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mj8-009HKv-2m;
	Tue, 23 May 2023 07:46:38 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mj4-009HEh-16;
	Tue, 23 May 2023 07:46:34 +0000
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
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 20/24] dm: only call early_lookup_bdev from early boot context
Date: Tue, 23 May 2023 09:45:31 +0200
Message-Id: <20230523074535.249802-21-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523074535.249802-1-hch@lst.de>
References: <20230523074535.249802-1-hch@lst.de>
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

early_lookup_bdev is supposed to only be called from the early boot
code, but dm_get_device calls it as a general fallback when lookup_bdev
fails, which is problematic because early_lookup_bdev bypasses all normal
path based permission checking, and might cause problems with certain
container environments renaming devices.

Switch to only call early_lookup_bdev when dm is built-in and the system
state in not running yet.  This means it is still available when tables
are constructed by dm-init.c from the kernel command line, but not
otherwise.

Note that this strictly speaking changes the kernel ABI as the PARTUUID=
and PARTLABEL= style syntax is now not available during a running
systems.  They never were intended for that, but this breaks things
we'll have to figure out a way to make them available again.  But if
avoidable in any way I'd rather avoid that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-table.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index e997f4322a9967..c230241a76b374 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -326,8 +326,11 @@ static int upgrade_mode(struct dm_dev_internal *dd, fmode_t new_mode,
 /*
  * Add a device to the list, or just increment the usage count if
  * it's already present.
+ *
+ * Note: the __ref annotation is because this function can call the __init
+ * marked early_lookup_bdev when called during early boot code from dm-init.c.
  */
-int dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
+int __ref dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
 		  struct dm_dev **result)
 {
 	int r;
@@ -346,8 +349,10 @@ int dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
 			return -EOVERFLOW;
 	} else {
 		r = lookup_bdev(path, &dev);
-		if (r)
+#ifndef MODULE
+		if (r && system_state < SYSTEM_RUNNING)
 			r = early_lookup_bdev(path, &dev);
+#endif
 		if (r)
 			return -ENODEV;
 	}
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
