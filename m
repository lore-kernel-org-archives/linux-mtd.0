Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E81C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 10:45:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0751A6199A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 10:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0751A6199A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvrczqBusJoLBOfDLljrNEsl8ty08n87tQ02ce06T84=; b=Nry5XHdrePs9mWWJK/Ham8b0mk
	zXG4j13WkB2nQ9lFGoDandiNp7EwgbJ6p9tcEhxKl7wJkWw8Su2vER5f+wSxgecMrTqGAKUG/Ynki
	K8mhhUtHQWpZ5MRZ5Rrh/NnPiZ4c+oC8ab3WRXETi18TgFmSWDcWrmu/qnZDzZ/pAgh+JXNi4cU8J
	KdVpai14reQvh8JwnIKJc1p8N/9gUjsbskjakIYs0S9NIF/Iu8HpMOYFyaDmxEDZyqXJvrw1lp5X6
	9jpzcU6WesRzdzn700WzghnzPLEpkWEJF9Z6l4SYeR60pE52hbCvWeuxmKKhEi1EeI76zRFOifC18
	XQTW2U+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBrC-003RHE-Rm; Tue, 30 Mar 2021 10:44:22 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBqv-003RCN-Mk
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 10:44:09 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lRBqu-0006SH-NU; Tue, 30 Mar 2021 12:44:04 +0200
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lRBqt-0006OX-QA; Tue, 30 Mar 2021 12:44:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: kernel@pengutronix.de, Jan Kara <jack@suse.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v5 0/7] Add quota support to UBIFS
Date: Tue, 30 Mar 2021 12:43:44 +0200
Message-Id: <20210330104351.21328-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_114405_865654_8ED96F07 
X-CRM114-Status: GOOD (  26.06  )
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


This series adds quota support to UBIFS.

Not much has changed since I last sent this series. I only dropped "quota:
Allow to pass mount path to quotactl" as this is on its way upstream
(currently in -next). With this the fs/quota general things have been
sorted out and this is now a UBIFS-only series.

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

changes since v5:
- Rebase on v5.12-rc5
- Drop "quota: Allow to pass mount path to quotactl" as it's on its way upstream

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

Sascha Hauer (7):
  ubifs: move checks and preparation into setflags()
  ubifs: Add support for FS_IOC_FS[SG]ETXATTR ioctls
  ubifs: do not call ubifs_inode() on unchecked pointer
  ubifs: Factor out ubifs_set_feature_flag()
  ubifs: Add support for project id
  ubifs: move get_znode() to global scope
  ubifs: Add quota support

 Documentation/filesystems/ubifs.rst |   6 +
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
 include/uapi/linux/quota.h          |   1 +
 14 files changed, 1148 insertions(+), 80 deletions(-)
 create mode 100644 fs/ubifs/quota.c

-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
