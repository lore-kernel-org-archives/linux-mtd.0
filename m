Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163dzC-0004k1-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 13:52:22 +0000
Date: Tue, 13 Nov 2001 17:12:09 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: journaling
In-Reply-To: <20011108140654.B7695@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.21.0111121408520.2402-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
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

On Thu, 8 Nov 2001, Jörn Engel wrote:
> large files or all the files in a directory - in one or few spots.
> Without GC-optimizations or a defragmentation tool of some sort, LFSs
> are very bad at this. And these optimizations are much more

But you can't have a LFS without a GC, so.. 

> > Some sort of hierarchical checkpointing could perhaps work.. I haven't
> > read very much about that yet but it's a natural issue for JFFS3 :)
> 
> Sounds interesting. Can you quickly describe this one?

You need to find structures to put on flash (or disk), which serve the
same purpose that directories do for finding files on a normal filesystem,
but for the log in the jffs case.

> > The second problem with LFS is the GC process. After some time, you
> > reach a state where the log _is_ full and every write has to force a part
> 
> Getting low latency should be nearly impossible in the jffs case. The
> write will always have to wait until a complete delete block is
> finished. This can take several seconds, depending on your flash.

The way out of this is to never fill the flash filesystem, and allow the
GC to operate before any writes, so there always is a bit of room to do a
low-latency write. Both JFFS's now do this, but it requires some awareness
from the system designer.. like, as long as you dont fill the filesystem
you can always write X bytes without waiting. 

Also, you _can_ queue up writes so the writing process does not have to
wait (JFFS2 has a write-queue (?)). As long as you don't loose
synchronicity this might be a good trade-off.

/BW
