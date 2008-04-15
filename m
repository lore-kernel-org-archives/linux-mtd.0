Received: from smtp.nblnetworks.fi ([2001:1bc8:100c:f220::66]
	helo=smtp-69.nebula.fi)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jlm6f-0003ZB-Fa
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 14:25:57 +0000
Received: from [127.0.0.1] (nblzone-209-18.nblnetworks.fi [83.145.209.18])
	by smtp-69.nebula.fi (Postfix) with ESMTP id ED90265E93A
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Apr 2008 17:25:54 +0300 (EEST)
Message-ID: <4804BB40.9080403@hut.fi>
Date: Tue, 15 Apr 2008 17:27:12 +0300
From: Jussi Hakala <jussi.hakala@hut.fi>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.jffs2.c: Fix issue with crashing when using lzo
	compression
Content-Type: multipart/mixed; boundary="------------070306090600030404040703"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070306090600030404040703
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Calling jffs2_compressors_init() before page_size results in invalid 
compression buffer, which in turn leads to segmentation fault when lzo 
compression is used, for example:

mkfs.jffs2 -r /path-to/mtd-test -o /tmp/mtd-test.jffs2 -e 128KiB -l -n 
-X lzo -x zlib

Thanks to Siarhei Siamashka <siarhei dot siamashka at nokia dot com> for 
the patch.



--------------070306090600030404040703
Content-Type: text/x-diff;
 name="lzo-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lzo-fix.patch"

diff -Naur main.d/mtd-utils-0.0~200802271600.orig/mkfs.jffs2.c main.d/mtd-utils-0.0~200802271600/mkfs.jffs2.c
--- main.d/mtd-utils-0.0~200802271600.orig/mkfs.jffs2.c	2008-04-15 14:37:04.000000000 +0300
+++ main.d/mtd-utils-0.0~200802271600/mkfs.jffs2.c	2008-04-15 14:38:51.000000000 +0300
@@ -1662,14 +1662,14 @@
 	int compr_prior  = -1;
 	int warn_page_size = 0;
 
-	jffs2_compressors_init();
-
 	page_size = sysconf(_SC_PAGESIZE);
 	if (page_size < 0) /* System doesn't know so ... */
 		page_size = 4096; /* ... we make an educated guess */
 	if (page_size != 4096)
 		warn_page_size = 1; /* warn user if page size not 4096 */
 
+	jffs2_compressors_init();
+
 	while ((opt = getopt_long(argc, argv,
 					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
 	{

--------------070306090600030404040703--
