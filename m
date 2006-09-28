Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GT3tA-000220-E0
	for linux-mtd@lists.infradead.org; Thu, 28 Sep 2006 22:57:53 +0100
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: <linux-mtd@lists.infradead.org>
Subject: Different erase block sizes in a JFFS2 partion.
Date: Thu, 28 Sep 2006 23:55:17 +0200
Message-ID: <01de01c6e348$c94e7330$1267a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Got multiple NOR chips with top and bottom boot blocks with diffrent EB size
then the rest of the blocks. 
I want to put a JFFS2 FS spanning over several chips which makes the FS
cross top/bottom boot blocks.
Since(last I looked) JFFS2 can't deal with diffrent EB sizes on the same
partition I need do something about it.
I want to use point()/unpoint() and a cached memory mapping for burst access
and I don't know how to do that yet and I would like some ideas.

One idea I have is to reserve the boot blocks with a new type of JFFS2
node(similar to JFFS2_FEATURE_ROCOMPAT) that spans the whole boot block.
JFFS2 should not try to move or delete nodes of this type. Not sure
if thats a good idea or if its hard to impl. yet.

Better ideas anyone?
