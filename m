Received: from [207.217.120.84] (helo=gull.prod.itd.earthlink.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GPez-0004oE-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 19:12:17 +0000
Received: from sdn-ar-008azphoep265.dialsprint.net ([158.252.146.195] helo=timmy.rcment.net)
	by gull.prod.itd.earthlink.net with esmtp (Exim 3.33 #1)
	id 16GPp4-0007Gx-00
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2001 11:22:43 -0800
Subject: semi-raw access to flash
From: Russ Dill <Russ.Dill@asu.edu>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 18 Dec 2001 12:22:49 -0700
Message-Id: <1008703371.12999.0.camel@timmy>
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

I'm trying to get semi-raw access to flash in userspace. I'd like to be
able to mmap the flash and write to it (with mtd handling the unlock
commands) but not have mtd automatically cache and erase blocks, etc for
me. /dev/mtd? would be great, but its only a char device, so I can't
mmap it. /dev/mtdblock? is mmapable, but it tries to emulate a true
block device with its automatic erasing and rewriting.
