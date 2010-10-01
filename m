Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1j7w-0000mY-Pr
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 17:10:36 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id E8E731B40C3
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 17:10:30 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] sumtool: convert to common.h helpers
Date: Fri,  1 Oct 2010 13:11:27 -0400
Message-Id: <1285953088-19593-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 sumtool.c |  237 ++++++++++++++++++++----------------------------------------
 1 files changed, 79 insertions(+), 158 deletions(-)

diff --git a/sumtool.c b/sumtool.c
index d0e2a7b..51e4173 100644
--- a/sumtool.c
+++ b/sumtool.c
@@ -48,6 +48,7 @@
 #include <getopt.h>
 #include <crc32.h>
 #include "summary.h"
+#include "common.h"
 
 #define PAD(x) (((x)+3)&~3)
 
@@ -119,48 +120,6 @@ static unsigned char ffbuf[16] = {
 	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
 };
 
-static void verror_msg(const char *s, va_list p)
-{
-	fflush(stdout);
-	fprintf(stderr, "%s: ", PROGRAM_NAME);
-	vfprintf(stderr, s, p);
-}
-
-static void error_msg_and_die(const char *s, ...)
-{
-	va_list p;
-
-	va_start(p, s);
-	verror_msg(s, p);
-	va_end(p);
-	putc('\n', stderr);
-	exit(EXIT_FAILURE);
-}
-
-static void vperror_msg(const char *s, va_list p)
-{
-	int err = errno;
-
-	if (s == 0)
-		s = "";
-	verror_msg(s, p);
-	if (*s)
-		s = ": ";
-	fprintf(stderr, "%s%s\n", s, strerror(err));
-}
-
-static void perror_msg_and_die(const char *s, ...)
-{
-	va_list p;
-
-	va_start(p, s);
-	vperror_msg(s, p);
-	va_end(p);
-	exit(EXIT_FAILURE);
-}
-
-
-
 static void full_write(void *target_buff, const void *buf, int len);
 
 void setup_cleanmarker()
