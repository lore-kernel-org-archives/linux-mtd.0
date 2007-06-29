Subject: Re: jffs2_mark_node_obsolete race w.r.t erase_free_sem?
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1183101617.20673.49.camel@gentoo-jocke.transmode.se>
References: <005601c7b4c0$52207d90$0e67a8c0@Jocke>
	<1183055402.1170.186.camel@pmac.infradead.org>
	<1183101617.20673.49.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Fri, 29 Jun 2007 08:53:15 +0100
Message-Id: <1183103595.1170.215.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'Linux MTD mailing list' <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-06-29 at 09:20 +0200, Joakim Tjernlund wrote:
> Didn't manage to trig this printout, but earlier I managed to trig a
> WARN_ON(1) added next to the "argh. node added in wrong place" message:
> 
> Node totlen on flash (0x00000006) != totlen from node ref (0x00000048)
> argh. node added in wrong place

Hm. It is always accompanied by the totlen discrepancy message? 
I committed something slightly more informative than just a WARN_ON()
last night -- can you reproduce with that?
http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=66bfaeaa90432a585d7e9e70605ee4df3ede9890

And with this too...

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 9c3a3bb..da37746 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -656,6 +656,7 @@ void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 	}
 	if (PAD(je32_to_cpu(n.totlen)) != PAD(freed_len)) {
 		printk(KERN_WARNING "Node totlen on flash (0x%08x) != totlen from node ref (0x%08x)\n", je32_to_cpu(n.totlen), freed_len);
+		printk(KERN_WARNING "for node at 0x%08x(%d)\n", ref_offset(ref), ref_flags(ref));
 		goto out_erase_sem;
 	}
 	if (!(je16_to_cpu(n.nodetype) & JFFS2_NODE_ACCURATE)) {

If you can reproduce with CONFIG_JFFS2_FS_DEBUG=1 that would be massively useful.

-- 
dwmw2
