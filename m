Received: from amalthea.dnx.de ([193.108.181.146])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgiJ2-0003mv-Qw
	for linux-mtd@lists.infradead.org; Sat, 03 Jul 2004 07:03:41 -0400
Received: from metis.pengutronix.de ([213.252.143.165]:55714)
	by amalthea.dnx.de with asmtp (Exim 4.34) id 1BgiIn-0008Ko-O0
	for linux-mtd@lists.infradead.org; Sat, 03 Jul 2004 13:03:32 +0200
Received: from rsc by metis.pengutronix.de with local (Exim 3.36 #1 (Debian))
	id 1BgiIn-00073p-00
	for <linux-mtd@lists.infradead.org>; Sat, 03 Jul 2004 13:03:25 +0200
Date: Sat, 3 Jul 2004 13:03:25 +0200
From: Robert Schwebel <robert@schwebel.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20040703110325.GA26836@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: Robert Schwebel <rsc@pengutronix.de>
Subject: [PATCH] gen_probe forgets to clean chip_map
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On systems that have more than one flash chip in a probe window with
some space between the chips we recently found that erase operations are
performed on the wrong chip. This comes from the chip_map being
allocated in genprobe_ident_chips() but it is never cleaned before being
used. Here is a patch: 

----------8<----------
diff -urN mtd-20040622-1/drivers/mtd/chips/gen_probe.c mtd-20040622-1-ptx1/drivers/mtd/chips/gen_probe.c
--- mtd-20040622-1/drivers/mtd/chips/gen_probe.c	2003-11-09 00:00:04.000000000 +0100
+++ mtd-20040622-1-ptx1/drivers/mtd/chips/gen_probe.c	2004-06-25 14:38:28.000000000 +0200
@@ -114,6 +114,7 @@
 		kfree(cfi.cfiq);
 		return NULL;
 	}
+	memset(chip_map, 0, ((max_chips / 8) + ((max_chips % 8) ? 1 : 0)));
 
 	set_bit(0, chip_map); /* Mark first chip valid */
----------8<----------
 
Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
Signed-off-by: Benedikt Spranger <b.spranger@pengutronix.de>
Signed-off-by: Kai-Uwe Bloem <linux-development@auerswald.de>

Robert
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hornemannstraﬂe 12,  31137 Hildesheim, Germany
    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4
