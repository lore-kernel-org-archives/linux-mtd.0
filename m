Received: from david.siemens.de ([192.35.17.14])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2TWh-0002WM-ND
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2004 07:43:45 -0400
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.12.6/8.12.6) with ESMTP id i81BgElO000052
	for <linux-mtd@lists.infradead.org>; Wed, 1 Sep 2004 13:42:14 +0200
Received: from mchh9ega.mchh.siemens.de (mchh9ega.mchh.siemens.de
	[139.21.194.56])
	by mail3.siemens.de (8.12.6/8.12.6) with ESMTP id i81Bg3fU007856
	for <linux-mtd@lists.infradead.org>; Wed, 1 Sep 2004 13:42:13 +0200
Message-ID: <7F3FE9B2FBF6194691BC493C6699C0B1568B8D@mchh9esa.mchh.siemens.de>
From: Kuefmann Andreas ICM CP RD SD 1 <andreas.kuefmann@siemens.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 1 Sep 2004 13:41:58 +0200 
MIME-Version: 1.0
Content-Type: text/plain
Subject: how to change size of MTD partitions at runtime
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm searching for a solution to dynamically change the size of
MTD partitions at runtime.

This functionality is required for a flash update of kernel and/or
rootfs in the special case that the new kernel/rootfs is larger
than the old one. (in an embedded environment)

1.)
there is no problem in erasing the flash, e.g eraseall /dev/mtd?,
(acting from a chrooted environment)

2.)
However, reprogramming the flash with a larger image (now
exceeding the limits of the previous partition) isn't as
easy as a cp newimage.img /dev/mtd?.

The MTD layer will still rely on the (old) partition sizes
that were valid during system startup. (taken over from a
U-BOOT environment)

My plans are as follows:
- erase the flash partitions
- adapt the u-boot environment to reflect the new mtd partition sizes
- force the MTD subsystem to "re-read" the partition table in u-boot's
  environment.
- cp the new images to /dev/mtd? (which now reflect the changed
  partition sizes)

My question now is:
- How can I manage to force a re-read of the partition table?

Or can you think of another solution to change MTD partitions at
runtime?

Thank you,
regards,
- Andy
