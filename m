Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CmBv5-0000w8-CL
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2005 09:13:59 -0500
Message-ID: <41DBF5F2.5040208@yandex.ru>
Date: Wed, 05 Jan 2005 17:13:06 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
References: <Pine.LNX.4.58.0501031923110.14981@phoenix.infradead.org>
	<1104924806.5547.49.camel@baythorne.infradead.org>
In-Reply-To: <1104924806.5547.49.camel@baythorne.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] JFFS[23] slab corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'd like to do some analysis. David, could you please comment my notes:

1. Consider removing ic from mark_node_obsolete (NOR only).
When ic may have no nodes?

a). When the inode is deleted. In this case all it's nodes are marked 
obsolete (thankfully we may mark them obsolete physically). This happens 
when ic->nlink == 0 and last iput() is called.

b). I'm not sure, may be temporary it may have no valid nodes. I mean 
some transient state when, for example, there is one node A, and another 
node B is added, and B obsoletes A. Then possibly A will be first marked 
obsolete, then B will be added. Between these two operations, ic may 
have no nodes. I'm not sure, but it seems in the current implementation 
in such situations A will be always added first. So, mark_node_obsolete 
should not delete the ic in such temporary states.

But why do mark_node_obsolete code delete the correspondent ic if there 
is no nodes left? It should not delete ic because of b) . Moreover, 
conceptually it is not its work - the last iput handler should do that 
(do_clean_inode() may be).

Conclusions: a) remove that peace of code from the mark_node_obsolete. 
b) be sure ic will be deleted by somebody else.


2. Conceder jffs2_remove_node_refs_from_ino_list() function. It deletes 
ic if there are no nodes...

At first this is only valid for NAND. In case of NOR obsolete nodes are 
removed from the per-inode list as soon as they marked obsolete.

In case of nand our live is complicated because we can not mark nodes 
obsolete physically. And deletion/deleted direntries bring us 
misfortune. We must keep track of them in the per-inode list and only 
remove them when the last instance of the deleted direntry has been 
erased...

But before the erase code deletes ic, it should be sure there are no 
open files (iget count = 0) and ic->nlink = 0. But it seems it does not 
do so. ... May continue reasoning, but want to be sure I understand 
thing correctly. So, will wait for comments.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
