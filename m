Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdT1I-00041d-9J
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 19:07:25 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Mon, 26 Jul 2010 11:37:19 -0700
Subject: [PATCH v4] mtd-utils: clean up compile warnings
Message-Id: <316b2205ef90aed27bc9bf7b3a5701f0@localhost>
To: <dedekind1@gmail.com>, <vapier.adi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

gcc 4.4.3 on x86_64:

libcrc32.c:42: warning: ‘static’ is not at beginning of declaration

libfec.c:120: warning: initialization discards qualifiers from pointer target type
libfec.c:121: warning: initialization discards qualifiers from pointer target type

libfec.c:417: warning: passing argument 2 of ‘my_malloc’ discards qualifiers from pointer target type

recv_image.c:164: warning: comparison of unsigned expression < 0 is always false
recv_image.c:170: warning: format ‘%d’ expects type ‘int’, but argument 3 has type ‘size_t’
recv_image.c:170: warning: format ‘%d’ expects type ‘int’, but argument 4 has type ‘long unsigned int’

And many more along the same lines.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 compr.h        |    2 +-
 lib/libcrc32.c |    2 +-
 lib/libfec.c   |    6 +++---
 mkfs.jffs2.c   |    9 +++++----
 mtd_debug.c    |    4 ++--
 nandtest.c     |    6 +++---
 nftl_format.c  |    3 ++-
 recv_image.c   |   10 +++++-----
 sumtool.c      |    6 +++---
 9 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/compr.h b/compr.h
