Received: from phobos.hpl.hp.com ([192.6.19.124])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sVpN-0003K0-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2002 22:28:29 +0100
Date: Tue, 2 Apr 2002 13:28:19 -0800
From: Christopher Hoover <ch@hpl.hp.com>
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org
Cc: ch@hpl.hp.com, dwmw2@redhat.com
Subject: 2.5.7{,-rmk1}: jffs2 on root patch
Message-ID: <20020402132818.A10402@friction.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

2.5.7-rmk1 (and apparently any 2.5.7 kernel, hence the cross-posting)
requires the following patch, if you wish to use a jffs2 file system
as your root.  Without the patch, mount_block_root() won't attempt to
use jffs2.

-ch

mailto:ch@murgatroid.com
mailto:ch@hpl.hp.com

--- linux-2.5.7-rmk1/fs/jffs2/super.c	Mon Apr  1 13:25:41 2002
+++ linux-2.5.7-rmk1-ch1/fs/jffs2/super.c	Tue Apr  2 13:20:01 2002
@@ -300,7 +300,8 @@ static struct file_system_type jffs2_fs_
 	owner:		THIS_MODULE,
 	name:		"jffs2",
 	get_sb:		jffs2_get_sb,
-	kill_sb:	generic_shutdown_super
+	kill_sb:	generic_shutdown_super,
+	fs_flags:	FS_REQUIRES_DEV,
 };
 
 
