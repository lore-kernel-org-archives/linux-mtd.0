From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Sun, 30 Mar 2003 21:07:43 +0200
Subject: not enough blocks for JFFS?
In-Reply-To: <20030330190120.GA31483@wohnheim.fh-wedel.de>
References: <3E7E6DE5.5000003@interepoch.com.tw> <1048483100.3593.3.camel@gobbles> <20030325000503.GA14469@wohnheim.fh-wedel.de> <1048596666.12528.39.camel@passion.cambridge.redhat.com> <20030325133335.GF29035@wohnheim.fh-wedel.de> <1048602999.12528.156.camel@passion.cambridge.redhat.com> <20030330190120.GA31483@wohnheim.fh-wedel.de>
Message-ID: <20030330190742.GA12927@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 30 March 2003 21:01:20 +0200, J?rn Engel wrote:
> 
> It might be a good idea to get rid of the macros and add those values
> to the struct superblock instead. Then we can calculate their values
> on mount. Everything else can follow.

And in the next patch, I'd like to add one to all the numbers we
calculated and print out a big fat warning, if we ever needed this
safety block. :)

J?rn

-- 
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra
