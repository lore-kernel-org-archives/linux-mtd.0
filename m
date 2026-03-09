Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1E2FCA188
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 21:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2l94+/bTQxgQxYGcxMRnu0aiHwAWHHDaIuklZn3BxW0=; b=UcDkVs5+2zS1Tm
	GLiw6KrkgUzvsdu/y6OT6L+2/VTvjeqdMteW+a5g8xPeXFrqCLBcaeKSwdU3XOPlaOGd5DFQNNldM
	tpcFr+y9Zhbih67tsh6QLPISGvjqOdYvbsEzGisnHK6A7vPh2bFCnuNT8VzIIX/gHZ5BHzH1dDPoR
	skLLuvkeSWnv9j6TdHW3yECDL1ltw4H4aK/YAmzEapyypVGutTimAmJ++tEenpXAeY9iOFUz8HCyE
	Ort8d6/v5DA98XaQBe/tbBfSWlotZoaa9tzWBnQP02b2AtLBC3xGa/w+nu5SimsPgL/J+FOCjMmUo
	1c2SLT54KW0b5BW/OfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzi0I-00000008Apr-0kLB;
	Mon, 09 Mar 2026 21:19:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzi0E-00000008ApH-0HTz
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 21:19:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38396C40F8B;
	Mon,  9 Mar 2026 21:19:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93F775FFB8;
	Mon,  9 Mar 2026 21:18:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4E2310369606;
	Mon,  9 Mar 2026 22:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773091127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=WQCC7qLwEwXjdT52/kU0/vQm3QTOAKOigJjuuM91qCc=;
	b=D3Y22NdBYmILzslojyy8qCngMeNcA8eDK1EqUHjJXZPToCTUUeJgnEywyyCXcO8QeseZMR
	F0dRgNDtS/oP+qqNQGkQ2D8erX2EMuNhNzPdAFyKJ6JnVlsWFTLpIcQ2G2brtBqGBxGoYe
	gXqOD1Fhx00lPU/5r/QGOXee/+sQvgMm9m2Ih5t9fH0H9AaHJQd2/JqQx/3/RQt5Gv7HHg
	OA9gGkGmGi7ukjow8WPm+jPW2+ZmPS5604x4MP6UpzvRDVgQsSKKfDljjAdgH//7C+X4vu
	APdX1NjkALQntnq+ywWC2s/aZ/nSdVCT4rONDFpvHFn7NyZHilYyllh1OxCtIA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 09 Mar 2026 22:17:48 +0100
Subject: [PATCH] mtd: virt_concat: fix kdoc text
MIME-Version: 1.0
Message-Id: <20260309-mtd-virt-concat-fix-kdoc-v1-1-7028579b944a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPs4r2kC/x2MywqDMBAAf0X27EJ8sBJ/RTyE7LYupYkkQQrBf
 2/wOAwzFbIklQxrVyHJpVljaDD0HfjDhbegcmMYzUhmMha/hfHSVNDH4F3Bl/7ww9EjmdkR02Q
 XYmj5maS5Z73t9/0HQ23BVmoAAAA=
X-Change-ID: 20260309-mtd-virt-concat-fix-kdoc-604a6d63976d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_141902_545459_8170CFFB 
X-CRM114-Status: GOOD (  12.05  )
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

The function name in the kdoc comment is different from the name of the
function being documented, fix it.

Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603041232.fNDHNtUa-lkp@intel.com/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/mtd/mtd_virt_concat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index aea88d1c9bc5..42c3bf189faa 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -222,7 +222,7 @@ void mtd_virt_concat_destroy_items(void)
 }
 
 /**
- * mtd_virt_concat_create_add - Add a mtd device to the concat list
+ * mtd_virt_concat_add - Add a mtd device to the concat list
  * @mtd:        pointer to 'mtd_info'
  *
  * Return: true on success, false otherwise.

---
base-commit: 43db6366fc2de02050e66389f5628d3fdc9af10a
change-id: 20260309-mtd-virt-concat-fix-kdoc-604a6d63976d

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
