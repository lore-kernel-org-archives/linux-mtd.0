From: "Kyungmin Park" <kmpark@infradead.org>
To: <joakim.tjernlund@transmode.se>
References: <004601c86fa2$201a78d0$1fa9580a@swcenter.sec.samsung.co.kr>
	<1203065237.5419.74.camel@gentoo-jocke.transmode.se>
Subject: RE: Abnormal behavior with JFFS2 on latest kernel
Date: Fri, 15 Feb 2008 17:56:56 +0900
Message-ID: <005001c86fb0$b9bc6d00$1fa9580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <1203065237.5419.74.camel@gentoo-jocke.transmode.se>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > I got following messages.
> > INFO: task pdflush:56 blocked for more than 120 seconds.
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> >
> > What are the meanings?
> > Too mush running GC in JFFS2 or others?
> >
> > BR,
> > Kyungmin Park
> 
> It is probably erasing lots of blocks and that takes a while, minutes
> some times. I once sent a patch to address this but the patch is racy
> w.r.t module unload. Look in the archive after patches from me.
> 

You mean this one?
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index d1d4f27..b2e71c7 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -115,7 +115,7 @@ static inline void jffs2_refile_wbuf_blocks(struct jffs2_sb_

                D1(printk(KERN_DEBUG "Removing eraseblock at 0x%08x from erasabl
                list_del(this);
-               if ((jiffies + (n++)) & 127) {
+               if ((jiffies + (n++)) & 127 && !list_empty(&c->erasable_list)) {
                        /* Most of the time, we just erase it immediately. Other
                           spend ages scanning it on mount, etc. */
                        D1(printk(KERN_DEBUG "...and adding to erase_pending_lis

It's already applied, but it's same.

BR,
Kyungmin Park
