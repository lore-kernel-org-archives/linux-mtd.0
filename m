Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6AEw-0004kX-Dl
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2005 11:28:55 -0500
Received: from dedekind (helo=localhost)
	by phoenix.infradead.org with local-esmtp (Exim 4.43 #1 (Red Hat
	Linux)) id 1D6AEe-0005id-Hg
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2005 16:28:51 +0000
Date: Tue, 1 Mar 2005 16:28:36 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.58.0503011627270.19992@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Subject: JFFS3 and RAM consumprion reincarnated
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'd like to continue the JFFS3 RAM consumption discussion.
Please, take a glimpse at 
http://lists.infradead.org/pipermail/linux-mtd/2005-January/011671.html 
and follow the conversation 
athttp://lists.infradead.org/pipermail/linux-mtd/2005-January/011716.html 
to refresh your memory.

Well, I suppose the reader knows what are Summary and ICP. If no, follow 
the links above.

We've stopped on the design like this: each inode has ICP which is stored 
on flash. The ICP is being outdated by GC and users. Since it is 
inefficient to rewrite new inode every time, we won't rewrite it but add 
node_ref instead. Sometimes we'll flush ICP and free node_refs.

Example:
1. We have inode X with 10 nodes (node 1, node 2, ... node 10) and ICP 
node which describes them. So far so good. On iget() call we read ICP and 
have the inode built.

2. Suppose GC has moved node 1 of our inode. Its position has been 
changed, so the relating ICP entry is obsolete now. In this case JFFS3 
does not rewrite new ICP. Instesd, it allocates node_ref for node 1 and 
keeps it in-core.
Now, on iget() call, we read ICP and the node 1's node_ref and this is 
sufficient to build our inode.

Anologeously, if another nodes are moved, we just allocate more node_refs.

Sometimes, I don't specify when, we might rewrite old obsolete ICP and 
free node_refs. And so on.

I think it makes sence to introduce JFFS3 parameter that limits the abount 
of in-core RAM that JFFS3 might consume. Jets call this parameter 
JFFS3_MAXRAM.

If JFFS3_MAXRAM = 0, we rewrite new ICP every time when any of its entry 
is obsoleted.

If JFFS3_MAXRAM is very large, we have JFFS3 = JFFS2 in the memory 
consumption's respect.

Comments?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
