Received: from amalthea.dnx.de ([193.108.181.146] ident=mail)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A2Pj3-0007zg-54
	for <linux-mtd@lists.infradead.org>; Thu, 25 Sep 2003 07:35:41 +0100
Received: from metis.pengutronix.de ([213.252.143.165]:56990)
	by amalthea.dnx.de with asmtp (Exim 4.12)
	id 1A2Pi4-0007aA-00
	for linux-mtd@lists.infradead.org; Thu, 25 Sep 2003 08:34:40 +0200
Received: from ganymed.pengutronix.de ([213.252.143.162] ident=mail)
	by metis.pengutronix.de with esmtp (Exim 3.35 #1 (Debian))
	id 1A2PiH-0007ag-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Sep 2003 08:34:53 +0200
Received: from robert by ganymed.pengutronix.de with local (Exim 3.36 #1
	(Debian))	id 1A2PiC-0002HI-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Sep 2003 08:34:48 +0200
Date: Thu, 25 Sep 2003 08:34:48 +0200
From: Robert Schwebel <robert@schwebel.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20030925063448.GD25427@pengutronix.de>
Mime-Version: 1.0
Content-Disposition: inline
Sender: Robert Schwebel <robert@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Subject: mtd utilities
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

has there ever been an "official" release of the MTD user space
utilities? I have included them in the PTXdist [1] project, but it is a
little bit unsatisfying only to make snapshots from time to time. If
not, would there be interest in making a packet? I would volunteer to do
this from time to time if nobody else does. 

Btw, the mkcramfs utility has disappeared from recent kernels, it might
be an idea to add it to the MTD cvs. 

Robert 

[1] http://www.pengutronix.de/software/ptxdist_en.html
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hornemannstraﬂe 12,  31137 Hildesheim, Germany
    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4
