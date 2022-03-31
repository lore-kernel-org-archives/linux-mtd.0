Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4FBC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Mar 2022 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R80qKOHfKE6oZmShHjVZLb9OeCZnQwo8cxS0s+EXFTI=; b=HZzI4m0qSpKOJo
	gjfSbnbEyRtkdRvgg8lgDOSYulCi0+buReOubkLpP31jFlLBb9pD6lTvZl0TMzysZZ5fEECdhv7q4
	2ubG6FXI1SC229vUCT5IZ9fEkAWr58upRcQZYpy4ZuaqYA25n1zv0axt1zaNDAS7li5urlxs5fbci
	U8+ba6j2XS6m7VfVNLOOp2W6Boal3v6cn94ZVm0gsOo8X76KHjCmh0OvBfcMTMbsKABdqhsI/cxCi
	bBPp+nqbGpfPmc2NfpJ4gSMWm5KjeKDKOn9w0oIZAn6rEtz+/7RAVr4/Kkp71yF1gwfeXmfkRg6nt
	h2qDJ2fynDxvLjkl8/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na1xx-003foK-FD; Thu, 31 Mar 2022 21:04:25 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na1xt-003fnO-TJ
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2022 21:04:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B2D1E609B3CB;
 Thu, 31 Mar 2022 23:04:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KXq5bdCwI6eH; Thu, 31 Mar 2022 23:04:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4380A614E2F4;
 Thu, 31 Mar 2022 23:04:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qpofYdCL9ADw; Thu, 31 Mar 2022 23:04:20 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2A640609B3CB;
 Thu, 31 Mar 2022 23:04:20 +0200 (CEST)
Date: Thu, 31 Mar 2022 23:04:20 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <678407645.204324.1648760660133.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS2, UBI and UBIFS fixes for 5.18
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: dHWwhMT9Bg43NSBogJ+HKHdWxxbsHQ==
Thread-Topic: JFFS2, UBI and UBIFS fixes for 5.18
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_140422_285043_FF44A82B 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

Linus,

The following changes since commit aa39cc675799bc92da153af9a13d6f969c348e82:

  jffs2: GC deadlock reading a page that is used in jffs2_write_begin() (2021-12-23 22:33:41 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.18-rc1

for you to fetch changes up to 705757274599e2e064dd3054aabc74e8af31a095:

  ubifs: rename_whiteout: correct old_dir size computing (2022-03-17 23:34:07 +0100)


Please note that there is a minor merge conflict with the folio tree tree
between commits
3b67db8a6ca8 ("ubifs: Fix to add refcount once page is set private")
and
c337f2f4f746 ("ubifs: Convert from invalidatepage to invalidate_folio").

I'll happily review your merge resolution.

----------------------------------------------------------------
This pull request contains fixes for JFFS2, UBI and UBIFS

JFFS2:
        - Fixes for various memory issues

UBI:
        - Fix for a race condition in cdev ioctl handler

UBIFS:
	- Fixes for O_TMPFILE and whiteout handling
	- Fixes for various memory issues

----------------------------------------------------------------
Baokun Li (5):
      ubi: Fix race condition between ctrl_cdev_ioctl and ubi_cdev_ioctl
      jffs2: fix use-after-free in jffs2_clear_xattr_subsystem
      jffs2: fix memory leak in jffs2_do_mount_fs
      jffs2: fix memory leak in jffs2_scan_medium
      ubifs: rename_whiteout: correct old_dir size computing

Zhihao Cheng (11):
      ubifs: rename_whiteout: Fix double free for whiteout_ui->data
      ubifs: Fix deadlock in concurrent rename whiteout and inode writeback
      ubifs: Fix wrong number of inodes locked by ui_mutex in ubifs_inode comment
      ubifs: Add missing iput if do_tmpfile() failed in rename whiteout
      ubifs: Rename whiteout atomically
      ubifs: Fix 'ui->dirty' race between do_tmpfile() and writeback work
      ubifs: Rectify space amount budget for mkdir/tmpfile operations
      ubifs: setflags: Make dirtied_ino_d 8 bytes aligned
      ubifs: Fix read out-of-bounds in ubifs_wbuf_write_nolock()
      ubifs: Fix to add refcount once page is set private
      ubi: fastmap: Return error code if memory allocation fails in add_aeb()

hongnanli (1):
      fs/jffs2: fix comments mentioning i_mutex

 drivers/mtd/ubi/build.c   |   9 +-
 drivers/mtd/ubi/fastmap.c |  28 ++++--
 drivers/mtd/ubi/vmt.c     |   8 +-
 fs/jffs2/build.c          |   4 +-
 fs/jffs2/fs.c             |   2 +-
 fs/jffs2/jffs2_fs_i.h     |   4 +-
 fs/jffs2/scan.c           |   6 +-
 fs/ubifs/dir.c            | 238 ++++++++++++++++++++++++++++------------------
 fs/ubifs/file.c           |  14 +--
 fs/ubifs/io.c             |  34 ++++++-
 fs/ubifs/ioctl.c          |   2 +-
 fs/ubifs/journal.c        |  52 ++++++++--
 fs/ubifs/ubifs.h          |   2 +-
 13 files changed, 259 insertions(+), 144 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
