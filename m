Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZGGN-00038h-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 19:00:47 +0000
Message-ID: <3C642220.8F055CF5@comdev.cc>
Date: Fri, 08 Feb 2002 11:08:16 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: i node, u node, we all node for inodes
References: <Pine.LNX.4.44.0202090427040.13267-100000@lapdancer.baythorne.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse wrote:
> > Does an inode have a fixed or maximum size?
> 
> Do you mean a node? Not explicitly, although each type of node has its own
> limits so you could deduce the maximum node size you'll ever see.

Maybe I don't have a clear idea of what an "inode" is in this context.
I normally think of an inode as a small block on a physical disk.  It
has
a fixed size, say 1K.  A file larger than 1K would span multiple inodes.
Or maybe I have this wrong.

> > Can a raw node contain data used by mutiple inodes?  If not, what
> > prevents this from happening?
> 
> Each node belongs to only one inode. It's generated for that inode, added
> to the list for that inode, the physical node on the flash contains the
> inode number. Why would it get shared?

In the case where a file consists of multiple inodes, and a data write
is performed which spans two inodes, does the write get broken into two
raw nodes, and linked into two inode chains, or is one raw node written
and somehow magically shared between two inode chains?

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
