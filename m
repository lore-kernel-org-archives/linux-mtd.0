Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008FDC433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:49:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C850E20772
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KByGkILJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C850E20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cPsu0/tDdvusQ4E4BcTdnynTd+5MghNx4vP8BbEVU8c=; b=KByGkILJK8UW4s
	ZqFtnGWJqXg903qBv0hNjjtC7tcIQSLqZ6bIlcPFqF6U2bBDxYC4oox1ZKArZ5WIy73CR6ocv7VFy
	5j8HOwUemzEkfGQLVhAh0kJnUqeE/WofD28NrmqSiLH3iRM9kvr9jQbjk8GlIbJRCGeB/dDGiNtaQ
	5OFRT3cx0sx6gaHSAbjgDC9zlrZ9cWNBrSDM/L2WgEwulCXoondNTSejViHvJD8agHACmUwhC1ULL
	bwFaUpX0J0Se9MuSM6yNhZNxm+FlHddcOlsnNB7olsk4VR5cJNdPsG8lQ8xoa6G4qxuECSxtCymEF
	qtMKQpHF4TozCA1uWIaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgTlq-0001jq-B5; Wed, 03 Jun 2020 13:49:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgTln-0001iQ-O5
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 13:49:29 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ED7812A00BB;
 Wed,  3 Jun 2020 14:49:25 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 00/10] mtd: rawnand: fsl_upm: Convert to exec_op() (and more)
Date: Wed,  3 Jun 2020 15:49:12 +0200
Message-Id: <20200603134922.1352340-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_064927_913347_9A2D1600 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

A bit of context to explain the motivation behind those conversions
I've been sending for the last few weeks. The raw NAND subsystem
carries a lot of history which makes any rework not only painful, but
also subject to regressions which we only detect when someone dares to
update its kernel on one of those ancient HW. While carrying drivers
for old HW is not a problem per se, carrying ancient and unmaintained
drivers that are not converted to new APIs is a maintenance burden,
hence this massive conversion attempt I'm conducting here.

So here is a series converting the FSM UPM NAND controller driver to
exec_op(), plus a bunch of minor improvements done along the way.
I hope I'll find someone to test those changes, but if there's no one
still having access to this HW or no interest in keeping it supported
in recent kernel versions, we should definitely consider removing the
driver instead.

Regards,

Boris

Boris Brezillon (10):
  mtd: rawnand: fsl_upm: Remove unused mtd var
  mtd: rawnand: fsl_upm: Get rid of the unused fsl_upm_nand.parts field
  mtd: rawnand: fsl_upm: Allocate the fsl_upm_nand object using
    devm_kzalloc()
  mtd: rawnand: fsl_upm: Use devm_kasprintf() to allocate the MTD name
  mtd: rawnand: fsl_upm: Use platform_get_resource() +
    devm_ioremap_resource()
  mtd: rawnand: fsl_upm: Use gpio descriptors
  mtd: rawnand: fsl_upm: Inherit from nand_controller
  mtd: rawnand: fsl_upm: Implement exec_op()
  mtd: rawnand: fsl_upm: Get rid of the legacy interface implementation
  dt-bindings: mtd: fsl-upm-nand: Deprecate chip-delay and
    fsl,upm-wait-flags

 .../devicetree/bindings/mtd/fsl-upm-nand.txt  |  10 +-
 drivers/mtd/nand/raw/fsl_upm.c                | 311 +++++++-----------
 2 files changed, 117 insertions(+), 204 deletions(-)

-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
