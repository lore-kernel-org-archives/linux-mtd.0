Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3kRo-0002Hg-SM
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 06:59:25 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 639402597D8
	for <linux-mtd@lists.infradead.org>;
	Thu,  7 Oct 2010 08:59:21 +0200 (CEST)
Subject: JFFS2 very slow when erasing
To: linux-mtd@lists.infradead.org
Message-ID: <OF23585AD5.AC5BB50F-ONC12577B5.0025413E-C12577B5.00263D39@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 7 Oct 2010 08:57:40 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


With 2.6.35 JFFS2 takes a very long time cp files while it erases:
 cp big_file test
 rm test
 cp big_file test
The last cp op. takes several times longer because JFFS2 is erasing.
Revering the patches I helped out with make JFFS2 go fast again:
  jffs2: Stop triggering block erases from jffs2_write_super()
  jffs2: Rename jffs2_erase_pending_trigger() to jffs2_dirty_trigger()
  jffs2: Use jffs2_garbage_collect_trigger() to trigger pending erases
  jffs2: Require jffs2_garbage_collect_trigger() to be called with lock held
  jffs2: Wake GC thread when there are blocks to be erased
  jffs2: Erase pending blocks in GC pass, avoid invalid -EIO return

The final patches were somewhat different than the ones I originally wrote
and I THINK those didn't make JFFS2 go this slow.

I suspect there is a locking problem somewhere.

 Jocke
