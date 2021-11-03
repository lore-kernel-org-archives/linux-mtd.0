Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554A3C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:53:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F93660F90
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F93660F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jR0FOMKkLFxvKI4FQPIb1GnJ+zoPbZ5ysszF6QAoQ90=; b=hR5SxGmMJ/M3Iz
	OBtHO2Ah+Kjukq1DutblShcjpnAaVluJugmIYDcGHjea11Ia3gDSgeN+DIYFhisMXNXnjnc2GwhXe
	Fgy4YjPXC05yqod03szzAXgzcOOYow9FXGYzr4S4urCr/Bai6Y/QbiLeh0icicrnUJieb18O/Njro
	7ciSMkFocitR0/N+s8pgeKZK/RQ/zEYFWqA6SU//LwXyOPQOKwK+jo13T1vg1P1IVmwDKkvhhB35W
	Vs2k/pXHXqa5HaOFmTJmB+yq8WuKXLPgfIFSUeIQ5nK5HvDX2xHZ8ZDpmX3pBAqjCvQUycRmx89zk
	Qtyaz/H/mNJwJEff4WTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKRN-0062BX-1y; Wed, 03 Nov 2021 17:52:49 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miKKA-005z5l-Lq; Wed, 03 Nov 2021 17:45:22 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, hch@lst.de, penguin-kernel@i-love.sakura.ne.jp,
 dan.j.williams@intel.com, vishal.l.verma@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, richard@nod.at, miquel.raynal@bootlin.com,
 vigneshr@ti.com, efremov@linux.com, song@kernel.org,
 martin.petersen@oracle.com, hare@suse.de, jack@suse.cz,
 ming.lei@redhat.com, tj@kernel.org, mcgrof@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/13] block: fix __register_blkdev() probe add_disk()
 failures
Date: Wed,  3 Nov 2021 10:45:20 -0700
Message-Id: <20211103174521.1426407-13-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103174521.1426407-1-mcgrof@kernel.org>
References: <20211103174521.1426407-1-mcgrof@kernel.org>
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

__register_blkdev() is used to register a probe callback, and
that callback is typically used to call add_disk(). Now that
we are able to capture errors for add_disk(), we need to fix
those probe calls where add_disk() fails and clean up resources.

We don't extend the probe call to return the error given:

1) we'd have to always special-case the case where the disk
   was already present, as otherwise concurrent requests to
   open an existing block device would fail, and this would be
   a userspace visible change
2) the error from ilookup() on blkdev_get_no_open() is sufficient
3) The only thing the probe call is used for is to support
   pre-devtmpfs, pre-udev semantics that want to create disks when
   their pre-created device node is accessed, and so we don't care
   for failures on probe there.

We expand documentation for the probe callback to ensure users
cleanup resources if add_disk() is used and to clarify this interface
may be removed in the future.

This fixes the ataflop and floppy driver uses of the probe call,
which lacked proper error handling for the add_disk() calls.

Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 block/genhd.c           |  5 ++++-
 drivers/block/ataflop.c | 12 +++++++++---
 drivers/block/floppy.c  | 11 +++++++++--
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 4ed87f25276a..8837a89242a2 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -213,7 +213,10 @@ void blkdev_show(struct seq_file *seqf, off_t offset)
  * @major: the requested major device number [1..BLKDEV_MAJOR_MAX-1]. If
  *         @major = 0, try to allocate any unused major number.
  * @name: the name of the new block device as a zero terminated string
- * @probe: allback that is called on access to any minor number of @major
+ * @probe: pre-devtmpfs / pre-udev callback used to create disks when their
+ *	   their pre-created device node is accessed. When a probe call
+ *	   uses add_disk() and it fails the driver must cleanup resources.
+ *	   This interface may soon be removed.
  *
  * The @name must be unique within the system.
  *
diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index 170dd193cef6..cce6615fe10a 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -2012,6 +2012,7 @@ static void ataflop_probe(dev_t dev)
 {
 	int drive = MINOR(dev) & 3;
 	int type  = MINOR(dev) >> 2;
+	int err = 0;
 
 	if (type)
 		type--;
@@ -2019,9 +2020,14 @@ static void ataflop_probe(dev_t dev)
 	if (drive >= FD_MAX_UNITS || type >= NUM_DISK_MINORS)
 		return;
 	if (!unit[drive].disk[type]) {
-		if (ataflop_alloc_disk(drive, type) == 0) {
-			add_disk(unit[drive].disk[type]);
-			unit[drive].registered[type] = true;
+		err = ataflop_alloc_disk(drive, type);
+		if (err == 0) {
+			err = add_disk(unit[drive].disk[type]);
+			if (err) {
+				blk_cleanup_disk(unit[drive].disk[type]);
+				unit[drive].disk[type] = NULL;
+			} else
+				unit[drive].registered[type] = true;
 		}
 	}
 }
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 3873e789478e..cebc11b74b1a 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4522,6 +4522,7 @@ static void floppy_probe(dev_t dev)
 {
 	unsigned int drive = (MINOR(dev) & 3) | ((MINOR(dev) & 0x80) >> 5);
 	unsigned int type = (MINOR(dev) >> 2) & 0x1f;
+	int err = 0;
 
 	if (drive >= N_DRIVE || !floppy_available(drive) ||
 	    type >= ARRAY_SIZE(floppy_type))
@@ -4529,8 +4530,14 @@ static void floppy_probe(dev_t dev)
 
 	mutex_lock(&floppy_probe_lock);
 	if (!disks[drive][type]) {
-		if (floppy_alloc_disk(drive, type) == 0)
-			add_disk(disks[drive][type]);
+		err = floppy_alloc_disk(drive, type);
+		if (err == 0) {
+			err = add_disk(disks[drive][type]);
+			if (err) {
+				blk_cleanup_disk(disks[drive][type]);
+				disks[drive][type] = NULL;
+			}
+		}
 	}
 	mutex_unlock(&floppy_probe_lock);
 }
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
