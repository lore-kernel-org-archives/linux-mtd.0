Received: from scopuli.esotechnik.de ([2a02:c205:3001:6788::1]
 helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxwvZ-0002px-Mm
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 16:14:45 +0000
Received: by mail.esotechnik.net (Postfix) with ESMTPSA id 89256AE0B80
 for <linux-mtd@lists.infradead.org>; Thu,  6 Sep 2018 18:14:26 +0200 (CEST)
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] Virtual MTD concat device driver
Date: Thu,  6 Sep 2018 18:14:10 +0200
Message-Id: <20180906161413.6335-1-kernel@nospam.obeliks.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody,

when porting my router board from a mach-file based OpenWRT target to a
device-tree based target, I found that there is no generic way to create
a mtd_concat device from within the dts. The following patches attempt
to provide that possibility.

According to [1], patches should be provided in a git tree if possible,
but to me it was a bit unclear whether repositories outside of
git.infradead.org are also acceptable. If this is the case, the changes
can be pulled from branch 'mtd_concat' at [2] (web view at [3]. The
commits are based on mtd/next even though the repository says forked
from torvalds/linux). In addition I'm sending the patches to the mailing
list.

Thanks for your feedback!

Best regards
Bernhard Frauendienst

PS: This is my first submission to this mailing list and the linux
kernel in general. I've tried to meet all requirements, but please
let me know if I have made any rookie mistakes.

[1] http://www.linux-mtd.infradead.org/source.html
[2] https://github.com/oxc/linux.git
[3] https://github.com/oxc/linux/commits/mtd_concat


Bernhard Frauendienst (3):
  mtd: core: add get_mtd_device_by_node
  dt-bindings: add bindings for mtd-concat devices
  mtd: mtdconcat: add dt driver for concat devices

 .../devicetree/bindings/mtd/mtd-concat.txt    |  21 +++
 drivers/mtd/Kconfig                           |   2 +
 drivers/mtd/Makefile                          |   3 +
 drivers/mtd/composite/Kconfig                 |  12 ++
 drivers/mtd/composite/Makefile                |   7 +
 drivers/mtd/composite/virt_concat.c           | 123 ++++++++++++++++++
 drivers/mtd/mtdcore.c                         |  39 ++++++
 include/linux/mtd/mtd.h                       |   2 +
 8 files changed, 209 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtd-concat.txt
 create mode 100644 drivers/mtd/composite/Kconfig
 create mode 100644 drivers/mtd/composite/Makefile
 create mode 100644 drivers/mtd/composite/virt_concat.c

-- 
2.17.1
