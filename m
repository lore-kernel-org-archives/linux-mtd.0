From: Russ.Dill@asu.edu (Russ Dill)
Date: 24 Mar 2003 19:21:47 -0700
Subject: not enough blocks for JFFS?
In-Reply-To: <3E7FBB35.1050100@interepoch.com.tw>
References: <3E7E6DE5.5000003@interepoch.com.tw>
 <1048483100.3593.3.camel@gobbles>
 <20030325000503.GA14469@wohnheim.fh-wedel.de>
 <3E7FBB35.1050100@interepoch.com.tw>
Message-ID: <1048558906.2922.5.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-03-24 at 19:13, Tim Wu wrote:
> J?rn:
> Thanks for your quick patch.  I will test it.
> 
> JFFS2 without compression?
> What does it different from JFFS?
> 
> No compression is OK for me.  That's why I chose JFFS instead of JFFS2.
> Can the idea "with less reserved blocks" apply to JFFS?
> I prefer JFFS because JFFS2 is much larger than JFFS in code size, which 
> makes
> I have to enlarge my flash partition for kernel.

Your goals would be better served by a user-space solution from what I
can tell. Not only would there be less code, but that code would be
compressed in cramfs. I'm able to use 1 boot block for blob, another for
static configuration, and the remaining two for configuration data saved
in this way.
