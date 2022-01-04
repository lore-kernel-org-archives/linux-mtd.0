Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1FAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gb+9LHNYDxkoy/NO1lwxYiW3g2TF0mlshnMccY7wI2o=; b=Tg6gTnRoxlBQkh
	dq7PaA45ShlVzosmU8tzKDg3KQ0pSN56NnkfiNWLER5S1yFKf3xI98nJz5vU6Z33SOuSQ87Hgk7r1
	+DOUE0tR3Y2c6+onuC39yJZYdEjdXfOtBNm7ldQVEzU/FvDgAQsrFFBJVwunepwli789BSOilYDnj
	pbQoRxNbtxktbNtoJc8Rc/mUl29qkZfF0vnnk0ViEKLVLgfFJl+XzuoPedwvOcitPQ3gF/o/Q6DQZ
	LgrbIDvpUEjIus03fHKZQ3tfUhfIdzWYtuOkaT1NkxlZFpp7/k/jWPby5wGKKExr0gx+P0LuFKvaU
	DmPPRUlJKam1JXhsXGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4k2U-00BXTz-AS; Tue, 04 Jan 2022 13:39:46 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4k1T-00BXAK-8a
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 13:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641303523; x=1672839523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5n0NVLD2/m8t8Qqc0BSLS9vuywuO9nv/kXq7ES1D9E8=;
 b=fLCosGhCAdk6eyJba5WCaUUPxSj2hUUUpzvX7vrxgyrZT8e+IAd4SxiA
 /4bk4u0ItLOmqNH27BlMiIwjNeLtxidgBQAYk5qhoTG49Ah6M8Jg4ToEt
 /CDjr1Z/Hi2iqUhvLzZnq7JGWLHt6rV8GgVP/fBMNq39j44xQ6Pfyg+Ct
 LF+D+zmvADF7HPh8FwZWr9Faf/bAeRebF6/4yEtWmG9kSV091CXkKSn1z
 eNVRa4mp8Ccta10B9fimT8jFM2Fs9YkRxRtpKIomvW1k9p8knHXgyF36X
 BWcA8qk9OzxB9AQQY2UM6kwVhiQKZ5ElKbCKvuQEn6eADfdHTMuUkyeMZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="302975571"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="302975571"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 05:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="472066539"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 04 Jan 2022 05:38:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DFB2A21A; Tue,  4 Jan 2022 15:38:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v1 3/5] nvmem: core: Check input parameter for NULL in
 nvmem_unregister()
Date: Tue,  4 Jan 2022 15:38:41 +0200
Message-Id: <20220104133843.44272-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
References: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_053843_376821_0787E8FA 
X-CRM114-Status: GOOD (  11.72  )
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

nvmem_unregister() frees resources and standard pattern is to allow
caller to not care if it's NULL or not. This will reduce burden on
the callers to perform this check.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/nvmem/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 6946d14876dc..3ca6615d9430 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -903,7 +903,8 @@ static void nvmem_device_release(struct kref *kref)
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
-	kref_put(&nvmem->refcnt, nvmem_device_release);
+	if (nvmem)
+		kref_put(&nvmem->refcnt, nvmem_device_release);
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
