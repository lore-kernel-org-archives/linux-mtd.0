Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OcT5f-0003fM-Kc
	for linux-mtd@lists.infradead.org; Sat, 24 Jul 2010 00:59:49 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Fri, 23 Jul 2010 17:47:52 -0700
Subject: [PATCH v3 2/2] mtd-utils: clean up compile warnings
Message-Id: <17c9bf88c97c51f5ef538d16715a148c@localhost>
In-Reply-To: <5a5041da4e200221d33e0e25594438e3@localhost>
References: <5a5041da4e200221d33e0e25594438e3@localhost>
To: <dedekind1@gmail.com>, <saeed.bishara@gmail.com>, <jwboyer@gmail.com>,
	<vapier.adi@gmail.com>
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

mkfs.jffs2.c:1557: warning: format ‘%08x’ expects type ‘unsigned int’, but argument 2 has type ‘long int’
mkfs.jffs2.c:1581: warning: format ‘%08x’ expects type ‘unsigned int’, but argument 3 has type ‘long int’

recv_image.c:164: warning: comparison of unsigned expression < 0 is always false
recv_image.c:170: warning: format ‘%d’ expects type ‘int’, but argument 3 has type ‘size_t’
recv_image.c:170: warning: format ‘%d’ expects type ‘int’, but argument 4 has type ‘long unsigned int’

And many more along the same lines.

I really wanted to add "-Wno-unused-parameter -Wno-unused-result" to
WFLAGS, but it looks like my old cross gcc (4.2) does not recognize
-Wno-unused-result and will just abort.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 compr.h        |    2 +-
 lib/libcrc32.c |    2 +-
 lib/libfec.c   |    6 +++---
 mkfs.jffs2.c   |   54 +++++++++++++++++++++++++++++++-----------------------
 mtd_debug.c    |    5 +++--
 nandtest.c     |    6 +++---
 nftl_format.c  |    3 ++-
 recv_image.c   |   12 ++++++------
 serve_image.c  |    5 +++--
 sumtool.c      |    6 +++---
 10 files changed, 56 insertions(+), 45 deletions(-)

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
index 4ba71fe..42c54c1 100644
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
+static const char *helptext =
 "Usage: mkfs.jffs2 [OPTIONS]\n"
 "Make a JFFS2 file system image from an existing directory tree\n\n"
 "Options:\n"
@@ -1520,7 +1521,7 @@ static char *helptext =
 "  -V, --version           Display version information\n"
 "  -i, --incremental=FILE  Parse FILE and generate appendage output for it\n\n";
 
-static char *revtext = "1.60";
+static const char *revtext = "1.60";
 
 int load_next_block() {
 
@@ -1554,7 +1555,8 @@ void process_buffer(int inp_size) {
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
 			if (!bitchbitmask++)
-				printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
+				printf ("Wrong bitmask  at  0x%08lx, 0x%04x\n", p - file_buffer,
+						(unsigned int)je16_to_cpu (node->u.magic));
 			p += 4;
 			continue;
 		}
@@ -1574,11 +1576,15 @@ void process_buffer(int inp_size) {
 
 			case JFFS2_NODETYPE_INODE:
 				if(verbose)
-					printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
-							je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize),
-							je32_to_cpu (node->i.csize), je32_to_cpu (node->i.dsize), je32_to_cpu (node->i.offset));
+					printf ("%8s Inode      node at 0x%08lx, totlen 0x%08x, #ino  %5u, version %5u, isize %8u, csize %8u, dsize %8u, offset %8u\n",
+							obsolete ? "Obsolete" : "", p - file_buffer,
+							(unsigned int)je32_to_cpu (node->i.totlen),
+							(unsigned int)je32_to_cpu (node->i.ino),
+							(unsigned int)je32_to_cpu (node->i.version),
+							(unsigned int)je32_to_cpu (node->i.isize),
+							(unsigned int)je32_to_cpu (node->i.csize),
+							(unsigned int)je32_to_cpu (node->i.dsize),
+							(unsigned int)je32_to_cpu (node->i.offset));
 
 				if ( je32_to_cpu (node->i.ino) > ino )
 					ino = je32_to_cpu (node->i.ino);
@@ -1591,10 +1597,12 @@ void process_buffer(int inp_size) {
 				name [node->d.nsize] = 0x0;
 
 				if(verbose)
-					printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
-							je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino),
+					printf ("%8s Dirent     node at 0x%08lx, totlen 0x%08x, #pino %5u, version %5u, #ino  %8u, nsize %8u, name %s\n",
+							obsolete ? "Obsolete" : "", p - file_buffer,
+							(unsigned int)je32_to_cpu (node->d.totlen),
+							(unsigned int)je32_to_cpu (node->d.pino),
+							(unsigned int)je32_to_cpu ( node->d.version),
+							(unsigned int)je32_to_cpu (node->d.ino),
 							node->d.nsize, name);
 
 				p += PAD(je32_to_cpu (node->d.totlen));