@@ -179,18 +138,18 @@ void process_options (int argc, char **argv)
 		switch (opt) {
 			case 'o':
 				if (out_fd != -1)
-					error_msg_and_die("output filename specified more than once");
+					errmsg_die("output filename specified more than once");
 				out_fd = open(optarg, O_CREAT | O_TRUNC | O_RDWR, 0644);
 				if (out_fd == -1)
-					perror_msg_and_die("open output file");
+					sys_errmsg_die("open output file");
 				break;
 
 			case 'i':
 				if (in_fd != -1)
-					error_msg_and_die("input filename specified more than once");
+					errmsg_die("input filename specified more than once");
 				in_fd = open(optarg, O_RDONLY);
 				if (in_fd == -1)
-					perror_msg_and_die("open input file");
+					sys_errmsg_die("open input file");
 				break;
 			case 'b':
 				target_endian = __BIG_ENDIAN;
@@ -200,13 +159,13 @@ void process_options (int argc, char **argv)
 				break;
 			case 'h':
 			case '?':
-				error_msg_and_die(helptext);
+				errmsg_die("%s", helptext);
 			case 'v':
 				verbose = 1;
 				break;
 
 			case 'V':
-				error_msg_and_die("revision %.*s\n",
+				errmsg_die("revision %.*s\n",
 						(int) strlen(revtext) - 13, revtext + 11);
 
 			case 'e': {
@@ -214,7 +173,7 @@ void process_options (int argc, char **argv)
 						  unsigned units = 0;
 						  erase_block_size = strtol(optarg, &next, 0);
 						  if (!erase_block_size)
-							  error_msg_and_die("Unrecognisable erase size\n");
+							  errmsg_die("Unrecognisable erase size\n");
 
 						  if (*next) {
 							  if (!strcmp(next, "KiB")) {
@@ -222,7 +181,7 @@ void process_options (int argc, char **argv)
 							  } else if (!strcmp(next, "MiB")) {
 								  units = 1024 * 1024;
 							  } else {
-								  error_msg_and_die("Unknown units in erasesize\n");
+								  errmsg_die("Unknown units in erasesize\n");
 							  }
 						  } else {
 							  if (erase_block_size < 0x1000)
@@ -234,8 +193,8 @@ void process_options (int argc, char **argv)
 
 						  /* If it's less than 8KiB, they're not allowed */
 						  if (erase_block_size < 0x2000) {
-							  fprintf(stderr, "Erase size 0x%x too small. Increasing to 8KiB minimum\n",
-									  erase_block_size);
+							  warnmsg("Erase size 0x%x too small. Increasing to 8KiB minimum\n",
+									erase_block_size);
 							  erase_block_size = 0x2000;
 						  }
 						  break;
@@ -248,10 +207,10 @@ void process_options (int argc, char **argv)
 					  cleanmarker_size = strtol(optarg, NULL, 0);
 
 					  if (cleanmarker_size < sizeof(cleanmarker)) {
-						  error_msg_and_die("cleanmarker size must be >= 12");
+						  errmsg_die("cleanmarker size must be >= 12");
 					  }
 					  if (cleanmarker_size >= erase_block_size) {
-						  error_msg_and_die("cleanmarker size must be < eraseblock size");
+						  errmsg_die("cleanmarker size must be < eraseblock size");
 					  }
 
 					  use_input_cleanmarker_size = 0;
@@ -269,41 +228,19 @@ void process_options (int argc, char **argv)
 
 void init_buffers()
 {
-	data_buffer = malloc(erase_block_size);
-
-	if (!data_buffer) {
-		perror("out of memory");
-		close (in_fd);
-		close (out_fd);
-		exit(1);
-	}
-
-	file_buffer = malloc(erase_block_size);
-
-	if (!file_buffer) {
-		perror("out of memory");
-		close (in_fd);
-		close (out_fd);
-		exit(1);
-	}
+	data_buffer = xmalloc(erase_block_size);
+	file_buffer = xmalloc(erase_block_size);
 }
 
 void init_sumlist()
 {
-	sum_collected = (struct jffs2_summary *) malloc (sizeof(struct jffs2_summary));
-
-	if (!sum_collected)
-		error_msg_and_die("Can't allocate memory for jffs2_summary!\n");
-
-	memset(sum_collected, 0, sizeof(struct jffs2_summary));
+	sum_collected = xzalloc(sizeof(*sum_collected));
 }
 
 void clean_buffers()
 {
-	if (data_buffer)
-		free(data_buffer);
-	if (file_buffer)
-		free(file_buffer);
+	free(data_buffer);
+	free(file_buffer);
 }
 
 void clean_sumlist()
@@ -320,7 +257,7 @@ void clean_sumlist()
 		}
 
 		if (sum_collected->sum_num != 0)
-			printf("Ooops, something wrong happened! sum_num != 0, but sum_list = null ???");
+			warnmsg("Ooops, something wrong happened! sum_num != 0, but sum_list = null ???");
 
 		free(sum_collected);
 	}
@@ -332,8 +269,7 @@ int load_next_block()
 	ret = read(in_fd, file_buffer, erase_block_size);
 	file_ofs = 0;
 
-	if (verbose)
-		printf("Load next block : %d bytes read\n",ret);
+	bareverbose(verbose, "Load next block : %d bytes read\n", ret);
 
 	return ret;
 }
@@ -350,10 +286,10 @@ void write_buff_to_file()
 		ret = write(out_fd, buf, len);
 
 		if (ret < 0)
-			perror_msg_and_die("write");
+			sys_errmsg_die("write");
 
 		if (ret == 0)
-			perror_msg_and_die("write returned zero");
+			sys_errmsg_die("write returned zero");
 
 		len -= ret;
 		buf += ret;
@@ -383,10 +319,7 @@ void dump_sum_records()
 	infosize += padsize; datasize += padsize;
 	offset = cpu_to_je32(data_ofs);
 
-	tpage = (jint32_t *) malloc(datasize);
-
-	if(!tpage)
-		error_msg_and_die("Can't allocate memory to dump summary information!\n");
+	tpage = xmalloc(datasize);
 
 	memset(tpage, 0xff, datasize);
 	memset(&isum, 0, sizeof(isum));
@@ -465,7 +398,7 @@ void dump_sum_records()
 									  }
 
 			default : {
-						  printf("Unknown node type!\n");
+						  warnmsg("Unknown node type!\n");
 					  }
 		}
 
@@ -610,17 +543,14 @@ int add_sum_mem(union jffs2_sum_mem *item)
 			break;
 
 		default:
