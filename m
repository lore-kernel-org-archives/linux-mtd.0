Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JBmoI-0002MH-Vr
	for linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 07:54:21 +0000
Message-ID: <4781D985.6020504@nokia.com>
Date: Mon, 07 Jan 2008 09:49:25 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: =?UTF-8?B?ZXh0IOaXtuatow==?= <shizheng@mail.ustc.edu.cn>
Subject: Re: why ubimkvol can't recognize /dev/ubi0?
References: <399646872.11492@ustc.edu.cn>
In-Reply-To: <399646872.11492@ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

时正 wrote:
> Hi all,
> I wanna have a try of ubifs on nandsim, and do as what the ubifs wiki
> tells me
> (http://osl.sed.hu/wiki/ubifs/index.php/Download_the_source).
> 
> 1. compile, install and boot the new kernel(2.6.23)
> the configuration option for ubi and nandsim is default turned on as module.
> 
> 
> 2. make the mtd-utils to produce ubimkvol
> 
> 3. create a ubi when I got the error
> # modprobe nandsim
> # modprobe ubi mtd=0
> # ls /dev/ubi0 -l
> crw-rw---- 1 root root 253, 0 2007-12-25 01:46 /dev/ubi0
> # ls /sys/class/ubi -l
> drwxr-xr-x 3 root root 0 2007-12-25 01:46 ubi0
> -r--r--r-- 1 root root 4096 2007-12-25 01:49 version
> # ubimkvol /dev/ubi0 -n 0 -N test -s 20MiB
> libubi error: readdir failed on "/sys/class/ubi"
> readdir: No such file or directory
> ubimkvol error: "/dev/ubi0" is not an UBI device node
> 
> it's so strange about the readdir failure, because there is the ubi0
> entry in sysfs.
> 
> did I miss any step, such as kernel configuration or mtd-tools installation?
> 
> Thanks a lot!
> 
> best wishes, shizheng
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

>From b96f4481662bd7ac247d4d5a25b27f7d8afffb92 Mon Sep 17 00:00:00 2001
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date: Mon, 7 Jan 2008 09:47:17 +0200
Subject: ubi-utils: fix bug using readdir

Library functions never reset errno to zero, so if you want
to use its value to check for errors then you must set it to zero
before calling the library function (in this case readdir).

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 ubi-utils/src/libubi.c |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/src/libubi.c b/ubi-utils/src/libubi.c
index 855aa82..be06f70 100644
--- a/ubi-utils/src/libubi.c
+++ b/ubi-utils/src/libubi.c
@@ -872,9 +872,13 @@ int ubi_get_info(libubi_t desc, struct ubi_info *info)
 	}
 
 	info->lowest_dev_num = INT_MAX;
-	while ((dirent = readdir(sysfs_ubi))) {
+	while (1) {
 		int dev_num, ret;
 
+		errno = 0;
+		dirent = readdir(sysfs_ubi);
+		if (!dirent)
+			break;
 		/*
 		 * Make sure this direntry is a directory and not a symlink -
 		 * Linux puts symlinks to UBI volumes on this UBI device to the
@@ -1022,9 +1026,14 @@ int ubi_get_dev_info1(libubi_t desc, int dev_num, struct ubi_dev_info *info)
 		return -1;
 
 	info->lowest_vol_num = INT_MAX;
-	while ((dirent = readdir(sysfs_ubi))) {
+
+	while (1) {
 		int vol_id, ret, devno;
 
+		errno = 0;
+		dirent = readdir(sysfs_ubi);
+		if (!dirent)
+			break;
 		ret = sscanf(dirent->d_name, UBI_VOL_NAME_PATT, &devno, &vol_id);
 		if (ret == 2 && devno == dev_num) {
 			info->vol_count += 1;
-- 
1.4.4.2
