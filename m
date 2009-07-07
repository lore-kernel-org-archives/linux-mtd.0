Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOBGw-0005RL-05
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 14:03:57 +0000
Date: Tue, 7 Jul 2009 16:03:38 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
Subject: mtd-utils warnings
Message-ID: <20090707140337.GA24749@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Josh,

I have a quick and dirty patch that removes most warnings when compiling
mtd-utils.  It should be relatively safe and trivial, but I won't give
any guarantees for it.  Interested?

Signed-off-by: Joern Engel <joern@logfs.org>

Jörn

-- 
The only real mistake is the one from which we learn nothing.
-- John Powell

 compr.h          |    2 +-
 fec.c            |   10 +++++-----
 flash_eraseall.c |    5 +++++
 ftl_check.c      |    4 ++--
 jffs2dump.c      |   36 ++++++++++++++++++------------------
 mkfs.jffs2.c     |   23 ++++++++++++-----------
 mtd_debug.c      |    2 +-
 nandtest.c       |    6 +++---
 nandwrite.c      |    1 -
 nftl_format.c    |    3 ++-
 recv_image.c     |    4 ++--
 sumtool.c        |   38 +++++++++++++++++++-------------------
 12 files changed, 70 insertions(+), 64 deletions(-)

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
diff --git a/fec.c b/fec.c
index 6d9020f..924701f 100644
--- a/fec.c
+++ b/fec.c
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
@@ -792,7 +792,7 @@ shuffle(gf *pkt[], int index[], int k)
  * a vector of k*k elements, in row-major order
  */
 static gf *
-build_decode_matrix(struct fec_parms *code, gf *pkt[], int index[])
+build_decode_matrix(struct fec_parms *code, int index[])
 {
     int i , k = code->k ;
     gf *p, *matrix = NEW_GF_MATRIX(k, k);
@@ -846,7 +846,7 @@ fec_decode(struct fec_parms *code, gf *pkt[], int index[], int sz)
 
     if (shuffle(pkt, index, k))	/* error if true */
 	return 1 ;
-    m_dec = build_decode_matrix(code, pkt, index);
+    m_dec = build_decode_matrix(code, index);
 
     if (m_dec == NULL)
 	return 1 ; /* error */
diff --git a/flash_eraseall.c b/flash_eraseall.c
index a22fc49..bcc7f88 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -43,6 +43,11 @@
 #define PROGRAM "flash_eraseall"
 #define VERSION "$Revision: 1.22 $"
 
+#define TRACE() do {						\
+	printf("trace: %s:%d: %p->%s\n", __FILE__, __LINE__,	\
+			__builtin_return_address(0), __func__);	\
+} while(0)
+
 static const char *exe_name;
 static const char *mtd_device;
 static int quiet;		/* true -- don't output progress */
diff --git a/ftl_check.c b/ftl_check.c
index f41e79a..0e5d139 100644
--- a/ftl_check.c
+++ b/ftl_check.c
@@ -79,7 +79,7 @@ static void print_size(u_int s)
 
 /*====================================================================*/
 
-static void check_partition(int fd, int verbose)
+static void check_partition(int fd)
 {
 	mtd_info_t mtd;
 	erase_unit_header_t hdr, hdr2;
@@ -224,7 +224,7 @@ int main(int argc, char *argv[])
 		exit(EXIT_FAILURE);
 	}
 
-	check_partition(fd, verbose);
+	check_partition(fd);
 	close(fd);
 
 	exit(EXIT_SUCCESS);
diff --git a/jffs2dump.c b/jffs2dump.c
index c5a99df..bcb518a 100644
--- a/jffs2dump.c
+++ b/jffs2dump.c
@@ -199,12 +199,12 @@ void do_dumpcontent (void)
 		}
 
 		if (p != p_free_begin)
-			printf("Empty space found from 0x%08x to 0x%08x\n", p_free_begin-data, p-data);
+			printf("Empty space found from 0x%08lx to 0x%08lx\n", p_free_begin-data, p-data);
 		p_free_begin = NULL;
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
 			if (!bitchbitmask++)
