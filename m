Received: from bs1.dnx.de ([213.252.143.130] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1765Qx-0000Pp-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 09:07:24 +0100
Received: from p50861b37.dip.t-dialin.net ([80.134.27.55] helo=callisto.pengutronix.de)
	by bs1.dnx.de with asmtp (Exim 3.34 #1)
	id 1765Qv-0007MY-00
	for linux-mtd@lists.infradead.org; Fri, 10 May 2002 10:07:21 +0200
Date: Fri, 10 May 2002 10:06:55 +0200
From: Robert Schwebel <robert@schwebel.de>
To: linux-mtd@lists.infradead.org
Subject: mtdblock and devfs
Message-ID: <20020510100655.T15258@schwebel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi, 

using devfs and mtd from CVS I see only the char device nodes in /dev/mtd,
although I've enabled CONFIG_MTD_BLOCK=y: 

# ls -l /dev/mtd/
crw-rw-rw-    1 0        0         90,   0 Jan  1  1970 0
crw-rw-rw-    1 0        0         90,   1 Jan  1  1970 0ro
crw-rw-rw-    1 0        0         90,   2 Jan  1  1970 1
crw-rw-rw-    1 0        0         90,   3 Jan  1  1970 1ro
crw-rw-rw-    1 0        0         90,   4 Jan  1  1970 2
crw-rw-rw-    1 0        0         90,   5 Jan  1  1970 2ro

Any idea? 

Robert
-- 
 +--------------------------------------------------------+
 | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
 | Pengutronix - Linux Solutions for Science and Industry |
 |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
 |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
 +--------------------------------------------------------+
