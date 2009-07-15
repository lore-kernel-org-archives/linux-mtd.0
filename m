Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MR0zw-0002zW-6j
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 09:42:06 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: tytso@mit.edu
Subject: [PATCH 1/2] blkid: add UBI volume support
Date: Wed, 15 Jul 2009 11:38:43 +0200
Message-Id: <1247650724-16288-2-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
References: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Probe UBI volume under /dev (or /devfs, /devices).
ubi_ctrl skip is hardcoded, maybe we should find a
cleaner way to do that.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 lib/blkid/blkidP.h  |    1 +
 lib/blkid/devname.c |   56 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 56 insertions(+), 1 deletions(-)

diff --git a/lib/blkid/blkidP.h b/lib/blkid/blkidP.h
index e0f11a0..baf82aa 100644
--- a/lib/blkid/blkidP.h
+++ b/lib/blkid/blkidP.h
@@ -117,6 +117,7 @@ extern char *blkid_strndup(const char *s, const int length);
 /*
  * Priority settings for different types of devices
  */
+#define BLKID_PRI_UBI	50
 #define BLKID_PRI_DM	40
 #define BLKID_PRI_EVMS	30
 #define BLKID_PRI_LVM	20
diff --git a/lib/blkid/devname.c b/lib/blkid/devname.c
index b151354..70e85c5 100644
--- a/lib/blkid/devname.c
+++ b/lib/blkid/devname.c
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
-- 
1.6.3.3