index 51bf0dd..4b79802 100644
--- a/compr.h
+++ b/compr.h
@@ -67,7 +67,7 @@ int jffs2_set_compressor_priority(const char *name, int priority);
 struct jffs2_compressor {
 	struct list_head list;
 	int priority;             /* used by prirority comr. mode */
-	char *name;
+	const char *name;
 	char compr;               /* JFFS2_COMPR_XXX */
 	int (*compress)(unsigned char *data_in, unsigned char *cpage_out,
 			uint32_t *srclen, uint32_t *destlen, void *model);
diff --git a/lib/libcrc32.c b/lib/libcrc32.c
index d556e91..d47a842 100644
--- a/lib/libcrc32.c
+++ b/lib/libcrc32.c
@@ -39,7 +39,7 @@
 
 #include <stdint.h>
 
-const static uint32_t crc32_table[256] = {
+static const uint32_t crc32_table[256] = {
 	0x00000000L, 0x77073096L, 0xee0e612cL, 0x990951baL, 0x076dc419L,
 	0x706af48fL, 0xe963a535L, 0x9e6495a3L, 0x0edb8832L, 0x79dcb8a4L,
 	0xe0d5e91eL, 0x97d2d988L, 0x09b64c2bL, 0x7eb17cbdL, 0xe7b82d07L,
diff --git a/lib/libfec.c b/lib/libfec.c
index 6d9020f..adf2bba 100644
--- a/lib/libfec.c
+++ b/lib/libfec.c
@@ -114,7 +114,7 @@ typedef unsigned short gf;
  * Primitive polynomials - see Lin & Costello, Appendix A,
  * and  Lee & Messerschmitt, p. 453.
  */
-static char *allPp[] = {    /* GF_BITS	polynomial		*/
+static const char *allPp[] = {    /* GF_BITS	polynomial		*/
     NULL,		    /*  0	no code			*/
     NULL,		    /*  1	no code			*/
     "111",		    /*  2	1+x+x^2			*/
@@ -226,7 +226,7 @@ gf_mul(x,y)
  * one place.
  */
 static void *
-my_malloc(int sz, char *err_string)
+my_malloc(int sz, const char *err_string)
 {
     void *p = malloc( sz );
     if (p == NULL) {
@@ -247,7 +247,7 @@ generate_gf(void)
 {
     int i;
     gf mask;
-    char *Pp =  allPp[GF_BITS] ;
+    const char *Pp =  allPp[GF_BITS] ;
 
     mask = 1;	/* x ** 0 = 1 */
     gf_exp[GF_BITS] = 0; /* will be updated at the end of the 1st loop */
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 4ba71fe..181fe9d 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -1090,7 +1090,7 @@ static uint32_t highest_xseqno = 0;
 
 static struct {
 	int xprefix;
-	char *string;
+	const char *string;
 	int length;
 } xprefix_tbl[] = {
 	{ JFFS2_XPREFIX_USER, XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN },
@@ -1232,7 +1232,8 @@ static void write_xattr_entry(struct filesystem_entry *e)
 	struct jffs2_raw_xref ref;
 	struct xattr_entry *xe;
 	char xlist[XATTR_BUFFER_SIZE], xvalue[XATTR_BUFFER_SIZE];
-	char *xname, *prefix_str;
+	char *xname;
+	const char *prefix_str;
 	int i, xprefix, prefix_len;
 	int list_sz, offset, name_len, value_len;
 
@@ -1481,7 +1482,7 @@ static struct option long_options[] = {
 	{NULL, 0, NULL, 0}
 };
 
-static char *helptext =
+static const char helptext[] =
 "Usage: mkfs.jffs2 [OPTIONS]\n"
 "Make a JFFS2 file system image from an existing directory tree\n\n"
 "Options:\n"
@@ -1520,7 +1521,7 @@ static char *helptext =
 "  -V, --version           Display version information\n"
 "  -i, --incremental=FILE  Parse FILE and generate appendage output for it\n\n";
 
-static char *revtext = "1.60";
+static const char revtext[] = "1.60";
 
 int load_next_block() {
 
diff --git a/mtd_debug.c b/mtd_debug.c
index 4934699..928cb5a 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -158,7 +158,7 @@ retry:
 	if (buf != NULL)
 		free (buf);
 	close (outfd);
-	printf ("Copied %d bytes from address 0x%.8x in flash to %s\n",len,offset,filename);
+	printf ("Copied %zu bytes from address 0x%.8x in flash to %s\n",len,offset,filename);
 	return (0);
 
 err2:
@@ -309,7 +309,7 @@ int showinfo (int fd)
 			{
 				if (first)
 				{
-					printf (flags[i].name);
+					printf ("%s", flags[i].name);
 					first = 0;
 				}
 				else printf (" | %s",flags[i].name);
diff --git a/nandtest.c b/nandtest.c
index 13e9577..4d90159 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -70,7 +70,7 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 	}
 	if (len < meminfo.erasesize) {
 		printf("\n");
-		fprintf(stderr, "Short write (%d bytes)\n", len);
+		fprintf(stderr, "Short write (%zd bytes)\n", len);
 		exit(1);
 	}
 
@@ -81,7 +81,7 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 	if (len < meminfo.erasesize) {
 		printf("\n");
 		if (len)
-			fprintf(stderr, "Short read (%d bytes)\n", len);
+			fprintf(stderr, "Short read (%zd bytes)\n", len);
 		else
 			perror("read");
 		exit(1);
@@ -263,7 +263,7 @@ int main(int argc, char **argv)
 				if (len < meminfo.erasesize) {
 					printf("\n");
 					if (len)
-						fprintf(stderr, "Short read (%d bytes)\n", len);
+						fprintf(stderr, "Short read (%zd bytes)\n", len);
 					else
 						perror("read");
 					exit(1);
diff --git a/nftl_format.c b/nftl_format.c
index 42949a0..167098a 100644
--- a/nftl_format.c
+++ b/nftl_format.c
@@ -202,7 +202,8 @@ int main(int argc, char **argv)
 	long MediaUnitOff1 = 0, MediaUnitOff2 = 0;
 	unsigned char oobbuf[16];
 	struct mtd_oob_buf oob = {0, 16, oobbuf};
-	char *mtddevice, *nftl;
+	char *mtddevice;
+	const char *nftl;
 	int c, do_inftl = 0, do_bbt = 0;
 
 
diff --git a/recv_image.c b/recv_image.c
index 2be511a..35059b3 100644
--- a/recv_image.c
+++ b/recv_image.c
@@ -39,24 +39,24 @@ int main(int argc, char **argv)
 	struct addrinfo *runp;
 	int ret;
 	int sock;
-	size_t len;
+	ssize_t len;
 	int flfd;
 	struct mtd_info_user meminfo;
 	unsigned char *eb_buf, *decode_buf, **src_pkts;
 	int nr_blocks = 0;
 	int pkts_per_block;
 	int block_nr = -1;
-	uint32_t image_crc;
+	uint32_t image_crc = 0;
 	int total_pkts = 0;
 	int ignored_pkts = 0;
 	loff_t mtdoffset = 0;
 	int badcrcs = 0;
 	int duplicates = 0;
 	int file_mode = 0;
-	struct fec_parms *fec;
+	struct fec_parms *fec = NULL;
 	int i;
 	struct eraseblock *eraseblocks = NULL;
-	uint32_t start_seq;
+	uint32_t start_seq = 0;
 	struct timeval start, now;
 	unsigned long fec_time = 0, flash_time = 0, crc_time = 0,
 		rflash_time = 0, erase_time = 0, net_time = 0;
@@ -166,7 +166,7 @@ int main(int argc, char **argv)
 			break;
 		}
 		if (len < sizeof(thispkt)) {
-			fprintf(stderr, "Wrong length %d bytes (expected %d)\n",
+			fprintf(stderr, "Wrong length %zd bytes (expected %lu)\n",
 				len, sizeof(thispkt));
 			continue;
 		}
diff --git a/sumtool.c b/sumtool.c
index 966e110..11b25b1 100644
--- a/sumtool.c
+++ b/sumtool.c
@@ -88,7 +88,7 @@ static struct option long_options[] = {
 	{NULL, 0, NULL, 0}
 };
 
-static char *helptext =
+static const char helptext[] =
 "Usage: sumtool [OPTIONS] -i inputfile -o outputfile\n\n"
 "Convert the input JFFS2 image to a summarized JFFS2 image\n"
 "Summary makes mounting faster - if summary support enabled in your kernel\n\n"
@@ -112,7 +112,7 @@ static char *helptext =
 "                            eraseblock\n\n";
 
 
-static char *revtext = "$Revision: 1.9 $";
+static const char revtext[] = "$Revision: 1.9 $";
 
 static unsigned char ffbuf[16] = {
 	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
@@ -927,7 +927,7 @@ int main(int argc, char **argv)
 			close(in_fd);
 		if(out_fd != -1)
 			close(out_fd);
-		fprintf(stderr,helptext);
+		fprintf(stderr, "%s", helptext);
 		error_msg_and_die("You must specify input and output files!\n");
 	}
 
-- 
1.7.0.4
