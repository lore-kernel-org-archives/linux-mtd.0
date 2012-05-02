Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPSaB-00055m-Fg
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 05:58:36 +0000
Received: by lbbgg6 with SMTP id gg6so213296lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 22:58:33 -0700 (PDT)
Date: Wed, 2 May 2012 08:58:26 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd-www: FAQ: spelling fixes
Message-ID: <20120502085826.23b8cf5c@halley>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Few typos fixed.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
diff --git a/faq/jffs2.xml b/faq/jffs2.xml
index a08af7a..1b426d7 100644
--- a/faq/jffs2.xml
+++ b/faq/jffs2.xml
@@ -85,7 +85,7 @@ eraseblocks and write only in NAND page size chunks. Please, use the
 <P>
 Also please, do not forget to erase your flash before flashing the image. You
 may use the <CODE>flash_eraseall</CODE> utility for this. And it makes sense to
-make sure the erase functionality actually works my reading the erase MTD
+make sure the erase functionality actually works by reading the erased MTD
 device back and checking that only 0xFF bytes were read.
 </P>
 
@@ -210,7 +210,7 @@ write-buffer contained some data and was not yet synced before the unclean
 reboot happened. In them first and the third cases, you just lose the very
 last data you have written, in the second case you lose nothing. The wrong
 nodes will eventually be recycled by Garbage Collector and the massages will go
-(but they may leave quite long).
+(but they may live quite long).
 </P>
 
 <P>
@@ -301,7 +301,7 @@ the kernel command line to use it as a root filesystem
 <P>On <B>NOR FLASH</B> each write goes directly into the FLASH.</P>
 
 <P>
-On <B>NAND FLASHM</B> and <B>NOR ECC FLASH</B> we have a write-buffer for
+On <B>NAND FLASH</B> and <B>NOR ECC FLASH</B> we have a write-buffer for
 writing only full pages to the chips. There could be a loss of data, when the
 write-buffer is not flushed before power down. There are some mechanisms to
 ensure, that the write-buffer is flushed. You can force the flush of the
diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index 8dafead..6476ce0 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -557,7 +557,7 @@ fully erased, which removes any problematic non-<code>0xFF</code> data from
 their OOB areas.</p>
 
 <p>Of course it is not possible to re-erase individual NAND pages, and entire
-PEBs are erised.  UBIFS performs this procedure by reading the useful
+PEBs are erased.  UBIFS performs this procedure by reading the useful
 (non 0xFF'ed) contents of LEBs and then invoking the
 <a href="ubi.html#L_lebchange">atomic LEB change</a> UBI operation. Obviously,
 this means that UBIFS has to read and write a lot of LEBs which takes
