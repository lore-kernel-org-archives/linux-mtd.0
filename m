Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoFlf-0004j9-GX
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 10:26:00 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HoFl3-0000JK-RL
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 11:25:22 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 11:25:21 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 11:25:21 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Opening flash device for update - locking
Date: Wed, 16 May 2007 09:24:35 +0000 (UTC)
Message-ID: <loom.20070516T111938-933@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A utility program cannot open a /dev/mtd  in mode O_RDWR - permission denied
(/dev permission bits are OK)

Presumably this is because the device is locked.

OK, there is a MEMUNLOCK ioctl - hopefully this can be called
on a device that is only opened in O_RDONLY mode ?!

Regards,
MikeW
