Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OY994-0006X4-DY
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2010 02:53:27 +0000
Received: by iwn40 with SMTP id 40so4814640iwn.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Jul 2010 19:53:25 -0700 (PDT)
Message-ID: <4C3A83A1.4000309@gmail.com>
Date: Sun, 11 Jul 2010 21:53:21 -0500
From: Neal B <nealb001@gmail.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com
Subject: [PATCH 5/6] Mtd: fixed tab/space related issues.
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: maximlevitsky@gmail.com, cascardo@holoscopio.com,
	linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>,
	linux-mtd@lists.infradead.org, jkosina@suse.cz,
	mohanlaljangir@gmail.com, rmk+kernel@arm.linux.org.uk, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is dependent on [patch 4/6]
 From c7a714a1a7dce6585e117835748517d0c7b48767 Mon Sep 17 00:00:00 2001
From: Neal Buckendahl <nealb001@gmail.com>
Date: Sun, 11 Jul 2010 18:37:30 -0500
Subject: [PATCH 5/6] Mtd: fixed tab/space related issues found by the 
checkpatch.pl tool
      Signed-off-by: Neal Buckendahl <nealb001@gmail.com>

---
  drivers/mtd/cmdlinepart.c |   52 
++++++++++++++++++++++----------------------
  1 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 38666bb..2423ade 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -34,7 +34,7 @@

  /* debug macro */
  #if 0
-#define dbg(x) do { printk("DEBUG-CMDLINE-PART: "); printk x; } while(0)
+#define dbg(x) do { printk("DEBUG-CMDLINE-PART: "); printk x; } while (0)
  #else
  #define dbg(x)
  #endif
@@ -67,11 +67,11 @@ static int cmdline_parsed = 0;
   * syntax has been verified ok.
   */
  static struct mtd_partition * newpart(char *s,
-                                      char **retptr,
-                                      int *num_parts,
-                                      int this_part,
-                                      unsigned char **extra_mem_ptr,
-                                      int extra_mem_size)
+					char **retptr,
+					int *num_parts,
+					int this_part,
+					unsigned char **extra_mem_ptr,
+					int extra_mem_size)
  {
  	struct mtd_partition *parts;
  	unsigned long size;
@@ -98,19 +98,19 @@ static struct mtd_partition * newpart(char *s,
  	/* fetch partition name and flags */
  	mask_flags = 0; /* this is going to be a regular partition */
  	delim = 0;
-        /* check for offset */
-        if (*s == '@') {
-                s++;
-                offset = memparse(s, &s);
-        }
-        /* now look for name */
+	/* check for offset */
+	if (*s == '@') {
+		s++;
+		offset = memparse(s, &s);
+	}
+	/* now look for name */
  	if (*s == '(')
  		delim = ')';

  	if (delim) {
  		char *p;

-	    	name = ++s;
+		name = ++s;
  		p = strchr(name, delim);
  		if (!p) {
  			printk(KERN_ERR ERRP "no closing %c found in partition name\n", delim);
@@ -119,24 +119,24 @@ static struct mtd_partition * newpart(char *s,
  		name_len = p - name;
  		s = p + 1;
  	} else {
-	    	name = NULL;
+		name = NULL;
  		name_len = 13; /* Partition_000 */
  	}

  	/* record name length for memory allocation later */
  	extra_mem_size += name_len + 1;

-        /* test for options */
-        if (strncmp(s, "ro", 2) == 0) {
+	/* test for options */
+	if (strncmp(s, "ro", 2) == 0) {
  		mask_flags |= MTD_WRITEABLE;
  		s += 2;
          }

-        /* if lk is found do NOT unlock the MTD partition*/
-        if (strncmp(s, "lk", 2) == 0) {
+	/* if lk is found do NOT unlock the MTD partition*/
+	if (strncmp(s, "lk", 2) == 0) {
  		mask_flags |= MTD_POWERUP_LOCK;
  		s += 2;
-        }
+	}

  	/* test if more partitions are following */
  	if (*s == ',') {
@@ -200,14 +200,14 @@ static int mtdpart_setup_real(char *s)
  {
  	cmdline_parsed = 1;

-	for( ; s != NULL; ) {
+	for ( ; s != NULL; ) {
  		struct cmdline_mtd_partition *this_mtd;
  		struct mtd_partition *parts;
-	    	int mtd_id_len;
+		int mtd_id_len;
  		int num_parts;
  		char *p, *mtd_id;

-	    	mtd_id = s;
+		mtd_id = s;
  		/* fetch <mtd-id> */
  		if (!(p = strchr(s, ':'))) {
  			printk(KERN_ERR ERRP "no mtd-id\n");
@@ -280,8 +280,8 @@ static int mtdpart_setup_real(char *s)
   * the first one in the chain if a NULL mtd_id is passed in.
   */
  static int parse_cmdline_partitions(struct mtd_info *master,
-                             struct mtd_partition **pparts,
-                             unsigned long origin)
+				    struct mtd_partition **pparts,
+				    unsigned long origin)
  {
  	unsigned long offset;
  	int i;
@@ -292,9 +292,9 @@ static int parse_cmdline_partitions(struct mtd_info 
*master,
  	if (!cmdline_parsed)
  		mtdpart_setup_real(cmdline);

-	for(part = partitions; part; part = part->next) {
+	for (part = partitions; part; part = part->next) {
  		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id))) {
-			for(i = 0, offset = 0; i < part->num_parts; i++) {
+			for (i = 0, offset = 0; i < part->num_parts; i++) {
  				if (part->parts[i].offset == OFFSET_CONTINUOUS)
  				  part->parts[i].offset = offset;
  				else
-- 
1.7.1
