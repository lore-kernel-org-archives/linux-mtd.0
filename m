From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Tue, 25 Mar 2003 13:33:28 +0100
Subject: not enough blocks for JFFS?
In-Reply-To: <1048558906.2922.5.camel@gobbles>
References: <3E7E6DE5.5000003@interepoch.com.tw> <1048483100.3593.3.camel@gobbles> <20030325000503.GA14469@wohnheim.fh-wedel.de> <3E7FBB35.1050100@interepoch.com.tw> <1048558906.2922.5.camel@gobbles>
Message-ID: <20030325123328.GC29035@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 24 March 2003 19:21:47 -0700, Russ Dill wrote:
> 
> Your goals would be better served by a user-space solution from what I
> can tell. Not only would there be less code, but that code would be
> compressed in cramfs. I'm able to use 1 boot block for blob, another for
> static configuration, and the remaining two for configuration data saved
> in this way.

Compressed in cramfs is the point where I really disagree. iirc,
cramfs images are a bit larger than jffs2 images. So if you want a
read-only rootfs, jffs2 might be a better idea, already.

Especially, if you need some if the jffs2 functionality again to save
configuration data. I doubt that you would save a lot with userspace
code + cramfs versus jffs2 both in flash and in memory consumption.

Time might be spend better in improving jffs2, than in reimplementing
a subset of jffs2's functionality each time.

J?rn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
