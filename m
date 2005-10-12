Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPgsz-0008JE-6m
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 09:43:29 -0400
Message-ID: <434D13D2.6030600@inf.u-szeged.hu>
Date: Wed, 12 Oct 2005 15:46:58 +0200
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: priewasser@gmail.com
References: <434CE6CB.9040509@gmail.com>
In-Reply-To: <434CE6CB.9040509@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to determine MTD/JFFS2 RAM consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Bernhard Priewasser wrote:

> - Why are there 64 jffs2_raw_node_refs after mounting an empty JFFS2?

If you are using NOR memory then there is a cleanmarker node in the
begining of every jeb and the scan process allocates a raw_node_ref for it.

> - Why are there 103 jffs2_raw_node_ref after writing 10 (small) files?

If you write a new file to the flash then it allocates a inode, dentry
and an other inode. Every dentry has an inode number to which it belongs
to, that's why jffs2 allocates the inode first and after then the
dentry. The second inode contains the writed data (if the compreessed
size of the data and the inode header is smaller than 4k ).
64 + 30 = 94
(What is about the other 9? I don't know exactly but if you send us the
testcase then maybe we can tell more)

> - What about jffs2_node_frag and jffs2_full_dnode?

Jffs2 builds up the full inode data by fragments (as on flash) and
builds a red-black tree (using the version number as key).
jffs2_node_frag stores the size of the fragment and the offset of the
fragment. Offset is the distance from the begining of the file.
jffs2_full_dnode is an extension of raw_node_ref.  Write_dnode returns a
full_dnode pointer, it contains the offset and the size of the written
data and a pointer to a raw node. From this information jffs2 can build
up the new fragment and add it to the fragment tree.

Zoltan
