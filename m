Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5cyF-00088G-TU
 for linux-mtd@lists.infradead.org; Fri, 20 Oct 2017 19:28:41 +0000
Received: by mail-pf0-x244.google.com with SMTP id n14so12384025pfh.8
 for <linux-mtd@lists.infradead.org>; Fri, 20 Oct 2017 12:28:19 -0700 (PDT)
Received: from roskinp-7510.office.thespaceshipcompany.com ([74.100.234.187])
 by smtp.gmail.com with ESMTPSA id
 k20sm2955814pfg.141.2017.10.20.12.28.18
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Oct 2017 12:28:18 -0700 (PDT)
From: Pavel Roskin <plroskin@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: make failure to list extended attributes quiet
 and non-fatal
Date: Fri, 20 Oct 2017 12:28:07 -0700
Message-Id: <20171020192807.25761-1-plroskin@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mkfs.ubifs treats all errors returned by llistxattr() except ENOENT as
fatal. In particular, if the host system doesn't support extended
attributes, mkfs.ubifs would fail. It happens even without any flags that
would explicitly request extended attribute support.

As a result, it's impossible to build an OpenEmbedded based UBI image on
a system without extended attribute support if the xattr feature is
enabled in DISTRO_FEATURES.

Take a clue from mkfs.jffs2, which treats llistxattr() errors as
non-fatal and doesn't report them by default. Report the error at the
debug level 1 and higher.

The second llistxattr() error remains fatal, as it indicates unexpected
behavior.

Don't use goto before the buffer is allocated. Don't initialize buf with
NULL, it should not be used before the xmalloc() call.

Signed-off-by: Pavel Roskin <plroskin@gmail.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index d432dfe..e390b5a 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1122,22 +1122,17 @@ static int inode_add_xattr(struct ubifs_ino_node *host_ino,
 {
 	int ret;
 	struct qstr nm;
-	void *buf = NULL;
+	void *buf;
 	ssize_t len;
 	ssize_t pos = 0;
 
 	len = llistxattr(path_name, NULL, 0);
-	if (len < 0) {
-		if (errno == ENOENT)
-			return 0;
-
-		sys_err_msg("llistxattr failed on %s", path_name);
-
-		return len;
-	}
+	if (len < 0)
+		dbg_msg(1, "llistxattr('%s') = %d : %s\n", path_name,
+			errno, strerror(errno));
 
-	if (len == 0)
-		goto noxattr;
+	if (len <= 0)
+		return 0;
 
 	buf = xmalloc(len);
 
@@ -1191,10 +1186,6 @@ static int inode_add_xattr(struct ubifs_ino_node *host_ino,
 			goto out_free;
 	}
 
-noxattr:
-	free(buf);
-	return 0;
-
 out_free:
 	free(buf);
 
-- 
2.14.2
