Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E20C88E5C
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2026 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xddncYfHnMbI2O8nW6gRA6MrepNYt6Xeh9hEMt4hBj8=; b=SRfGfiH3Z1obnP
	g3Bm0LfghCP0IjLwS+BO2Ohb8Du+dsp6okk0xXmMLms5zYGhd8MI3E+Lv1SEHcCJiyAhV/Ytfy+Ua
	YKLMgnMVTCgIWsU5Kn4c8cnvhjcRgueC4+M9cXMy4HgXMtk0UPW2r9q+GJ1gjkrJk6V+V6BAWTeKz
	n8s1qF3ABnFZLlEBHLol/KbssLztKenb/o+HsHUTL6XuIANqY36BP6LBMy2wdjMPR0LBdAH39e3PY
	HNhWcB7cU9kZgwoYGG1AVdCAUa2AiHe1bltwnS9rDvro8nZQ1BAmM20Wr22eACUfY+856HkkKiF5L
	L6dxngc3FnVs9UPNvb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6q9k-00000009LqF-49jb;
	Wed, 16 Sep 2026 13:58:37 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6q9h-00000009LpT-15x7
	for linux-mtd@lists.infradead.org;
	Wed, 16 Sep 2026 13:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789567113; x=1821103113;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=OBrCFnlTEIjhGfk9QvWKZR2eOFWSEpqthqxToIFrvi8=;
  b=OhZKY9oxoOdGHWFk9+xhsE+ME/t7js9ngt1eEEvzSkvAvFMNDrFWt0hg
   DV0DOxQSA0EnTAwFMom5k8KzxcJdCGFchk4HQZiws+uHuLj0h0RP3IV/A
   6ufWgT4ACyIimer4L6dG+YqTo1BKozV8Hr62iyDUYaFbAuXrDxbtQcEJU
   /uRNreAfql5tTGaj1AQ3so7NnqfsdHMfJtca2IsiNwZvFEpuDRMlPv5Ha
   x5s0LcR61Tw4YCN8YlIgwGKqHFQRmdx+M4l1HcNwvcPXA9rVVhpyvUaIe
   aQ/frGtMrOVJ7JSAafOCAY1kXpzHrZBwZVvjzG0LMpOXczUjY1E+eP4UX
   Q==;
X-CSE-ConnectionGUID: YDSc4b8qQjqlU4T2FqihKg==
X-CSE-MsgGUID: 8t8SodjZQKicYpb8QKg+Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89881924"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89881924"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:58:32 -0700
X-CSE-ConnectionGUID: oSCES6cPTaW5GTvUEWGfOA==
X-CSE-MsgGUID: mNCRndabQdqBoNABN76Pew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277475747"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:58:29 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v2 0/2] drm/xe/nvm: add survivabilty partiton
Date: Wed, 16 Sep 2026 16:58:14 +0300
Message-Id: <20260916-cri_surviv-v2-0-7de1b5328204@intel.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23M0QoCIRCF4VdZ5jrDMdToqvdYlhAb24HS0E2Kx
 XfP9rrL/8D5ViiUmQqchhUyVS6cYg+1G8DPLt5I8LU3KKmMtKiFz3wpr1y5Cu1McMHqowkI/fD
 MFPi9YePUe+aypPzZ7Iq/9S9TUUhh0JpD91Bac+a40H3v0wOm1toXylX+YaQAAAA=
X-Change-ID: 20260715-cri_surviv-5a6faf7586f1
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Menachem Adin <menachem.adin@intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789567108; l=1433;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=OBrCFnlTEIjhGfk9QvWKZR2eOFWSEpqthqxToIFrvi8=;
 b=bSma6OrE6Kw7lv2dmBhNpnouKEamhknl8paaF2K1r4ItswUjA9xiLrZ5WTCErkC91Xwrr4LaO
 6I+kFqlgQmbC6N2xAqROcoazoVeidahfgSRtri9lTAdD9Tf8/UpZyXA
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_065833_385734_EDABAB0A 
X-CRM114-Status: UNSURE (   8.99  )
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
should replace partitions detected from the storage when the card is
in survivability mode to allow a full memory update.

This series intended to be merged via drm tree for consistency
and requires ack from MTD maintainer.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
Changes in v2:
- Replace usual partitions with survivability one instead of adding
  addition partition to avoid problems with two partitons pointing to
  the same memory area.
- The change is in the mtd part; Miquel, I feel that this requires
  re-review/ack from your side.
- Link to v1: https://lore.kernel.org/r/20260715-cri_surviv-v1-0-61763a6f1076@intel.com

---
Alexander Usyskin (2):
      mtd: mtd_intel_dg: add survivability partition
      drm/xe/nvm: define survivabilty partition

 drivers/gpu/drm/xe/xe_nvm.c        | 13 ++++++--
 drivers/mtd/devices/mtd_intel_dg.c | 66 +++++++++++++++++++++++++++++---------
 include/linux/intel_dg_nvm_aux.h   |  1 +
 3 files changed, 61 insertions(+), 19 deletions(-)
---
base-commit: baafc300cd079a5210c1e70e5ea3d93518e40b38
change-id: 20260715-cri_surviv-5a6faf7586f1

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
