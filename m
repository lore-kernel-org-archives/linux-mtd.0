Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BE0C3601C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVnp3BgAMr8Jxv9JSIMUVBcsPkTnY6UWHF44SWfdd3s=; b=VawjcG8CNI8rGG
	TC2o6K6VRBtQOEtXopTp92kIIoEPC72l/dkXeED/Mvx83LsQrHaaCys9jHCmrdcwsfrBfWegBYNCB
	PqqrUTHWxAjPaUCPo9gIxImmWsk3C7T6p8+tym0im4qdLtfFzdEcwjFnv2GPkLUtce63fm30jEksl
	5m2mgmoxWwz8K4kWkj97Ccl25Zs5oFeMZ0FAKC/karFdSMYfruon6iUCRy9c+sv1x0Rf06eW4LmDU
	ljKXBcc5zZLILKZwtqS/s4l9b4o/tej7Gdgpr3uNlcn5SLMZ/0tvGk+XppWFyJyTmds+Duv/muFxW
	yg/6qK9qpfVUZ9b86PDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTDB-00000008wci-23i5;
	Wed, 26 Mar 2025 16:02:37 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSpD-00000008syJ-2prA
	for linux-mtd@lists.infradead.org;
	Wed, 26 Mar 2025 15:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743003472; x=1774539472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=02tjDKQNWeXHFLJTCMQ3g4lvV4tJ61jI02p0lATS/lk=;
  b=iE8sTpCoQ8tcY52LDDMdVX+NSYgq5LZOTPtBTMQfydkijA70Udj44ejB
   qiUELY5Jnia95Vkg84rz1tDDACT8879ulnWhww8mMao46AV9OU7GyPqj9
   iJFyA6J3dXtMw6mIqFkHHHHdPitHZbXRuLVtwsxmGvK6XBtOkJ8pzCyD0
   StHUZdUpXAdSGS26fhryQBA+JnRIAFEcKGJZAx7WC+1H5bRa11aL8bIHg
   zuplFme5Wsh93bYPnH6VyIFsE+WWpwJnm7yXtNWh5MFnz0czVVlZfIQcm
   85AJaKqhwSkiAYhED8Umq/+Fjgs/MzJChqfFWzv0Vte9eSV+li9J+VDvH
   g==;
X-CSE-ConnectionGUID: HxLtKpAJSIO8SrABjwh5hw==
X-CSE-MsgGUID: QDpYWdJBQV2qJnaHj5K+ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55665526"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="55665526"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 08:37:52 -0700
X-CSE-ConnectionGUID: y5VlznP4Qtyq8zC7+2hq6w==
X-CSE-MsgGUID: pyccQ9ogRCy32+LBHrYCng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="129923501"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 08:37:46 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v7 06/12] mtd: intel-dg: align 64bit read and write
Date: Wed, 26 Mar 2025 17:26:17 +0200
Message-ID: <20250326152623.3897204-7-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326152623.3897204-1-alexander.usyskin@intel.com>
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_083751_760067_72396435 
X-CRM114-Status: GOOD (  11.55  )
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

GSC NVM controller HW errors on quad access overlapping 1K border.
Align 64bit read and write to avoid readq/writeq over 1K border.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index 4023f2ebc344..3535f7b64429 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -238,6 +238,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
 		len_s -= to_shift;
 	}
 
+	if (!IS_ALIGNED(to, sizeof(u64)) &&
+	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {
+		/*
+		 * Workaround reads/writes across 1k-aligned addresses
+		 * (start u32 before 1k, end u32 after)
+		 * as this fails on hardware.
+		 */
+		u32 data;
+
+		memcpy(&data, &buf[0], sizeof(u32));
+		idg_nvm_write32(nvm, to, data);
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		buf += sizeof(u32);
+		to += sizeof(u32);
+		len_s -= sizeof(u32);
+	}
+
 	len8 = ALIGN_DOWN(len_s, sizeof(u64));
 	for (i = 0; i < len8; i += sizeof(u64)) {
 		u64 data;
@@ -295,6 +313,23 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
 		from += from_shift;
 	}
 
+	if (!IS_ALIGNED(from, sizeof(u64)) &&
+	    ((from ^ (from + len_s)) & GENMASK(31, 10))) {
+		/*
+		 * Workaround reads/writes across 1k-aligned addresses
+		 * (start u32 before 1k, end u32 after)
+		 * as this fails on hardware.
+		 */
+		u32 data = idg_nvm_read32(nvm, from);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		memcpy(&buf[0], &data, sizeof(data));
+		len_s -= sizeof(u32);
+		buf += sizeof(u32);
+		from += sizeof(u32);
+	}
+
 	len8 = ALIGN_DOWN(len_s, sizeof(u64));
 	for (i = 0; i < len8; i += sizeof(u64)) {
 		u64 data = idg_nvm_read64(nvm, from + i);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
