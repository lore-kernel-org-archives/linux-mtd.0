Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxDiX-0003y3-Rf
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2004 19:50:15 -0400
Date: Tue, 17 Aug 2004 16:50:10 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org, viro@ftp.uk.linux.org
Message-ID: <20040817235010.GA18014@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: yoann@prelude-ids.org, linux-kernel@vger.kernel.org
Subject: [PATCH] JFFS2 mount options discarded
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yoann Vandoorselaere noticed an attempt to mount a JFFS2 filesystem
read-only mounts writeable instead.  I believe the fix is:

--- linux-2.6.8.1-orig/fs/jffs2/super.c	2004-08-15 11:46:43.000000000 -0700
+++ linux-2.6.8.1-jffs2-mount-fix/fs/jffs2/super.c	2004-08-17 15:45:17.935379784 -0700
@@ -130,7 +130,7 @@
 		  mtd->index, mtd->name));
 
 	sb->s_op = &jffs2_super_operations;
-	sb->s_flags |= MS_NOATIME;
+	sb->s_flags = flags | MS_NOATIME;
 
 	ret = jffs2_do_fill_super(sb, data, (flags&MS_VERBOSE)?1:0);
 

Clue me in if I'm off-base, thanks,

-- 
Todd Poynor
MontaVista Software
