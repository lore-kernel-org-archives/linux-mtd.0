Received: from alcor.twinsun.com ([198.147.65.9] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19xWhW-0004h2-Pi
	for <linux-mtd@lists.infradead.org>; Thu, 11 Sep 2003 20:01:55 +0100
Received: from green.twinsun.com ([192.54.239.71])
	by alcor.twinsun.com (8.12.6/8.12.6) with ESMTP id h8BJ1Fff007597
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Sep 2003 12:01:15 -0700 (PDT)
Received: from shade.twinsun.com (shade.twinsun.com [192.54.239.27])
	by green.twinsun.com (8.11.7+Sun/8.11.7) with SMTP id h8BJ1FW05125
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Sep 2003 12:01:15 -0700 (PDT)
Received: from green.twinsun.com ([192.54.239.71])
 by shade.twinsun.com (SAVSMTP 3.1.0.29) with SMTP id M2003091112011403085
 for <linux-mtd@lists.infradead.org>; Thu, 11 Sep 2003 12:01:14 -0700
To: linux-mtd@lists.infradead.org
From: Junio C Hamano <junkio@twinsun.com>
Date: Thu, 11 Sep 2003 12:01:14 -0700
Message-ID: <7vy8wvgnet.fsf@mae.twinsun.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: TX49 NAND supported?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does anybody have a working tx4925 NAND driver that can be used
with the latest mtd from infradead CVS?  I have located a copy
of tx4925ndfmc.c with 2002 timestamp by Toshiba Corporation
(GPLv2) but it appears to use an API incompatible with the
current one.  Among other things, it seems to think that struct
nand_chip has fields like IO_ADDR, CTRL_ADDR, CLE, ALE, NCE,
ioread, iowrite, etc, and appears to predate the following
change in include/linux/mtd/nand.h:

 *   10-29-2001 TG      changed nand_chip structure to support 
 *                      hardwarespecific function for accessing
 *   control lines
