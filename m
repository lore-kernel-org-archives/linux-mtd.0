Received: from taurus-1.siol.net ([193.189.160.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tud8-0001WI-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 19:41:54 +0100
Received: from BSN-77-247-181.dsl.siol.net ([193.77.247.181])
          by taurus-1.siol.net
          (InterMail vK.4.03.05.03 201-232-132-103 license 5ac1ec526f2360901e54ffce7671dc4c)
          with ESMTP
          id <20020924183623.FMRF18509.taurus-1@BSN-77-247-181.dsl.siol.net>
          for <linux-mtd@lists.infradead.org>;
          Tue, 24 Sep 2002 20:36:23 +0200
Subject: jffs, jffs2
From: Simon Posnjak <simon@activetools.si>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 24 Sep 2002 20:41:52 +0200
Message-Id: <1032892912.2909.139.camel@klada.dyndns.org>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all,

I have some newbie quastions about jffs and jffs2. Our SA1110 based
board has 16MB of NOR based FLASH (Intel StrataFlesh).

-Which one (jffs or jffs2) would be a better choice(I need stability and
good back up on power fail)? Which version should I use (CVS or the one
that comes with vanila Linux kernel). 

-Have can I create a empty image? (I have a partition of 8 MB and I want
to put jffs or jffs2 on it)

-Have can I write the image from my bootloader - I mean how should I
modify my bootloader to support writing of a jffs/jffs2 image to flash
so that I can boot my system from it(only root will be on jffs - the
kernel will be preloaded and booted by bootloader). (My bootloader is
blob) 

	lp simon