@@ -1602,9 +1610,9 @@ void process_buffer(int inp_size) {
 
 			case JFFS2_NODETYPE_CLEANMARKER:
 				if (verbose) {
-					printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->u.totlen));
+					printf ("%8s Cleanmarker     at 0x%08lx, totlen 0x%08x\n",
+							obsolete ? "Obsolete" : "", p - file_buffer,
+							(unsigned int)je32_to_cpu (node->u.totlen));
 				}
 
 				p += PAD(je32_to_cpu (node->u.totlen));
@@ -1612,9 +1620,9 @@ void process_buffer(int inp_size) {
 
 			case JFFS2_NODETYPE_PADDING:
 				if (verbose) {
-					printf ("%8s Padding    node at 0x%08x, totlen 0x%08x\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->u.totlen));
+					printf ("%8s Padding    node at 0x%08lx, totlen 0x%08x\n",
+							obsolete ? "Obsolete" : "", p - file_buffer,
+							(unsigned int)je32_to_cpu (node->u.totlen));
 				}
 
 				p += PAD(je32_to_cpu (node->u.totlen));
@@ -1626,9 +1634,9 @@ void process_buffer(int inp_size) {
 
 			default:
 				if (verbose) {
-					printf ("%8s Unknown    node at 0x%08x, totlen 0x%08x\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->u.totlen));
+					printf ("%8s Unknown    node at 0x%08lx, totlen 0x%08x\n",
+							obsolete ? "Obsolete" : "", p - file_buffer,
+							(unsigned int)je32_to_cpu (node->u.totlen));
 				}
 
 				p += PAD(je32_to_cpu (node->u.totlen));
diff --git a/mtd_debug.c b/mtd_debug.c
index 4934699..3bba3be 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -158,7 +158,8 @@ retry:
 	if (buf != NULL)
 		free (buf);
 	close (outfd);
-	printf ("Copied %d bytes from address 0x%.8x in flash to %s\n",len,offset,filename);
+	printf ("Copied %d bytes from address 0x%.8x in flash to %s\n",
+		(int)len,offset,filename);
 	return (0);
 
 err2:
@@ -309,7 +310,7 @@ int showinfo (int fd)
 			{
 				if (first)
 				{
-					printf (flags[i].name);
+					printf ("%s", flags[i].name);
 					first = 0;
 				}
 				else printf (" | %s",flags[i].name);
diff --git a/nandtest.c b/nandtest.c
index 13e9577..c3ded7d 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -70,7 +70,7 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 	}
 	if (len < meminfo.erasesize) {
 		printf("\n");
-		fprintf(stderr, "Short write (%d bytes)\n", len);
+		fprintf(stderr, "Short write (%d bytes)\n", (int)len);
 		exit(1);
 	}
 
@@ -81,7 +81,7 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 	if (len < meminfo.erasesize) {
 		printf("\n");
 		if (len)
-			fprintf(stderr, "Short read (%d bytes)\n", len);
+			fprintf(stderr, "Short read (%d bytes)\n", (int)len);
 		else
 			perror("read");
 		exit(1);
@@ -263,7 +263,7 @@ int main(int argc, char **argv)
 				if (len < meminfo.erasesize) {
 					printf("\n");
 					if (len)
-						fprintf(stderr, "Short read (%d bytes)\n", len);
+						fprintf(stderr, "Short read (%d bytes)\n", (int)len);
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
index 2be511a..3f20b6d 100644
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
@@ -166,8 +166,8 @@ int main(int argc, char **argv)
 			break;
 		}
 		if (len < sizeof(thispkt)) {
-			fprintf(stderr, "Wrong length %d bytes (expected %d)\n",
-				len, sizeof(thispkt));
+			fprintf(stderr, "Wrong length %d bytes (expected %lu)\n",
+				(int)len, sizeof(thispkt));
 			continue;
 		}
 		if (!eraseblocks) {
diff --git a/serve_image.c b/serve_image.c
index 5aafa35..a2c1a23 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -125,8 +125,9 @@ int main(int argc, char **argv)
 	}
 
 	if (st.st_size % erasesize) {
-		fprintf(stderr, "Image size %ld bytes is not a multiple of erasesize %d bytes\n",
-			st.st_size, erasesize);
+		fprintf(stderr, "Image size %lld bytes is not a multiple "
+			"of erasesize %d bytes\n",
+			(long long)st.st_size, erasesize);
 		exit(1);
 	}
 	image = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, rfd, 0);
diff --git a/sumtool.c b/sumtool.c
index 966e110..4bd4624 100644
--- a/sumtool.c
+++ b/sumtool.c
@@ -88,7 +88,7 @@ static struct option long_options[] = {
 	{NULL, 0, NULL, 0}
 };
 
-static char *helptext =
+static const char *helptext =
 "Usage: sumtool [OPTIONS] -i inputfile -o outputfile\n\n"
 "Convert the input JFFS2 image to a summarized JFFS2 image\n"
 "Summary makes mounting faster - if summary support enabled in your kernel\n\n"
@@ -112,7 +112,7 @@ static char *helptext =
 "                            eraseblock\n\n";
 
 
-static char *revtext = "$Revision: 1.9 $";
+static const char *revtext = "$Revision: 1.9 $";
 
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
