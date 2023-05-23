Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80022C7EE26
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9B9Lz5B7zXH2Y4wAnc3E/nncoXbEw+iOs8LMbnGOMg=; b=z5r8K0o0EtDFjB
	dQSW+yzVxH15oSraF3hV29phFj5VrzdnmwaKW/qzyU3fMIju5LQoQtefSTOGrCVpAovWz0sV8MiWh
	LVv+XvPXUhIt4S53FNqZTevUrPmvAk1fVPq+ls+SVPiPeHtp5afMridrplGZcmsdAo1IOEqBOr1sf
	8cVkXMZPk/H4CWZkzEtkIqDEC8IUQlTkwbPBTqVFvWlwlcRr8ngEnW91RBRELbFJ0NrcGeNMLKBEC
	BhrpzsV1Uu1gQJj60CdQFLhfxdyAcXZEUtj/Q4cnxR9wgpyyCMBswjmTr7f00ILXejGwV2AwMML7h
	p5/BllFL/uvNfo8gKlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MiP-009GZz-1R;
	Tue, 23 May 2023 07:45:53 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MiN-009GXt-1X;
	Tue, 23 May 2023 07:45:51 +0000
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
Subject: [PATCH 05/24] init: remove pointless Root_* values
Date: Tue, 23 May 2023 09:45:16 +0200
Message-Id: <20230523074535.249802-6-hch@lst.de>
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

Remove all unused defines, and just use the expanded versions for
the scsi disk majors.

I've decided to keep Root_RAM0 even if it could be expanded as there
is a lot of special casing for it in the init code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/kernel/setup.c               | 2 +-
 arch/ia64/kernel/setup.c                | 2 +-
 arch/powerpc/platforms/powermac/setup.c | 3 ++-
 include/linux/root_dev.h                | 8 --------
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 33bf3a62700270..b650ff1cb022ee 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -658,7 +658,7 @@ setup_arch(char **cmdline_p)
 #endif
 
 	/* Default root filesystem to sda2.  */
-	ROOT_DEV = Root_SDA2;
+	ROOT_DEV = MKDEV(SCSI_DISK0_MAJOR, 2);
 
 #ifdef CONFIG_EISA
 	/* FIXME:  only set this when we actually have EISA in this box? */
diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
index c0572804427275..becdb4f33c2195 100644
--- a/arch/ia64/kernel/setup.c
+++ b/arch/ia64/kernel/setup.c
@@ -627,7 +627,7 @@ setup_arch (char **cmdline_p)
 	 * is physical disk 1 partition 1 and the Linux root disk is
 	 * physical disk 1 partition 2.
 	 */
-	ROOT_DEV = Root_SDA2;		/* default to second partition on first drive */
+	ROOT_DEV = MKDEV(SCSI_DISK0_MAJOR, 2);
 
 	if (is_uv_system())
 		uv_setup(cmdline_p);
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 193cc9c394221b..0c41f4b005bcf3 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -76,7 +76,8 @@ int pmac_newworld;
 
 static int current_root_goodness = -1;
 
-#define DEFAULT_ROOT_DEVICE Root_SDA1	/* sda1 - slightly silly choice */
+/* sda1 - slightly silly choice */
+#define DEFAULT_ROOT_DEVICE	MKDEV(SCSI_DISK0_MAJOR, 1)
 
 sys_ctrler_t sys_ctrler = SYS_CTRLER_UNKNOWN;
 EXPORT_SYMBOL(sys_ctrler);
diff --git a/include/linux/root_dev.h b/include/linux/root_dev.h
index 4e78651371ba92..ed3ea8da642972 100644
--- a/include/linux/root_dev.h
+++ b/include/linux/root_dev.h
@@ -10,14 +10,6 @@ enum {
 	Root_NFS = MKDEV(UNNAMED_MAJOR, 255),
 	Root_CIFS = MKDEV(UNNAMED_MAJOR, 254),
 	Root_RAM0 = MKDEV(RAMDISK_MAJOR, 0),
-	Root_RAM1 = MKDEV(RAMDISK_MAJOR, 1),
-	Root_FD0 = MKDEV(FLOPPY_MAJOR, 0),
-	Root_HDA1 = MKDEV(IDE0_MAJOR, 1),
-	Root_HDA2 = MKDEV(IDE0_MAJOR, 2),
-	Root_SDA1 = MKDEV(SCSI_DISK0_MAJOR, 1),
-	Root_SDA2 = MKDEV(SCSI_DISK0_MAJOR, 2),
-	Root_HDC1 = MKDEV(IDE1_MAJOR, 1),
-	Root_SR0 = MKDEV(SCSI_CDROM_MAJOR, 0),
 };
 
 extern dev_t ROOT_DEV;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
