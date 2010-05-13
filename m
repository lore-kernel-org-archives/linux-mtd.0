Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCOHo-00015y-Aq
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 02:36:33 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Wed, 12 May 2010 19:24:30 -0700
Subject: [PATCH v5 3/3] mtd-utils: clean up compiler warnings
Message-Id: <4b38adf0a5ec5a3a1c7ef85f64585cfee66c1921@localhost.localdomain>
References: <cd4bcbb843643dc463d2a2853766bcf57c23f546@localhost.localdomain>
In-Reply-To: <cd4bcbb843643dc463d2a2853766bcf57c23f546@localhost.localdomain>
To: <dedekind1@gmail.com>, <saeed.bishara@gmail.com>, <jwboyer@gmail.com>
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

Seen on gcc 4.2.4 IA32:

flashcp.c:255:2: warning: #warning "Check for smaller erase regions"
nftl_format.c:214: warning: assignment discards qualifiers from pointer target type
nftl_format.c:219: warning: assignment discards qualifiers from pointer target type
serve_image.c:129: warning: format ‘%ld’ expects type ‘long int’, but argument 3 has type ‘__off64_t’
fec.c:120: warning: initialization discards qualifiers from pointer target type
<many more of these>
fec.c:417: warning: passing argument 2 of ‘my_malloc’ discards qualifiers from pointer target type
<many more of these>
recv_image.c:164: warning: comparison of unsigned expression < 0 is always false
recv_image.c:59: warning: ‘start_seq’ may be used uninitialized in this function
recv_image.c:56: warning: ‘fec’ may be used uninitialized in this function
recv_image.c:49: warning: ‘image_crc’ may be used uninitialized in this function
sumtool.c:112: warning: initialization discards qualifiers from pointer target type
sumtool.c:115: warning: initialization discards qualifiers from pointer target type
mkfs.ubifs.c:1171: warning: format ‘%lu’ expects type ‘long unsigned int’, but argument 4 has type ‘ino_t’
mkfs.ubifs.c:1171: warning: format ‘%lu’ expects type ‘long unsigned int’, but argument 6 has type ‘ino_t’

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 fec.c                   |    6 +++---
 mkfs.ubifs/mkfs.ubifs.c |    4 ++--
 nftl_format.c           |    3 ++-
 recv_image.c            |    8 ++++----
 serve_image.c           |    5 +++--
 sumtool.c               |    4 ++--
 6 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/fec.c b/fec.c
index 6d9020f..bee371e 100644
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
+    const char *Pp = allPp[GF_BITS] ;
 
     mask = 1;	/* x ** 0 = 1 */
     gf_exp[GF_BITS] = 0; /* will be updated at the end of the 1st loop */
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index e4b4e3c..4d1971c 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -1168,8 +1168,8 @@ static int add_dent_node(ino_t dir_inum, const char *name, ino_t inum,
 	char *kname;
 	int len;
 
-	dbg_msg(3, "%s ino %lu type %u dir ino %lu", name, inum,
-		(unsigned)type, dir_inum);
+	dbg_msg(3, "%s ino %lu type %u dir ino %lu", name, (unsigned long)inum,
+		(unsigned)type, (unsigned long)dir_inum);
 	memset(dent, 0, UBIFS_DENT_NODE_SZ);
 
 	dname.name = (void *)name;
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
index d65aa2a..6ff0bce 100644
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
diff --git a/serve_image.c b/serve_image.c
index adb4869..292e7f6 100644
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
index 6bb7168..9a2029f 100644
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
-- 
1.6.5
