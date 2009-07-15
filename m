Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MR0zw-0002zT-6b
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 09:42:06 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: tytso@mit.edu
Subject: [PATCH 0/2] RFC: Add support for UBI and UBIFS
Date: Wed, 15 Jul 2009 11:38:42 +0200
Message-Id: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Here is two patch to add support for UBI and UBIFS in libblkid
With that, if you type "blkid" it will show you UBIFS filesystem.

The thing is that I'm not sure this patch is really usefull as UBIFS
is a "nodev" filesystem, and it doesn't deal with block devices.

I first started theses patch to be able to do stuff like:
mount /dev/ubi0_0 /mnt/test but we need to patch UBIFS for that.

So, do you think we should be able to do that ? If it's ok, these
two patch are a first step.

Thanks

Corentin Chary (2):
  blkid: add UBI volume support
  blkid: add ubifs support

 lib/blkid/blkidP.h  |    1 +
 lib/blkid/devname.c |   56 ++++++++++++++++++++++++++++++++++-
 lib/blkid/probe.c   |   14 +++++++++
 lib/blkid/probe.h   |   81 +++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 151 insertions(+), 1 deletions(-)
