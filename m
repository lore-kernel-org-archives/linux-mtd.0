Received: from na3sys009aog113.obsmtp.com ([74.125.149.209])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QqtMo-0000Sh-2T
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 20:57:39 +0000
Received: by mail-vw0-f49.google.com with SMTP id 8so434131vws.8
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Aug 2011 13:57:34 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd_debug: report ecc layout
Date: Tue,  9 Aug 2011 16:57:27 -0400
Message-Id: <e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
In-Reply-To: <cover.1312922073.git.bengardiner@nanometrics.ca>
References: <cover.1312922073.git.bengardiner@nanometrics.ca>
Cc: Ben Gardiner <bengardiner@nanometrics.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd_debug 'info' command reports a great deal of useful information about
the mtd device is it given for a query.

Add the ECC size and OOB available to that list. The other entries in the
ecclayout struct are arrays and are not as meaningful as eccsize and oobavail.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

---

I noticed that the struct nand_ecclayout_user and its corresponding ioctl
has been marked deprecated; however, since this is a 'debug' utility and at
least one person found it useful I thought it would be a good idea to propose
these changes anyways.
---
 mtd_debug.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/mtd_debug.c b/mtd_debug.c
index b82dabe..ea2a119 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -74,6 +74,14 @@ static int getregions (int fd,struct region_info_user *regions,int *n)
 	return (0);
 }
 
+/*
+ * ECCGETLAYOUT
+ */
+static int getecclayout (int fd, struct nand_ecclayout_user *ecclayout)
+{
+	return (ioctl (fd,ECCGETLAYOUT,ecclayout));
+}
+
 int erase_flash (int fd,u_int32_t offset,u_int32_t bytes)
 {
 	int err;
@@ -237,6 +245,7 @@ int showinfo (int fd)
 {
 	int i,err,n;
 	struct mtd_info_user mtd;
+	struct nand_ecclayout_user ecclayout;
 	static struct region_info_user region[1024];
 
 	err = getmeminfo (fd,&mtd);
@@ -246,6 +255,13 @@ int showinfo (int fd)
 		return (1);
 	}
 
+	err = getecclayout (fd,&ecclayout);
+	if (err < 0)
+	{
+		perror ("ECCGETLAYOUT");
+		return (1);
+	}
+
 	err = getregions (fd,region,&n);
 	if (err < 0)
 	{
@@ -330,6 +346,12 @@ int showinfo (int fd)
 	printf ("\nmtd.oobsize = ");
 	printsize (mtd.oobsize);
 
+	printf ("\necclayout.eccbytes = ");
+	printsize (ecclayout.eccbytes);
+
+	printf ("\necclayout.oobavail = ");
+	printsize (ecclayout.oobavail);
+
 	printf ("\n"
 			"regions = %d\n"
 			"\n",
-- 
1.7.3.5
