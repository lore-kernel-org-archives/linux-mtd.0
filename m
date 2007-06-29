Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I4AmC-0004HT-HS
	for linux-mtd@lists.infradead.org; Fri, 29 Jun 2007 03:20:22 -0400
Subject: Re: jffs2_mark_node_obsolete race w.r.t erase_free_sem?
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1183055402.1170.186.camel@pmac.infradead.org>
References: <005601c7b4c0$52207d90$0e67a8c0@Jocke>
	<1183055402.1170.186.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 29 Jun 2007 09:20:17 +0200
Message-Id: <1183101617.20673.49.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: 'Linux MTD mailing list' <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-06-28 at 19:30 +0100, David Woodhouse wrote:
> On Fri, 2007-06-22 at 13:27 +0200, Joakim Tjernlund wrote:
> > I belive this jffs2_mark_node_obsolete can race against
> > jffs2_erase_pending_blocks(run in pdflush context).
> > 
> > During jffs2_build_filesystem, the flag JFFS2_SB_FLAG_BUILDING is set and
> > the erase_free_sem is NOT taken. There is nothing I can see that
> > holds pdflush back from erasing blocks during this time.
> > Confirmation would be great.
> > 
> > Dunno what the fix should be. Gut feeling is to prevent pdflush
> > from running until after build phase as erasing blocks is
> > a background task that shouldn't interfere with other tasks if
> > it can be helpt.
> > 
> > I think this is the root cause to the OOPS:es I seen lately
> 
> Perhaps. Try this...
> 
> diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
> index 1d3b7a9..0fa82d0 100644
> --- a/fs/jffs2/fs.c
> +++ b/fs/jffs2/fs.c
> @@ -390,6 +390,12 @@ void jffs2_write_super (struct super_block *sb)
>  	if (sb->s_flags & MS_RDONLY)
>  		return;
>  
> +	if (c->flags & JFFS2_SB_FLAG_BUILDING) {
> +		printk(KERN_NOTICE "jffs2_write_super() called while fs still building\n");
> +		WARN_ON(1);
> +		return;
> +	}
> +
>  	D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
>  	jffs2_garbage_collect_trigger(c);
>  	jffs2_erase_pending_blocks(c, 0);
> 

Didn't manage to trig this printout, but earlier I managed to trig a
WARN_ON(1) added next to the "argh. node added in wrong place" message:

Node totlen on flash (0x00000006) != totlen from node ref (0x00000048)
argh. node added in wrong place
------------[ cut here ]------------
Badness at fs/jffs2/nodemgmt.c:427
Call Trace:
[c05c7a80] [c0008334] show_stack+0x48/0x194 (unreliable)
[c05c7ab0] [c00f6014] report_bug+0x84/0xec
[c05c7ac0] [c000de08] program_check_exception+0x274/0x55c
[c05c7ae0] [c000f790] ret_from_except_full+0x0/0x4c
--- Exception: 700 at jffs2_add_physical_node_ref+0x5c/0x110
    LR = jffs2_add_physical_node_ref+0x5c/0x110
[c05c7bc0] [c00d7dd8] jffs2_write_dnode+0x300/0x39c
[c05c7c30] [c00d8368] jffs2_write_inode_range+0x17c/0x318
[c05c7c80] [c00d3508] jffs2_commit_write+0xcc/0x238
[c05c7cb0] [c003fe8c] generic_file_buffered_write+0x290/0x63c
[c05c7d70] [c00408d4] __generic_file_aio_write_nolock+0x3a4/0x564
[c05c7df0] [c0040afc] generic_file_aio_write+0x68/0x120
[c05c7e20] [c005c228] do_sync_write+0xc8/0x13c
[c05c7ef0] [c005c338] vfs_write+0x9c/0x160
[c05c7f10] [c005c4d8] sys_write+0x4c/0x90
[c05c7f40] [c000f148] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xff5e744
    LR = 0xff12c9c
Node CRC 0a004c60 != calculated CRC f75f2f2f for node at 05af7900

 Jocke
