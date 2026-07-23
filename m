Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E14DC531CF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zj5j1AV4YirvXxMRClEIEWLLplWvlKdkFThY9GhaypM=; b=4lnrXx8vOmKx0F
	WzOoP2Ej25ECwMvknUiTH4cUqGNBG3mJn1y5newELywRmd/SdbPHaKrVCW6wkC6nhbNY0mjEi7wxI
	EhFNgzXElFjGseTmh9soytFTJFcKZ3kN2c7semSkNMEHRe9G304XBM9cmki3mPvdoxDw/9oNopycH
	DTRdwDCH5QawMwRwguEA9ZiC7AZaQ9uGkbfWIAkGZ2Sr/M6LtptJpjawm4rkcQu9gN5YNnsf5OZNc
	PPw3skgLfDDo21UD57fu+7aBj6zwVLRTVmU/U2H+duYWMQYJOphh9rR4yNTkSsz/q7RglIi9QY3Z3
	SSIsjJkVt9Z0syssiUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtfp-0000000EOve-3AXH;
	Thu, 23 Jul 2026 13:41:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtfk-0000000EOtT-3PIw
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 13:41:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F1254E40F0C;
	Thu, 23 Jul 2026 13:41:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7FF4602B8;
	Thu, 23 Jul 2026 13:41:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8450011C10CEE;
	Thu, 23 Jul 2026 15:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784814065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9Q185pF0DA/CFN6GHNn6AhfxIhuntfnhwSs6ZtpfhwU=;
	b=ajaOA+TpwOeT+/XVAyCAoZx5FLcgWMgaRocWAZKT/k2mFm6Q7CBoeMbon6X6oh+yoFE/zH
	g2n5avmiYgHPHvzVCwMK8UtQgNoov4EJVMJoo+yhSmJg1WaG1junlh7tveQ+rMQM0RK5YC
	419rvydyNrzvgbyT+SviqfuXEbAGuuoqfYA3z7rDpl8iawpqRSqpr/OLR6k58Be3KnqxUI
	m9xbN9P0PT8xi5wFr0NiPwbhFvQ4oMDOZOaQxQOUWN9I12gSBNRe9UDNb0eRyykkovR2aV
	buawn7YmpzX61CeoOzwTE01w9N24RKP0Qr/1QmMA0dGEmntyWP9Rk9b/4SqD8Q==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 0/4] rawnand: pl35x: Implement mixed ECC
Date: Thu, 23 Jul 2026 15:41:00 +0200
Message-Id: <20260723-mix-ecc-v1-0-7361c3baeb07@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMBCE4Vdp9uwm0CBSXsVwKNtB91DQFg0J4
 d1t5PhNJv9OGUmRqTc7JXw16zIX1BdD8vTzA6yhmGxl2+pqHUfdGCLctOhEQgPnQeX9Sph0+5f
 uw+mE96cE13Ok0WewLDHq2pvJ3cYgHaQOQsNx/ADtSlmQiQAAAA==
X-Change-ID: 20260529-mix-ecc-46e8ccd4e9ae
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_064113_006824_00AC4250 
X-CRM114-Status: UNSURE (   8.36  )
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

Hi all,

This series addresses the PL353 errata "SLC ECC misses single error to
bit0 byte0 and fails to detect some double error cases" (see 721059 in
[1]).

The ECC HW engine is known to be broken on this chip, it fails to detect
some bitflips on reads.

This series implements a mixed-ECC where the HW engine is used on writes
and reads are done by software. To make it work, the software ECC has to
use the same layout for the ECC bits than the HW engine. Patches 1 & 2
add the PL35x ordering to the available orderings for soft ECC. Patches
3 & 4 make use of this ordering to implement the mixed-ECC for the PL353
controller.

Note that this series is based on top of nand/next.

[1]: https://developer.arm.com/documentation/rlnc000227/a

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Bastien Curutchet (4):
      nand: hamming: Replace sm_order boolean with enum
      nand: hamming: Add support for the PL35x ECC bit ordering
      rawnand: base: Export nand_read_page_swecc
      rawnand: pl35x: Implement mixed ECC computing

 drivers/mtd/nand/ecc-sw-hamming.c            | 179 ++++++++++++++++++---------
 drivers/mtd/nand/raw/nand_base.c             |  11 +-
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 173 ++------------------------
 include/linux/mtd/nand-ecc-sw-hamming.h      |  20 ++-
 include/linux/mtd/rawnand.h                  |   7 +-
 5 files changed, 161 insertions(+), 229 deletions(-)
---
base-commit: f97bdc8ec1dc7b33781a702eeba55326c206be56
change-id: 20260529-mix-ecc-46e8ccd4e9ae

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
