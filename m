Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161cUx-0002Es-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2001 23:52:47 +0000
Date: Thu, 8 Nov 2001 03:12:26 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
cc: linux-mtd@lists.infradead.org
Subject: re: journaling
In-Reply-To: <20011107133747.A5963@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.21.0111080259580.29588-100000@godzilla.axis.se>
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

On Wed, 7 Nov 2001, Jörn Engel wrote:
> On a regular hard drive, user data journaling maximizes write
> performance but will only achieve decent read performance when data is
> read successively that was written successively, too. Very unlikely.

On the other hand, a "normal" filesystem does not optimize the read speed
in any other way either. I don't see how you can optimize in another way
than putting data which belong together logically together
physically.. the LFS can do this even better than traditional systems
because data is moved naturally during the GC process and can be
reorganized.

The main problem with logstructured filesystems is that it's difficult to
scalably _locate_ the data you want to read. That's why JFFS1,2 have long
mount-times. Checkpointing the in-core representation would help a bit,
but it would still not scale well with filesystem size.

Some sort of hierarchical checkpointing could perhaps work.. I haven't
read very much about that yet but it's a natural issue for JFFS3 :)

The second problem with LFS is the GC process. After some time, you
reach a state where the log _is_ full and every write has to force a part
of the GC. There is a lot of tweaking which can be done in that area. As
you note below it solves fragmentation as a byproduct, but getting good
performance and low latency is difficult.

> On the other hand, it is trivial to write a disk defragmentation tool
> for these filesystems. Just read and rewrite everything in the
> preferred order and the filesystem logic takes care of the rest.

/BW
