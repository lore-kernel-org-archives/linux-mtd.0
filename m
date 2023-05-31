Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFECEC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5w31w+zZv892sZKtN/pHOkwm4iPKfDlNCg76dfsNnU8=; b=LWIr7g3K4/XlLN
	luGp3l4gNG/rjfY0EWMtQ3g45i8MQL/a2Ex//hs85U7znbaNKEiYTuinEpx8BqmVnaUumkmbJZPDC
	PkMo3qC8yqJnEmb5roiEHEALmkQEZ/qtW4wKKlweUM8KBchaPFAMJRY+UXoTODrCxHgYbTbaf/KsY
	0cTIMNI7GfEzpu4rZdZs0oNOfEstL+q5gNaG3HYdQ65WGicX1PBBKmEO2AiEfEGQlZxk85DIYHbq4
	0AOE2Jkkbn8sS4OX8s4fV/F+jB7rNowZMFZv4lYkEOQeHSncGe/5NMUQkeaqHVm7Z0/oN1PT9wXrJ
	pQT9zxcQmjPT/sVd8Rcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LNe-00HRa6-0h;
	Wed, 31 May 2023 12:56:46 +0000
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LNb-00HRVg-31;
	Wed, 31 May 2023 12:56:44 +0000
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
Subject: [PATCH 12/24] init: move the nfs/cifs/ram special cases out of name_to_dev_t
Date: Wed, 31 May 2023 14:55:23 +0200
Message-Id: <20230531125535.676098-13-hch@lst.de>
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

The nfs/cifs/ram special case only needs to be parsed once, and only in
the boot code.  Move them out of name_to_dev_t and into
prepare_namespace.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 ++++++-
 init/do_mounts.c                                | 14 ++++++--------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9e5bab29685ff0..457c342d15977e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5452,7 +5452,12 @@
 			port and the regular usb controller gets disabled.
 
 	root=		[KNL] Root filesystem
-			See name_to_dev_t comment in init/do_mounts.c.
+			Usually this a a block device specifier of some kind,
+			see the name_to_dev_t comment in init/do_mounts.c for
+			details.
+			Alternatively this can be "ram" for the legacy initial
+			ramdisk, "nfs" and "cifs" for root on a network file
+			system, or "mtd" and "ubi" for mounting from raw flash.
 
 	rootdelay=	[KNL] Delay (in seconds) to pause before attempting to
 			mount the root filesystem
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
