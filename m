Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oll6h-0004vs-5j
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 16:03:19 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd-utils: Fix compiler warnings
Date: Wed, 18 Aug 2010 09:01:45 -0700
Message-ID: <1282147305-4640-2-git-send-email-norris@broadcom.com>
In-Reply-To: <1282147305-4640-1-git-send-email-norris@broadcom.com>
References: <1282147305-4640-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixed several compiler warnings, mainly when compiling on 64-bit
architectures (where "size_t"-related types are not necessarily
32-bit).

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 jffs2dump.c  |   36 ++++++++++++++++++------------------
 lib/libfec.c |    4 ++--
 mkfs.jffs2.c |   12 ++++++------
 recv_image.c |    2 +-
 sumtool.c    |   32 ++++++++++++++++----------------
 5 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/jffs2dump.c b/jffs2dump.c
index cd8b6fa..500ee58 100644
--- a/jffs2dump.c
+++ b/jffs2dump.c
@@ -198,12 +198,12 @@ void do_dumpcontent (void)
 		}
 
 		if (p != p_free_begin)
-			printf("Empty space found from 0x%08x to 0x%08x\n", p_free_begin-data, p-data);
+			printf("Empty space found from 0x%08zx to 0x%08zx\n", p_free_begin-data, p-data);
 		p_free_begin = NULL;
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
 			if (!bitchbitmask++)
