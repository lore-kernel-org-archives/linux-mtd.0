Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D78C982D5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=icEOa64zIrHj8lsuOkEuMQ27AabeAqeTKU9+C0kIZcQ=; b=GyZWEzQ7tVhXFf
	Mg+626ZNL559pb3TWJNBXSyMHCkFgG/cYwgcYMEfLwedqrNv+GULnKFWKwnBHt+bj+dffJXrVil9o
	NQlhQm/YwHEHVBvhpnPWzWzMbDYLq3q05mLBZsdFMftKL4KRrolfskjEtlJuEaAXK5v9oNxL6FIpD
	gvogPrXlC0kebLGXVnYFeP9BNb2eHhY4fRNGkY7rA9WDPts+Rw5phr6kMF/YgTJRyhdD2QcGWQrqN
	sxnge5X//m2B7QHA5h+/tjeSe20qcazrslueibqnnv5L+daxGvkkMRhUhtnuiPbPs9uAk9Z3BkYgW
	qoa5UL+4oNZWUywOsD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BjT-0000000BM9f-0krb;
	Thu, 17 Sep 2026 13:00:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BjQ-0000000BM8p-31Pd
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 13:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D40FF60204;
	Thu, 17 Sep 2026 13:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86337C2BCB8;
	Thu, 17 Sep 2026 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789650051;
	bh=ST6lkf8zWnv1Bb1/dVgKbAOWbpFORRupmi8n5QqXhzg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=O2xVGkNYcjWxXO1fS8hOL/A6OIxU+lKxCvrv684Qa4NATwuSJyx8UTY3l5L/x1AYS
	 VERPE/MfXsUuJjKpkZfm0h8PuJVYhvZ5V73UlYG3PcRn33jtGpIVR+bEoxdrz2wTWi
	 psfpcJ3QA4kOk34kal9+/LK6Bm+4wm+rC2H3clgBrO0AoXWmYh4TYpOCpGQT1q4b8z
	 2GmQFhZ2ry+1Vc6cvM6dPUHS3Cub1xsSJjunlf4nIhqzqFGySDtiQ5XSZGZX64WqNl
	 OdmBR5Rzl/eJfy/2O5ALtU2gAVUKrWlux3Lw7K34pOuopwSTOnpsKqWRN1bCHgeSZm
	 fQxBcmu1lQf4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7218CC982D1;
	Thu, 17 Sep 2026 13:00:51 +0000 (UTC)
From: Peter-Simon Dieterich via B4 Relay <devnull+peter-simon.dieterich.vaillant-group.com@kernel.org>
Subject: [PATCH 0/2] mtd: rawnand: Handle GigaDevice chips behind the ESMT
 manufacturer ID
Date: Thu, 17 Sep 2026 15:00:41 +0200
Message-Id: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHnkq2oC/yXMQQqEMAxA0atI1hbSKqJzlcFF1bRG0BkaK4J4d
 6su3+L/A4QCk8AnOyDQxsK/JUHnGfSjXTwpHpLBoKmwNqhI5lX5oXHR+NoVVjVlp11FGrGwkLJ
 /IMf7s/y2ryV2E/Xr/YHzvACsPd/+dAAAAA==
X-Change-ID: 20260820-esmt-gd9fu2g8f3a-94b1f6e1003a
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789650050; l=1814;
 i=peter-simon.dieterich@vaillant-group.com; s=20260820;
 h=from:subject:message-id;
 bh=ST6lkf8zWnv1Bb1/dVgKbAOWbpFORRupmi8n5QqXhzg=;
 b=v8R4RThorGStiRkYuqiy4vVHp2R3EYd1tnzChzEJWSj/iyUf1N530ytqr6Kzl4/5Gzj+SBMGs
 ExPLfO26ZG8C66WNLgYeqkRM0iUeYbWEH7rxbWUuKgU5Mu+4jS6HEzv
X-Developer-Key: i=peter-simon.dieterich@vaillant-group.com; a=ed25519;
 pk=YI8VL1pBCnAIu0GVWI3a6qn/SG0pMQhm9n/RZTI5KZg=
X-Endpoint-Received: by B4 Relay for
 peter-simon.dieterich@vaillant-group.com/20260820 with auth_id=965
X-Original-From: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
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
Reply-To: peter-simon.dieterich@vaillant-group.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

JEDEC manufacturer ID 0xc8 is shared between ESMT and GigaDevice, so
GigaDevice raw NAND chips are detected as ESMT and handled by
nand_esmt.c. This series deals with a GigaDevice part that ends up there.

Patch 1 works around a broken timing mode feature on the GD9FU2G8F3A:
the parameter page advertises SET/GET_FEATURES support, but
GET_FEATURES(TIMING_MODE) does not report the mode that was written, so
the core does not see its selection acknowledged and falls back to timing
mode 0. GigaDevice confirmed the chip is compatible with every timing
mode it advertises and that SET_FEATURES is not required to enter them,
so the feature is unflagged for this model and only the host side is
configured. This mirrors the existing handling of the Macronix MX30LF AC
series in nand_macronix.c.

Patch 2 is cosmetic: it renames the manufacturer entry to
"ESMT/GigaDevice" and documents the ID collision, so a GigaDevice part
is no longer reported as ESMT at detection time. It is independent of
patch 1 and can be dropped or deferred without affecting the fix.

Tested on an i.MX6ULL board using gpmi-nand with a GD9FU2G8F3A.

Signed-off-by: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
---
Peter-Simon Dieterich (2):
      mtd: rawnand: esmt: Disable broken timings feature on GD9FU2G8F3A
      mtd: rawnand: Reflect that ESMT and GigaDevice share ID 0xc8

 drivers/mtd/nand/raw/internals.h |  1 +
 drivers/mtd/nand/raw/nand_esmt.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/nand_ids.c  |  2 +-
 3 files changed, 36 insertions(+), 1 deletion(-)
---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260820-esmt-gd9fu2g8f3a-94b1f6e1003a

Best regards,
--  
Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
