Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00240C2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 14:19:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EAAC22226
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 14:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BoEENMRQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EAAC22226
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=esJoq0etVJLJ/5ehVsFOchMYlDYyHhMP5omg0TfzsW4=; b=BoEENMRQDTP+f4/0hB8wVq30iS
	Wxj0lMCTqKNmFwdziK/1i46ps4b26UwkKJiwbIaJQUX8Io49NdCHN0GjttcmQwClikldXG4G+3JN+
	zF/ViS98sfQ9+ZVDalsl5Uqpp7sw3d5OuxANOL/RCWqNTFU9YTQx82BhQafSosQcU6KXk5DTsKsML
	9oE+K5pJ2XBVmSNkPQyBuMqnYS/Ye4Jmjw9uozY7htdAC16UEmKCTaIqn73ocUiU/LvRvQbLA7jNy
	uxKNi4pYmsv/iE0a0yax/elEL9c3Uo49+CwgJz1UbVkBvFK0uz9hSAp2l9ofykd5G1NoAZ+KvbhJN
	6+FnrF0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfklw-0003Os-Az; Thu, 19 Nov 2020 14:18:52 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfklg-0003JD-RK
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 14:18:39 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 3FE14181C88E8;
 Thu, 19 Nov 2020 15:18:26 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KYEAPqzs0CVc; Thu, 19 Nov 2020 15:18:25 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OqOEmPr6IOK7; Thu, 19 Nov 2020 15:18:25 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 0/5] [RFC] MUSE: Userspace backed MTD
Date: Thu, 19 Nov 2020 15:16:54 +0100
Message-Id: <20201119141659.26176-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_091837_204619_EB9376FC 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When working with flash devices a common task is emulating them to run various
tests or inspect dumps from real hardware. To achieve that we have plenty of
emulators in the mtd subsystem: mtdram, block2mtd, nandsim.

Each of them implements a adhoc MTD and have various drawbacks.
Over the last years some developers tried to extend them but these attempts
often got rejected because they added just more adhoc feature instead of
addressing overall problems.

MUSE is a novel approach to address the need of advanced MTD emulators.
Advanced means in this context supporting different (vendor specific) image
formats, different ways for fault injection (fuzzing) and recoding/replaying
IOs to emulate power cuts.

The core goal of MUSE is having the complexity on the userspace side and
only a small MTD driver in kernelspace.
While playing with different approaches I realized that FUSE offers everything
we need. So MUSE is a little like CUSE except that it does not implement a
bare character device but an MTD.

To get early feedback I'm sending this series as RFC, so don't consider it as
ready to merge yet.

Open issues are:

1. Dummy file object
The logic around fuse_direct_io() expects a file object.
Unlike FUSE or CUSE we don't have such an object in MUSE because usually an
MTD is not opened by userspace. The kernel uses the MTD and makes it available
to filesystems or other layers such as mtdblock, mtdchar or UBI.
Currently a anon inode is (ab)used for that.
Maybe there is a better way?

2. Init parameter passing
Currently parameter passing borrowed the logic from CUSE and parameters are
passed as stringy key value pairs.
Most MTD paramerters are numbers (erase size, etc..) so passing them via
struct muse_init_out seems more natural.
But I plan to pass also pure string parameters such as an mtdparts command line.
What is the perffered way these days in FUSE?
Am I allowed to embed structs such as struct mtd_info_user (mtd-abi.h) in
muse_init_out?

3. MUSE specific FUSE ops
At this time MUSE_INIT, FUSE_READ, FUSE_WRITE, FUSE_FSYNC and MUSE_ERASE are
used.

I plan to get rid of FUSE_READ and FUSE_WRITE too. On NAND'ish MTDs there is
out of band (OOB) data which can be read and written. Strictly speaking for
testing UBI/UBIFS OOB is not needed but for JFFS2 it is.

FUSE_READ/WRITE also consider every non-zero return code as fatal and abort
the transfer. In MTD, -EUCLEAN and -EBADMSG are not fatal, a driver is
expected to return possible corrupted data and let the next layer deal
with it.
So far I found no good way how to encode this in FUSE_READ. Maybe you can
point me in the right direction?

This series can also be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git muse_v1

Richard Weinberger (5):
  fuse: Rename FUSE_DIO_CUSE
  fuse: Export fuse_simple_request
  fuse: Make cuse_parse_one a common helper
  mtd: Add MTD_MUSE flag
  fuse: Implement MUSE: MTD in userspace

 fs/fuse/Kconfig            |  15 ++
 fs/fuse/Makefile           |   2 +
 fs/fuse/cuse.c             |  62 +----
 fs/fuse/dev.c              |   1 +
 fs/fuse/file.c             |   4 +-
 fs/fuse/fuse_i.h           |   7 +-
 fs/fuse/helper.c           |  68 ++++++
 fs/fuse/muse.c             | 450 +++++++++++++++++++++++++++++++++++++
 include/uapi/linux/fuse.h  |  25 ++-
 include/uapi/mtd/mtd-abi.h |   1 +
 10 files changed, 571 insertions(+), 64 deletions(-)
 create mode 100644 fs/fuse/helper.c
 create mode 100644 fs/fuse/muse.c

-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
