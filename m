Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B954C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 13:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Il1++XyaRTUvz8TLDQV6MHLrOJIwGd3nbMhYSYjMyQ=; b=0fq9j1xOjBwy4E
	iGrwWkvDnNhg1rzkNxKU4VMJrpuwApr79YvEDQULFgDCVxpiTGM48O5Kh18jANq016NDEJ7mLgFFb
	3w7O5vMen0D/iZpknw3ryaExylRlay0lZDRVccdCL5dY0dko8I7NTxDI9Ab/hxUmtjAbYaFJNoQrL
	N12Joe3YH9Ya98Kpe1rsUGTnQO5v33WsWpLXpIBdQaBo6crbaXPLgYGu2gXq1OB4wAX/6lP45Jh9a
	eQ2cwFDoseXjdCE23KGGG5DSaE/Hglj8NXyG1vlBMmgYH7EMRUoNEqVUVZhmmH8ykjwRN4ZStpJcH
	2zrCiEcV7tdqU011P9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4k1T-00BXCZ-QU; Tue, 04 Jan 2022 13:38:43 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4k1Q-00BXAM-IW
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 13:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641303520; x=1672839520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VgbAQpftXwrGIO11WeKJEI86gSonJP5etagd1SMrm8M=;
 b=Ab8LDXED/lg2iCJMHb9z9LvKGUe8fC735PSn4JdYxOfGY7os3YBWS78i
 Q67KKDIdtd5QpyY5ATwl12hWtVOcp+cN32OKkU9c/tj66HQ7riKgtkPvR
 HXoivykngYnt11JBkWSN+FucmI248YgNBU3GWaYR2qgPzRft9jVTqM1YL
 ZhMV0+CCgbK+XRJCMz5fwnHtyiBocH0Av7OOXY/I7nR9jbjHczFmnlmHm
 yK66hjPDQfsFTaUaCpMJXIt1ArelGMhHE0tll3OJh1IKv0XK2OvxhhMHw
 y/u+4LK5BEyiJKI50PW7b0ipzNJ1phXGvEIBK+5HUD23FqTsTEjpgyVCB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="229042723"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="229042723"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 05:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="760439210"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 04 Jan 2022 05:38:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0249B512; Tue,  4 Jan 2022 15:38:45 +0200 (EET)
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
Subject: [PATCH v1 5/5] thunderbolt: Drop duplicate NULL checks around
 nvmem_unregister()
Date: Tue,  4 Jan 2022 15:38:43 +0200
Message-Id: <20220104133843.44272-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
References: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_053840_691117_8CED2C7F 
X-CRM114-Status: GOOD (  11.32  )
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

Since nvmem_unregister() checks for NULL, no need to repeat in
the caller. Drop duplicate NULL checks.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/thunderbolt/nvm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/nvm.c b/drivers/thunderbolt/nvm.c
index 3a5336913cca..b3f310389378 100644
--- a/drivers/thunderbolt/nvm.c
+++ b/drivers/thunderbolt/nvm.c
@@ -154,10 +154,8 @@ int tb_nvm_add_non_active(struct tb_nvm *nvm, size_t size,
 void tb_nvm_free(struct tb_nvm *nvm)
 {
 	if (nvm) {
-		if (nvm->non_active)
-			nvmem_unregister(nvm->non_active);
-		if (nvm->active)
-			nvmem_unregister(nvm->active);
+		nvmem_unregister(nvm->non_active);
+		nvmem_unregister(nvm->active);
 		vfree(nvm->buf);
 		ida_simple_remove(&nvm_ida, nvm->id);
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
