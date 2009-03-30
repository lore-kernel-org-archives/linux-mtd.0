Received: from nwd2mail11.analog.com ([137.71.25.57])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LoChq-00019g-QE
	for linux-mtd@lists.infradead.org; Mon, 30 Mar 2009 08:19:01 +0000
Received: from [10.99.29.109] ([10.99.29.109])	by sdc1.sdcdesign.analog.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id n2U8Inn19880	for
	<linux-mtd@lists.infradead.org>; Mon, 30 Mar 2009 16:18:50 +0800 (CST)
Subject: [Patch] [ubifs] Don't define large array on local stack.
From: sonic zhang <sonic.adi@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 30 Mar 2009 16:22:48 +0800
Message-ID: <1238401368.24899.2.camel@eight.analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On nommu arch, local stack size is very limited and can't be enlarged on demand. So, don't define large array on local stack.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

Index: ubi-utils/src/libubigen.c
===================================================================
--- ubi-utils/src/libubigen.c	(revision 7935)
+++ ubi-utils/src/libubigen.c	(revision 7939)
@@ -287,7 +287,7 @@
 {
 	int ret;
 	struct ubigen_vol_info vi;
-	char outbuf[ui->peb_size];
+	char *outbuf;
 	struct ubi_vid_hdr *vid_hdr;
 	off_t seek;
 
@@ -302,6 +302,9 @@
 	vi.name_len = strlen(UBI_LAYOUT_VOLUME_NAME);
 	vi.compat = UBI_LAYOUT_VOLUME_COMPAT;
 
+	if ((outbuf = malloc(ui->peb_size)) == NULL)
+		return sys_errmsg("fail to malloc outbuf");
+
 	memset(outbuf, 0xFF, ui->data_offs);
 	vid_hdr = (struct ubi_vid_hdr *)(&outbuf[ui->vid_hdr_offs]);
 	memcpy(outbuf + ui->data_offs, vtbl, ui->vtbl_size);
@@ -309,22 +312,32 @@
 	       ui->peb_size - ui->data_offs - ui->vtbl_size);
 
 	seek = peb1 * ui->peb_size;
-	if (lseek(fd, seek, SEEK_SET) != seek)
+	if (lseek(fd, seek, SEEK_SET) != seek) {
+		free(outbuf);
 		return sys_errmsg("cannot seek output file");
+	}
+
 	ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf, ec1);
 	init_vid_hdr(ui, &vi, vid_hdr, 0, NULL, 0);
 	ret = write(fd, outbuf, ui->peb_size);
-	if (ret != ui->peb_size)
+	if (ret != ui->peb_size) {
+		free(outbuf);
 		return sys_errmsg("cannot write %d bytes", ui->peb_size);
+	}
 
 	seek = peb2 * ui->peb_size;
-	if (lseek(fd, seek, SEEK_SET) != seek)
+	if (lseek(fd, seek, SEEK_SET) != seek) {
+		free(outbuf);
 		return sys_errmsg("cannot seek output file");
+	}
 	ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf, ec2);
 	init_vid_hdr(ui, &vi, vid_hdr, 1, NULL, 0);
 	ret = write(fd, outbuf, ui->peb_size);
-	if (ret != ui->peb_size)
+	if (ret != ui->peb_size) {
+		free(outbuf);
 		return sys_errmsg("cannot write %d bytes", ui->peb_size);
+	}
 
+	free(outbuf);
 	return 0;
 }
