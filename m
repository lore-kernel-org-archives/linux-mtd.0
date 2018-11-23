Received: from mail-eopbgr30082.outbound.protection.outlook.com ([40.107.3.82]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gQAxn-00020d-Jc
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2018 12:53:41 +0000
From: Kim Woelders <kw@thrane.eu>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Kim Woelders <kw@thrane.eu>
Subject: [PATCH] jffs2: Fix garbage collection when jffs2_read_dnode() returns
 EIO
Date: Fri, 23 Nov 2018 12:53:23 +0000
Message-ID: <20181123125313.30041-1-kw@thrane.eu>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am by no means certain that this is the correct fix for the problem
at hand but it seems to work for us.

/Kim

---

For unknown reasons a jffs2 partition had entered a state where it would
not function properly (e.g. writing new files would abort) and give log
messages like:
  jffs2: Data CRC 178b4d59 !=3D calculated CRC 22902b28 for node at 011425d=
0
  jffs2: read_cache_page() returned error: -5
  jffs2: Error garbage collecting node at 01141f88!

The file system was effectively unusable until the file containing the
offending node(s) was deleted.

The "Data CRC" message is issued by jffs2_read_dnode() which returns
-EIO (=3D -5).
The problem in our case first manifests itself during garbage collection
after mount where the call tree in reverse order is:
                  jffs2_read_dnode() -> EIO
                jffs2_read_inode_range() -> EIO
              jffs2_do_readpage_nolock() -> EIO
            jffs2_do_readpage_unlock() -> EIO
          read_cache_page() -> EIO
        jffs2_gc_fetch_page() -> EIO
      jffs2_garbage_collect_dnode() -> EIO
    jffs2_garbage_collect_live() -> EIO
  jffs2_garbage_collect_pass() -> ENOSPC
jffs2_garbage_collect_thread()

The garbage collection thread is then aborted:
  jffs2: No space for garbage collection. Aborting GC thread

This commit changes the behavior so that if jffs2_garbage_collect_live()
in jffs2_garbage_collect_pass() returns EIO, we obsolete the offending
node.
During subsequent GC passes this will clean up the file system to become
usable.

Signed-off-by: Kim Woelders <kw@thrane.eu>

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 9ed0f26cf023..25c075b3c189 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -470,7 +470,10 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c=
)
 		/* Eep. This really should never happen. GC is broken */
 		pr_err("Error garbage collecting node at %08x!\n",
 		       ref_offset(jeb->gc_node));
-		ret =3D -ENOSPC;
+		if (ret =3D=3D -EIO)
+			jffs2_mark_node_obsolete(c, raw);
+		else
+			ret =3D -ENOSPC;
 	}
  release_sem:
 	mutex_unlock(&c->alloc_sem);
--=20
2.17.2
