Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8DFCA5FCB
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2026 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U7eWKQbrsDSVdap68sZ2UAsujMCi38Uy0Snd/0Rfm9I=; b=Oh6/ehlpaFYC3v
	iw7DUpub6CHYWFwv3jQFGKTFebbZC/eb4Zh6Gh4KuSGcczl8cCCph1v7lApwMNEcHCb0cOSTYSBJb
	OP7NPE30G4L7phqGC8+jVBOuSMhO+HaIF+X9hVaIbiXqCRkH8aQDngAak+P70Ns5m7CCq8/fx0QD9
	/4qpEBpVKj1pMk9z78L021/WuOS1OCHHpdZQ39CsbRgsXzFo5J73WP7BmRw/FZqtLRKZ6fTmIDVb5
	eQFfDUSZDBZmW9hAk9WHwjcOqL7DTL5MSqDQmP3x5YJ9ImGxPBwG58JkKjjhVrboex+AyvS8dydOn
	kepBKpvKKYf07ZlFoYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv5m-00000006GZH-2XwK;
	Wed, 30 Sep 2026 14:15:30 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv5b-00000006GWf-1pHW
	for linux-mtd@lists.infradead.org;
	Wed, 30 Sep 2026 14:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790777720; x=1822313720;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Uh9gom39WzbNzzzBwCXu/2laBjXWC998zi1qTL8D4Ls=;
  b=P432YkyQO0isLlzbTdPRdXFjFQLoALDO+7sOs23ZZTu53b2rqRJninZA
   JHoN3rp+KxA/TIq4s2pgc5JQJqRnULW3n8BWgcmHOd6BFkBBkXn+2yihp
   dCPiElSKa5URDlWDHvtsSAapytMBsY+7tWjGnDca917K09NxDkFoPQOJ7
   iFEkEfJyACXaabnhvuPRSFSwoFYrIjoGc7fMXUT46/jstPjTZTzG8650K
   upXBwsjkpiFDEbJLEr2JG4NuEOj7y0eFSUGybXCxk1fOHdOC4pPApmtYJ
   JjUsg5Xe5+Us6bfPI9p2f89bRc+QRol6GYcrdm09InL/cCgMFYgAuOWet
   w==;
X-CSE-ConnectionGUID: DiyKEwmZQ9Wo4pEY/JwDOA==
X-CSE-MsgGUID: C8qbrtVdQ/CnSCsOY7PAHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90469989"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90469989"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:14:58 -0700
X-CSE-ConnectionGUID: N6VUx1vnRFiESVz3cBge7g==
X-CSE-MsgGUID: SMr/RS35T/a+Qv+s2gvgyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279499579"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:14:55 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v3 0/2] drm/xe/nvm: add survivabilty partiton
Date: Wed, 30 Sep 2026 17:14:45 +0300
Message-Id: <20260930-cri_surviv-v3-0-357aeed5fc60@intel.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQrCMBCF4auUWRvJpCaprryHiNR2Ygc0laQGp
 fTupt2o4PI9+L8RIgWmCLtihECJI/c+j3JVQNPV/kKC27xBSWWkRS2awKf4CImT0LVxtbO6Mg4
 hB/dAjp8Ldjjm3XEc+vBa7ITz+5dJKKQwaE2ZPZTW7NkPdF03/Q1mJqlPukXzk6qc2pbwrEtVK
 bn5TqdpegP9w/yR3wAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790777694; l=1591;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=Uh9gom39WzbNzzzBwCXu/2laBjXWC998zi1qTL8D4Ls=;
 b=qBMmZUBGx+CVmIcdAn6rHqQ4J0RItiVqFUJpuPni8jRorjvz6LqJ5T2Meo/Z5UuItQjzkBZV2
 U0vFZKZWPQBA5QOftkP1QoF70wWfmLiVKClQx2EumAWRIl8J3JTcoHF
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_071519_598237_71BD0F2E 
X-CRM114-Status: UNSURE (   9.55  )
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
Changes in v3:
- Fix minor checkpatch complain
- Add Miquel ack
- Link to v2: https://lore.kernel.org/r/20260916-cri_surviv-v2-0-7de1b5328204@intel.com

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
 drivers/mtd/devices/mtd_intel_dg.c | 65 ++++++++++++++++++++++++++++----------
 include/linux/intel_dg_nvm_aux.h   |  1 +
 3 files changed, 60 insertions(+), 19 deletions(-)
---
base-commit: 3fc93d311249d5ad969a520dd3aae73bc007d431
change-id: 20260715-cri_surviv-5a6faf7586f1

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
