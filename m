Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E15CC28B28
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Mar 2025 20:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B84qV8T0Qw6kP8m9L8AAvpmi6Sng5L2d0SsRI4xdJhs=; b=ZlwZkKBgNGnc2B
	KsfwN0TAQgRV8RRUeT1HRK8VYGH22j4wUMYzAifiJeq9bToPrccYPgKbY+Zp+A8IK5/xJigqNLUyL
	iQaKv6Vl8IY4JNs6o8lnBcSzRnp7XGaHpSe2djgqVu3Mhg4gJ1ESzqc7LKn57mpx7KYS8DLrn8067
	FQ6WSPXTLVR57/ix0y2i580oRLIzqcxNH/TTK+MgBA81S9sRMdxRx+8B1T0qnz3qOHSyFjitJKVpR
	0J+OEW9pPgr9ZCeXr7N0t0J4CfUE0I9tF1/3oJavnTm//lIN/4Sx++j6jW6vaA6/2uxGjW0Evgpmk
	Z+hQu1q+T9x4ST1dBHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSVe-00000009PL5-0aqt;
	Wed, 12 Mar 2025 20:16:58 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSVb-00000009PKi-3vQ7
	for linux-mtd@lists.infradead.org;
	Wed, 12 Mar 2025 20:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741810616; x=1773346616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LdXPczmAvLFOtdsRAuqJEfZQmT1DM6lFW14qyWC1FHo=;
  b=icDHNfylFkOMWyhi45M+zDl/BvkaeCwSU9WKHuo7AvC36bfWJ9oB0mp9
   dR2Ec7A9kEVxLTZTUbKvGc+RRPiVGwMy4PQfzQzzfmW/Y25371HXRcsxu
   m+W5Xpi9Jfhif/FBuWIGu9RVOn23k+gtuKyDejijJiF3Eq1jb+klTMxa3
   sAWVDRWeGbQEAmcBiaXS95LQznnepx7gI2+ip98pOBUrG4lRXf2M9NSlg
   5IhHI/K5yfiK9kn+NC9cUn2PJZNA/rPfll9js0UpCqyc6uIt7nfRBGwku
   jaxk/6CsuPSNJx5Z6MAY+mGXCkAoi4VXkWahZ8yjaBkRTPR09um3r8yTb
   w==;
X-CSE-ConnectionGUID: SDq2kGJRSWCQxXwC93xw0g==
X-CSE-MsgGUID: gYgNkjHeRqaLZPzuCJBFVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60451915"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="60451915"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 13:16:56 -0700
X-CSE-ConnectionGUID: 2GApYVQCRt6Zs/NzK1RSlQ==
X-CSE-MsgGUID: 1TuaK3NvT6evsUOJYk6neQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="121242351"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 12 Mar 2025 13:16:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5A33D1F2; Wed, 12 Mar 2025 22:16:52 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v1 1/1] mtd: mtdpart: Do not supply NULL to printf()
Date: Wed, 12 Mar 2025 22:16:49 +0200
Message-ID: <20250312201649.217555-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_131656_026511_B3701C32 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Q29tcGlsZXIgaXMgbm90IGhhcHB5IGFib3V0IE5VTEwgYmVpbmcgc3VwcGxpZWQgYXMgcHJpbnRm
KCkgcGFyYW1ldGVyOgoKZHJpdmVycy9tdGQvbXRkcGFydC5jOjY5MzozNDogZXJyb3I6IOKAmCVz
4oCZIGRpcmVjdGl2ZSBhcmd1bWVudCBpcyBudWxsIFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1d
CgpSZXBsYWNlIHRoYXQgd2l0aCAiKG51bGwpIiB0byBmaXggY29tcGlsYXRpb24gZXJyb3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9tdGRwYXJ0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKaW5kZXggNjgxMWE3MTQzNDlkLi42
ZjdlMjUwZWY3MTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYworKysgYi9kcml2
ZXJzL210ZC9tdGRwYXJ0LmMKQEAgLTY5MSw3ICs2OTEsNyBAQCBpbnQgcGFyc2VfbXRkX3BhcnRp
dGlvbnMoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsIGNvbnN0IGNoYXIgKmNvbnN0ICp0eXBlcywK
IAkJCWlmICghcGFyc2VyICYmICFyZXF1ZXN0X21vZHVsZSgiJXMiLCAqdHlwZXMpKQogCQkJCXBh
cnNlciA9IG10ZF9wYXJ0X3BhcnNlcl9nZXQoKnR5cGVzKTsKIAkJCXByX2RlYnVnKCIlczogZ290
IHBhcnNlciAlc1xuIiwgbWFzdGVyLT5uYW1lLAotCQkJCXBhcnNlciA/IHBhcnNlci0+bmFtZSA6
IE5VTEwpOworCQkJCXBhcnNlciA/IHBhcnNlci0+bmFtZSA6ICIobnVsbCkiKTsKIAkJCWlmICgh
cGFyc2VyKQogCQkJCWNvbnRpbnVlOwogCQkJcmV0ID0gbXRkX3BhcnRfZG9fcGFyc2UocGFyc2Vy
LCBtYXN0ZXIsICZwcGFydHMsIGRhdGEpOwotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
