Received: from gv-out-0910.google.com ([216.239.58.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kg1TN-0005rK-SA
	for linux-mtd@lists.infradead.org; Wed, 17 Sep 2008 18:09:55 +0000
Received: by gv-out-0910.google.com with SMTP id n40so1749035gve.5
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Sep 2008 11:09:52 -0700 (PDT)
Date: Wed, 17 Sep 2008 22:09:41 +0400
From: Alexander Beregalov <a.beregalov@gmail.com>
To: dedekind@infradead.org, ext-adrian.hunter@nokia.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: fix printk format warnings
Message-ID: <20080917180941.GB29966@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fs/ubifs/dir.c:428: warning: format '%llu' expects type 'long long
unsigned int', but argument 5 has type 'long unsigned int'

fs/ubifs/debug.c:541: warning: format '%llu' expects type 'long long
unsigned int', but argument 2 has type 'long unsigned int'


Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 fs/ubifs/debug.c |    2 +-
 fs/ubifs/dir.c   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index b9cb774..d7f7645 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -538,7 +538,7 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 		printk(KERN_DEBUG "\t%d orphan inode numbers:\n", n);
 		for (i = 0; i < n; i++)
 			printk(KERN_DEBUG "\t  ino %llu\n",
-			       le64_to_cpu(orph->inos[i]));
+			       (unsigned long long)le64_to_cpu(orph->inos[i]));
 		break;
 	}
 	default:
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 4884f06..8561890 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -426,7 +426,7 @@ static int ubifs_readdir(struct file *file, void *dirent, filldir_t filldir)
 
 	while (1) {
 		dbg_gen("feed '%s', ino %llu, new f_pos %#x",
-			dent->name, le64_to_cpu(dent->inum),
+			dent->name, (unsigned long long)le64_to_cpu(dent->inum),
 			key_hash_flash(c, &dent->key));
 		ubifs_assert(dent->ch.sqnum > ubifs_inode(dir)->creat_sqnum);
 
