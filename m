Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYHvs-0006Rw-OV
	for linux-mtd@lists.infradead.org; Tue, 04 Aug 2009 11:11:57 +0000
Message-ID: <4A781773.6030200@users.sourceforge.net>
Date: Tue, 04 Aug 2009 13:11:47 +0200
From: =?UTF-8?B?QW5kZXJzIEdyYWZzdHLDtm0=?=
 <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] [JFFS2] Fix return value from jffs2_do_readpage_nolock()
References: <4A76FAFE.6050906@users.sourceforge.net>
In-Reply-To: <4A76FAFE.6050906@users.sourceforge.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[JFFS2] Fix return value from jffs2_do_readpage_nolock()

This fixes "kernel BUG at fs/jffs2/file.c:251!".
This pseudocode hopefully illustrates the scenario that triggers it:

jffs2_write_begin {
     jffs2_do_readpage_nolock {
         jffs2_read_inode_range {
             jffs2_read_dnode {
                 Data CRC 33c102e9 != calculated CRC 0ef77e7b for node at 005d42e4
                 return -EIO;
             }
         }
         ClearPageUptodate(pg);
         return 0;
     }
}

jffs2_write_end {
     BUG_ON(!PageUptodate(pg));
}

Signed-off-by: Anders Grafström <grfstrm@users.sourceforge.net>
---

Looks like the previous post got mangled so here's another try.

 fs/jffs2/file.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 5edc2bf..23c9475 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -99,7 +99,7 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 	kunmap(pg);

 	D2(printk(KERN_DEBUG "readpage finished\n"));
-	return 0;
+	return ret;
 }

 int jffs2_do_readpage_unlock(struct inode *inode, struct page *pg)
