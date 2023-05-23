Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FA9C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyzK0hcdridE55Ms0NZ4WwEt33dPub8mgnKxSzWnRuY=; b=bE7O+uKERdFR0c
	RC+b4cTiUtEj6l6CXHEBBpC9OX5fkYtWuXbEcrkNPAr3t9V2oisl1PjfC6fBkL3f/ySw/1/HFOkEN
	xQdohQVAbw3W+RbYWaeTz/6eSxqW5i2j7ctWET2lreZvlEA34qC8NIPMhVuAZMFnGrKntWJOsYDKD
	wNB6M7RfZojOkazUUJ9ldfhKzxxpn3EYC1HBD8Ql3ddcfT4/HwWSn46nwQvAXpkvtpGKA2YzcgIh+
	lCXoMuxwRMmlocE3ryMz5nyj+Tnewxd0/HLshkwSbu0c5pvTqikBRGugt2YUM0XlqSGutTMbpdNdB
	yLe13NtEp29je+vuNZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mih-009GsO-2f;
	Tue, 23 May 2023 07:46:11 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mig-009Gou-1r;
	Tue, 23 May 2023 07:46:11 +0000
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
Subject: [PATCH 12/24] init: move the nfs/cifs/ram special cases out of name_to_dev_t
Date: Tue, 23 May 2023 09:45:23 +0200
Message-Id: <20230523074535.249802-13-hch@lst.de>
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

The nfs/cifs/ram special cass only need to be parsed once, and only in
the boot code.  Move them out of name_to_dev_t and into
prepare_namespace.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 init/do_mounts.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index d5c06c1546e82c..86599faf2bf8a1 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -248,7 +248,6 @@ static dev_t devt_from_devnum(const char *name)
  *
  *	1) <hex_major><hex_minor> device number in hexadecimal represents itself
  *         no leading 0x, for example b302.
- *	2) /dev/nfs represents Root_NFS (0xff)
  *	3) /dev/<disk_name> represents the device number of disk
  *	4) /dev/<disk_name><decimal> represents the device number
  *         of partition - device number of disk plus the partition number
@@ -266,7 +265,6 @@ static dev_t devt_from_devnum(const char *name)
  *	   a colon.
  *	9) PARTLABEL=<name> with name being the GPT partition label.
  *	   MSDOS partitions do not support labels!
- *	10) /dev/cifs represents Root_CIFS (0xfe)
  *
  *	If name doesn't have fall into the categories above, we return (0,0).
  *	block_class is used to check if something is a disk name. If the disk
@@ -275,12 +273,6 @@ static dev_t devt_from_devnum(const char *name)
  */
 dev_t name_to_dev_t(const char *name)
 {
-	if (strcmp(name, "/dev/nfs") == 0)
-		return Root_NFS;
-	if (strcmp(name, "/dev/cifs") == 0)
-		return Root_CIFS;
-	if (strcmp(name, "/dev/ram") == 0)
-		return Root_RAM0;
 #ifdef CONFIG_BLOCK
 	if (strncmp(name, "PARTUUID=", 9) == 0)
 		return devt_from_partuuid(name + 9);
@@ -631,6 +623,12 @@ static dev_t __init parse_root_device(char *root_device_name)
 	if (!strncmp(root_device_name, "mtd", 3) ||
 	    !strncmp(root_device_name, "ubi", 3))
 		return Root_Generic;
+	if (strcmp(root_device_name, "/dev/nfs") == 0)
+		return Root_NFS;
+	if (strcmp(root_device_name, "/dev/cifs") == 0)
+		return Root_CIFS;
+	if (strcmp(root_device_name, "/dev/ram") == 0)
+		return Root_RAM0;
 	return name_to_dev_t(root_device_name);
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
