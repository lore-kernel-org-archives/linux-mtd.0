Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5064C3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 16:35:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 921B521775
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 16:35:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qxUJI0uw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 921B521775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7VgFZXriqLC/5NfQI6VSgXp3LQ2+hE66KEGZ8j8cIys=; b=qxUJI0uwhyl+EU
	c/B1yRQqF3tnwSoWvuCJc2rcofvfoXkO5nsvdhC17cVUNwtkrmH5pID0qYUCwx3qro3lJglYhUJ/Q
	B5J8OnQeQsaE+O+z1wyiN9MWqw5W0od+ObsewjWXI8FT3KFt6J54eJh7NZG/gmOJr3XJ4ZEfedXfJ
	yIHzqGYLJ3dC+2aFHML4I/o69zomJtI2r2/L6UM+o2QnUhf/o71wqSt8Y7XDzTQOMQcYTAY7hP7mQ
	oPi7SbhFl1dke3IQHafHTV3k3j7ymtVRiveDu55p3d9Jdh3wo0oT+K6Ov3rc2qGvzGWtySMB8Hy95
	8V1cyWLbNhZAGSPVXaHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUv6D-0000nR-V1; Sat, 02 May 2020 16:34:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUv67-0000kN-SZ; Sat, 02 May 2020 16:34:41 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 35F9E263955;
 Sat,  2 May 2020 17:34:36 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] mtd: rawnand: brcmnand: Convert to exec_op()
Date: Sat,  2 May 2020 18:34:29 +0200
Message-Id: <20200502163432.1543243-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_093440_051019_12C6C182 
X-CRM114-Status: GOOD (  17.11  )
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Scott Branden <sbranden@broadcom.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Ray Jui <rjui@broadcom.com>,
 Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

A bit of context to explain the motivation behind those conversions
I've been sending for the last couple of weeks. The raw NAND subsystem
carries a lot of history which makes any rework not only painful, but
also subject to regressions which we only detect when someone dares to
update its kernel on one of those ancient HW (I'm not saying brcmnand
is one of those ancient hardware BTW, but others in the NAND directory
are pretty old). While carrying drivers for old HW is not a problem per
se, carrying ancient and unmaintained drivers that are not converted to
new APIs is a maintenance burden (again, that does not really apply to
brcmnand, as Kamal as always prompt to reply to patches targeting this
driver), hence this massive conversion attempt I'm conducting here.

So here is a series converting the brcmnand NAND controller driver to
exec_op(). It's worth noting that I took the simplest path for this
implementation, using low-level operations for everything that's passed
to exec_op(). There are 2 reasons to that, the first one is that I
don't have the hardware to test and also don't know how this series
will be received so, I decided to take the quickest approach. But even
if we put that aside, I'm not sure the extra complexity implied by
the specialized operation handlers would be worth it, given that the
read/write page paths (those where performance really matters) are
already optimized (see the {read,write}_page[_raw]() implementations).
That leaves us with things that are only executed at boot time (ID,
PARAM_PAGE reads), or things that are simple enough (STATUS read,
ERASE) to not generate to much overhead if we don't use the dedicated
hardware functions. I'm of course open to reworking that part if someone
can validate my changes and come up with numbers showing that the
dedicated functions approach improves perfs.

Regards,

Boris

Boris Brezillon (3):
  mtd: rawnand: Add the concept of destructive operation
  mtd: rawnand: bcrmnand: Add exec_op() support
  mtd: rawnand: brcmnand: Get rid of the legacy interface implementation

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 248 +++++------------------
 include/linux/mtd/rawnand.h              |  11 +
 2 files changed, 66 insertions(+), 193 deletions(-)

-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