-				printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
+				printf ("Wrong bitmask  at  0x%08lx, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
 			p += 4;
 			dirty += 4;
 			continue;
@@ -222,7 +222,7 @@ void do_dumpcontent (void)
 
 		crc = crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
 		if (crc != je32_to_cpu (node->u.hdr_crc)) {
-			printf ("Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
+			printf ("Wrong hdr_crc  at  0x%08lx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
 			p += 4;
 			dirty += 4;
 			continue;
@@ -231,7 +231,7 @@ void do_dumpcontent (void)
 		switch(je16_to_cpu(node->u.nodetype)) {
 
 			case JFFS2_NODETYPE_INODE:
-				printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+				printf ("%8s Inode      node at 0x%08lx, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
 						obsolete ? "Obsolete" : "",
 						p - data, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
 						je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize),
@@ -239,7 +239,7 @@ void do_dumpcontent (void)
 
 				crc = crc32 (0, node, sizeof (struct jffs2_raw_inode) - 8);
 				if (crc != je32_to_cpu (node->i.node_crc)) {
-					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.node_crc), crc);
+					printf ("Wrong node_crc at  0x%08lx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.node_crc), crc);
 					p += PAD(je32_to_cpu (node->i.totlen));
 					dirty += PAD(je32_to_cpu (node->i.totlen));;
 					continue;
@@ -247,7 +247,7 @@ void do_dumpcontent (void)
 
 				crc = crc32(0, p + sizeof (struct jffs2_raw_inode), je32_to_cpu(node->i.csize));
 				if (crc != je32_to_cpu(node->i.data_crc)) {
-					printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.data_crc), crc);
+					printf ("Wrong data_crc at  0x%08lx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.data_crc), crc);
 					p += PAD(je32_to_cpu (node->i.totlen));
 					dirty += PAD(je32_to_cpu (node->i.totlen));;
 					continue;
@@ -259,7 +259,7 @@ void do_dumpcontent (void)
 			case JFFS2_NODETYPE_DIRENT:
 				memcpy (name, node->d.name, node->d.nsize);
 				name [node->d.nsize] = 0x0;
-				printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
+				printf ("%8s Dirent     node at 0x%08lx, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
 						obsolete ? "Obsolete" : "",
 						p - data, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
 						je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino),
@@ -267,7 +267,7 @@ void do_dumpcontent (void)
 
 				crc = crc32 (0, node, sizeof (struct jffs2_raw_dirent) - 8);
 				if (crc != je32_to_cpu (node->d.node_crc)) {
-					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->d.node_crc), crc);
+					printf ("Wrong node_crc at  0x%08lx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->d.node_crc), crc);
 					p += PAD(je32_to_cpu (node->d.totlen));
 					dirty += PAD(je32_to_cpu (node->d.totlen));;
 					continue;
@@ -275,7 +275,7 @@ void do_dumpcontent (void)
 
 				crc = crc32(0, p + sizeof (struct jffs2_raw_dirent), node->d.nsize);
 				if (crc != je32_to_cpu(node->d.name_crc)) {
-					printf ("Wrong name_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->d.name_crc), crc);
+					printf ("Wrong name_crc at  0x%08lx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->d.name_crc), crc);
 					p += PAD(je32_to_cpu (node->d.totlen));
 					dirty += PAD(je32_to_cpu (node->d.totlen));;
 					continue;
@@ -289,7 +289,7 @@ void do_dumpcontent (void)
 											 int i;
 											 struct jffs2_sum_marker * sm;
 
-											 printf("%8s Inode Sum  node at 0x%08x, totlen 0x%08x, sum_num  %5d, cleanmarker size %5d\n",
+											 printf("%8s Inode Sum  node at 0x%08lx, totlen 0x%08x, sum_num  %5d, cleanmarker size %5d\n",
 													 obsolete ? "Obsolete" : "",
 													 p - data,
 													 je32_to_cpu (node->s.totlen),
@@ -298,7 +298,7 @@ void do_dumpcontent (void)
 
 											 crc = crc32 (0, node, sizeof (struct jffs2_raw_summary) - 8);
 											 if (crc != je32_to_cpu (node->s.node_crc)) {
-												 printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.node_crc), crc);
+												 printf ("Wrong node_crc at  0x%08lx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.node_crc), crc);
 												 p += PAD(je32_to_cpu (node->s.totlen));
 												 dirty += PAD(je32_to_cpu (node->s.totlen));;
 												 continue;
@@ -306,7 +306,7 @@ void do_dumpcontent (void)
 
 											 crc = crc32(0, p + sizeof (struct jffs2_raw_summary),  je32_to_cpu (node->s.totlen) - sizeof(struct jffs2_raw_summary));
 											 if (crc != je32_to_cpu(node->s.sum_crc)) {
-												 printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.sum_crc), crc);
+												 printf ("Wrong data_crc at  0x%08lx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.sum_crc), crc);
 												 p += PAD(je32_to_cpu (node->s.totlen));
 												 dirty += PAD(je32_to_cpu (node->s.totlen));;
 												 continue;
@@ -379,7 +379,7 @@ void do_dumpcontent (void)
 
 			case JFFS2_NODETYPE_CLEANMARKER:
 										 if (verbose) {
-											 printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n",
+											 printf ("%8s Cleanmarker     at 0x%08lx, totlen 0x%08x\n",
 													 obsolete ? "Obsolete" : "",
 													 p - data, je32_to_cpu (node->u.totlen));
 										 }
@@ -388,7 +388,7 @@ void do_dumpcontent (void)
 
 			case JFFS2_NODETYPE_PADDING:
 										 if (verbose) {
-											 printf ("%8s Padding    node at 0x%08x, totlen 0x%08x\n",
+											 printf ("%8s Padding    node at 0x%08lx, totlen 0x%08x\n",
 													 obsolete ? "Obsolete" : "",
 													 p - data, je32_to_cpu (node->u.totlen));
 										 }
@@ -402,7 +402,7 @@ void do_dumpcontent (void)
 
 			default:
 										 if (verbose) {
-											 printf ("%8s Unknown    node at 0x%08x, totlen 0x%08x\n",
+											 printf ("%8s Unknown    node at 0x%08lx, totlen 0x%08x\n",
 													 obsolete ? "Obsolete" : "",
 													 p - data, je32_to_cpu (node->u.totlen));
 										 }
@@ -444,7 +444,7 @@ void do_endianconvert (void)
 		}
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
-			printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
+			printf ("Wrong bitmask  at  0x%08lx, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
 			newnode.u.magic = cnv_e16 (node->u.magic);
 			newnode.u.nodetype = cnv_e16 (node->u.nodetype);
 			write (fd, &newnode, 4);
@@ -454,7 +454,7 @@ void do_endianconvert (void)
 
 		crc = crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
 		if (crc != je32_to_cpu (node->u.hdr_crc)) {
-			printf ("Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
+			printf ("Wrong hdr_crc  at  0x%08lx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
 		}
 
 		switch(je16_to_cpu(node->u.nodetype)) {
@@ -619,7 +619,7 @@ void do_endianconvert (void)
 										  break;
 
 			default:
-										  printf ("Unknown node type: 0x%04x at 0x%08x, totlen 0x%08x\n", je16_to_cpu (node->u.nodetype), p - data, je32_to_cpu (node->u.totlen));
+										  printf ("Unknown node type: 0x%04x at 0x%08lx, totlen 0x%08x\n", je16_to_cpu (node->u.nodetype), p - data, je32_to_cpu (node->u.totlen));
 										  p += PAD(je32_to_cpu (node->u.totlen));
 
 		}
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 23a8cf8..f39e46a 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -1089,7 +1089,7 @@ static uint32_t highest_xseqno = 0;
 
 static struct {
 	int xprefix;
-	char *string;
+	const char *string;
 	int length;
 } xprefix_tbl[] = {
 	{ JFFS2_XPREFIX_USER, XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN },
@@ -1231,7 +1231,8 @@ static void write_xattr_entry(struct filesystem_entry *e)
 	struct jffs2_raw_xref ref;
 	struct xattr_entry *xe;
 	char xlist[XATTR_BUFFER_SIZE], xvalue[XATTR_BUFFER_SIZE];
-	char *xname, *prefix_str;
+	char *xname;
+	const char *prefix_str;
 	int i, xprefix, prefix_len;
 	int list_sz, offset, name_len, value_len;
 
@@ -1479,7 +1480,7 @@ static struct option long_options[] = {
 	{NULL, 0, NULL, 0}
 };
 
-static char *helptext =
+static const char *helptext =
 "Usage: mkfs.jffs2 [OPTIONS]\n"
 "Make a JFFS2 file system image from an existing directory tree\n\n"
 "Options:\n"
@@ -1518,7 +1519,7 @@ static char *helptext =
 "  -V, --version           Display version information\n"
 "  -i, --incremental=FILE  Parse FILE and generate appendage output for it\n\n";
 
-static char *revtext = "1.60";
+static const char *revtext = "1.60";
 
 int load_next_block() {
 
@@ -1552,7 +1553,7 @@ void process_buffer(int inp_size) {
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
 			if (!bitchbitmask++)
-				printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
+				printf ("Wrong bitmask  at  0x%08lx, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
 			p += 4;
 			continue;
 		}
@@ -1572,7 +1573,7 @@ void process_buffer(int inp_size) {
 
 			case JFFS2_NODETYPE_INODE:
 				if(verbose)
-					printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+					printf ("%8s Inode      node at 0x%08lx, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
 							je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize),
@@ -1589,7 +1590,7 @@ void process_buffer(int inp_size) {
 				name [node->d.nsize] = 0x0;
 
 				if(verbose)
-					printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
+					printf ("%8s Dirent     node at 0x%08lx, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
 							je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino),
@@ -1600,7 +1601,7 @@ void process_buffer(int inp_size) {
 
 			case JFFS2_NODETYPE_CLEANMARKER:
 				if (verbose) {
-					printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Cleanmarker     at 0x%08lx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
@@ -1610,7 +1611,7 @@ void process_buffer(int inp_size) {
 
 			case JFFS2_NODETYPE_PADDING:
 				if (verbose) {
-					printf ("%8s Padding    node at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Padding    node at 0x%08lx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
@@ -1624,7 +1625,7 @@ void process_buffer(int inp_size) {
 
 			default:
 				if (verbose) {
-					printf ("%8s Unknown    node at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Unknown    node at 0x%08lx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
@@ -1878,7 +1879,7 @@ int main(int argc, char **argv)
 	if(in_fd != -1)
 		parse_image();
 
-	root = recursive_add_host_directory(NULL, "/", cwd);
+	root = recursive_add_host_directory(NULL, (char *)"/", cwd);
 
 	if (devtable)
 		parse_device_table(root, devtable);
diff --git a/mtd_debug.c b/mtd_debug.c
index 85d48e9..60e1ce1 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -158,7 +158,7 @@ retry:
 	if (buf != NULL)
 		free (buf);
 	close (outfd);
-	printf ("Copied %d bytes from address 0x%.8x in flash to %s\n",len,offset,filename);
+	printf ("Copied %zd bytes from address 0x%.8x in flash to %s\n",len,offset,filename);
 	return (0);
 
 err2:
diff --git a/nandtest.c b/nandtest.c
index 7613a52..e406777 100644
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
diff --git a/nandwrite.c b/nandwrite.c
index 1a9449b..16c3938 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -260,7 +260,6 @@ int main(int argc, char * const argv[])
 	int ret, readlen;
 	int oobinfochanged = 0;
 	struct nand_oobinfo old_oobinfo;
-	int readcnt = 0;
 	bool failed = true;
 
 	process_options(argc, argv);
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
index d65aa2a..8d7a2e7 100644
--- a/recv_image.c
+++ b/recv_image.c
@@ -39,7 +39,7 @@ int main(int argc, char **argv)
 	struct addrinfo *runp;
 	int ret;
 	int sock;
-	size_t len;
+	ssize_t len;
 	int flfd;
 	struct mtd_info_user meminfo;
 	unsigned char *eb_buf, *decode_buf, **src_pkts;
@@ -166,7 +166,7 @@ int main(int argc, char **argv)
 			break;
 		}
 		if (len < sizeof(thispkt)) {
-			fprintf(stderr, "Wrong length %d bytes (expected %d)\n",
+			fprintf(stderr, "Wrong length %zd bytes (expected %ld)\n",
 				len, sizeof(thispkt));
 			continue;
 		}
diff --git a/sumtool.c b/sumtool.c
index 6bb7168..2cd98b1 100644
--- a/sumtool.c
+++ b/sumtool.c
@@ -73,7 +73,7 @@ static unsigned int file_ofs = 0;		/* position in the buffer */
 
 int target_endian = __BYTE_ORDER;
 
-static struct option long_options[] = {
+static const struct option long_options[] = {
 	{"output", 1, NULL, 'o'},
 	{"input", 1, NULL, 'i'},
 	{"eraseblock", 1, NULL, 'e'},
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
@@ -740,7 +740,7 @@ void create_summed_image(int inp_size)
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK) {
 			if (!bitchbitmask++)
-				printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
+				printf ("Wrong bitmask  at  0x%08lx, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
 			p += 4;
 			continue;
 		}
@@ -759,7 +759,7 @@ void create_summed_image(int inp_size)
 
 		crc = crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
 		if (crc != je32_to_cpu (node->u.hdr_crc)) {
-			printf ("Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->u.hdr_crc), crc);
+			printf ("Wrong hdr_crc  at  0x%08lx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->u.hdr_crc), crc);
 			p += 4;
 			continue;
 		}
@@ -767,7 +767,7 @@ void create_summed_image(int inp_size)
 		switch(je16_to_cpu(node->u.nodetype)) {
 			case JFFS2_NODETYPE_INODE:
 				if (verbose)
-					printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+					printf ("%8s Inode      node at 0x%08lx, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
 							je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize),
@@ -775,14 +775,14 @@ void create_summed_image(int inp_size)
 
 				crc = crc32 (0, node, sizeof (struct jffs2_raw_inode) - 8);
 				if (crc != je32_to_cpu (node->i.node_crc)) {
-					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.node_crc), crc);
+					printf ("Wrong node_crc at  0x%08lx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.node_crc), crc);
 					p += PAD(je32_to_cpu (node->i.totlen));
 					continue;
 				}
 
 				crc = crc32(0, p + sizeof (struct jffs2_raw_inode), je32_to_cpu(node->i.csize));
 				if (crc != je32_to_cpu(node->i.data_crc)) {
-					printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.data_crc), crc);
+					printf ("Wrong data_crc at  0x%08lx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.data_crc), crc);
 					p += PAD(je32_to_cpu (node->i.totlen));
 					continue;
 				}
@@ -797,7 +797,7 @@ void create_summed_image(int inp_size)
 				name [node->d.nsize] = 0x0;
 
 				if (verbose)
-					printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
+					printf ("%8s Dirent     node at 0x%08lx, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
 							je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino),
@@ -805,14 +805,14 @@ void create_summed_image(int inp_size)
 
 				crc = crc32 (0, node, sizeof (struct jffs2_raw_dirent) - 8);
 				if (crc != je32_to_cpu (node->d.node_crc)) {
-					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.node_crc), crc);
+					printf ("Wrong node_crc at  0x%08lx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.node_crc), crc);
 					p += PAD(je32_to_cpu (node->d.totlen));
 					continue;
 				}
 
 				crc = crc32(0, p + sizeof (struct jffs2_raw_dirent), node->d.nsize);
 				if (crc != je32_to_cpu(node->d.name_crc)) {
-					printf ("Wrong name_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.name_crc), crc);
+					printf ("Wrong name_crc at  0x%08lx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.name_crc), crc);
 					p += PAD(je32_to_cpu (node->d.totlen));
 					continue;
 				}
@@ -826,14 +826,14 @@ void create_summed_image(int inp_size)
 				if (je32_to_cpu(node->x.node_crc) == 0xffffffff)
 					obsolete = 1;
 				if (verbose)
-					printf("%8s Xdatum     node at 0x%08x, totlen 0x%08x, "
+					printf("%8s Xdatum     node at 0x%08lx, totlen 0x%08x, "
 							"#xid  %5u, version %5u\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->x.totlen),
 							je32_to_cpu(node->x.xid), je32_to_cpu(node->x.version));
 				crc = crc32(0, node, sizeof (struct jffs2_raw_xattr) - 4);
 				if (crc != je32_to_cpu(node->x.node_crc)) {
-					printf("Wrong node_crc at 0x%08x, 0x%08x instead of 0x%08x\n",
+					printf("Wrong node_crc at 0x%08lx, 0x%08x instead of 0x%08x\n",
 							p - file_buffer, je32_to_cpu(node->x.node_crc), crc);
 					p += PAD(je32_to_cpu (node->x.totlen));
 					continue;
@@ -841,7 +841,7 @@ void create_summed_image(int inp_size)
 				length = node->x.name_len + 1 + je16_to_cpu(node->x.value_len);
 				crc = crc32(0, node->x.data, length);
 				if (crc != je32_to_cpu(node->x.data_crc)) {
-					printf("Wrong data_crc at 0x%08x, 0x%08x instead of 0x%08x\n",
+					printf("Wrong data_crc at 0x%08lx, 0x%08x instead of 0x%08x\n",
 							p - file_buffer, je32_to_cpu(node->x.data_crc), crc);
 					p += PAD(je32_to_cpu (node->x.totlen));
 					continue;
@@ -855,14 +855,14 @@ void create_summed_image(int inp_size)
 				if (je32_to_cpu(node->r.node_crc) == 0xffffffff)
 					obsolete = 1;
 				if (verbose)
-					printf("%8s Xref       node at 0x%08x, totlen 0x%08x, "
+					printf("%8s Xref       node at 0x%08lx, totlen 0x%08x, "
 							"#ino  %5u, xid     %5u\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu(node->r.totlen),
 							je32_to_cpu(node->r.ino), je32_to_cpu(node->r.xid));
 				crc = crc32(0, node, sizeof (struct jffs2_raw_xref) - 4);
 				if (crc != je32_to_cpu(node->r.node_crc)) {
-					printf("Wrong node_crc at 0x%08x, 0x%08x instead of 0x%08x\n",
+					printf("Wrong node_crc at 0x%08lx, 0x%08x instead of 0x%08x\n",
 							p - file_buffer, je32_to_cpu(node->r.node_crc), crc);
 					p += PAD(je32_to_cpu (node->r.totlen));
 					continue;
@@ -874,7 +874,7 @@ void create_summed_image(int inp_size)
 
 			case JFFS2_NODETYPE_CLEANMARKER:
 				if (verbose) {
-					printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Cleanmarker     at 0x%08lx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
@@ -893,7 +893,7 @@ void create_summed_image(int inp_size)
 
 			case JFFS2_NODETYPE_PADDING:
 				if (verbose) {
-					printf ("%8s Padding    node at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Padding    node at 0x%08lx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
@@ -906,7 +906,7 @@ void create_summed_image(int inp_size)
 
 			default:
 				if (verbose) {
-					printf ("%8s Unknown    node at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Unknown    node at 0x%08lx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
