Received: from mta4.srv.hcvlny.cv.net ([167.206.5.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15HSmg-0002B6-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jul 2001 17:12:18 +0100
Received: from d410 (ool-18b97dae.dyn.optonline.net [24.185.125.174])
 by mta4.srv.hcvlny.cv.net
 (iPlanet Messaging Server 5.0 Patch 2 (built Dec 14 2000))
 with ESMTP id <0GFW00HFONXUZB@mta4.srv.hcvlny.cv.net> for
 linux-mtd@lists.infradead.org; Tue, 03 Jul 2001 12:17:54 -0400 (EDT)
Date: Tue, 03 Jul 2001 12:17:58 -0400
From: Harris Landgarten <harrisl@samsungcctvusa.com>
Subject: Bad Magic
To: linux-mtd@lists.infradead.org
Message-id: <005f01c103db$b9336980$0301a8c0@landgarten.local>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
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

I am using JFFS2 as the root and only file system on a custom embedded
arm system. Everything seems to work properly after boot but I am
getting a bad magic message and JFFS2 scan right after JFFS2 loads but
before the root filesystem is mounted. This image file was built using
mkfs.jffs2 with pad=full size of the MTD partition. This was done on an
X86 platform.  The image file was then flashed to the proper location
using my bootloader and tftp. None of this seems to be effecting
operation of the filesystem but I was concerned about the messages.


Harris Landgarten 
