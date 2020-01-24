Return-Path: <SRS0=Gzls=3N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CD5C2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 13:15:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49AF8206D5
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 13:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WCbxEGxn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49AF8206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mGbUUB//HOmNACKL5bi8MFjCJFXLZweWduqFWaJ4fN8=; b=WCbxEGxny7y942
	6W2EcnLoFVrsYhdGLSh1s096yMSisZL8kFqOTDcyCbljfkUl6C59RtllWVc/9YB1+3Lyw9M7W/2/J
	jlNCiUXBgd3rTjZZHUe2Sl7S4gkrHcydCbxnQtSoEHvsqgqvRfgvZmyZBainEe00lB7p/DFCEwSHE
	rwQh6WaiMPt84PWVo/vGIiJ3Eh3BYBRMKIoC4Mi/L6J/oFktTN6B8fMhFVp9IJp7Y0DZuT8OCXdy5
	xZw9fB+5P11MKbKb42EyqTqU34XdNuFpOyKEfQ55stJzuTalssMA/Y0U/lGwr5NMKmdnhG54Bi2uK
	agx4uZETGvj2QtIg0lJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuynz-0000P7-MG; Fri, 24 Jan 2020 13:15:23 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuymN-0006Bj-DB
 for linux-mtd@lists.infradead.org; Fri, 24 Jan 2020 13:13:45 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iuym5-0003aD-RR; Fri, 24 Jan 2020 14:13:25 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iuym4-0006Z6-Vz; Fri, 24 Jan 2020 14:13:24 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v4 0/8] Add quota support to UBIFS
Date: Fri, 24 Jan 2020 14:13:15 +0100
Message-Id: <20200124131323.23885-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_051343_472055_336EEDB9 
X-CRM114-Status: GOOD (  18.92  )
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

Integrated more review feedback this time, see changelog.

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

Sascha

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


Sascha Hauer (8):
  quota: Allow to pass mount path to quotactl
  ubifs: move checks and preparation into setflags()
  ubifs: Add support for FS_IOC_FS[SG]ETXATTR ioctls
  ubifs: do not ubifs_inode() on potentially NULL pointer
  ubifs: Factor out ubifs_set_feature_flag()
  ubifs: Add support for project id
  ubifs: export get_znode
  ubifs: Add quota support

 Documentation/filesystems/ubifs.txt |   7 +-
 fs/quota/quota.c                    |  53 ++-
 fs/ubifs/Makefile                   |   1 +
 fs/ubifs/dir.c                      |  56 ++-
 fs/ubifs/file.c                     |  43 ++
 fs/ubifs/ioctl.c                    | 220 ++++++++--
 fs/ubifs/journal.c                  |   4 +-
 fs/ubifs/quota.c                    | 603 ++++++++++++++++++++++++++++
 fs/ubifs/sb.c                       |  29 +-
 fs/ubifs/super.c                    |  87 +++-
 fs/ubifs/tnc.c                      |  34 +-
 fs/ubifs/ubifs-media.h              |  10 +-
 fs/ubifs/ubifs.h                    |  43 ++
 include/uapi/linux/quota.h          |   2 +
 14 files changed, 1117 insertions(+), 75 deletions(-)
 create mode 100644 fs/ubifs/quota.c

-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
