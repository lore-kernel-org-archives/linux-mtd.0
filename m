Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A369C7EE26
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vvvaTfymumVzxelrd6qbvKkT/FZ/Y/cqbDvXJb/y2wk=; b=oPYppZHFDISyCc
	Oicxhga8dsPYteJjuUz/uOKuOktX+VGjYX60fNNNuoUsGmVKMWFRy+Jp1Cfg0QjWJ255zEncM2A0f
	xJqlk0A0tX3UXr5uiTSqyuIwaAWuM9cTbsJkrOMkzrkOls2ptPtlrt1YhV3psPb37swcTMVWNTiMi
	EJruiqH08FDJFfRPqWFn3g2iDZ7PxjHparuIqLP2ydTmnv/e0Cgro9O2bT8ndOEmuC/0rOvc0tKTk
	n5vOllcrkLsUVHlhd0+ZFd7lGp+PWLh7boN/5tgyumWJEquFrkJDEVQKruHmHJhTR7EMf7KgnUKHO
	lJmw1SxF42YKcRu08yEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MiE-009GUx-32;
	Tue, 23 May 2023 07:45:42 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mi9-009GTZ-27;
	Tue, 23 May 2023 07:45:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: fix the name_to_dev_t mess
Date: Tue, 23 May 2023 09:45:11 +0200
Message-Id: <20230523074535.249802-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

this series tries to sort out accumulated mess around the name_to_dev_t
function.  This function is intended to allow looking up the dev_t of a
block device based on a name string before the root file systems is
mounted and thus the normal path based lookup is available.

Unfortunately a few years ago it managed to get exported and used in
non-init contexts, leading to the something looking like a path name
also beeing lookuped up by a different and potential dangerous
algorithm.

This series does a fair amount of refactoring and finally ends up with
the renamed and improved name_to_dev_t only beeing available for the
early init code again.

The series is against Jens' for-6.5/block tree but probably applies
against current mainline just fine as well.

A git tree is also available here:

    git://git.infradead.org/users/hch/block.git blk-init-cleanup

Gitweb:

    http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/blk-init-cleanup

Diffstat:
 Documentation/admin-guide/kernel-parameters.txt |    2 
 arch/alpha/kernel/setup.c                       |    2 
 arch/ia64/kernel/setup.c                        |    2 
 arch/powerpc/platforms/powermac/setup.c         |    3 
 block/Makefile                                  |    2 
 block/early-lookup.c                            |  315 ++++++++++++++++++
 block/genhd.c                                   |   92 -----
 drivers/base/dd.c                               |    6 
 drivers/md/dm-init.c                            |    4 
 drivers/md/dm-snap.c                            |   14 
 drivers/md/dm-table.c                           |   26 -
 drivers/md/md-autodetect.c                      |    3 
 drivers/mtd/devices/block2mtd.c                 |   62 ++-
 fs/pstore/blk.c                                 |    4 
 include/linux/blkdev.h                          |    6 
 include/linux/device-mapper.h                   |    2 
 include/linux/device/driver.h                   |    2 
 include/linux/mount.h                           |    1 
 include/linux/root_dev.h                        |    9 
 init/do_mounts.c                                |  416 ++++++------------------
 init/do_mounts.h                                |   14 
 init/do_mounts_initrd.c                         |   11 
 kernel/power/hibernate.c                        |  167 +++++----
 kernel/power/power.h                            |    3 
 kernel/power/swap.c                             |    2 
 25 files changed, 603 insertions(+), 567 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
