Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A0EC46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 06:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OGJgWt1rYnsD6iHJKiFPPl9Hc3PYXoKlaiu6e3GV3MU=; b=VPMK+0fWCLF53V
	P7Iopt6Js1AncCoKUl90I7V/94CyVAlXfqnrpj/XJPVCoHGZciXHaWRPMh4O0nkCuvFvKFNRL4ejJ
	LoP+4ElptdwzkAK4rhSagDMTRtEQzMfWiYY4sqJQBcQ4wmFxoe6eWhKbAY6eVUwXKZVQrG5hi++KL
	POAM+GwjJ74XiGyQBC2YOc/eO0FNOAAGzfNiBwZHVue3IrwEviNRI2PGh3paOqopD7QWDiWj5K6jq
	4RO3EF+M29thQdxReeS673EUF8NvhhjSJpEEnzRMP9eM4voBIl+pYRCbinUtap7ERVpjhemw/B6x2
	uunphi98f71B2TMllNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSWtF-001kx9-0q;
	Wed, 24 Jan 2024 06:37:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSWtC-001kwc-2b
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 06:37:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E830A64507DA;
	Wed, 24 Jan 2024 07:37:30 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id KGTPGDENNKnb; Wed, 24 Jan 2024 07:37:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 73AC564507DD;
	Wed, 24 Jan 2024 07:37:30 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id L8avlpaUQPNY; Wed, 24 Jan 2024 07:37:30 +0100 (CET)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 3541A64507DA;
	Wed, 24 Jan 2024 07:37:30 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Chenyuan Yang <cy54@illinois.edu>,
	stable@vger.kernel.org
Subject: [PATCH] ubi: Check for too small LEB size in VTBL code
Date: Wed, 24 Jan 2024 07:37:02 +0100
Message-Id: <20240124063702.5642-1-richard@nod.at>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_223735_014987_918814E8 
X-CRM114-Status: UNSURE (   8.80  )
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

If the LEB size is smaller than a volume table record we cannot
have volumes.
In this case abort attaching.

Cc: Chenyuan Yang <cy54@illinois.edu>
Cc: stable@vger.kernel.org
Fixes: 801c135ce73d ("UBI: Unsorted Block Images")
Reported-by: Chenyuan Yang <cy54@illinois.edu>
Closes: https://lore.kernel.org/linux-mtd/1433EB7A-FC89-47D6-8F47-23BE41B263B3@illinois.edu/
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/vtbl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index f700f0e4f2ec..6e5489e233dd 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -791,6 +791,12 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	 * The number of supported volumes is limited by the eraseblock size
 	 * and by the UBI_MAX_VOLUMES constant.
 	 */
+
+	if (ubi->leb_size < UBI_VTBL_RECORD_SIZE) {
+		ubi_err(ubi, "LEB size too small for a volume record");
+		return -EINVAL;
+	}
+
 	ubi->vtbl_slots = ubi->leb_size / UBI_VTBL_RECORD_SIZE;
 	if (ubi->vtbl_slots > UBI_MAX_VOLUMES)
 		ubi->vtbl_slots = UBI_MAX_VOLUMES;
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
