Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D57UI-0006v1-Km
	for linux-mtd@lists.infradead.org; Sat, 26 Feb 2005 14:20:27 -0500
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id A402A22C5A
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Feb 2005 22:19:53 +0300 (MSK)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Sat, 26 Feb 2005 22:19:53 +0300
Message-Id: <1109445593.13512.1.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [BUGFIX] JFFS2 NOR problem
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've detected major JFFS2 bug and have attached the fix. The bug seems
to be NOR-only. I believe everybody who uses JFFS2 on top of NOR flash
should have this bug fixed.

The brief problem description:

JFFS2 clears the JFFS2_SB_FLAG_MOUNTING (c-flags) superblock flag after
it has done the 1st filesystem build pass. But it still has non NULL
ic->scan_dents pointers which are actually assigned NULL at the very end
of the file system build procedure. Next FS build passes call the
jffs2_mark_node_obsolete() function which, in turn, utilizes the
jffs2_raw_ref_to_ic() function which *requires* ic->scan_dents = NULL.

This might cause infinite loops and oopses.

I think it is safe to clear the JFFS2_SB_FLAG_MOUNTING flag at the end
of JFFS2 filesystem build routine. Comments?

P.S. Possibly, the patch will fix Konstantin Kletschke's and Craig A.
Vanderborgh's problems. Guys, please try.



--- build.c     2005-02-26 22:08:17.503657749 +0300
+++ build.c_fixed       2005-02-26 22:07:55.806278357 +0300
@@ -116,7 +116,6 @@
                        cond_resched();
                }
        }
-       c->flags &= ~JFFS2_SB_FLAG_MOUNTING;

        D1(printk(KERN_DEBUG "Pass 1 complete\n"));

@@ -164,6 +163,8 @@
                ic->scan_dents = NULL;
                cond_resched();
        }
+       c->flags &= ~JFFS2_SB_FLAG_MOUNTING;
+
        D1(printk(KERN_DEBUG "Pass 3 complete\n"));
        D2(jffs2_dump_block_lists(c));


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
