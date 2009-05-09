Received: from smtp23.services.sfr.fr ([93.17.128.21])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2jCH-0006iE-TX
	for linux-mtd@lists.infradead.org; Sat, 09 May 2009 09:50:28 +0000
Received: from smtp23.services.sfr.fr (msfrf2324 [10.18.27.38])
	by msfrf2310.sfr.fr (SMTP Server) with ESMTP id 9F52270001B4
	for <linux-mtd@lists.infradead.org>;
	Sat,  9 May 2009 11:43:21 +0200 (CEST)
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] libubi: fix multiple memory corruptions
Date: Sat,  9 May 2009 11:41:07 +0200
Message-Id: <1241862068-10596-3-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1241862068-10596-2-git-send-email-corentincj@iksaif.net>
References: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-2-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The memset is obviously wrong, and valgrind tells
use there are some uninitialised bytes used after read()

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 ubi-utils/src/libubi.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/ubi-utils/src/libubi.c b/ubi-utils/src/libubi.c
index a81173d..d748a65 100644
--- a/ubi-utils/src/libubi.c
+++ b/ubi-utils/src/libubi.c
@@ -82,16 +82,17 @@ static int read_positive_ll(const char *file, long long *value)
 	if (fd == -1)
 		return -1;
 
-	rd = read(fd, buf, 50);
+	rd = read(fd, buf, sizeof(buf));
 	if (rd == -1) {
 		sys_errmsg("cannot read \"%s\"", file);
 		goto out_error;
 	}
-	if (rd == 50) {
+	if (rd == sizeof(buf)) {
 		errmsg("contents of \"%s\" is too long", file);
 		errno = EINVAL;
 		goto out_error;
 	}
+	buf[rd] = '\0';
 
 	if (sscanf(buf, "%lld\n", value) != 1) {
 		/* This must be a UBI bug */
@@ -166,6 +167,7 @@ static int read_data(const char *file, void *buf, int buf_len)
 		sys_errmsg("cannot read \"%s\"", file);
 		goto out_error;
 	}
+	((char *)buf)[rd] = '\0';
 
 	/* Make sure all data is read */
 	tmp1 = read(fd, &tmp, 1);
@@ -1244,7 +1246,7 @@ int ubi_set_property(int fd, uint8_t property, uint64_t value)
 {
 	struct ubi_set_prop_req r;
 
-	memset(&r, sizeof(struct ubi_set_prop_req), '\0');
+	memset(&r, 0, sizeof(struct ubi_set_prop_req));
 	r.property = property;
 	r.value = value;
 
-- 
1.6.3
