Received: from d-200.linux2002.uq.net.au ([203.15.37.200] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZMch-0003YV-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Feb 2002 01:48:16 +0000
Date: Sat, 9 Feb 2002 11:28:12 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Adam Wozniak <adam.wozniak@comdev.cc>
cc: linux-mtd@lists.infradead.org
Subject: Re: i node, u node, we all node for inodes
In-Reply-To: <3C642220.8F055CF5@comdev.cc>
Message-ID: <Pine.LNX.4.44.0202091120140.2394-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 8 Feb 2002, Adam Wozniak wrote:

> > Do you mean a node? Not explicitly, although each type of node has its own
> > limits so you could deduce the maximum node size you'll ever see.
> 
> Maybe I don't have a clear idea of what an "inode" is in this context. I
> normally think of an inode as a small block on a physical disk.  It has
> a fixed size, say 1K.  A file larger than 1K would span multiple inodes.
> Or maybe I have this wrong.

Basically, 'inode' == 'file'. Or devicenode, symlink, etc. But basically 
it's a _logical_ filesystem object. Nothing physical on the medium - just 
the 'inode #' field in each physical node to say which inode they belong 
to.

> In the case where a file consists of multiple inodes, and a data write
> is performed which spans two inodes, does the write get broken into two
> raw nodes, and linked into two inode chains, or is one raw node written
> and somehow magically shared between two inode chains?

I think I've obsoleted this question. I _hope_ I have, at least. If not, 
read on a little...

JFFS is log-structured. Basically you keep a log of every change that 
happens to the filesystem, by writing packets of data, or 'nodes' to the 
flash to say what happened each time something changed. So you make a new 
file, and it'll pick an unused inode number for it, and write a 'node' to 
the flash containing the metadata (uid,gid,etc) for that file. 

It'll also write a 'dirent node', containing the inode# of the directory,
the name of the file and the inode number of the file - which is enough to
rebuild the filesystem tree.

Whenever you write to the file, it just appends another node (or nodes) to 
the flash, giving the new metadata (mtime, isize etc) and the new data. 

Even if you overwrite the beginning of the file, it just appends another 
node to the log, saying 'and now he wrote <this> <here>'...

It replays this log of events in chronological order, when it needs to 
know the 'current' state of the file/filesystem, in order to satisfy 
reads etc.

Imagine it with an infinite amount of flash, just writing out changelogs 
every time you change anything on the file system - and it's very simple. 

Then just take my word for it when I say that garbage collection doesn't 
really change the concept very much :)

-- 
dwmw2
