Received: from brmea-mail-4.sun.com ([192.18.98.36])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HWh4B-0004qj-JA
	for linux-mtd@lists.infradead.org; Wed, 28 Mar 2007 18:56:32 -0400
Received: from fe-amer-04.sun.com ([192.18.108.178])
	by brmea-mail-4.sun.com (8.13.6+Sun/8.12.9) with ESMTP id
	l2SMuT3c002498
	for <linux-mtd@lists.infradead.org>; Wed, 28 Mar 2007 22:56:29 GMT
Received: from conversion-daemon.mail-amer.sun.com by mail-amer.sun.com
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	id <0JFM00701YD35900@mail-amer.sun.com> (original mail from
	shashi@sun.com)
	for linux-mtd@lists.infradead.org; Wed, 28 Mar 2007 16:56:29 -0600 (MDT)
Received: from [129.146.53.50] by mail-amer.sun.com
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPSA id <0JFM0080PYE4ZA67@mail-amer.sun.com> for
	linux-mtd@lists.infradead.org; Wed, 28 Mar 2007 16:56:29 -0600 (MDT)
Date: Wed, 28 Mar 2007 15:56:28 -0700
From: Shashi Rao <shashi@sun.com>
Subject: [PATCH] [MTD] fix fwh_lock locking
Sender: Shashikant.Rao@sun.com
To: linux-mtd@lists.infradead.org, Shashi Rao <shashi@sun.com>
Message-id: <460AF29C.4090409@sun.com>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

This is on a custom board with a mapping driver access to an ST
M50LPW080 chip. This chip is probed successfully with
do_map_probe("jedec_probe",...). If I use the mtdchar interface to
perform unlock->erase->program->lock on any of the 16 eraseblocks in the
chip, the chip is left in FL_STATUS mode while the data structures
believe that the chip is in FL_READY mode. Hence, any subsequent reads
to any flash byte results in 0x80 being read.

Thanks.

Signed-off-by: Shashi Rao <shashi at sun.com>

--- linux-2.6.20.3.orig/drivers/mtd/chips/fwh_lock.h
+++ linux-2.6.20.3/drivers/mtd/chips/fwh_lock.h
@@ -65,11 +65,12 @@
 		return ret;
 	}

+	chip->oldstate = chip->state;
 	chip->state = xxlt->state;
 	map_write(map, CMD(xxlt->val), adr);

 	/* Done and happy. */
-	chip->state = FL_READY;
+	chip->state = chip->oldstate;
 	put_chip(map, chip, adr);
 	spin_unlock(chip->mutex);
 	return 0;
