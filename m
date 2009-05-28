Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9g2H-00017y-9Z
	for linux-mtd@lists.infradead.org; Thu, 28 May 2009 13:52:54 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 34D8B650010
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 May 2009 15:43:47 +0200 (CEST)
In-Reply-To: <OF19B0B97E.84069DDC-ONC12575C4.003C9262-C12575C4.003E7135@transmode.se>
References: <OF19B0B97E.84069DDC-ONC12575C4.003C9262-C12575C4.003E7135@transmode.se>
Subject: Re: Bug in erase failed?
Cc: linux-mtd@lists.infradead.org
Message-ID: <OFF2A75D7E.05320330-ONC12575C4.0047CBCB-C12575C4.004B6BA6@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 28 May 2009 15:43:48 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
>
> When an erase has failed:
>  Newly-erased block contained word 0x0 at offset 0x0224df6
> You end up in erase.c:490
> filebad:
>    mutex_lock(&c->erase_free_sem);
>    spin_lock(&c->erase_completion_lock);
>    /* Stick it on a list (any list) so erase_failed can take it
>       right off again.  Silly, but shouldn't happen often. */
>    list_move(&jeb->list, &c->erasing_list);
>       ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Here is the sector moved to the erasing list.
>
>    spin_unlock(&c->erase_completion_lock);
>    mutex_unlock(&c->erase_free_sem);
>    jffs2_erase_failed(c, jeb, bad_offset);
>       ^^^^^^^^^^^^^^
> jffs2_erase_flailed also moves a sector:
>    list_move(&jeb->list, &c->bad_list);
> but it is already moved so you end up moving a good sector to the bad
> list. Very bad.
>
>  Jocke

Just keeping the call to jffs2_erase_failed() in filebad:
it gets much more stable but I get these errors in pair:
 Newly-erased block contained word 0x0 at offset 0x00a40700
 Node totlen on flash (0x00000000) != totlen from node ref (0x0000000c)


Sticking in a WARN_ON(1) with the "Node totlen .." printout I get:

Newly-erased block contained word 0x0 at offset 0x0090df78
Node totlen on flash (0x00000000) != totlen from node ref (0x0000000c)
------------[ cut here ]------------
Badness at fs/jffs2/nodemgmt.c:680
NIP: c00fafa4 LR: c00fafa4 CTR: c0153f58
REGS: c4023af0 TRAP: 0700   Not tainted  (2.6.29)
MSR: 00029032 <EE,ME,CE,IR,DR>  CR: 24008424  XER: 20000000
TASK = c7873be0[487] 'cp' THREAD: c4022000
GPR00: c00fafa4 c4023ba0 c7873be0 0000005f 00001fed ffffffff c01575f8 c02eacf8
GPR08: 00001fed c0310000 00000000 c02ead18 24008442 10085148 c7498a00 00000000
GPR16: 00000000 00008000 00000000 c023c878 00000000 c4023ca8 000000f8 00000000
GPR24: 00000000 00000000 00000001 0000000c c4023bb0 c79bddec c7963a00 c7898ed4
NIP [c00fafa4] jffs2_mark_node_obsolete+0x5b8/0x5c0
LR [c00fafa4] jffs2_mark_node_obsolete+0x5b8/0x5c0
Call Trace:
[c4023ba0] [c00fafa4] jffs2_mark_node_obsolete+0x5b8/0x5c0 (unreliable)
[c4023c00] [c00fb02c] jffs2_do_reserve_space+0x80/0x294
[c4023c20] [c00fb3e4] jffs2_reserve_space+0x124/0x1a4
[c4023c50] [c00fdce4] jffs2_write_inode_range+0x1c4/0x2a0
[c4023ca0] [c00f8cf4] jffs2_write_end+0xf0/0x228
[c4023ce0] [c005610c] generic_file_buffered_write+0x164/0x2e8
[c4023d70] [c0056634] __generic_file_aio_write_nolock+0x3a4/0x568
[c4023df0] [c0056950] generic_file_aio_write+0x68/0x120
[c4023e20] [c00772e8] do_sync_write+0xc8/0x118
[c4023ef0] [c00773d4] vfs_write+0x9c/0x174
[c4023f10] [c0077588] sys_write+0x4c/0x90
[c4023f40] [c0011674] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xff5e744
    LR = 0x10004aec
Instruction dump:
4bffff0c 809d0004 3c60c028 38634044 5484003a 4bfffef8 80dd0004 3c60c028
7f65db78 38634080 54c6003a 4bf2c211 <0fe00000> 4bfffd94 7c0802a6 9421ffe0

I think this is another bug in JFFS2, trying to mark a the last node obsolete
in the just erased block that failed erase.

I have no idea why this happens, I hope an JFFS2 expert can have a look, I need
to move on to other things.

   Jocke
