From: Russ.Dill@asu.edu (Russ Dill)
Date: 25 Mar 2003 12:06:05 -0700
Subject: not enough blocks for JFFS?
In-Reply-To: <20030325123328.GC29035@wohnheim.fh-wedel.de>
References: <3E7E6DE5.5000003@interepoch.com.tw>
 <1048483100.3593.3.camel@gobbles>
 <20030325000503.GA14469@wohnheim.fh-wedel.de>
 <3E7FBB35.1050100@interepoch.com.tw> <1048558906.2922.5.camel@gobbles>
 <20030325123328.GC29035@wohnheim.fh-wedel.de>
Message-ID: <1048619164.1647.11.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 2003-03-25 at 05:33, J?rn Engel wrote:
> On Mon, 24 March 2003 19:21:47 -0700, Russ Dill wrote:
> > 
> > Your goals would be better served by a user-space solution from what I
> > can tell. Not only would there be less code, but that code would be
> > compressed in cramfs. I'm able to use 1 boot block for blob, another for
> > static configuration, and the remaining two for configuration data saved
> > in this way.
> 
> Compressed in cramfs is the point where I really disagree. iirc,
> cramfs images are a bit larger than jffs2 images. So if you want a
> read-only rootfs, jffs2 might be a better idea, already.

not a chance....

russ:~/src/build$ du -sh out_dir-arm/
2.3M    out_dir-arm/
russ:~/src/build$ ls -l image.*
-rw-r--r--    1 russ     russ      1286144 Mar 25 12:03 image.cramfs
-rw-r--r--    1 russ     russ      1364676 Mar 25 12:02 image.jffs2

> Especially, if you need some if the jffs2 functionality again to save
> configuration data. I doubt that you would save a lot with userspace
> code + cramfs versus jffs2 both in flash and in memory consumption.

cramfs.o is 7662 bytes, jffs2.o is 74046 bytes. cramfs requires almost
no kernel allocated memory to run, jffs2 creates large data structures
to keep track of nodes. A simple userspace implementation to read and
write nodes to flash that include crc's and revisions in 4296 bytes
(object file before linking)

> Time might be spend better in improving jffs2, than in reimplementing
> a subset of jffs2's functionality each time.

A userspace library would be nice
