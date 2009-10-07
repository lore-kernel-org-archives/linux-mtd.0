Received: from mail.perches.com ([173.55.12.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MvOPJ-0008Q0-6y
	for linux-mtd@lists.infradead.org; Wed, 07 Oct 2009 04:45:50 +0000
From: Joe Perches <joe@perches.com>
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/8] Add vsprintf extension %pU to print UUID/GUIDs and use it
Date: Tue,  6 Oct 2009 21:45:33 -0700
Message-Id: <1254890742-28245-1-git-send-email-joe@perches.com>
Cc: cluster-devel@redhat.com, xfs@oss.sgi.com, xfs-masters@oss.sgi.com,
	Neil Brown <neilb@suse.de>, Alex Elder <aelder@sgi.com>,
	Mauro Carvalho Chehab <mchehab@infradead.org>, linux-raid@vger.kernel.org,
	Artem Bityutskiy <dedekind@infradead.org>,
	Laurent Pinchart <laurent.pinchart@skynet.be>,
	linux-mtd@lists.infradead.org, Matt Mackall <mpm@selenic.com>,
	linux-media@vger.kernel.org, Steven Whitehouse <swhiteho@redhat.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using %pU makes an x86 defconfig image a bit smaller

before:	$ size vmlinux
   text    data     bss     dec     hex filename
6976022  679572 1359668 9015262  898fde vmlinux

after:	$ size vmlinux
   text	   data	    bss	    dec	    hex	filename
6975863	 679652	1359668	9015183	 898f8f	vmlinux

Joe Perches (8):
  lib/vsprintf.c: Add %pU to print UUID/GUIDs
  random.c: Use %pU to print UUIDs
  drivers/firmware/dmi_scan.c: Use %pUB to print UUIDs
  drivers/md/md.c: Use %pU to print UUIDs
  drivers/media/video/uvc: Use %pUl to print UUIDs
  fs/gfs2/sys.c: Use %pUB to print UUIDs
  fs/ubifs: Use %pUB to print UUIDs
  fs/xfs/xfs_log_recover.c: Use %pU to print UUIDs

 drivers/char/random.c                |   10 +---
 drivers/firmware/dmi_scan.c          |    5 +--
 drivers/md/md.c                      |   16 ++------
 drivers/media/video/uvc/uvc_ctrl.c   |   69 ++++++++++++++++------------------
 drivers/media/video/uvc/uvc_driver.c |    7 +--
 drivers/media/video/uvc/uvcvideo.h   |   10 -----
 fs/gfs2/sys.c                        |   16 +------
 fs/ubifs/debug.c                     |    9 +---
 fs/ubifs/super.c                     |    7 +---
 fs/xfs/xfs_log_recover.c             |   14 ++-----
 lib/vsprintf.c                       |   62 ++++++++++++++++++++++++++++++-
 11 files changed, 114 insertions(+), 111 deletions(-)