-				printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
+				printf ("Wrong bitmask  at  0x%08zx, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
 			p += 4;
 			dirty += 4;
 			continue;
@@ -221,7 +221,7 @@ void do_dumpcontent (void)
 
 		crc = crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
 		if (crc != je32_to_cpu (node->u.hdr_crc)) {
-			printf ("Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
+			printf ("Wrong hdr_crc  at  0x%08zx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
 			p += 4;
 			dirty += 4;
 			continue;
@@ -230,7 +230,7 @@ void do_dumpcontent (void)
 		switch(je16_to_cpu(node->u.nodetype)) {
 
 			case JFFS2_NODETYPE_INODE:
-				printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+				printf ("%8s Inode      node at 0x%08zx, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
 						obsolete ? "Obsolete" : "",
 						p - data, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
 						je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize),
@@ -238,7 +238,7 @@ void do_dumpcontent (void)
 
 				crc = crc32 (0, node, sizeof (struct jffs2_raw_inode) - 8);
 				if (crc != je32_to_cpu (node->i.node_crc)) {
-					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.node_crc), crc);
+					printf ("Wrong node_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.node_crc), crc);
 					p += PAD(je32_to_cpu (node->i.totlen));
 					dirty += PAD(je32_to_cpu (node->i.totlen));;
 					continue;
@@ -246,7 +246,7 @@ void do_dumpcontent (void)
 
 				crc = crc32(0, p + sizeof (struct jffs2_raw_inode), je32_to_cpu(node->i.csize));
 				if (crc != je32_to_cpu(node->i.data_crc)) {
-					printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.data_crc), crc);
+					printf ("Wrong data_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.data_crc), crc);
 					p += PAD(je32_to_cpu (node->i.totlen));
 					dirty += PAD(je32_to_cpu (node->i.totlen));;
 					continue;
@@ -258,7 +258,7 @@ void do_dumpcontent (void)
 			case JFFS2_NODETYPE_DIRENT:
 				memcpy (name, node->d.name, node->d.nsize);
 				name [node->d.nsize] = 0x0;
-				printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
+				printf ("%8s Dirent     node at 0x%08zx, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
 						obsolete ? "Obsolete" : "",
 						p - data, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
 						je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino),
@@ -266,7 +266,7 @@ void do_dumpcontent (void)
 
 				crc = crc32 (0, node, sizeof (struct jffs2_raw_dirent) - 8);
 				if (crc != je32_to_cpu (node->d.node_crc)) {
-					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->d.node_crc), crc);
+					printf ("Wrong node_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->d.node_crc), crc);
 					p += PAD(je32_to_cpu (node->d.totlen));
 					dirty += PAD(je32_to_cpu (node->d.totlen));;
 					continue;
@@ -274,7 +274,7 @@ void do_dumpcontent (void)
 
 				crc = crc32(0, p + sizeof (struct jffs2_raw_dirent), node->d.nsize);
 				if (crc != je32_to_cpu(node->d.name_crc)) {
-					printf ("Wrong name_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->d.name_crc), crc);
+					printf ("Wrong name_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->d.name_crc), crc);
 					p += PAD(je32_to_cpu (node->d.totlen));
 					dirty += PAD(je32_to_cpu (node->d.totlen));;
 					continue;
@@ -288,7 +288,7 @@ void do_dumpcontent (void)
 											 int i;
 											 struct jffs2_sum_marker * sm;
 
-											 printf("%8s Inode Sum  node at 0x%08x, totlen 0x%08x, sum_num  %5d, cleanmarker size %5d\n",
+											 printf("%8s Inode Sum  node at 0x%08zx, totlen 0x%08x, sum_num  %5d, cleanmarker size %5d\n",
 													 obsolete ? "Obsolete" : "",
 													 p - data,
 													 je32_to_cpu (node->s.totlen),
@@ -297,7 +297,7 @@ void do_dumpcontent (void)
 
 											 crc = crc32 (0, node, sizeof (struct jffs2_raw_summary) - 8);
 											 if (crc != je32_to_cpu (node->s.node_crc)) {
-												 printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.node_crc), crc);
+												 printf ("Wrong node_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.node_crc), crc);
 												 p += PAD(je32_to_cpu (node->s.totlen));
 												 dirty += PAD(je32_to_cpu (node->s.totlen));;
 												 continue;
@@ -305,7 +305,7 @@ void do_dumpcontent (void)
 
 											 crc = crc32(0, p + sizeof (struct jffs2_raw_summary),  je32_to_cpu (node->s.totlen) - sizeof(struct jffs2_raw_summary));
 											 if (crc != je32_to_cpu(node->s.sum_crc)) {
-												 printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.sum_crc), crc);
+												 printf ("Wrong data_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.sum_crc), crc);
 												 p += PAD(je32_to_cpu (node->s.totlen));
 												 dirty += PAD(je32_to_cpu (node->s.totlen));;
 												 continue;
@@ -378,7 +378,7 @@ void do_dumpcontent (void)
 
 			case JFFS2_NODETYPE_CLEANMARKER:
 										 if (verbose) {
-											 printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n",
+											 printf ("%8s Cleanmarker     at 0x%08zx, totlen 0x%08x\n",
 													 obsolete ? "Obsolete" : "",
 													 p - data, je32_to_cpu (node->u.totlen));
 										 }
@@ -387,7 +387,7 @@ void do_dumpcontent (void)
 
 			case JFFS2_NODETYPE_PADDING:
 										 if (verbose) {
-											 printf ("%8s Padding    node at 0x%08x, totlen 0x%08x\n",
+											 printf ("%8s Padding    node at 0x%08zx, totlen 0x%08x\n",
 													 obsolete ? "Obsolete" : "",
 													 p - data, je32_to_cpu (node->u.totlen));
 										 }
@@ -401,7 +401,7 @@ void do_dumpcontent (void)
 
 			default:
 										 if (verbose) {
-											 printf ("%8s Unknown    node at 0x%08x, totlen 0x%08x\n",
+											 printf ("%8s Unknown    node at 0x%08zx, totlen 0x%08x\n",
 													 obsolete ? "Obsolete" : "",
 													 p - data, je32_to_cpu (node->u.totlen));
 										 }
@@ -443,7 +443,7 @@ void do_endianconvert (void)
 		}
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
-			printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
+			printf ("Wrong bitmask  at  0x%08zx, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
 			newnode.u.magic = cnv_e16 (node->u.magic);
 			newnode.u.nodetype = cnv_e16 (node->u.nodetype);
 			write (fd, &newnode, 4);
@@ -453,7 +453,7 @@ void do_endianconvert (void)
 
 		crc = crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
 		if (crc != je32_to_cpu (node->u.hdr_crc)) {
-			printf ("Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
+			printf ("Wrong hdr_crc  at  0x%08zx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
 		}
 
 		switch(je16_to_cpu(node->u.nodetype)) {
@@ -618,7 +618,7 @@ void do_endianconvert (void)
 										  break;
 
 			default:
-										  printf ("Unknown node type: 0x%04x at 0x%08x, totlen 0x%08x\n", je16_to_cpu (node->u.nodetype), p - data, je32_to_cpu (node->u.totlen));
+										  printf ("Unknown node type: 0x%04x at 0x%08zx, totlen 0x%08x\n", je16_to_cpu (node->u.nodetype), p - data, je32_to_cpu (node->u.totlen));
 										  p += PAD(je32_to_cpu (node->u.totlen));
 
 		}
diff --git a/lib/libfec.c b/lib/libfec.c
index adf2bba..924701f 100644
--- a/lib/libfec.c
+++ b/lib/libfec.c
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
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 181fe9d..ebfdb50 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -1555,7 +1555,7 @@ void process_buffer(int inp_size) {
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
 			if (!bitchbitmask++)
-				printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
+				printf ("Wrong bitmask  at  0x%08zx, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
 			p += 4;
 			continue;
 		}
@@ -1575,7 +1575,7 @@ void process_buffer(int inp_size) {
 
 			case JFFS2_NODETYPE_INODE:
 				if(verbose)
-					printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+					printf ("%8s Inode      node at 0x%08zx, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
 							je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize),
@@ -1592,7 +1592,7 @@ void process_buffer(int inp_size) {
 				name [node->d.nsize] = 0x0;
 
 				if(verbose)
-					printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
+					printf ("%8s Dirent     node at 0x%08zx, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
 							je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino),
@@ -1603,7 +1603,7 @@ void process_buffer(int inp_size) {
 
 			case JFFS2_NODETYPE_CLEANMARKER:
 				if (verbose) {
-					printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Cleanmarker     at 0x%08zx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
@@ -1613,7 +1613,7 @@ void process_buffer(int inp_size) {
 
 			case JFFS2_NODETYPE_PADDING:
 				if (verbose) {
-					printf ("%8s Padding    node at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Padding    node at 0x%08zx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
@@ -1627,7 +1627,7 @@ void process_buffer(int inp_size) {
 
 			default:
 				if (verbose) {
-					printf ("%8s Unknown    node at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Unknown    node at 0x%08zx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
diff --git a/recv_image.c b/recv_image.c
index 35059b3..60b24b3 100644
--- a/recv_image.c
+++ b/recv_image.c
@@ -166,7 +166,7 @@ int main(int argc, char **argv)
 			break;
 		}
 		if (len < sizeof(thispkt)) {
-			fprintf(stderr, "Wrong length %zd bytes (expected %lu)\n",
+			fprintf(stderr, "Wrong length %zd bytes (expected %zu)\n",
 				len, sizeof(thispkt));
 			continue;
 		}
diff --git a/sumtool.c b/sumtool.c
index 11b25b1..e931177 100644
--- a/sumtool.c
+++ b/sumtool.c
@@ -740,7 +740,7 @@ void create_summed_image(int inp_size)
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK) {
 			if (!bitchbitmask++)
-				printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
+				printf ("Wrong bitmask  at  0x%08zx, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
 			p += 4;
 			continue;
 		}
@@ -759,7 +759,7 @@ void create_summed_image(int inp_size)
 
 		crc = crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
 		if (crc != je32_to_cpu (node->u.hdr_crc)) {
-			printf ("Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->u.hdr_crc), crc);
+			printf ("Wrong hdr_crc  at  0x%08zx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->u.hdr_crc), crc);
 			p += 4;
 			continue;
 		}
@@ -767,7 +767,7 @@ void create_summed_image(int inp_size)
 		switch(je16_to_cpu(node->u.nodetype)) {
 			case JFFS2_NODETYPE_INODE:
 				if (verbose)
-					printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+					printf ("%8s Inode      node at 0x%08zx, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
 							je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize),
@@ -775,14 +775,14 @@ void create_summed_image(int inp_size)
 
 				crc = crc32 (0, node, sizeof (struct jffs2_raw_inode) - 8);
 				if (crc != je32_to_cpu (node->i.node_crc)) {
-					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.node_crc), crc);
+					printf ("Wrong node_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.node_crc), crc);
 					p += PAD(je32_to_cpu (node->i.totlen));
 					continue;
 				}
 
 				crc = crc32(0, p + sizeof (struct jffs2_raw_inode), je32_to_cpu(node->i.csize));
 				if (crc != je32_to_cpu(node->i.data_crc)) {
-					printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.data_crc), crc);
+					printf ("Wrong data_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.data_crc), crc);
 					p += PAD(je32_to_cpu (node->i.totlen));
 					continue;
 				}
@@ -797,7 +797,7 @@ void create_summed_image(int inp_size)
 				name [node->d.nsize] = 0x0;
 
 				if (verbose)
-					printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
+					printf ("%8s Dirent     node at 0x%08zx, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
 							je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino),
@@ -805,14 +805,14 @@ void create_summed_image(int inp_size)
 
 				crc = crc32 (0, node, sizeof (struct jffs2_raw_dirent) - 8);
 				if (crc != je32_to_cpu (node->d.node_crc)) {
-					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.node_crc), crc);
+					printf ("Wrong node_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.node_crc), crc);
 					p += PAD(je32_to_cpu (node->d.totlen));
 					continue;
 				}
 
 				crc = crc32(0, p + sizeof (struct jffs2_raw_dirent), node->d.nsize);
 				if (crc != je32_to_cpu(node->d.name_crc)) {
-					printf ("Wrong name_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.name_crc), crc);
+					printf ("Wrong name_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.name_crc), crc);
 					p += PAD(je32_to_cpu (node->d.totlen));
 					continue;
 				}
@@ -826,14 +826,14 @@ void create_summed_image(int inp_size)
 				if (je32_to_cpu(node->x.node_crc) == 0xffffffff)
 					obsolete = 1;
 				if (verbose)
-					printf("%8s Xdatum     node at 0x%08x, totlen 0x%08x, "
+					printf("%8s Xdatum     node at 0x%08zx, totlen 0x%08x, "
 							"#xid  %5u, version %5u\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->x.totlen),
 							je32_to_cpu(node->x.xid), je32_to_cpu(node->x.version));
 				crc = crc32(0, node, sizeof (struct jffs2_raw_xattr) - 4);
 				if (crc != je32_to_cpu(node->x.node_crc)) {
-					printf("Wrong node_crc at 0x%08x, 0x%08x instead of 0x%08x\n",
+					printf("Wrong node_crc at 0x%08zx, 0x%08x instead of 0x%08x\n",
 							p - file_buffer, je32_to_cpu(node->x.node_crc), crc);
 					p += PAD(je32_to_cpu (node->x.totlen));
 					continue;
@@ -841,7 +841,7 @@ void create_summed_image(int inp_size)
 				length = node->x.name_len + 1 + je16_to_cpu(node->x.value_len);
 				crc = crc32(0, node->x.data, length);
 				if (crc != je32_to_cpu(node->x.data_crc)) {
-					printf("Wrong data_crc at 0x%08x, 0x%08x instead of 0x%08x\n",
+					printf("Wrong data_crc at 0x%08zx, 0x%08x instead of 0x%08x\n",
 							p - file_buffer, je32_to_cpu(node->x.data_crc), crc);
 					p += PAD(je32_to_cpu (node->x.totlen));
 					continue;
@@ -855,14 +855,14 @@ void create_summed_image(int inp_size)
 				if (je32_to_cpu(node->r.node_crc) == 0xffffffff)
 					obsolete = 1;
 				if (verbose)
-					printf("%8s Xref       node at 0x%08x, totlen 0x%08x, "
+					printf("%8s Xref       node at 0x%08zx, totlen 0x%08x, "
 							"#ino  %5u, xid     %5u\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu(node->r.totlen),
 							je32_to_cpu(node->r.ino), je32_to_cpu(node->r.xid));
 				crc = crc32(0, node, sizeof (struct jffs2_raw_xref) - 4);
 				if (crc != je32_to_cpu(node->r.node_crc)) {
-					printf("Wrong node_crc at 0x%08x, 0x%08x instead of 0x%08x\n",
+					printf("Wrong node_crc at 0x%08zx, 0x%08x instead of 0x%08x\n",
 							p - file_buffer, je32_to_cpu(node->r.node_crc), crc);
 					p += PAD(je32_to_cpu (node->r.totlen));
 					continue;
@@ -874,7 +874,7 @@ void create_summed_image(int inp_size)
 
 			case JFFS2_NODETYPE_CLEANMARKER:
 				if (verbose) {
-					printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Cleanmarker     at 0x%08zx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
@@ -893,7 +893,7 @@ void create_summed_image(int inp_size)
 
 			case JFFS2_NODETYPE_PADDING:
 				if (verbose) {
-					printf ("%8s Padding    node at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Padding    node at 0x%08zx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
@@ -906,7 +906,7 @@ void create_summed_image(int inp_size)
 
 			default:
 				if (verbose) {
-					printf ("%8s Unknown    node at 0x%08x, totlen 0x%08x\n",
+					printf ("%8s Unknown    node at 0x%08zx, totlen 0x%08x\n",
 							obsolete ? "Obsolete" : "",
 							p - file_buffer, je32_to_cpu (node->u.totlen));
 				}
-- 
1.7.0.4
