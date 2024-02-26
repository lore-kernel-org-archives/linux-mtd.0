Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7004CC54E4A
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lh6YGEFnZMxDDxhK0xuTD/Pi8jCSj+y7Q1s1i3I+EaY=; b=lMiQ9L66cvnMye
	7EzrTQ8nQg0i3fptaPXmHPXRTjEjg4qvCcqeLRBhlpwcX5nCm7tY7MStcM6R8nOqDs7T7VfDdfJb5
	H4RbL43ScgidmjreXgJIQm5KlmX59Gfd+WQdpV4XTELi7yG28G0pBPRuxgm41AatcEGRIV0iDj6ni
	iFwMRx1U6hFLFrN8P8ZJ/lS5COu+czE9/u4O/HEhCjDtPuZdhrlc8VSUEKZEjmsTlrGXf51QYerm1
	R4APomu/eA+3VitXFDMaHc/0hsMb29d8KRW8adFCPW+TWp+b1nbkRDBEL5aKIKGQBGE33461G09r6
	oTg8WT4JNT4PW/fOKZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refdz-00000002ASK-0Ztr;
	Mon, 26 Feb 2024 18:24:03 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refdw-00000002APn-05lW
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 18:24:01 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1refdl-0003fF-06;
	Mon, 26 Feb 2024 18:23:49 +0000
Date: Mon, 26 Feb 2024 18:23:42 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
Message-ID: <186fa96ae25f7033ff8b6f0f7fcfb1e602f556fc.1708971705.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_102400_084993_C5D850E7 
X-CRM114-Status: GOOD (  12.16  )
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

A compiler warning related to sizeof(int) != 8 when calling do_div()
is triggered when building on 32-bit platforms.
Address this by using integer types having a well-defined size where
appropriate.

Fixes: 3ce485803da1 ("mtd: ubi: provide NVMEM layer over UBI volumes")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/nvmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
index b7a93c495d172..5820a170d2512 100644
--- a/drivers/mtd/ubi/nvmem.c
+++ b/drivers/mtd/ubi/nvmem.c
@@ -23,14 +23,17 @@ struct ubi_nvmem {
 static int ubi_nvmem_reg_read(void *priv, unsigned int from,
 			      void *val, size_t bytes)
 {
-	int err = 0, lnum = from, offs, bytes_left = bytes, to_read;
+	uint32_t bytes_left, offs, to_read;
 	struct ubi_nvmem *unv = priv;
 	struct ubi_volume_desc *desc;
+	uint64_t lnum = from;
+	int err = 0;
 
 	desc = ubi_open_volume(unv->ubi_num, unv->vol_id, UBI_READONLY);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
+	bytes_left = bytes;
 	offs = do_div(lnum, unv->usable_leb_size);
 	while (bytes_left) {
 		to_read = unv->usable_leb_size - offs;
-- 
2.44.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
