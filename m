Received: from smtp2e.orange.fr ([80.12.242.111])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfXTd-0007rU-EW
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 11:12:47 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: util-linux-ng@vger.kernel.org
Subject: [PATCH 1/3] blkid: add UBI volume support
Date: Mon, 24 Aug 2009 13:11:54 +0200
Message-Id: <1251112316-18971-2-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Probe UBI volume under /dev (or /devfs, /devices).
ubi_ctrl skip is hardcoded, maybe we should find a
cleaner way to do that. Also change probe.c to handle
char devices.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 shlibs/blkid/src/blkidP.h  |    1 +
 shlibs/blkid/src/devname.c |   56 +++++++++++++++++++++++++++++++++++++++++++-
 shlibs/blkid/src/probe.c   |    2 +
 3 files changed, 58 insertions(+), 1 deletions(-)

diff --git a/shlibs/blkid/src/blkidP.h b/shlibs/blkid/src/blkidP.h
index e0e5cb8..8db6599 100644
--- a/shlibs/blkid/src/blkidP.h
+++ b/shlibs/blkid/src/blkidP.h
@@ -237,6 +237,7 @@ extern char *blkid_strndup(const char *s, const int length);
 /*
  * Priority settings for different types of devices
  */
+#define BLKID_PRI_UBI	50
 #define BLKID_PRI_DM	40
 #define BLKID_PRI_EVMS	30
 #define BLKID_PRI_LVM	20
diff --git a/shlibs/blkid/src/devname.c b/shlibs/blkid/src/devname.c
index ef686f4..cac13c5 100644
--- a/shlibs/blkid/src/devname.c
+++ b/shlibs/blkid/src/devname.c
@@ -229,7 +229,9 @@ static void probe_one(blkid_cache cache, const char *ptname,
 		    dev->bid_devno == devno)
 			goto set_pri;
 
-		if (stat(device, &st) == 0 && S_ISBLK(st.st_mode) &&
+		if (stat(device, &st) == 0 &&
+		    (S_ISBLK(st.st_mode) ||
+		     (S_ISCHR(st.st_mode) && !strncmp(ptname, "ubi", 3))) &&
 		    st.st_rdev == devno) {
 			devname = blkid_strdup(device);
 			goto get_dev;
@@ -388,6 +390,57 @@ evms_probe_all(blkid_cache cache, int only_if_new)
 	return num;
 }
 
+static void
+ubi_probe_all(blkid_cache cache, int only_if_new)
+{
+	const char **dirname;
+
+	for (dirname = dirlist; *dirname; dirname++) {
+		DBG(DEBUG_DEVNAME, printf("probing UBI volumes under %s\n",
+					  *dirname));
+
+		DIR		*dir;
+		struct dirent	*iter;
+
+		dir = opendir(*dirname);
+		if (dir == NULL)
+			continue ;
+
+		while ((iter = readdir(dir)) != NULL) {
+			char		*name, *device;
+			struct stat	st;
+			dev_t		dev;
+
+			name = iter->d_name;
+
+			if (!strcmp(name, ".") || !strcmp(name, "..") ||
+			    !strstr(name, "ubi"))
+				continue;
+			if (!strcmp(name, "ubi_ctrl"))
+				continue;
+			device = malloc(strlen(*dirname) + strlen(name) + 2);
+			if (!device)
+				break ;
+			sprintf(device, "%s/%s", *dirname, name);
+			if (stat(device, &st))
+				break ;
+
+			if (!(st.st_rdev & 0xFF)) { // It's an UBI Device
+				free(device);
+				continue ;
+			}
+			dev = st.st_rdev;
+			DBG(DEBUG_DEVNAME, printf("UBI vol %s: devno 0x%04X\n",
+						  device,
+						  (int) dev));
+			probe_one(cache, name, dev, BLKID_PRI_UBI,
+				  only_if_new);
+			free(device);
+		}
+		closedir(dir);
+	}
+}
+
 /*
  * Read the device data for all available block devices in the system.
  */
@@ -419,6 +472,7 @@ static int probe_all(blkid_cache cache, int only_if_new)
 #ifdef VG_DIR
 	lvm_probe_all(cache, only_if_new);
 #endif
+	ubi_probe_all(cache, only_if_new);
 
 	proc = fopen(PROC_PARTITIONS, "r");
 	if (!proc)
diff --git a/shlibs/blkid/src/probe.c b/shlibs/blkid/src/probe.c
index 10fcb00..fc293fc 100644
--- a/shlibs/blkid/src/probe.c
+++ b/shlibs/blkid/src/probe.c
@@ -284,6 +284,8 @@ int blkid_probe_set_device(blkid_probe pr, int fd,
 
 		if (S_ISBLK(sb.st_mode))
 			blkdev_get_size(fd, (unsigned long long *) &pr->size);
+		else if (S_ISCHR(sb.st_mode))
+			pr->size = 1;
 		else
 			pr->size = sb.st_size;
 	}
-- 
1.6.4
