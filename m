From: timwu@interepoch.com.tw (Tim Wu)
Date: Tue, 25 Mar 2003 10:13:09 +0800
Subject: not enough blocks for JFFS?
In-Reply-To: <20030325000503.GA14469@wohnheim.fh-wedel.de>
References: <3E7E6DE5.5000003@interepoch.com.tw> <1048483100.3593.3.camel@gobbles> <20030325000503.GA14469@wohnheim.fh-wedel.de>
Message-ID: <3E7FBB35.1050100@interepoch.com.tw>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

J?rn:
Thanks for your quick patch.  I will test it.

JFFS2 without compression?
What does it different from JFFS?

No compression is OK for me.  That's why I chose JFFS instead of JFFS2.
Can the idea "with less reserved blocks" apply to JFFS?
I prefer JFFS because JFFS2 is much larger than JFFS in code size, which 
makes
I have to enlarge my flash partition for kernel.


J?rn Engel:

>But a filesystem is nicer than a quick user space implementation. :)
>
>Today I have tweaked jffs2 a little to work without compression,
>depending on mount options. (patch will follow)
>
>The nice effect of this is that you should be able to work with less
>reserved blocks. My estimate is somewhere between one and three. In
>Tims case, that would leave him with 16kB net space, enough for his
>data. Cool.
>
>Changing the amount of reserved blocks per filesystem (not per kernel)
>is a bit tricky. And figuring out, how many are really needed requires
>quite a bit of testing or some math. Without compression, math might
>even be doable. :)
>
>Tim, would you volunteer to test patches?
>
>J?rn
>
>  
>
