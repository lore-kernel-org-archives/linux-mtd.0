Received: from dedekind (helo=localhost)
	by phoenix.infradead.org with local-esmtp (Exim 4.43 #1 (Red Hat
	Linux)) id 1CtimW-0000sj-PG
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2005 08:44:23 +0000
Date: Wed, 26 Jan 2005 08:44:08 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Subject: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, how about to discuss one more problem?

JFFS2 stores anything on flash using special container data structures 
called
nodes. Nodes have different types and different lengths. Nodes may be 
situated
everywhere within the block.

As David Woodhouse said, JFFS2 has no any structure on flash. There are no
specific addresses which one may access to get specific JFFS2 information.
For example, most file systems have the super block data structure, which 
may
be found at the specified address and the information about the whole file
system may be read from that super block. JFFS2 has no super block. The 
only
it has is the set of nodes on it. Nodes may be placed to any offset within
the flash device, so may have any position. JFFS2 just writes nodes,
sequentially.

The above design assumes two things:

1. When mounting JFFS2, the flash media scanning must be done. Since we 
have no
super block, we must scan the flash device and identify the offsets of 
nodes,
read their header information and only then "build" the file system's 
tree.
This is the reason why the mount process is slow in JFFS2. And, roughly
speaking, the mount time grows lineary with the growing file system size .
But this is not the subject of this speech.

2. Nodes... They are the only JFFS2 data containers. They have no 
determined
position on the flash chip. They are moved by the Garbage Collection from 
time
to time, so their position is dynamically changed. This is problem.
To handle this situation, JFFS2 needs to keep track of all its nodes in 
memory
since obviously, it is unacceptable to scan the whole flash device to find
the position of all the inode's nodes when user issued, say, the file read
operation. JFFS2 needs to quickly find all the needed nodes on flash.

This is why JFFS2 have small object for each JFFS2 node in RAM memory. 
This
means, more nodes we have on the flash (i.e., mode data on the JFFS2 file
system), more RAM JFFS2 needs to keep track of these nodes. The memory
occupied by these object is called "in-core" memory. The RAM objects which
correspond to nodes are called "node_ref" objects and have the
"struct jffs2_raw_node_ref" type.

Roughly speaking, the JFFS2 in-core memory consumption is the linear 
function
of the file system size.

This is the problem which I want to discuss.

The JFFS2 design is ideal from the wear-leveling viewpoint, it is simple 
and
clean, it is very robust in cases of power loss. But it has the major 
problem -
scalability. We have the linear dependency of the mount time and the RAM 
usage.
This may be the problem with the tendency of the flash sizes growth.

Unfortunately, I believe this is fundamental JFFS2 problem, caused by its 
"pure"
log structured design. Denote denote the above dependency as Tm = K1N and 
M = K2N,
where
        - Tm is the mount time;
        - M is the required in-core memory;
        - K1, K2 are some coefficients;
        - N is the number of nodes on Flash.

I think with the JFFS2 design we can not have other dependency then 
linear, we can only
make K1 and K2 smaller.

K1 is decreased by the Ferenc Havasi's "summary" patch well. Would be nice 
to decrease
K2 either. Any Ideas how to do so?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
