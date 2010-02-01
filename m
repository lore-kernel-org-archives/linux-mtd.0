Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nc2bE-0007a9-43
	for linux-mtd@lists.infradead.org; Mon, 01 Feb 2010 20:10:25 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id D7A63259870
	for <linux-mtd@lists.infradead.org>;
	Mon,  1 Feb 2010 21:10:09 +0100 (CET)
Subject: lock_super twice?
To: linux-mtd@lists.infradead.org
Message-ID: <OFBAF6655B.16A56429-ONC12576BD.006E37E2-C12576BD.006E950A@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 1 Feb 2010 21:07:51 +0100
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


I am looking at jffs2_write_super() on how to make erase stop when you umount
the root FS and I don't get the locking here. Both fs/super.c and
jffs_write_super take do lock_super(sb). How does that work?

 Jocke
