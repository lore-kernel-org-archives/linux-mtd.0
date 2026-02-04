Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF390E83F0E
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e6phrr4Q1+P3NxM6FJ5JTtV0JZWO4OKxYaJwwFWjqII=; b=qd//+wKqGZ8E1b
	PyzN3cgIBqsRZnV1ql/uD47ZHr2W8XblLUYiFJ/fW3Hmh9f/xEofA0/10lxeyTIAi0Nnrw59JDC2f
	FwyvuarFW0RR+xOTPouUidGZTebZ6JdECAUN5Fedmm36lZ4ZgT3GzPv4WB6t8t9odA+7gPwsFD7NU
	4Sgohihi3GWoibvyjJ3sofhjr31g0NOg0xUPGO6HNYcFsGVQMefOnWszj+ZEJ8UaSk94o4no7QLey
	9tLDjCbYk3aE26EPtDAAaQ1q/tVVIBnivXM7zEFXQS/W7cmAFScoBy3NL2ZqNhsakaGT6zSHKChJb
	jPsl2dINt3is+il8Xodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngt8-00000008roH-44vW;
	Wed, 04 Feb 2026 17:42:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngt7-00000008rnj-3ok2
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 17:42:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF31F60010;
	Wed,  4 Feb 2026 17:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CDAAC4CEF7;
	Wed,  4 Feb 2026 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770226920;
	bh=SN/EnI3gRH5EgPtrtzgUHt1OXyTJ4FMI4Zj0DQ7Bzfg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GwG+H/cYPl5+eUPDgTuML9PZcg1VNw8646QJpZVsbnHtTEH+v2yMFcFpjRv0UUYDH
	 IDWawSGRFPxalb9STJL8rIpt+Qiw8tDSaOn7DYuXfvxu1AOnr1n6Q5W+wznGPQ43c2
	 mOZBq34s2r0fvFsd4e7GZKpv2vkwB6E/ogEKl0BTD676fW63AUL/kdD0KQrMymB4Kp
	 +KUctRTgNTfQNJEOMdsnCeFMhWjqDkgdaja5GB1gRTNi0VdvE/Gr7H8dzLE5vqrRPK
	 7hp8HUMp78cR8kofAB1YJ4tgI7Q+VHC9o9NAzIEtFGR+oG6hm4j3bRjtIJ2iK0UnQB
	 PZ1qeIg0YgXZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706C5E9D40F;
	Wed,  4 Feb 2026 17:42:00 +0000 (UTC)
From: Andrea Scian via B4 Relay <devnull+andrea.scian.dave.eu@kernel.org>
Subject: [PATCH v3 0/2] PL353 SW ECC fixes
Date: Wed, 04 Feb 2026 18:41:43 +0100
Message-Id: <20260204-pl353-soft-ecc-support-v3-0-fd8ee7595cc1@dave.eu>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANeEg2kC/4XNTQ7CIBCG4as0rMXwU6B15T2MC4TBkphCoCWap
 neXdqMb4/L9knlmQRmSh4xOzYISFJ99GGvwQ4PMoMc7YG9rI0aYJJRRHB9ccJyDmzAYg/McY0g
 TVn0LFJTgimtUj2MC5587fLnWHnyeQnrtfwrd1r9koZhgQrTtgEpiO362usARZrSBhX0j8ifCK
 uKMVe1NQi+E+yDrur4B0s7gtP8AAAA=
X-Change-ID: 20260121-pl353-soft-ecc-support-794e1e75373a
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrea Scian <andrea.scian@dave.eu>, stable@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770226919; l=1281;
 i=andrea.scian@dave.eu; s=20260121; h=from:subject:message-id;
 bh=SN/EnI3gRH5EgPtrtzgUHt1OXyTJ4FMI4Zj0DQ7Bzfg=;
 b=alB+oSyKR61RnSRxCpvkButoFr42kGODXraEw9NXPMkSn9ky/J95WooC/VZ1ffU+01w3Og2qv
 caVYdgr2mocCE6UfVoHDud+zpId8MmoiZVqMtglBoEdOg5GzztzauH3
X-Developer-Key: i=andrea.scian@dave.eu; a=ed25519;
 pk=PMQL72nEsyoiJCobnq0uEXwUFpVmkwoWIx317WvaQOU=
X-Endpoint-Received: by B4 Relay for andrea.scian@dave.eu/20260121 with
 auth_id=613
X-Original-From: Andrea Scian <andrea.scian@dave.eu>
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
Reply-To: andrea.scian@dave.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PL353 has some known errata with its ECC implementation and it may be
useful to switch to software ECC, to avoid issue with this.

On-die ECC is already supported (while I didn't test it) but when
enabling SW ECC we get operation-not-supported error during page write
(page read already work correctly)

IMHO it's enough to have 1-bit Hamming ECC correction, because this is
the only one supported on PL353, but this might be a wrong assumption.

This has been tested with nandflipbits and mtd_nandbiterrs

---
Changes in v3:
- remove wrong SW ECC algo selection
- add Fixes and CC to stable
- Link to v2: https://lore.kernel.org/r/20260126-pl353-soft-ecc-support-v2-0-fcd74b6e955f@dave.eu

Changes in v2:
- change dev_info() into dev_dbg() to reduce messages
- Link to v1: https://lore.kernel.org/r/20260121-pl353-soft-ecc-support-v1-0-00ad8e160d83@dave.eu

---
Andrea Scian (2):
      mtd: rawnand: pl353: Fix software ECC support
      mtd: rawnand: pl353: Add message about ECC mode

 drivers/mtd/nand/raw/pl35x-nand-controller.c | 4 ++++
 1 file changed, 4 insertions(+)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260121-pl353-soft-ecc-support-794e1e75373a

Best regards,
-- 
Andrea Scian <andrea.scian@dave.eu>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
