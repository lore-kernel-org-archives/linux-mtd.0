Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PBTP5-0006Sf-Pn
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2010 14:24:32 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 966EB2597D8
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Oct 2010 16:24:28 +0200 (CEST)
Subject: Preventing FS full
To: linux-mtd@lists.infradead.org
Message-ID: <OF2C2A2D93.9DE54A3F-ONC12577CA.004EC5B1-C12577CA.004F2498@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 28 Oct 2010 16:24:27 +0200
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


Is there any way to temporarily lower the FS full limit(preferably on a process basis)
on JFFS2?

I want to safeguard the OS from FS full due to some process filling up the disk.

    Jocke
