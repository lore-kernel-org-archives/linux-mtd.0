Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1j7x-0000nb-DQ
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 17:10:37 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id F1BDE1B4063
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 17:10:31 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] sumtool/libfec: convert "()" to "(void)" in func defs
Date: Fri,  1 Oct 2010 13:11:28 -0400
Message-Id: <1285953088-19593-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285953088-19593-1-git-send-email-vapier@gentoo.org>
References: <1285953088-19593-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since these functions take no parameters, declare them as such.  The
subtle difference here is that gcc allows (without warning) people to
accidentally call funcs declared with "()" with arguments.  Using void
makes sure that gcc will reject such typos at compile time.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 lib/libfec.c |    6 +++---
 sumtool.c    |   20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/lib/libfec.c b/lib/libfec.c
index b19ed6e..c89a180 100644
--- a/lib/libfec.c
+++ b/lib/libfec.c
@@ -185,7 +185,7 @@ static gf gf_mul_table[GF_SIZE + 1][GF_SIZE + 1];
 #define GF_ADDMULC(dst, x) dst ^= __gf_mulc_[x]
 
 static void
-init_mul_table()
+init_mul_table(void)
 {
     int i, j;
     for (i=0; i< GF_SIZE+1; i++)
@@ -603,7 +603,7 @@ invert_vdm(gf *src, int k)
 
 static int fec_initialized = 0 ;
 static void
-init_fec()
+init_fec(void)
 {
     TICK(ticks[0]);
     generate_gf();
@@ -882,7 +882,7 @@ fec_decode(struct fec_parms *code, gf *pkt[], int index[], int sz)
 
 #if (TEST || DEBUG)
 void
-test_gf()
+test_gf(void)
 {
     int i ;
     /*
diff --git a/sumtool.c b/sumtool.c
index 51e4173..886b545 100644
--- a/sumtool.c
+++ b/sumtool.c
@@ -122,7 +122,7 @@ static unsigned char ffbuf[16] = {
 
 static void full_write(void *target_buff, const void *buf, int len);
 
-void setup_cleanmarker()
+void setup_cleanmarker(void)
 {
 	cleanmarker.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
 	cleanmarker.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
@@ -226,24 +226,24 @@ void process_options (int argc, char **argv)
 }
 
 
-void init_buffers()
+void init_buffers(void)
 {
 	data_buffer = xmalloc(erase_block_size);
 	file_buffer = xmalloc(erase_block_size);
 }
 
-void init_sumlist()
+void init_sumlist(void)
 {
 	sum_collected = xzalloc(sizeof(*sum_collected));
 }
 
-void clean_buffers()
+void clean_buffers(void)
 {
 	free(data_buffer);
 	free(file_buffer);
 }
 
-void clean_sumlist()
+void clean_sumlist(void)
 {
 	union jffs2_sum_mem *temp;
 
@@ -263,7 +263,7 @@ void clean_sumlist()
 	}
 }
 
-int load_next_block()
+int load_next_block(void)
 {
 	int ret;
 	ret = read(in_fd, file_buffer, erase_block_size);
@@ -274,7 +274,7 @@ int load_next_block()
 	return ret;
 }
 
-void write_buff_to_file()
+void write_buff_to_file(void)
 {
 	int ret;
 	int len = data_ofs;
@@ -298,7 +298,7 @@ void write_buff_to_file()
 	data_ofs = 0;
 }
 
-void dump_sum_records()
+void dump_sum_records(void)
 {
 
 	struct jffs2_raw_summary isum;
@@ -447,7 +447,7 @@ static void pad(int req)
 	}
 }
 
-static inline void padword()
+static inline void padword(void)
 {
 	if (data_ofs % 4)
 		full_write(data_buffer + data_ofs, ffbuf, 4 - (data_ofs % 4));
@@ -474,7 +474,7 @@ static inline void pad_block_if_less_than(int req,int plus)
 	}
 }
 
-void flush_buffers()
+void flush_buffers(void)
 {
 
 	if ((add_cleanmarkers == 1) && (found_cleanmarkers == 1)) { /* CLEANMARKER */
-- 
1.7.3.1
