Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PI3g5-0000PQ-Qf
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2010 18:21:20 +0000
Received: by eyd9 with SMTP id 9so2998950eyd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Nov 2010 10:21:09 -0800 (PST)
Date: Mon, 15 Nov 2010 21:20:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] jffs2: typo in comment
Message-ID: <20101115182005.GA3941@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It says FB instead of FS (file system).

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
index f864005..0bc6a6c 100644
--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -144,4 +144,4 @@ struct jffs2_sb_info {
 	void *os_priv;
 };
 
-#endif /* _JFFS2_FB_SB */
+#endif /* _JFFS2_FS_SB */
