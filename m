Received: from 207.88.121.47.ptr.us.xo.net ([207.88.121.47]
	helo=ba.realmsys.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELRRW-0007SM-3d
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 16:25:28 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: dedekind@infradead.org
In-Reply-To: <1128070714.4267.8.camel@sauron.oktetlabs.ru>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<1128010237.6926.10.camel@localhost.localdomain>
	<loom.20050929T193349-733@post.gmane.org>
	<1128053984.6926.59.camel@localhost.localdomain>
	<1128070714.4267.8.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Fri, 30 Sep 2005 14:25:16 -0600
Message-Id: <1128111916.6926.92.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-09-30 at 12:58 +0400, Artem B. Bityutskiy wrote:
> Could you please create a 200MB file 'dedekind' (or larger, the larger -
> the better), mount your FS, run 'time stat dedekind' and report how much
> time did that command stat took.

# time dd if=/dev/zero of=/mnt/mtdb2/dedekind bs=1M count=300
300+0 records in
300+0 records out
real    1m 37.08s
user    0m 0.01s
sys     0m 40.64s

# time umount /mnt/mtdb2
real    0m 0.45s
user    0m 0.00s
sys     0m 0.33s

# time mount /mnt/mtdb2 && time stat /mnt/mtdb2/dedekind
real    0m 0.18s
user    0m 0.00s
sys     0m 0.14s
  File: `/mnt/mtdb2/dedekind'
  Size: 314572800       Blocks: 614400     IO Block: 4096   regular file
Device: 1f02h/7938d     Inode: 2           Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 1969-12-31 17:01:29.000000000 -0700
Modify: 1969-12-31 17:03:06.000000000 -0700
Change: 1969-12-31 17:03:06.000000000 -0700
real    0m 9.50s
user    0m 0.00s
sys     0m 4.47s

And again with a bigger file:

# time dd if=/dev/zero of=/mnt/mtdb2/dedekind bs=1M count=600
600+0 records in
600+0 records out
real    3m 6.93s
user    0m 0.02s
sys     1m 19.27s

# time umount /mnt/mtdb2
real    0m 0.81s
user    0m 0.00s
sys     0m 0.58s

# time mount /mnt/mtdb2 && time stat /mnt/mtdb2/dedekind
real    0m 0.32s
user    0m 0.00s
sys     0m 0.26s
  File: `/mnt/mtdb2/dedekind'
  Size: 629145600       Blocks: 1228800    IO Block: 4096   regular file
Device: 1f02h/7938d     Inode: 3           Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 1969-12-31 17:19:56.000000000 -0700
Modify: 1969-12-31 17:19:56.000000000 -0700
Change: 1969-12-31 17:19:56.000000000 -0700
real    0m 18.72s
user    0m 0.00s
sys     0m 8.40s

Yet bigger:

# time dd if=/dev/zero of=/mnt/mtdb2/dedekind bs=1M count=900
900+0 records in
900+0 records out
real    5m 28.55s
user    0m 0.02s
sys     1m 55.58s

# time umount /mnt/mtdb2
real    0m 1.17s
user    0m 0.00s
sys     0m 0.83s

# time mount /mnt/mtdb2 && time stat /mnt/mtdb2/dedekind
real    0m 0.45s
user    0m 0.00s
sys     0m 0.36s
  File: `/mnt/mtdb2/dedekind'
  Size: 943718400       Blocks: 1843200    IO Block: 4096   regular file
Device: 1f02h/7938d     Inode: 4           Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 1969-12-31 17:30:46.000000000 -0700
Modify: 1969-12-31 17:30:46.000000000 -0700
Change: 1969-12-31 17:30:46.000000000 -0700
real    0m 28.31s
user    0m 0.00s
sys     0m 12.93s

So, there seems to be a linear relationship between the time-to-stat and
the file size.

> Also, just after mount of a fully filled FS (again, the larger is your
> FS, the better), run top, and look how much time your cpu is busy by
> executing the GC thread. Basically, you can start writing only after the
> GC thread has stopped working.

I do not have the time to do this test right now.

> I am really curious about the results. 

Me too!

> And another fun is to create a directory with thousands of small (or
> empty) files, remount the FS and run stat on the directory or enter it.
> But this is not that fundamental problem and may be fixed.

I'll try to make some time to do these tests next week.

Pete
