Received: from metis.extern.pengutronix.de ([83.236.181.26])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbKCK-0005a2-V8
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 11:23:02 -0400
Received: from rsc by metis.extern.pengutronix.de with local (Exim 3.36 #1
	(Debian)) id 1DbKCG-0001Ob-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 May 2005 17:22:56 +0200
Date: Thu, 26 May 2005 17:22:56 +0200
From: Robert Schwebel <robert@schwebel.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050526152256.GS6681@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Sender: Robert Schwebel <rsc@pengutronix.de>
Subject: Fast rollout process on jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

Is there a method for faster rollout of an embedded root filesystem on
jffs2? I'm currently first erase the chip from u-boot, then copy the
image created with mkfs.jffs2 into the empty flash. On first startup it
seems to detect that the partition is larger than the actual image and
it takes quite some time before the / mount is finished. 

Does anybody know a faster variant? 

Robert
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
