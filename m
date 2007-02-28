Received: from mtagate2.de.ibm.com ([195.212.29.151])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HML8F-0005AT-LB
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 09:30:01 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate2.de.ibm.com (8.13.8/8.13.8) with ESMTP id l1S9TeDr046930
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 09:29:40 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l1S9TdmO2175176
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 10:29:39 +0100
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l1S9TdID003905
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 10:29:39 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org, John Smith <john@arrows.demon.co.uk>
Subject: Re: UBI Tools - problem with multiple ubi devices.
Date: Wed, 28 Feb 2007 10:29:34 +0100
References: <Pine.LNX.4.33.0702272101240.7726-100000@arrows.demon.co.uk>
In-Reply-To: <Pine.LNX.4.33.0702272101240.7726-100000@arrows.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200702281029.34799.alexs@linux.vnet.ibm.com>
Cc: Frank Haverkamp <haver@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 27 February 2007, John Smith wrote:
> In
> GIT:      users/haver/mtd-utils.git
> File:     ubi-utils/src/libubi.c
> Function: get_ubi_info
> 
> The code counts the number of UBI volumes by looking for files called
> 
>   /sys/class/ubi0, /sys/class/ubi1, ...
> 
> but the files are actually
> 
>   /sys/class/ubi/ubi0, ...
> 
> The count starts from 1 (probably also wrong), so is usable if there is a
> single UBI device. But if there is more than one UBI device, tools like
> ubimkvol fail.

Hi John,

thanks for pointing this out.

Frank, please review and commit.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 ubi-utils/src/libubi.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

--- mtd-utils.orig/ubi-utils/src/libubi.c
+++ mtd-utils/ubi-utils/src/libubi.c
@@ -138,7 +138,7 @@ static int
 get_ubi_info(ubi_lib_t desc, struct ubi_info *ubi)
 {
 	int err;
-	int n = 1;
+	int dev_count = 0;
 	char *path;
 	struct stat stat;
 
@@ -147,31 +147,31 @@ get_ubi_info(ubi_lib_t desc, struct ubi_
 		return -1;
 
 	/* Calculate number of UBI devices */
-	do {
+	while (!err) {
 		char dir[20];
 
-		sprintf(&dir[0], "ubi%d", n);
-		path = mkpath(desc->sysfs_root, dir);
+		sprintf(&dir[0], "ubi%d", dev_count);
+		path = mkpath(desc->ubi_root, dir);
 		if (!path)
 			return ENOMEM;
 
 		err = lstat(path, &stat);
 		if (err == 0)
-			n += 1;
+			dev_count += 1;
 		free(path);
-	} while (err == 0);
+	}
 
 	if (errno != ENOENT)
 		return -1;
 
-	if (n == 0) {
+	if (dev_count == 0) {
 		ubi_err("no UBI devices found");
 		errno = EINVAL;
 		return -1;
 	}
 
 	errno = 0;
-	ubi->dev_count = n;
+	ubi->dev_count = dev_count;
 	return 0;
 }
 
