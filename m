Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907F5D19504
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jan 2026 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FAD2DzvfDQWwCZlJIVp6Iin6UyzUdGNkdCCXX5Smlrw=; b=Nsfjf0l3Xm2kG3
	8LGMCusPDRlU06cxRwRmgW3gRd21IRXIhtQIMxPI82hFar8QMNC6D28LPZKYKpLFFGBswsDuWALKY
	i9opo47jTs2Gifq4UonW5GHR0VUxsG5Qv44nCOvQ+XFXzgofPU+dh8K2wDPw9FeBRAIZ8J/cLrNO6
	fF9Orvj7p4Kvcv/UEeKmEZYLQqWcb83hwdAZqvAPqzystwhVw3Q+UAgfN00NPL9ZbgMbKbH50LITf
	uyAfjwgqU1xX4QNY8tmrD+hLF9pU0yJpdcV9RRF1888O3N8uJTRR/6cD/UyXup0kH0V5aOcFBjG2c
	CkQ2QjaCSsftLspUrWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPvd-0000000CuWl-1trC;
	Mon, 26 Jan 2026 16:59:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPvc-0000000CuW5-30tA
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jan 2026 16:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98CF360097;
	Mon, 26 Jan 2026 16:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D4EEC116C6;
	Mon, 26 Jan 2026 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769446743;
	bh=hE+1gQasjcI7r0KGGKKj8zLyRMoa1nqwpr1aCZA23oc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YIKm2oVWH+oBNl3zu3X5VfWhjXWvdfuNaOOTjyOUTF2vVtlJAPO3Z/kWAT4Dby9x1
	 hSf+4zTcikcstYntQcPnxjToyd9DkMcWRF5Ls9cuQeCHIblCgL+ysCRJOzyIAubXKy
	 F3WAtmuOg3Uli7NKjJ/ncKW/zSwcc9xwutiANVXiVo4Xrc8/bubiBbeCTieBmsl9ma
	 EeIvvvp+MeoQhS3MEbuoyn99ASXmX4cxHzkaev22yPjxEfc04SBLUXPYej71cp5lLX
	 zIhxanZ1HIvVtuRs/Il0cQnjNtsuAu/99t/047GJ4B8llrs6xnjfT8HWsosy7v/V9h
	 IeNmQWijcUeWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AD7D19504;
	Mon, 26 Jan 2026 16:59:03 +0000 (UTC)
From: Andrea Scian via B4 Relay <devnull+andrea.scian.dave.eu@kernel.org>
Subject: [PATCH v2 0/2] PL353 SW ECC fixes
Date: Mon, 26 Jan 2026 17:58:54 +0100
Message-Id: <20260126-pl353-soft-ecc-support-v2-0-fcd74b6e955f@dave.eu>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE6dd2kC/4WNSw7CIBRFt9K8sc/wsaU6ch+mAwKvlsQUApRoG
 vYudgMOz0nuuTskio4S3LodIhWXnF8biFMHZtHrk9DZxiCYGBgXHMNL9hKTnzOSMZi2EHzMqK4
 X4qR6qaSGNg6RZvc+wo+p8eJS9vFz/BT+s3+ThSNDxrQdiQ/MjvJudaEzbTDVWr/qLIodugAAA
 A==
X-Change-ID: 20260121-pl353-soft-ecc-support-794e1e75373a
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Amit Kumar <amit.kumar-mahapatra@amd.com>, 
 Andrea Scian <andrea.scian@dave.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769446742; l=1097;
 i=andrea.scian@dave.eu; s=20260121; h=from:subject:message-id;
 bh=hE+1gQasjcI7r0KGGKKj8zLyRMoa1nqwpr1aCZA23oc=;
 b=WJ1GJupjjxNlVNUqMfkuz90Qo9NplErbJdSx7B+8HX1zwQZpNhmteJsCtu/tBipLFec4WwGPs
 6nWxWcAOgdoCMyUyssaSrXrbQ3v+ZEN+lIrRpLItfukHzyErmSTm+vN
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
Changes in v2:
- change dev_info() into dev_dbg() to reduce messages
- Link to v1: https://lore.kernel.org/r/20260121-pl353-soft-ecc-support-v1-0-00ad8e160d83@dave.eu

---
Andrea Scian (2):
      mtd: rawnand: pl353: Fix software ECC support
      mtd: rawnand: pl353: Add message about ECC mode

 drivers/mtd/nand/raw/pl35x-nand-controller.c | 5 +++++
 1 file changed, 5 insertions(+)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260121-pl353-soft-ecc-support-794e1e75373a

Best regards,
-- 
Andrea Scian <andrea.scian@dave.eu>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
