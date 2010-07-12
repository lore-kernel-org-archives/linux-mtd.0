Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OY9AB-0008Uw-53
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2010 02:54:35 +0000
Received: by iwn40 with SMTP id 40so4815502iwn.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Jul 2010 19:54:34 -0700 (PDT)
Message-ID: <4C3A83E7.3040807@gmail.com>
Date: Sun, 11 Jul 2010 21:54:31 -0500
From: Neal B <nealb001@gmail.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com
Subject: [PATCH 6/6] Mtd: Removed legacy dbg function.
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

This is dependent on [patch 4/6 and patch 5/6]
 From 4840c4e191b3a507784298e8e3a5131b10901241 Mon Sep 17 00:00:00 2001
From: Neal Buckendahl <nealb001@gmail.com>
Date: Sun, 11 Jul 2010 18:42:39 -0500
Subject: [PATCH 6/6] Mtd: Removed legacy dbg function which is no longer 
needed.
      Signed-off-by: Neal Buckendahl <nealb001@gmail.com>

---
  drivers/mtd/cmdlinepart.c |   20 --------------------
  1 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 2423ade..d20258c 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -32,13 +32,6 @@
  /* error message prefix */
  #define ERRP "mtd: "

-/* debug macro */
-#if 0
-#define dbg(x) do { printk("DEBUG-CMDLINE-PART: "); printk x; } while (0)
-#else
-#define dbg(x)
-#endif
-

  /* special size referring to all the remaining space in a partition */
  #define SIZE_REMAINING UINT_MAX
@@ -175,13 +168,6 @@ static struct mtd_partition * newpart(char *s,
  	parts[this_part].name = extra_mem;
  	extra_mem += name_len + 1;

-	dbg(("partition %d: name <%s>, offset %llx, size %llx, mask flags %x\n",
-	     this_part,
-	     parts[this_part].name,
-	     parts[this_part].offset,
-	     parts[this_part].size,
-	     parts[this_part].mask_flags));
-
  	/* return (updated) pointer to extra_mem memory */
  	if (extra_mem_ptr)
  	  *extra_mem_ptr = extra_mem;
@@ -215,8 +201,6 @@ static int mtdpart_setup_real(char *s)
  		}
  		mtd_id_len = p - mtd_id;

-		dbg(("parsing <%s>\n", p+1));
-
  		/*
  		 * parse one mtd. have it reserve memory for the
  		 * struct cmdline_mtd_partition and the mtd-id string.
@@ -253,10 +237,6 @@ static int mtdpart_setup_real(char *s)
  		this_mtd->next = partitions;
  		partitions = this_mtd;

-		dbg(("mtdid=<%s> num_parts=<%d>\n",
-		     this_mtd->mtd_id, this_mtd->num_parts));
-
-
  		/* EOS - we're done */
  		if (*s == 0)
  			break;
-- 
1.7.1
