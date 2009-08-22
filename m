Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mem1X-00058y-Om
	for linux-mtd@lists.infradead.org; Sat, 22 Aug 2009 08:32:39 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 69499650001
	for <linux-mtd@lists.infradead.org>;
	Sat, 22 Aug 2009 10:32:27 +0200 (CEST)
Subject: Ideal NAND flashes for JFFS2 or YAFFS
To: linux-mtd@lists.infradead.org
Message-ID: <OF10187A22.DA46F228-ONC125761A.002E1EB3-C125761A.002EB9BA@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Sat, 22 Aug 2009 10:30:22 +0200
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


We are looking into using NAND flash instead of NOR flashes in our design and I am
trying to find out how the ideal NAND flash should look like to be used as a JFFS2 or YAFFS
file system. We are mainly looking for speed and reliability. Power cuts are common
for our boards.

Any suggestions like generic properties or specific chips are welcome.

 Jocke
