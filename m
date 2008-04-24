Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jp8a0-00027u-QE
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 21:02:09 +0000
Message-ID: <4810F549.6030107@users.sourceforge.net>
Date: Thu, 24 Apr 2008 23:02:01 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
References: <4807B552.7090501@users.sourceforge.net>	<Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>	<20080418163536.GD31520@shareable.org>	<6934efce0804181054y5887c6b4kc1129deec2d3a2eb@mail.gmail.com>	<48091C7A.1070709@users.sourceforge.net>	<012501c8a1fe$4a5308e0$def91aa0$@Tjernlund@transmode.se>	<4809F7EC.9010808@users.sourceforge.net>
	<Pine.LNX.4.64.0804241524310.16953@pentafluge.infradead.org>
In-Reply-To: <Pine.LNX.4.64.0804241524310.16953@pentafluge.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexey Korolev wrote:
> Could you please try this patch on your platform. 
> It should solve the issue. 
> As I said before we also have a case which reproduces the issue.

So I'm not the only one seeing it. That's 'good' to know.

> After applying it the issue is not seen on test items which usually
> fails. (However to prove that it is Ok
> we need to execute whole bunch. It will be completed on next day)

Works a lot better but it has failed one time so far with the patch applied.

To answer Jared's question earlier, I've seen the problem with 2.6.18 as well
but it was very rare, a couple of months in between sightings.
With 2.6.23 it got frequent and even worse with 2.6.25.
I'm overwriting a file, size about 6MB, to a file system that is filled to the brim.
It triggers around 25-30 erases and around 10 of those usually fail.

So the problem is probably not the number of suspends but more likely a latency issue?

This patch used to work around the issue but it's not enough any more:

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 5e2719c..be8fc87 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -18,6 +18,9 @@
  #include <linux/pagemap.h>
  #include "nodelist.h"

+/* max. erase failures before we mark a block bad */
+#define MAX_ERASE_FAILURES 	2
+
  struct erase_priv_struct {
  	struct jffs2_eraseblock *jeb;
  	struct jffs2_sb_info *c;
@@ -190,8 +193,23 @@ static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock
  			mutex_unlock(&c->erase_free_sem);
  			return;
  		}
+	} else if (c->mtd->type != MTD_NANDFLASH) {
+		if( ++jeb->bad_count < MAX_ERASE_FAILURES) {
+			/* We'd like to give this block another try. */
+			printk(KERN_ERR "Retrying erase at 0x%08x\n", jeb->offset);
+			mutex_lock(&c->erase_free_sem);
+			spin_lock(&c->erase_completion_lock);
+			list_move(&jeb->list, &c->erase_pending_list);
+			c->erasing_size -= c->sector_size;
+			c->dirty_size += c->sector_size;
+			jeb->dirty_size = c->sector_size;
+			spin_unlock(&c->erase_completion_lock);
+			mutex_unlock(&c->erase_free_sem);
+			return;
+		}
  	}

+	printk(KERN_ERR "Failed erase at 0x%08x\n", jeb->offset);
  	mutex_lock(&c->erase_free_sem);
  	spin_lock(&c->erase_completion_lock);
  	c->erasing_size -= c->sector_size;
@@ -454,6 +472,7 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
  	}
  	/* Everything else got zeroed before the erase */
  	jeb->free_size = c->sector_size;
+	jeb->bad_count = 0;

  	mutex_lock(&c->erase_free_sem);
  	spin_lock(&c->erase_completion_lock);
