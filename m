Received: from ocean.emcraft.com ([213.221.7.182])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fqn1I-0008M5-O1
	for linux-mtd@lists.infradead.org; Thu, 15 Jun 2006 04:16:17 -0400
Received: from river.emcraft.com ([172.17.0.5])
	by ocean.emcraft.com with esmtp (Exim 4.43) id 1Fqn0y-0005YK-Di
	for linux-mtd@lists.infradead.org; Thu, 15 Jun 2006 12:15:44 +0400
From: Dmitry Bazhenov <dbazhenov@rambler.ru>
To: "Linux-MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: [JFFS2] a way to reduce memory usage
Date: Thu, 15 Jun 2006 12:16:23 +0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606151216.23086.dbazhenov@rambler.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all!

As I understand, for the moment every reference to raw node is kept in-core,
even for obsoleted one. I think it is a bit excessive.

I have an idea how to reduce the amount of references kept in-core.
It requires some terminology: 

Raw nodes are classified as:
-	valid
	Node is still used. The block owning a valid node couldn't be erased.
-	significant
	A significant node is obsolete but we must consider it exists. The block
	owning a significant node can be erased. A significant node must be kept
	in memory until the owning block is erased.
-	insignificant
	A insignificant node is obsolete and may not be kept in memory any more.

As you can see, I introduced a new state of node "significant". The amount of
significant nodes is less than total amount, thus we can reduce memory usage
by releasing all references to insignificant nodes.

Below are the rules to determine validness/significance of a certain node.
I have made rules for dirent and data nodes only:
-	Node is "obsoleted in block" if it is obsoleted by
	subsequent nodes in the same block.
-	Node is "globally obsoleted" if it is obsoleted by
	subsequent nodes that are not in the same block.
-	Normal dirent or data node is valid if it is neither
	"globally obsoleted" nor "obsoleted in block".
-	Normal dirent or data node is significant if it is
	"globally obsoleted" but is not "obsoleted in block",
	and the block is not erased.
-	Deletion dirent is valid if it is neither "globally
	obsoleted" nor "obsoleted in block", and
	is not the only dirent in inode.
-	Deletion dirent is significant if it is the only
	dirent in inode and the block is not erased.

I think that the same rules can be applied to other kinds of nodes.

What do you think?

--
Dmitry
