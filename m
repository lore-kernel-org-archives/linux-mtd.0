Received: from dedekind (helo=localhost)
	by phoenix.infradead.org with local-esmtp (Exim 4.43 #1 (Red Hat
	Linux)) id 1Cp0wK-0004VP-3S
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 09:06:56 +0000
Date: Thu, 13 Jan 2005 09:06:47 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.58.0501130906230.17045@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Subject: RE: how to behave on jffs2 (fwd)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

---------- Forwarded message ----------
Date: Thu, 13 Jan 2005 09:00:53 +0000 (GMT)
From: Artem B. Bityuckiy <dedekind@phoenix.infradead.org>
To: Lokesh Kumar <kumar.lokesh@wrx-us.com>
Subject: RE: how to behave on jffs2

Two hints.

1. Each direntry in JFFS2 is represented by the struct jffs2_full_dirent 
structure. There is a list of 'struct jffs2_full_dirent' objects. The list 
is sorted by nhash(direntry name) value, where nhash is hash function. Any 
operation with direntry implies the search operation in this list. This is 
very time consuming when there are lots of direntries in directory. Use 
some kind of balanced tree and fix this.

2. ls -l implies that JFFS2 should build the inode of the directory with 
your 30000 files (iget() call) as well as build the inode of all of that 
30000 files.

The iget() call is slow in JFFS2 by its design. It implies reading of all 
nodes for the inode being built.

So you should solve more general task - improve the iget() call. I have 
only one Idea how to do that - checkpointing. But it only helps much in 
case of NAND - but think on NOR too, but I didn't try.

Basically I've implemented checkpoints and seems they give great 
performance growth. But my work still not in repository because of:
	a. The patch touchs too many things in JFFS2. I changed almost 	
all its core data structures. And the patch is not mature enough to go to 
mainline (JFFS2). It is supposed to go to JFFS3.
	b. Patch is ugly. I hate it. And I gonna first prepare JFFS3 
step-by-step. Move my patch there evolutionary, not revolutionary.

For NOR there is room for optimization exist either.

Basic checkpoints idea:
~~~~~~~~~~~~~~~~~~~~~~

You have inode with lots of nodes. iget implies you read all these nodes. 
In case of directory your nodes are direntries which are about 100 bytes 
long. They are scattered over flash randomly. On NAND, any read (even if 
you read 100 bytes) assumes you read the whole NAND page (512 or 2048 
bytes). And the specific of the NAND flash that any access to any page 
takes additional "access time".

So, in worst case, having 30000 direntries you will read 30000 pages. If 
you have NAND flash, look to your specification and calculate the time 
needed.

Checkpoint is special node which contains the information which is needed 
to build inode.

 -------------------
| Checkpoint header |
 -------------------
|   (1)direntry A   |  
|   (2)direntry B   |  <- checkpoint data
|       ....        |
|(30000)direntry XXX|
 -------------------

So, when you build inode, you read only checkpoint and do not read each 
node.

There are 2 benefits:
1. Checkpoint contains only data which is needed to build inode. No any 
unneeded information.
2. The information goes consequently and is not scattered over different 
pages. So, even if we've stored the whole node, we would have to read much 
fewer NAND pages, thus saving on the page access time.

Moreover, we may compress the checkpoint data.


On Wed, 12 Jan 2005, Lokesh Kumar wrote:
> Sure, give me the hints.
> 
> Lokesh
> 
> -----Original Message-----
> From: Artem B. Bityuckiy [mailto:dedekind@infradead.org]
> Sent: Wednesday, January 12, 2005 11:23 AM
> To: Lokesh Kumar
> Cc: 'linux-mtd@lists.infradead.org'
> Subject: Re: how to behave on jffs2
> 
> 
> On Wed, 12 Jan 2005, Lokesh Kumar wrote:
> 
> This is feature of JFFS2. It works slow with directories which have lots 
> of files. If you want to fix it, I may try to take you some hints :-)
> 
> 
> > Hi All,
> > 
> > I have an embedded Linux (kernel 2.4.18) board at 50MHz, with jffs2 16MB
> > flash. My system creates small files of 700 bytes each and is required to
> > create ~3000 of such files. I see that when there are 1000 files, the
> system
> > takes 3 minutes or so to mount this partition and then another 3 to do "ls
> > -l". When there are 3000 files, the system takes 10 minutes each for mount
> > and "ls -l". 
> > 
> > Is that expected behaviour?
> > 
> > Lokesh Kumar
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
> 
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
