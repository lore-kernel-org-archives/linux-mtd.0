Date: Thu, 17 Feb 2005 18:26:26 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "Bobzin,Heiko" <h.bobzin@icp-ag.de>
In-Reply-To: <256713DBAA00D911828C00065BF75DEB025F72@icpmail-hh.icp-intern.de>
Message-ID: <Pine.LNX.4.58.0502171826130.30538@phoenix.infradead.org>
References: <256713DBAA00D911828C00065BF75DEB025F72@icpmail-hh.icp-intern.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Data corrupted
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Heiko,

please try this patch (fs/jffs2/nodemgmt.c).

--- nodemgmt.c  2005-01-25 23:11:11.000000000 +0300
+++ nodemgmt-fixed.c    2005-02-17 21:22:30.608220411 +0300
@@ -483,7 +483,7 @@

        if (jeb == c->nextblock) {
                D2(printk(KERN_DEBUG "Not moving nextblock 0x%08x to 
dirty/erase_pending list\n", jeb->offset));
-       } else if (!jeb->used_size && !jeb->unchecked_size) {
+       } else if ((jeb->used_size + jeb->unchecked_size) == 
PAD(c->cleanmarker_size)) {
                if (jeb == c->gcblock) {
                        D1(printk(KERN_DEBUG "gcblock at 0x%08x completely 
dirtied. Clearing gcblock...\n", jeb->offset));
                        c->gcblock = NULL;

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