-			error_msg_and_die("__jffs2_add_sum_mem(): UNKNOWN node type %d\n", je16_to_cpu(item->u.nodetype));
+			errmsg_die("__jffs2_add_sum_mem(): UNKNOWN node type %d\n", je16_to_cpu(item->u.nodetype));
 	}
 	return 0;
 }
 
 void add_sum_inode_mem(union jffs2_node_union *node)
 {
-	struct jffs2_sum_inode_mem *temp = (struct jffs2_sum_inode_mem *) malloc(sizeof(struct jffs2_sum_inode_mem));
-
-	if (!temp)
-		error_msg_and_die("Can't allocate memory for summary information!\n");
+	struct jffs2_sum_inode_mem *temp = xmalloc(sizeof(*temp));
 
 	temp->nodetype = node->i.nodetype;
 	temp->inode = node->i.ino;
@@ -634,11 +564,7 @@ void add_sum_inode_mem(union jffs2_node_union *node)
 
 void add_sum_dirent_mem(union jffs2_node_union *node)
 {
-	struct jffs2_sum_dirent_mem *temp = (struct jffs2_sum_dirent_mem *)
-		malloc(sizeof(struct jffs2_sum_dirent_mem) + node->d.nsize);
-
-	if (!temp)
-		error_msg_and_die("Can't allocate memory for summary information!\n");
+	struct jffs2_sum_dirent_mem *temp = xmalloc(sizeof(*temp) + node->d.nsize);
 
 	temp->nodetype = node->d.nodetype;
 	temp->totlen = node->d.totlen;
@@ -656,10 +582,7 @@ void add_sum_dirent_mem(union jffs2_node_union *node)
 
 void add_sum_xattr_mem(union jffs2_node_union *node)
 {
-	struct jffs2_sum_xattr_mem *temp = (struct jffs2_sum_xattr_mem *)
-		malloc(sizeof(struct jffs2_sum_xattr_mem));
-	if (!temp)
-		error_msg_and_die("Can't allocate memory for summary information!\n");
+	struct jffs2_sum_xattr_mem *temp = xmalloc(sizeof(*temp));
 
 	temp->nodetype = node->x.nodetype;
 	temp->xid = node->x.xid;
@@ -673,10 +596,7 @@ void add_sum_xattr_mem(union jffs2_node_union *node)
 
 void add_sum_xref_mem(union jffs2_node_union *node)
 {
-	struct jffs2_sum_xref_mem *temp = (struct jffs2_sum_xref_mem *)
-		malloc(sizeof(struct jffs2_sum_xref_mem));
-	if (!temp)
-		error_msg_and_die("Can't allocate memory for summary information!\n");
+	struct jffs2_sum_xref_mem *temp = xmalloc(sizeof(*temp));
 
 	temp->nodetype = node->r.nodetype;
 	temp->offset = cpu_to_je32(data_ofs);
@@ -740,7 +660,8 @@ void create_summed_image(int inp_size)
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK) {
 			if (!bitchbitmask++)
-				printf ("Wrong bitmask  at  0x%08zx, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
+				warnmsg("Wrong bitmask  at  0x%08zx, 0x%04x\n",
+					p - file_buffer, je16_to_cpu (node->u.magic));
 			p += 4;
 			continue;
 		}
@@ -759,30 +680,33 @@ void create_summed_image(int inp_size)
 
 		crc = mtd_crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
 		if (crc != je32_to_cpu (node->u.hdr_crc)) {
-			printf ("Wrong hdr_crc  at  0x%08zx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->u.hdr_crc), crc);
+			warnmsg("Wrong hdr_crc  at  0x%08zx, 0x%08x instead of 0x%08x\n",
+				p - file_buffer, je32_to_cpu (node->u.hdr_crc), crc);
 			p += 4;
 			continue;
 		}
 
 		switch(je16_to_cpu(node->u.nodetype)) {
 			case JFFS2_NODETYPE_INODE:
-				if (verbose)
-					printf ("%8s Inode      node at 0x%08zx, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
-							je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize),
-							je32_to_cpu (node->i.csize), je32_to_cpu (node->i.dsize), je32_to_cpu (node->i.offset));
+				bareverbose(verbose,
+					"%8s Inode      node at 0x%08zx, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+					obsolete ? "Obsolete" : "",
+					p - file_buffer, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
+					je32_to_cpu (node->i.version), je32_to_cpu (node->i.isize),
+					je32_to_cpu (node->i.csize), je32_to_cpu (node->i.dsize), je32_to_cpu (node->i.offset));
 
 				crc = mtd_crc32 (0, node, sizeof (struct jffs2_raw_inode) - 8);
 				if (crc != je32_to_cpu (node->i.node_crc)) {
-					printf ("Wrong node_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.node_crc), crc);
+					warnmsg("Wrong node_crc at  0x%08zx, 0x%08x instead of 0x%08x\n",
+						p - file_buffer, je32_to_cpu (node->i.node_crc), crc);
 					p += PAD(je32_to_cpu (node->i.totlen));
 					continue;
 				}
 
 				crc = mtd_crc32(0, p + sizeof (struct jffs2_raw_inode), je32_to_cpu(node->i.csize));
 				if (crc != je32_to_cpu(node->i.data_crc)) {
-					printf ("Wrong data_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.data_crc), crc);
+					warnmsg("Wrong data_crc at  0x%08zx, 0x%08x instead of 0x%08x\n",
+						p - file_buffer, je32_to_cpu (node->i.data_crc), crc);
 					p += PAD(je32_to_cpu (node->i.totlen));
 					continue;
 				}
@@ -796,23 +720,25 @@ void create_summed_image(int inp_size)
 				memcpy (name, node->d.name, node->d.nsize);
 				name [node->d.nsize] = 0x0;
 
-				if (verbose)
-					printf ("%8s Dirent     node at 0x%08zx, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
-							je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino),
-							node->d.nsize, name);
+				bareverbose(verbose,
+					"%8s Dirent     node at 0x%08zx, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
+					obsolete ? "Obsolete" : "",
+					p - file_buffer, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
+					je32_to_cpu (node->d.version), je32_to_cpu (node->d.ino),
+					node->d.nsize, name);
 
 				crc = mtd_crc32 (0, node, sizeof (struct jffs2_raw_dirent) - 8);
 				if (crc != je32_to_cpu (node->d.node_crc)) {
-					printf ("Wrong node_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.node_crc), crc);
+					warnmsg("Wrong node_crc at  0x%08zx, 0x%08x instead of 0x%08x\n",
+						p - file_buffer, je32_to_cpu (node->d.node_crc), crc);
 					p += PAD(je32_to_cpu (node->d.totlen));
 					continue;
 				}
 
 				crc = mtd_crc32(0, p + sizeof (struct jffs2_raw_dirent), node->d.nsize);
 				if (crc != je32_to_cpu(node->d.name_crc)) {
-					printf ("Wrong name_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.name_crc), crc);
+					warnmsg("Wrong name_crc at  0x%08zx, 0x%08x instead of 0x%08x\n",
+						p - file_buffer, je32_to_cpu (node->d.name_crc), crc);
 					p += PAD(je32_to_cpu (node->d.totlen));
 					continue;
 				}
@@ -825,15 +751,14 @@ void create_summed_image(int inp_size)
 			case JFFS2_NODETYPE_XATTR:
 				if (je32_to_cpu(node->x.node_crc) == 0xffffffff)
 					obsolete = 1;
-				if (verbose)
-					printf("%8s Xdatum     node at 0x%08zx, totlen 0x%08x, "
-							"#xid  %5u, version %5u\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->x.totlen),
-							je32_to_cpu(node->x.xid), je32_to_cpu(node->x.version));
+				bareverbose(verbose,
+					"%8s Xdatum     node at 0x%08zx, totlen 0x%08x, #xid  %5u, version %5u\n",
+					obsolete ? "Obsolete" : "",
+					p - file_buffer, je32_to_cpu (node->x.totlen),
+					je32_to_cpu(node->x.xid), je32_to_cpu(node->x.version));
 				crc = mtd_crc32(0, node, sizeof (struct jffs2_raw_xattr) - 4);
 				if (crc != je32_to_cpu(node->x.node_crc)) {
-					printf("Wrong node_crc at 0x%08zx, 0x%08x instead of 0x%08x\n",
+					warnmsg("Wrong node_crc at 0x%08zx, 0x%08x instead of 0x%08x\n",
 							p - file_buffer, je32_to_cpu(node->x.node_crc), crc);
 					p += PAD(je32_to_cpu (node->x.totlen));
 					continue;
@@ -841,7 +766,7 @@ void create_summed_image(int inp_size)
 				length = node->x.name_len + 1 + je16_to_cpu(node->x.value_len);
 				crc = mtd_crc32(0, node->x.data, length);
 				if (crc != je32_to_cpu(node->x.data_crc)) {
-					printf("Wrong data_crc at 0x%08zx, 0x%08x instead of 0x%08x\n",
+					warnmsg("Wrong data_crc at 0x%08zx, 0x%08x instead of 0x%08x\n",
 							p - file_buffer, je32_to_cpu(node->x.data_crc), crc);
 					p += PAD(je32_to_cpu (node->x.totlen));
 					continue;
@@ -854,15 +779,14 @@ void create_summed_image(int inp_size)
 			case JFFS2_NODETYPE_XREF:
 				if (je32_to_cpu(node->r.node_crc) == 0xffffffff)
 					obsolete = 1;
-				if (verbose)
-					printf("%8s Xref       node at 0x%08zx, totlen 0x%08x, "
-							"#ino  %5u, xid     %5u\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu(node->r.totlen),
-							je32_to_cpu(node->r.ino), je32_to_cpu(node->r.xid));
+				bareverbose(verbose,
+					"%8s Xref       node at 0x%08zx, totlen 0x%08x, #ino  %5u, xid     %5u\n",
+					obsolete ? "Obsolete" : "",
+					p - file_buffer, je32_to_cpu(node->r.totlen),
+					je32_to_cpu(node->r.ino), je32_to_cpu(node->r.xid));
 				crc = mtd_crc32(0, node, sizeof (struct jffs2_raw_xref) - 4);
 				if (crc != je32_to_cpu(node->r.node_crc)) {
-					printf("Wrong node_crc at 0x%08zx, 0x%08x instead of 0x%08x\n",
+					warnmsg("Wrong node_crc at 0x%08zx, 0x%08x instead of 0x%08x\n",
 							p - file_buffer, je32_to_cpu(node->r.node_crc), crc);
 					p += PAD(je32_to_cpu (node->r.totlen));
 					continue;
@@ -873,11 +797,10 @@ void create_summed_image(int inp_size)
 				break;
 
 			case JFFS2_NODETYPE_CLEANMARKER:
-				if (verbose) {
-					printf ("%8s Cleanmarker     at 0x%08zx, totlen 0x%08x\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->u.totlen));
-				}
+				bareverbose(verbose,
+					"%8s Cleanmarker     at 0x%08zx, totlen 0x%08x\n",
+					obsolete ? "Obsolete" : "",
+					p - file_buffer, je32_to_cpu (node->u.totlen));
 
 				if (!found_cleanmarkers) {
 					found_cleanmarkers = 1;
@@ -892,11 +815,10 @@ void create_summed_image(int inp_size)
 				break;
 
 			case JFFS2_NODETYPE_PADDING:
-				if (verbose) {
-					printf ("%8s Padding    node at 0x%08zx, totlen 0x%08x\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->u.totlen));
-				}
+				bareverbose(verbose,
+					"%8s Padding    node at 0x%08zx, totlen 0x%08x\n",
+					obsolete ? "Obsolete" : "",
+					p - file_buffer, je32_to_cpu (node->u.totlen));
 				p += PAD(je32_to_cpu (node->u.totlen));
 				break;
 
@@ -905,11 +827,10 @@ void create_summed_image(int inp_size)
 				break;
 
 			default:
-				if (verbose) {
-					printf ("%8s Unknown    node at 0x%08zx, totlen 0x%08x\n",
-							obsolete ? "Obsolete" : "",
-							p - file_buffer, je32_to_cpu (node->u.totlen));
-				}
+				bareverbose(verbose,
+					"%8s Unknown    node at 0x%08zx, totlen 0x%08x\n",
+					obsolete ? "Obsolete" : "",
+					p - file_buffer, je32_to_cpu (node->u.totlen));
 
 				p += PAD(je32_to_cpu (node->u.totlen));
 		}
@@ -928,7 +849,7 @@ int main(int argc, char **argv)
 		if(out_fd != -1)
 			close(out_fd);
 		fprintf(stderr, "%s", helptext);
-		error_msg_and_die("You must specify input and output files!\n");
+		errmsg_die("You must specify input and output files!\n");
 	}
 
 	init_buffers();
-- 
1.7.3.1
