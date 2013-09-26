Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPCqQ-0000WZ-B3
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2013 14:47:07 +0000
Received: from 3capp-gmx-bs09.server.lan ([172.19.170.60]) by
 mrigmx.server.lan (mrigmx002) with ESMTP (Nemesis) id
 0MZzWr-1V9ShU4ADX-00LpfC for <linux-mtd@lists.infradead.org>; Thu, 26 Sep
 2013 16:46:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-6be4e199-095d-46dd-9ca4-3f18d68ca479-1380206799874@3capp-gmx-bs09>
From: dbextern@gmx.de
To: linux-mtd@lists.infradead.org
Subject: Does UBI take into account factory supplied bad block information?
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Sep 2013 16:46:39 +0200 (CEST)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

Reading the datasheet of our NAND flash MT29F4G08 I came across the information about factory supplied bad block information which is stored in the first two pages of each block. The manufacturer advices to use this information because it might not be reproducible in better than worst case conditions (which he applies in the end test).

My question ist now whether a ubiformat takes into account this information or not? If not I'd try to read that information myself beforehand and supply it to the ubiformat myself. 

Thanks and best regards, 
Sebastian
