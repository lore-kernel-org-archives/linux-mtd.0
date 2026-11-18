Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10575606A335
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j6KMt5GN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fKYX4w52
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oe0LKA5hcFJJ78oWHuCaegs49elKfp1My8y3bRTf6D4=; b=j6KMt5GNLUP01pHQa0CBQMWNlw
	maMKplauIEQZhCzeMkUG97fWjWoJfqjXCbAIxbDB09ZX3oluRFDDha4blyK8ECn62wZVeFO3obLgc
	DUeBVsT6POIsNmGMOUMGE60vP1vUuJyEf2GIf/++YZBmT2CjtdA4GHyo7LeaDxkDiVeU3KETDNR/Q
	p0MRTuzxd1lwASXsHFHED0qm1xhUkvg4pRFK5yw8UWPHSf/PN6kXJgSOPebmj2y2GhxkirhzgfW5P
	LXRq5fbtifVq6cSBvD9qnN44MIiqM2uQwd+fk3kqzmFJcVj1bwFUbv29JxpyUuJrtmnDxoQqusHtF
	+PZrsUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9F-00000009i2l-13rN;
	Wed, 18 Nov 2026 17:08:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9C-00000009i1d-2DK3
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:08:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 42E79C4F77B;
	Wed, 18 Nov 2026 17:08:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 58D5A5FE9B;
	Wed, 18 Nov 2026 17:08:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7876B11BC2A14;
	Wed, 18 Nov 2026 18:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nGZEZN5yjs51E9V/Ro0nwhidiwUYChKgL/6iUuAN0ZM=;
	b=fKYX4w52wCxpxiHcfpLjtfUddfoTFt6Kp2cS+HKEPaChvwTqoiOGfWoxx1IsSrY014ZpVJ
	72UAl4gV8ild4iOH/HooSg8pfdlCDtpS0xHy7FVh1N6TW5zBDimiCvsiha3WLIER7NTV3W
	0NF7W+Zkv7KNluVM0L4B693EMTjiqoHn6uRhW3W13GSq1VsmfjVFMwOTW+7Ozmc78CRPy2
	rMQkN7sGWqzU7odJEcbrGVPjP0oULdkRCqN8oDQoQHWk/cGonTTvsmXg92H5oaZrZCpqSC
	GHlhiM3BJ9sdcES4hyMZtK8balLK2NIsPxUjtqYSOsk+G78S6HeeGzQcUHQWcg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 00/13] mtd: spinand winbond: Add support for W25NxxLV
 and W25NxxLW chips
Date: Wed, 18 Nov 2026 18:08:17 +0100
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6CMBRFt0Le2GfaonwcuQ/DoD/kJdCSlhQMY
 e9WVuDwnOSeu0O0gWyER7FDsIkieZdBXArQg3Rvi2Qyg2Ci4qxkuJJT3hmcZFxswFXc3baNaUX
 eNsrIUva1FpDnc7A9bWf61WUeKC4+fM6nxH/2j2jiyLDlfVXfWG10o57K+2Ukd9V+gu44ji8Eo
 kOdwgAAAA==
X-Change-ID: 20261030-winbond-master-w25nxxlvw-198bda3af7c2
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090839_006110_55D30C19 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These chips mostly reuse the existing infrastructure and have been
tested using the mtd-utils test suite. In particular, I wrote and
contributed a new tool to ease continuous read testing:
https://lore.kernel.org/linux-mtd/20261030144108.2211604-1-miquel.raynal@bootlin.com/T/#u

A bit of reorganization and renaming is being done as well as
preparation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- Rebased on v7.4-rc2.
- Fixed the mistake with the KV OOB layout reported three times by Sashiko.
- Added Dominique Martinet's tag.
- Link to v1: https://lore.kernel.org/r/20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com

---
Miquel Raynal (13):
      mtd: spinand: winbond: Fix an OOB layout inconsistency with W25NxxLW chips
      mtd: spinand: winbond: Generalize the KV OOB layout
      mtd: spinand: winbond: Generalize the LW OOB layout
      mtd: spinand: winbond: Rename the ->set_cont_read() helper
      mtd: spinand: winbond: Rename the ->ecc_get_status() helper
      mtd: spinand: winbond: Add 1S_1S_1S continuous read variant
      mtd: spinand: winbond: Add basic support for W25N02LV
      mtd: spinand: winbond: Add basic support for W25N04LV
      mtd: spinand: winbond: Add basic support for W25N02LW
      mtd: spinand: winbond: Add continuous read support for W25N02LV
      mtd: spinand: winbond: Add continuous read support for W25N04LV
      mtd: spinand: winbond: Add continuous read support for W25N02LW
      mtd: spinand: winbond: Add continuous read support for W25N04LW

 drivers/mtd/nand/spi/winbond.c | 187 +++++++++++++++++++++++++++--------------
 1 file changed, 126 insertions(+), 61 deletions(-)
---
base-commit: 7b88b1111079cc2a43be02198bb1e07e649f367a
change-id: 20261030-winbond-master-w25nxxlvw-198bda3af7c2

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
