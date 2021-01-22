Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F441C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C709923A84
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C709923A84
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GWq/TkdhTFhsuhWtCr7YQV3V4P0MiqQewiPOsDJJu6E=; b=vwMJBZwqcB1SnFqqLTcoi9VjWF
	yq0gGKM5x5yqViG5TBXBtBH5jEPR+fBP1fJhdAPIWRS7ff4+lhPd8MOSurhSXux3CTUCuO1R0c/iU
	zdT/q/Tc3IfPxrDeCqXWXDNp8jGlV+hC1ojFxRFeZMXGA3U1kqvXWJ/mKW+iWtpmkeFFJV4s3YP/6
	zhJlqq0A4LrX+9uR49E9MAtUWrcHW7wGi+SMCAKYkmzR0h2H0smpr33f6xxuzAK0WvRu2DqPy3r6I
	lPtMjS55nuFvUbptsXF80RD/U0ERCXauKz0V/TorDA/sh79LVTx+m/tbKcehgOFVsZg8Ue74x7Zr8
	BGJAY0LQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2yAN-0006rd-4h; Fri, 22 Jan 2021 15:16:03 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2yAA-0006n7-U5
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 15:15:55 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA1-0004Bp-HF; Fri, 22 Jan 2021 16:15:41 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA0-0003qZ-MU; Fri, 22 Jan 2021 16:15:40 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v5 0/8] Add quota support to UBIFS
Date: Fri, 22 Jan 2021 16:15:28 +0100
Message-Id: <20210122151536.7982-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_101551_032019_260580A6 
X-CRM114-Status: GOOD (  28.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series adds quota support to UBIFS.

I realized that counting xattr inodes for quota is quite broken, so I
removed it this time. The problem is that the code used to add the xattr
inodes to the owners of the xattr inodes which are not necessarily the
owner of the files. When root added xattrs to files he doesn't own or
when a file was chowned then the inode count became wrong.

One point that has lead to discussions last time was the integration of
the mountpoint used for quotactl rather than the path to a block device
(which doesn't exist for UBIFS). Last time Al suggested that getting a
super_block from a path should be in core code. I was about to integrate
Jans approach of introducing several variants of a hold_super_()
function when I realized that the variants of get_super_* took the
opposite direction and are now open coded in quota code. I took a
similar approach of open coding this which brings us close to where we
once were. Let's see how welcomed this is.

This series follows a very simple approach to quota: Neither the quota
limits nor the quota usage are ever written to the medium. The quota
usage is reconstructed from the filesystem during mount time. The quota
limits must be set by the user each time after mount. This is probably
not very convenient for systems that are used interactively, but UBIFS
is targetted to embedded systems and here running a script after mount
shouldn't be a problem. This of course isn't the way quota was thought
to be, but I believe this is a good compromise for a feature that I predict
is only rarely used on UBIFS. The big upside of this approach is that
no on-disk format changes are required and thus we can't get any
broken/corrupt filesystems because of quota support. Reconstructing the
quota data each time during mount has an noticable but I think for many
cases acceptable time overhead. I mounted a ~56MiB rootfs with 1920 files
which takes around 0.7s longer when quota is enabled.

As UBIFS works on mtd there is no block_device involved. The quotactl
system call requires a path to a block device as argument. To overcome
this we add support for passing the mount point instead. This is done
with a new Q_PATH flag to the quotactl syscall indicating that the special
argument belongs to the mount path rather than a path to the block device
file

The UBIFS quota support itself is based on a series by Dongsheng Yang
posted here:
http://lists.infradead.org/pipermail/linux-mtd/2015-September/061812.html
This part hasn't changed much, except that the code for reading and writing
quota files has been dropped.

changes since v4:
- Rebase on v5.11-rc5
- Drop quota inode counting for xattrs

changes since v3:
- implement ubifs_dqblk_find() using ubifs_dqblk_find_next()
- Fix copy/paste errors in flag settings
- drop unnecessary inline declaration
- add ubifs_assert() for catching wrong usage of setflags()
- add helper function for projid checking
- Add a feature flag for supporting projid

changes since v2:
- Rebase on Jans quota-without-inode series
- Use recently introduced vfs_ioc_fssetxattr_check() and simple_fill_fsxattr()
- fix project quota support (was broken in v2 due to upstream changes in UBIFS)
- check for illegal renames due to different project id

Changes since v1:
- Introduce Q_PATH flag to make passing a mountpath explicit
- Do not mess with fs layer as suggested by Al Viro
- create separate usrquota, grpquota and prjquota options rather than just
  a single quota option
- register a UBIFS specific quota_format and use dquot_enable()
- drop "quota: Only module_put the format when existing" which is no
  longer necesary

Sascha Hauer (8):
  quota: Allow to pass mount path to quotactl
  ubifs: move checks and preparation into setflags()
  ubifs: Add support for FS_IOC_FS[SG]ETXATTR ioctls
  ubifs: do not ubifs_inode() on potentially NULL pointer
  ubifs: Factor out ubifs_set_feature_flag()
  ubifs: Add support for project id
  ubifs: export get_znode
  ubifs: Add quota support

 Documentation/filesystems/ubifs.rst |   6 +
 fs/quota/quota.c                    |  66 ++-
 fs/ubifs/Makefile                   |   1 +
 fs/ubifs/dir.c                      | 139 +++++--
 fs/ubifs/file.c                     |  43 ++
 fs/ubifs/ioctl.c                    | 221 ++++++++--
 fs/ubifs/journal.c                  |   4 +-
 fs/ubifs/quota.c                    | 606 ++++++++++++++++++++++++++++
 fs/ubifs/sb.c                       |  29 +-
 fs/ubifs/super.c                    |  87 +++-
 fs/ubifs/tnc.c                      |  32 +-
 fs/ubifs/ubifs-media.h              |  10 +-
 fs/ubifs/ubifs.h                    |  44 ++
 fs/ubifs/xattr.c                    |   5 +-
 include/uapi/linux/quota.h          |   2 +
 15 files changed, 1198 insertions(+), 97 deletions(-)
 create mode 100644 fs/ubifs/quota.c

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
