Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FBCD1CDDD
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2024 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsUeBgwm/25Uf6oV9E8o+98I259Ok8EMC61ON3qPJrA=; b=M0B8WPPail7nr+
	GdK73q+It83mY14y7yuOP9VvFOs+1gKzJtUb3NjM5Zh4UIrN4AtiWhVItUKWe4A2buR2sU5iB5b22
	XA1eLNh8mnEtMp1fS5cysXFrt5Bzw97oGe/B1RRHDoBwH4n9Dd144m8v6VCULsQblHmirYyBh43d0
	IZexvnhOn/SuHNrCg6MyRyHc3QMhZ2z6MysG+cBTXFaBQL22Zm+t1PvO14lNFbfYx7XCTdCAuuU2E
	fChngXMTJsG93I1PENxIyoyQMjNLG+NcxWTkMUpz4A71cPuEFILr0qhcaTImiJnEV6i0iFX/hqfpG
	He7IlD9P/W9nEy5Tu59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CWe-0000000Aaux-1whR;
	Tue, 22 Oct 2024 10:54:08 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CWS-0000000AajQ-0LHZ
	for linux-mtd@lists.infradead.org;
	Tue, 22 Oct 2024 10:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729594436; x=1761130436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=torsyGLfl3n5n85YhXlFTvXr/Lht7lxmZbx5KlrzZgU=;
  b=ExOMVZmNntiKI8qAGolUmMOsVbzBesO9H4vFQRmyWR5tS3jPsxJBcHt3
   moaqWdetyGrEgxxoSE8fuCX0QU5akeFb1GkaxvJuD7SVLpHznaTZ5yPyM
   LwNA6M0BKoerg5dw5MbiGD1eqrGeLUiVcKJY2kBcE0xfR+WOAjtBQ6lHI
   We3se07vaPb/Lk7Cx9VFk+m8Vg8xxneSc/b+5DHg1ryXE5G/IbLwO/lEU
   QDCi7hM6Hyd2uOiythBvTnkG14nOnN8EDK7arLF+AO597qGLIhbWYRrVo
   shB3PrGCeP1zRncrYIUhdvHJAt7qLe+gxk8d0jJvUJZ25Qbe6+tFxojUo
   w==;
X-CSE-ConnectionGUID: lIPPyGPYRaSe6zSFTvoPIA==
X-CSE-MsgGUID: KDX4sGq8QwmpK4eH8EKunQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39705045"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="39705045"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 03:53:47 -0700
X-CSE-ConnectionGUID: vUpuTgXsRHWTvXP2NIGq+w==
X-CSE-MsgGUID: kzS1+BB1R4+60Avq0+4J4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79847647"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 03:53:31 -0700
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
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH 05/10] mtd: intel-dg: align 64bit read and write
Date: Tue, 22 Oct 2024 13:41:14 +0300
Message-ID: <20241022104119.3149051-6-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022104119.3149051-1-alexander.usyskin@intel.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_035356_289767_7875353A 
X-CRM114-Status: GOOD (  11.53  )
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

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd-intel-dg.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
index 2efcb4d64ebf..4951438e8faf 100644
--- a/drivers/mtd/devices/mtd-intel-dg.c
+++ b/drivers/mtd/devices/mtd-intel-dg.c
@@ -239,6 +239,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
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
@@ -297,6 +315,23 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
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
