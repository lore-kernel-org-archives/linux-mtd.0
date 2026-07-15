Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C754C4450A
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2026 14:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jaOBNkQnJwCIv2MmWNswkOCWVBjd8DPu09gYKktUub0=; b=tisW9r0NtBRwxU
	lkCzXECIlnT3YUwe8MlO9BJISV3b7YfJjNsukLkEp1YMnOk113yKv9oskOMWOx8oV5qcRVxXysES7
	IAEVpze3kAPZfqUINICBd3iOTDS7xQPmPuq4dx6D6OtI1WKZGZz55p+J+7+1mzj4h9GPG9heGumBA
	Sbhi334HDpj4XymMfw106j5BNIO6Wmj/H4mb8g9aiCrqOiJjSDCu9/lPazbAZrEt1pVUnWe2od+oR
	yx5nyDEPYIGMQnbvycde+ZmDx0E1f8+iXV0KQz6lG+dfD1e0dG1Kst7B/jnB1tPUT1Lh4rYjAy16h
	Ds0WFSIUOlSoPcjzpJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0IJ-0000000F46l-1NOS;
	Wed, 15 Jul 2026 14:09:03 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0IG-0000000F45U-2LDu
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jul 2026 14:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784124540; x=1815660540;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=dCyV2fCxlnQlIjGOH8f3xg6tybPY5EsXgQMhHPrmnlw=;
  b=OFOAe5+3yAdK6+8VjQtId4zMPwrlZRjKeyO8vuWP3miAh6PoCpMo+GqS
   RxQufgW9Sk8nOxUMJgmgqC0xEUg23TpVuztMsKq8MfUnDjk1qotUZNdzu
   ijlxOXGl5V4zx7eD0GKmfXgPH7sBJORduwU6HLxlgVAXoTw79plZwhvHP
   biTigrjzNaG3YPxn//+gPWGPeQUgJBewJwPOSh5wsbMM8HNP6Kr4V9m0B
   HRoUyt+jG+jbECqbkqyNn47JsrOKubiGZgByDftUlWLIe0+ZbogQp/MoM
   1mPytWSKhjzurXxOxzapgyt1IjuylwhANk7UN5PB9sUXlQ8zqA0Byrytd
   w==;
X-CSE-ConnectionGUID: u0slKFVFRzK+izUHsn0vkA==
X-CSE-MsgGUID: vF8H8UewSzOAIUYW9LAc8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84615777"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84615777"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:08:58 -0700
X-CSE-ConnectionGUID: V5IShM9eS32li9A4vFOTEw==
X-CSE-MsgGUID: 9Y9MyI5OSDK0Vbv20334NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="251777863"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:08:55 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH 0/2] drm/xe/nvm: add survivabilty partiton
Date: Wed, 15 Jul 2026 16:45:28 +0300
Message-Id: <20260715-cri_surviv-v1-0-61763a6f1076@intel.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0NT3eSizPji0qKyzDJd00SztMQ0c1MLszRDJaCGgqLUtMwKsGHRsbW
 1ALqbZt9cAAAA
X-Change-ID: 20260715-cri_surviv-5a6faf7586f1
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784123168; l=1018;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=dCyV2fCxlnQlIjGOH8f3xg6tybPY5EsXgQMhHPrmnlw=;
 b=46LI4ZEe2uhSuVa3oVAfJVy7yPFF6aoOdFUM+ZRMNQCKne9QxG9Ss9o18A2WESMv+4aZPFtym
 kFy/eovxCiAAe6E43/TPisGnzvcHaGhKCJ6N45No2Uk40t0fCsNatX2
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_070900_647896_0E683135 
X-CRM114-Status: UNSURE (   8.04  )
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

One of the reasons for the CRI to enter survivability mode
is corrupted storage.
A corrupted storage partition table can make recovery impossible.
A new partition with a pre-defined size, covering the entire storage,
should be added when the card is in survivability mode to allow a full
memory update.

This series intended to be merged via drm tree for consistency
and requires ack from MTD maintainer.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
Alexander Usyskin (2):
      mtd: mtd_intel_dg: add survivability partition
      drm/xe/nvm: define survivabilty partition

 drivers/gpu/drm/xe/xe_nvm.c        | 13 +++++--
 drivers/mtd/devices/mtd_intel_dg.c | 80 +++++++++++++++++++++++++++-----------
 include/linux/intel_dg_nvm_aux.h   |  1 +
 3 files changed, 69 insertions(+), 25 deletions(-)
---
base-commit: acc744fa62fb098358f371bfb38e6b32032459c7
change-id: 20260715-cri_surviv-5a6faf7586f1

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
