From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
In-Reply-To: <41DBF5F2.5040208@yandex.ru>
References: <Pine.LNX.4.58.0501031923110.14981@phoenix.infradead.org>
	<1104924806.5547.49.camel@baythorne.infradead.org>
	<41DBF5F2.5040208@yandex.ru>
Content-Type: text/plain
Date: Sun, 27 Feb 2005 10:30:33 +0000
Message-Id: <1109500233.27107.20.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] JFFS[23] slab corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-05 at 17:13 +0300, Artem B. Bityuckiy wrote:
>I'd like to do some analysis. David, could you please comment my notes:
>
>1. Consider removing ic from mark_node_obsolete (NOR only).
>When ic may have no nodes?

ic will have no nodes when they've all been actually removed or marked
obsolete -- that's either in mark_node_obsolete() in the case of NOR
flash, or somewhere in erase.c in the case of NAND.

Until all the nodes are actually gone, we mustn't re-use the old inode
number for new inodes, so the ic has to stay in the list.

>a). When the inode is deleted. In this case all it's nodes are marked 
>obsolete (thankfully we may mark them obsolete physically). This happens 
>when ic->nlink == 0 and last iput() is called.

On NOR, yes. If !jffs2_can_mark_obsolete() it happens only later.

>b). I'm not sure, may be temporary it may have no valid nodes. I mean 
>some transient state when, for example, there is one node A, and another 
>node B is added, and B obsoletes A. Then possibly A will be first marked 
>obsolete, then B will be added. Between these two operations, ic may 
>have no nodes. I'm not sure, but it seems in the current implementation 
>in such situations A will be always added first. So, mark_node_obsolete 
>should not delete the ic in such temporary states.

No, that'll never happen because it wouldn't be powerfail-safe. We can't
ever obsolete an old node before writing the new one.

>But why do mark_node_obsolete code delete the correspondent ic if there 
>is no nodes left? It should not delete ic because of b) . Moreover, 
>conceptually it is not its work - the last iput handler should do that 
>(do_clean_inode() may be).

>Conclusions: a) remove that peace of code from the mark_node_obsolete. 
>b) be sure ic will be deleted by somebody else.

Perhaps. But I think we have to check for INO_STATE_READING and
INO_STATE_CLEARING even when we're removing the ic from erase.c, to
prevent a similar failure. And so I think that we have to do the check
when we leave read_inode() or clear_inode() (or have some other way of
postponing it). So since we need all this to handle the erase case, we
might as well just do the same in mark_node_obsolete() too.

>2. Conceder jffs2_remove_node_refs_from_ino_list() function. It deletes 
>ic if there are no nodes...
>
>At first this is only valid for NAND. In case of NOR obsolete nodes are 
>removed from the per-inode list as soon as they marked obsolete.
>
>In case of nand our live is complicated because we can not mark nodes 
>obsolete physically. And deletion/deleted direntries bring us 
>misfortune. We must keep track of them in the per-inode list and only 
>remove them when the last instance of the deleted direntry has been 
>erased...
>
>But before the erase code deletes ic, it should be sure there are no 
>open files (iget count = 0) and ic->nlink = 0. But it seems it does not 
>do so. ... May continue reasoning, but want to be sure I understand 
>thing correctly. So, will wait for comments.

You'll never delete ic for a file which is open because it can't be
actually deleted when it's open, and until it's actually deleted it'll
always have at least one node.

-- 
dwmw2
