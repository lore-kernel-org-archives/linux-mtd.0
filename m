Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DDk2Q-0003fg-Nn
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2005 09:07:26 -0500
Received: from dedekind (helo=localhost)
	by phoenix.infradead.org with local-esmtp (Exim 4.43 #1 (Red Hat
	Linux)) id 1DDk22-0001WK-CK
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2005 14:07:02 +0000
Date: Tue, 22 Mar 2005 14:06:54 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.58.0503221406120.5581@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Subject: JFFS3 & deletion dirents RFC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, I've found some time to share my old Idea concerning the JFFS2 
deleted/deletion dirent processing and the similar in JFFS3.


Brief problem description
~~~~~~~~~~~~~~~~~~~~~~~~

JFFS2 removes direntries by means of writing deletion direntries. Deletion 
dirents are the same nodes as deleted dirents but with the target inode 
number 0. Deletion dirents refer deleted ones by means of name.

Example:

1. Before the deletion we have a dirent named "kaka" with the target inode 
"1980"

-----------
| kaka    |
-----------
| 1980    |
-----------

2. After the deletion we have 2 dirents - older, "kaka" with the target 
inode "1980" (deleted dirent) and newer, "kaka" with the target inode 0.

-----------
| kaka    |
-----------       <-- deleted dirent
| 1980    |
-----------

-----------
| kaka    |
-----------       <-- deletion dirent
| 0       |
-----------

It is possible that there are several instances of the deleted dirent on 
flash (due to GC) or there are previous versions of the deleted dirent 
present (due to dirent updates). E.g.:


-----------
| kaka    |
-----------       <-- an old (and obsolete) "kaka" node
| 1980    |
-----------
| 95      |<-- version
-----------

-----------
| kaka    |
-----------       <-- deleted dirent
| 1980    |
-----------
| 100     |
-----------

-----------
| kaka    |
-----------       <-- deletion dirent
| 0       |
-----------
| 304     |
-----------


There are 2 major drawback of such design:

1. GC of deletion dirents becomes slow and complicated. Before we may 
remove a deletion dirent, we have to make sure there are no instances of 
the deleted dirent on flash exist. Since the in-core data structures do 
not contain dirents' names, JFFS2 has nothing to do except to *physically* 
read all the obsolete dirent nodes belonging to the deletion dirent's 
inode and compare names. Reads involve CRC checking. This may be very slow 
(look at jffs2_garbage_collect_deletion_dirent()).

2. During mount we need to read dirents' names and check their CRCs.
Furthermore, we need to calculate the inodes' nlinks for which reason we 
need to locate all the deleted dirents, comparing them by name. This is 
rather slow.


Proposed JFFS3 approach
~~~~~~~~~~~~~~~~~~~~~~

I propose to refer deleted dirents by their versions.

-----------
| kaka    |
-----------       <-- deleted dirent
| 1980    |
-----------
| 100     |<-- version
-----------

-----------
| 0       |
-----------       <-- deletion dirent
| 100     |
-----------

Here the deletion dirent specifies the deleted dirent by its version 
number (100). The name is unneeded in the deletion dirent. Since there may 
be more then one instance of the deleted dirent, I offer to write a 
deletion dirent for each instance:

1. Whenever a dirent is updated, i.e. newer node is written, we may write 
a deletion node for its previous instance at once.

2. Whenever a dirent is GCed, its version number is preserved, so we will 
have two dirents with equivalent versions. In this case we don't need to 
write any additional deletion dirent.

Additionally, we introduce the "version" field to the "struct 
jffs2_raw_node_ref" structure. In this case, the 
jffs2_garbage_collect_deletion_dirent() function will work as follows:

exist = 0;
for (each_node_ref) {
	if (cur_ref->version == deleted_version) {
		exist += 1;
		break;
	}
}

if (exist) {
	/* Move the deletion dirent as it still refers
	 * an existing deleted dirent's node */
} else {
	/* Mark the deletion dirent obsolete and do
	 * not move it to the new block */
}

The mount process must also be faster.

The drawback is that we need to increase the size of in-core node_ref  
objects. But it seems for me as not so bad thing because we're going to 
introduce an in-core memory shrink mechanism to JFFS3 (ICP, ...).

Opinions?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
