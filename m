Received: from nz-out-0102.google.com ([64.233.162.196])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GSaSg-0000br-7O
	for linux-mtd@lists.infradead.org; Wed, 27 Sep 2006 15:32:34 +0100
Received: by nz-out-0102.google.com with SMTP id s1so76482nze
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Sep 2006 07:31:30 -0700 (PDT)
Message-ID: <305035a40609270731n150513b4obe4249b461a3d1bc@mail.gmail.com>
Date: Wed, 27 Sep 2006 16:31:30 +0200
From: "Gregory CLEMENT" <gclement00@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Exporting jffs2 by nfs with kernel 2.6
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

On 2.4.18 we managed to export a jffs2 filesystem by nfs.
Now on 2.6.16 we can't.
I found 2 problems for it:
First, changed was made in nfs, and now they test if
s_export_op is not a void pointer. By dding a pointer on
this structure (even this structure is void) makes nfs happy.
If the structure is void nfs use generic function, so for this part
I think it's ok

Second, nfs need to identify the filesystem to export. It is done
either by the device of the filesystem or by a "fsid". I didfn't see any
filesystem use a "fsid" and I don't know how to use it. So identification
is made if FS_REQUIRES_DEV is set. The problem was in kernel 2.5.7,
this flag was removed because "We never really used the block device anyway".
Do you mind setting this flag again? Or have you a better idea?

I joined my patch which make jffs2 exportable by nfs:


PS: I sent this mail 3 weeks ago to jffs-dev@axis.com before notice
that now jffs2 is discussed on this mailing-list.


Index: linux-2.6.16/fs/jffs2/super.c
===================================================================
diff -u -r1.1 -r1.2
--- linux-2.6.16/fs/jffs2/super.c	6 Jun 2006 16:18:24 -0000	1.1
+++ linux-2.6.16/fs/jffs2/super.c	6 Sep 2006 14:14:37 -0000	1.2
@@ -80,6 +80,10 @@
 	.sync_fs =	jffs2_sync_fs,
 };

+/* Just declare a void structure as A NULL value implies the default */
+static struct export_operations jffs2_export_ops;
+
+
 static int jffs2_sb_compare(struct super_block *sb, void *data)
 {
 	struct jffs2_sb_info *p = data;
@@ -150,6 +154,7 @@
 	spin_lock_init(&c->inocache_lock);

 	sb->s_op = &jffs2_super_operations;
+	sb->s_export_op = &jffs2_export_ops;
 	sb->s_flags = flags | MS_NOATIME;

 	ret = jffs2_do_fill_super(sb, data, (flags&MS_VERBOSE)?1:0);
@@ -314,6 +319,7 @@
 	.name =		"jffs2",
 	.get_sb =	jffs2_get_sb,
 	.kill_sb =	jffs2_kill_sb,
+	.fs_flags = FS_REQUIRES_DEV,
 };

 static int __init init_jffs2_fs(void)



-- 
Gregory CLEMENT
Adeneo
