From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Wed, 26 Mar 2003 14:04:10 +0100
Subject: not enough blocks for JFFS?
In-Reply-To: <1048619164.1647.11.camel@gobbles>
References: <3E7E6DE5.5000003@interepoch.com.tw> <1048483100.3593.3.camel@gobbles> <20030325000503.GA14469@wohnheim.fh-wedel.de> <3E7FBB35.1050100@interepoch.com.tw> <1048558906.2922.5.camel@gobbles> <20030325123328.GC29035@wohnheim.fh-wedel.de> <1048619164.1647.11.camel@gobbles>
Message-ID: <20030326130410.GE20098@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 25 March 2003 12:06:05 -0700, Russ Dill wrote:
> On Tue, 2003-03-25 at 05:33, J?rn Engel wrote:
> > 
> > Compressed in cramfs is the point where I really disagree. iirc,
> > cramfs images are a bit larger than jffs2 images. So if you want a
> > read-only rootfs, jffs2 might be a better idea, already.
> 
> not a chance....
> 
> russ:~/src/build$ du -sh out_dir-arm/
> 2.3M    out_dir-arm/
> russ:~/src/build$ ls -l image.*
> -rw-r--r--    1 russ     russ      1286144 Mar 25 12:03 image.cramfs
> -rw-r--r--    1 russ     russ      1364676 Mar 25 12:02 image.jffs2

Correct, my tests disagree with my memory as well. 

> > Especially, if you need some if the jffs2 functionality again to save
> > configuration data. I doubt that you would save a lot with userspace
> > code + cramfs versus jffs2 both in flash and in memory consumption.
> 
> cramfs.o is 7662 bytes, jffs2.o is 74046 bytes. cramfs requires almost
> no kernel allocated memory to run, jffs2 creates large data structures
> to keep track of nodes. A simple userspace implementation to read and
> write nodes to flash that include crc's and revisions in 4296 bytes
> (object file before linking)

Also correct. Over here, jffs2 accounts for 45k of zipped kernel
image, cramfs for 15k. Both numbers include zlib (not shared).

> > Time might be spend better in improving jffs2, than in reimplementing
> > a subset of jffs2's functionality each time.
> 
> A userspace library would be nice

Agreed.

Your suggestion still doesn't apply to my problems, but it would make
more sense for Tim.

J?rn

-- 
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu
