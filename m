Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577DEC7115F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Jun 2025 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/vwcWy1YuVvq9JpLjL2556HvVf5njQRKokVJFpmBlg=; b=1OhZem7aHM+YnY
	JpE6H5rRS8Ej0U7PrdV7caoVapmY3NbXMmot6jgylvkQ/zZDSsZG0UnDfNYqTJvgwIUHODzugVIvl
	VWHCFBHGxSxpI8dlcZeki/o9ZsRXPFKzVcykd1p/AZTsxgboKtyUCf9wWrp8r9Y9tHU6Ir91hSxpC
	TizgNgosFq8vJI+h+qB9DadThdJMgTjoNmHU3nfu8SO6u2fkowlqoInwY1zyI3srjI+7yvDpuTBDz
	QAH6rOX5BW/oBzW9qkmq1ZfKo7zjJvnr4HJyVgyiCiVAkC2A8FgVWO2kOCDGqOsSOcHxi+hg5c8bO
	M1X2U+mvHvdG8v2zWGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZpx-00000007yDO-2gFX;
	Tue, 17 Jun 2025 17:11:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXsn-00000007h68-2Mmk
	for linux-mtd@bombadil.infradead.org;
	Tue, 17 Jun 2025 15:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OM8J/6LhvRX4QxGElbkxsLXNgiTymzM52NdnpKWgzC4=; b=ksXf6Z7ZU5aN5L9pzT/6QTcXgI
	4+x4Ee0RXHqsN5+/7mhpVSh/nPckGwBOKoEh+fqvq8jFi0K/mfJq7oRcqzCDnfLvCQJygmwr8osoS
	10S7wmGKGNfAzUbhSPTnGtkNC6EuJEIIev7oXZ9+O53nyNa53HTM2cIn0ZCMnGfhRCUzCN4Mk+VDC
	gkUT3dfrXhHVcw91Nps3NgmG9n2j9B4ef7yvxN9Kt1aSub8sU9IyXS/6gKIGj5urDF+hRDrx8y2nS
	rKra6/wEb5TfbwaB3lJaCwV13U9AhZjC/MnhnkSytqSp8IBN+mlrLbxdgQdaX1kWq17qfQDlmMRFe
	nKV85Mkg==;
Received: from mgamail.intel.com ([192.198.163.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXsk-00000003pW6-42bY
	for linux-mtd@lists.infradead.org;
	Tue, 17 Jun 2025 15:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750172750; x=1781708750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WvLWJRAv8idelb+wbiysTqm+mBTnrzkj5Bl282lOSrk=;
  b=iFdtQw+NjU1HlFN5oVgKenUJUMjr6jBjbA5F9xOtGZQvnoMr/LpRUIm7
   X6TFrz5tPSMx9lQ/BWCaUMdHfCcjmgab/sHhVhsDRNUyYjn28OBpQiLYy
   BjzplmY3sWP2G1C6lQke9dra/QMNahrHexNhVAG6by+2HO2FwIgB5W66A
   cD8l64SIlCEqbYNamibYoW69w9Lh+DAlOYDiLLToIzXevFocT6t/kJTtl
   FKxEikq4C0JeEOfXdAtfvYMoywm+PRrHweAWEFK5zLeMx5BE+klSmO3hx
   OhmpuvUe1FRjO+5f1egG9/nrIbSVwWWiaipkAPu30yVVoaxqejf02LCs0
   g==;
X-CSE-ConnectionGUID: 60In6HrmTNWf7WkbkCAqxw==
X-CSE-MsgGUID: oS7f1gTHTDml917riw0x6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63008804"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="63008804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 08:05:50 -0700
X-CSE-ConnectionGUID: 5K82F0eBQdmzCaF3yqASiQ==
X-CSE-MsgGUID: 4kn8rnixQh2vyIHcgeETgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="152672274"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 08:05:42 -0700
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
	Karthik Poosa <karthik.poosa@intel.com>,
	Raag Jadav <raag.jadav@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tomas Winkler <tomasw@gmail.com>,
	Vitaly Lubart <lubvital@gmail.com>
Subject: [PATCH v14 3/8] mtd: intel-dg: implement access functions
Date: Tue, 17 Jun 2025 17:51:53 +0300
Message-ID: <20250617145159.3803852-4-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617145159.3803852-1-alexander.usyskin@intel.com>
References: <20250617145159.3803852-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_160551_443155_D46F313C 
X-CRM114-Status: GOOD (  17.10  )
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

Implement read(), erase() and write() functions.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Co-developed-by: Vitaly Lubart <lubvital@gmail.com>
Signed-off-by: Vitaly Lubart <lubvital@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 197 +++++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index 478dd2b158e3..4d6e2c009b45 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -5,13 +5,16 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/intel_dg_nvm_aux.h>
 #include <linux/io.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 struct intel_dg_nvm {
@@ -91,6 +94,33 @@ static inline u32 idg_nvm_read32(struct intel_dg_nvm *nvm, u32 address)
 	return ioread32(base + NVM_TRIGGER_REG);
 }
 
+static inline u64 idg_nvm_read64(struct intel_dg_nvm *nvm, u32 address)
+{
+	void __iomem *base = nvm->base;
+
+	iowrite32(address, base + NVM_ADDRESS_REG);
+
+	return readq(base + NVM_TRIGGER_REG);
+}
+
+static void idg_nvm_write32(struct intel_dg_nvm *nvm, u32 address, u32 data)
+{
+	void __iomem *base = nvm->base;
+
+	iowrite32(address, base + NVM_ADDRESS_REG);
+
+	iowrite32(data, base + NVM_TRIGGER_REG);
+}
+
+static void idg_nvm_write64(struct intel_dg_nvm *nvm, u32 address, u64 data)
+{
+	void __iomem *base = nvm->base;
+
+	iowrite32(address, base + NVM_ADDRESS_REG);
+
+	writeq(data, base + NVM_TRIGGER_REG);
+}
+
 static int idg_nvm_get_access_map(struct intel_dg_nvm *nvm, u32 *access_map)
 {
 	u32 fmstr4_addr;
@@ -155,6 +185,173 @@ static int idg_nvm_is_valid(struct intel_dg_nvm *nvm)
 	return 0;
 }
 
+__maybe_unused
+static unsigned int idg_nvm_get_region(const struct intel_dg_nvm *nvm, loff_t from)
+{
+	unsigned int i;
+
+	for (i = 0; i < nvm->nregions; i++) {
+		if ((nvm->regions[i].offset + nvm->regions[i].size - 1) >= from &&
+		    nvm->regions[i].offset <= from &&
+		    nvm->regions[i].size != 0)
+			break;
+	}
+
+	return i;
+}
+
+static ssize_t idg_nvm_rewrite_partial(struct intel_dg_nvm *nvm, loff_t to,
+				       loff_t offset, size_t len, const u32 *newdata)
+{
+	u32 data = idg_nvm_read32(nvm, to);
+
+	if (idg_nvm_error(nvm))
+		return -EIO;
+
+	memcpy((u8 *)&data + offset, newdata, len);
+
+	idg_nvm_write32(nvm, to, data);
+	if (idg_nvm_error(nvm))
+		return -EIO;
+
+	return len;
+}
+
+__maybe_unused
+static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
+			 loff_t to, size_t len, const unsigned char *buf)
+{
+	size_t len_s = len;
+	size_t to_shift;
+	size_t len8;
+	size_t len4;
+	ssize_t ret;
+	size_t to4;
+	size_t i;
+
+	idg_nvm_set_region_id(nvm, region);
+
+	to4 = ALIGN_DOWN(to, sizeof(u32));
+	to_shift = min(sizeof(u32) - ((size_t)to - to4), len);
+	if (to - to4) {
+		ret = idg_nvm_rewrite_partial(nvm, to4, to - to4, to_shift, (u32 *)&buf[0]);
+		if (ret < 0)
+			return ret;
+
+		buf += to_shift;
+		to += to_shift;
+		len_s -= to_shift;
+	}
+
+	len8 = ALIGN_DOWN(len_s, sizeof(u64));
+	for (i = 0; i < len8; i += sizeof(u64)) {
+		u64 data;
+
+		memcpy(&data, &buf[i], sizeof(u64));
+		idg_nvm_write64(nvm, to + i, data);
+		if (idg_nvm_error(nvm))
+			return -EIO;
+	}
+
+	len4 = len_s - len8;
+	if (len4 >= sizeof(u32)) {
+		u32 data;
+
+		memcpy(&data, &buf[i], sizeof(u32));
+		idg_nvm_write32(nvm, to + i, data);
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		i += sizeof(u32);
+		len4 -= sizeof(u32);
+	}
+
+	if (len4 > 0) {
+		ret = idg_nvm_rewrite_partial(nvm, to + i, 0, len4, (u32 *)&buf[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return len;
+}
+
+__maybe_unused
+static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
+			loff_t from, size_t len, unsigned char *buf)
+{
+	size_t len_s = len;
+	size_t from_shift;
+	size_t from4;
+	size_t len8;
+	size_t len4;
+	size_t i;
+
+	idg_nvm_set_region_id(nvm, region);
+
+	from4 = ALIGN_DOWN(from, sizeof(u32));
+	from_shift = min(sizeof(u32) - ((size_t)from - from4), len);
+
+	if (from - from4) {
+		u32 data = idg_nvm_read32(nvm, from4);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		memcpy(&buf[0], (u8 *)&data + (from - from4), from_shift);
+		len_s -= from_shift;
+		buf += from_shift;
+		from += from_shift;
+	}
+
+	len8 = ALIGN_DOWN(len_s, sizeof(u64));
+	for (i = 0; i < len8; i += sizeof(u64)) {
+		u64 data = idg_nvm_read64(nvm, from + i);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+
+		memcpy(&buf[i], &data, sizeof(data));
+	}
+
+	len4 = len_s - len8;
+	if (len4 >= sizeof(u32)) {
+		u32 data = idg_nvm_read32(nvm, from + i);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		memcpy(&buf[i], &data, sizeof(data));
+		i += sizeof(u32);
+		len4 -= sizeof(u32);
+	}
+
+	if (len4 > 0) {
+		u32 data = idg_nvm_read32(nvm, from + i);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		memcpy(&buf[i], &data, len4);
+	}
+
+	return len;
+}
+
+__maybe_unused
+static ssize_t
+idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_addr)
+{
+	void __iomem *base = nvm->base;
+	const u32 block = 0x10;
+	u64 i;
+
+	for (i = 0; i < len; i += SZ_4K) {
+		iowrite32(from + i, base + NVM_ADDRESS_REG);
+		iowrite32(region << 24 | block, base + NVM_ERASE_REG);
+		/* Since the writes are via sgunit
+		 * we cannot do back to back erases.
+		 */
+		msleep(50);
+	}
+	return len;
+}
+
 static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
 {
 	u32 access_map = 0;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
