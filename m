Received: from mgw-x4.nokia.com ([131.228.20.27])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgO8P-00064u-FD
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 12:59:05 +0000
Received: from esvir04nok.ntc.nokia.com (esvir04nokt.ntc.nokia.com
	[172.21.143.36])i0DCut227701	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jan 2004 14:56:55 +0200 (EET)
Received: from esebh003.NOE.Nokia.com (unverified) by esvir04nok.ntc.nokia.com
	<T671c24f463ac158f24072@esvir04nok.ntc.nokia.com> for
	<linux-mtd@lists.infradead.org>; Tue, 13 Jan 2004 14:56:55 +0200
Received: from angel.research.nokia.com (localhost.localdomain [127.0.0.1])
	i0DCoVRF006372
	for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2004 14:50:31 +0200
Received: (from jlavi@localhost)
	by angel.research.nokia.com (8.12.8/8.12.8/Submit) id i0DCoVrf006370
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 14:50:31 +0200
Date: Tue, 13 Jan 2004 14:50:31 +0200
From: "Jarkko Lavinen (NMP/Helsinki)" <jarkko.lavinen@nokia.com>
To: MTD List <linux-mtd@lists.infradead.org>
Message-ID: <20040113125031.GA5146@angel.research.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Subject: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working with an embedded device with 64MB nand chip. I am able to
read from chip at 6MB/s and able to read the whole chip in 10 seconds
using character mtd device. The device has Omap1610 running at 190MHz,
kernel 2.4.21.

With 80% file system usage the mount time is 8 seconds which is
unacceptable for root file system on a handheld device. I assume the
scan time is linear with respect to the size of the flash partition
and the file system usage.

Is there anything that could be done to reduce the mount time of large
JFFS2 partitions?  Lazy mounting with prioritized scanning?

Jarkko Lavinen
