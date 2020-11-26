Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3C9C63798
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:34:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1020121D1A
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nv6DeexK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1020121D1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H0OMpRlUVIHndiI17U16Q9olqTo0HR1CwSYQ4DExWmU=; b=Nv6DeexKi+GL5wdXdjal9rMh7V
	ijPl/1cs93LcrrPcu52Xwx3ciyPK4rjhdtgP0orThpnz8k/2o0DeZQ7PM6AtVJID/nSyqsn3i/c9t
	ld5UrU5ttqlPc/pzoVrVsHHdNcdt0U9VuW/03qjopKztP7ClKVHa5qNSz8nVLrkDWsm/Dar23cwJs
	1xY4cQDCBtYmRKGh9gru50tSL5MohRYGfV0WEoEcmhW4aelL2lG5qoPLPA67pRsdgC/ES7yAJmOwZ
	e4TJAGRf4Wa7nBDupm2DZK5ou4bwZ6asNYFJERw6Mbw+wFqrDEY8xI3FWwXv197SflWtUV8C5yJKZ
	HUVrWNkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiQmI-0007w6-My; Thu, 26 Nov 2020 23:34:18 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiQlq-0007l2-B9
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 23:33:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 3948F18191058;
 Fri, 27 Nov 2020 00:33:38 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dbwzsOq9we2G; Fri, 27 Nov 2020 00:33:37 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ojufQZoP_csG; Fri, 27 Nov 2020 00:33:37 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 0/7] [RFC] MUSE: Userspace backed MTD v2
Date: Fri, 27 Nov 2020 00:32:53 +0100
Message-Id: <20201126233300.10714-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_183350_669866_D7057C29 
X-CRM114-Status: GOOD (  16.12  )
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

First of all, sorry for sending v2 before getting a review.
I found a much better way to process IO and to get rid of all hacks
from v1.


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

1. Init parameter passing
Currently parameter passing borrowed the logic from CUSE and parameters are
passed as stringy key value pairs.
Most MTD paramerters are numbers (erase size, etc..) so passing them via
struct muse_init_out seems more natural.
But I plan to pass also pure string parameters such as an mtdparts command line.
What is the perffered way these days in FUSE?
Am I allowed to embed structs such as struct mtd_info_user (mtd-abi.h) in
muse_init_out?

2. OOB (out of band) handling
So far OOB support is not implemented. I plan to do so.
Mabye just the bare minimum to make jffs2 happy.
I'm still digging into FUSE to find a nice way how to implement
it.

Changes since v1:
- Rewrote IO path, fuse_direct_io() is no longer used.
  Instead of cheating fuse_direct_io() use custom ops to implement
  reading and writing. That way MUSE no longer needs a dummy file object
  nor a fuse file object.
  In MTD all IO is synchronous and operations on kernel buffers, this
  makes IO processing simple for MUSE.
- Support for bad blocks.
- No more (ab)use of FUSE ops such as FUSE_FSYNC.
- Major code cleanup.

This series can also be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git muse_v2

Richard Weinberger (7):
  fuse: Export fuse_simple_request
  fuse: Export IO helpers
  fuse: Make cuse_parse_one a common helper
  mtd: Add MTD_MUSE flag
  fuse: Add MUSE specific defines FUSE interface
  fuse: Implement MUSE: MTD in userspace
  MAINTAINERS: Add entry for MUSE

 MAINTAINERS                |   7 +
 fs/fuse/Kconfig            |  15 +
 fs/fuse/Makefile           |   2 +
 fs/fuse/cuse.c             |  58 +--
 fs/fuse/dev.c              |   1 +
 fs/fuse/file.c             |  16 +-
 fs/fuse/fuse_i.h           |  18 +
 fs/fuse/helper.c           |  70 ++++
 fs/fuse/muse.c             | 730 +++++++++++++++++++++++++++++++++++++
 include/uapi/linux/fuse.h  |  73 +++-
 include/uapi/mtd/mtd-abi.h |   1 +
 11 files changed, 920 insertions(+), 71 deletions(-)
 create mode 100644 fs/fuse/helper.c
 create mode 100644 fs/fuse/muse.c

-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
