Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DsIho-0003nh-FR
	for linux-mtd@lists.infradead.org; Tue, 12 Jul 2005 07:13:51 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Tue, 12 Jul 2005 15:12:45 +0400
Message-Id: <1121166766.16978.71.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] (preliminary) new fragtree build method
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

I've implemented a new fragtree build algorithm which should optimize
and speed-up the the JFFS2 checking process.

I'd like to recall, that just after mount, JFFS2 checks all the inodes
it has found during the initial flash scan. The checking process' goal
is to (1) check the header/data CRCs of the inode's nodes and (2) to
detect and drop obsolete nodes (NAND-specific).

The checking process, in fact, is a "fake" inode build invocation for
each inode in the filesystem. During the check of the regular file
inodes (I further will talk only about the regular file inodes) JFFS2
does the following:

1. Read nodes, checks their data and header CRC.
2. Build the temporary RB-tree with the key = the node version (this
used to be the temporary list, not tree, until recently). The whole
point of this is to sort nodes in the order of increasing versions.
3. Build the fragtree, taking nodes from the temporary RB-tree one-by-
one, in the increasing node version. While this fragtree is being built,
obsolete nodes are detected (NAND-specific).

The drawback of this approach is that we read the data of *all* nodes at
step 1. and check the data CRC of all nodes, even though they will be
recognized as obsolete at step 3 and dropped.

My patch changes is algorithm:

1. Read only the node headers, checks their CRC (data are not read and
are not checked).
2. Build the temporary RB-tree with the key = node version. The whole
point of this is to sort nodes in the order of *decreasing* versions.
3. Builds the fragtree, taking nodes from the temporary RB-tree one-by-
one, in the *decreasing* node version. Just before we have found that
the node should be inserted, we check its data CRC. If we have found
that the node is obsolete, we do not check it, just mark it obsolete and
drop.

Thus, we avoid reading and checking data of obsolete nodes.

The patch may be found at:
http://www.infradead.org/~dedekind/reverse-version-prelim-01.diff

Please, review it, try it. It changes the vital part of JFFS2, so it
would be nice if people try it on their systems before we may commit it.

Note: on NOR the patch does not optimize anything, but I'd be very
appreciated if someone try it, just to be sure it is OK.

Note: I've left some temporary debugging stuff there, it'll be removed.

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
