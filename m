Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17EBC52D54
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2024 19:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PIiWiiF3/q0X6lXuQpDCh0RnGiNE9IvED83eGuQerZ0=; b=klKttRAnwhljZZ
	9cP5TEN3Io9xsUpeM+OM3ZEo7VHAdtbkuAV0RiavKirvPfsyIJ3ctEVRWtY/zf+rZSShx7/+X2JH7
	SObKa0fraK7JyktT+o/UsxN8wNvRkNFmtSaHEPVeFcbi6EHt8VX69+I7wPU/Nx8A4XMrhATnDlQxZ
	YozJfpAUNSvMLFFa6n9i1A51imUQ/M8yEt4BWVOCX2V7QgOOQka0LLPjyHks3ykx0d+ZUZ3RLFWbv
	MECnvpuiyAWQxiAWVxoXVCoCSjcks66CXSmGpB6LAzryLTLW+3fkZG9zRyGs1edLg2CWIMUzCxhmv
	woIZBrQZPOmiW/3PUk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZEq2-00000002FXV-2X3U;
	Wed, 31 Jul 2024 19:18:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZEm9-00000002E70-0IkV
	for linux-mtd@lists.infradead.org;
	Wed, 31 Jul 2024 19:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EDBC61E89;
	Wed, 31 Jul 2024 19:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3A4C4AF0F;
	Wed, 31 Jul 2024 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453256;
	bh=ukYI81uokU0BeUwLmOS4D2F7xXqpS+znxKl1c+2meMI=;
	h=From:To:Cc:Subject:Date:From;
	b=m8pspgt7W2gbKhsOsQGmqzBdH11VC2v7GYkGwIUcPv8JBrKmw0zw+ebsn1b174T2L
	 iRrapwnXNksDnITIlRBULpE+MHPef8H4GCIUEuk1THlg8pZFL1qXxBe84mWn+52cZw
	 1arhglWORDbPwqnTihpVdSjQXhva5h593MX+vj9KeAd9pJPPX/JHG4e2yEdpbMY+e2
	 2OOPxrt3hvBmWmVxwt42iNGFeWKWN96lhBTYMxcWfTFlsf7jqkDjHPuBeyRmKcaXMv
	 3lKaVE0adICprVohWDcWjVMpDG7SB2uF7j5kP7CTKqIV6Y9QAWx2/6loG3XMQEzzeV
	 YimlvggdmFp/g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: Use of_property_read_bool()
Date: Wed, 31 Jul 2024 13:13:00 -0600
Message-ID: <20240731191312.1710417-22-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_121417_223272_41334FF5 
X-CRM114-Status: GOOD (  10.41  )
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

Use of_property_read_bool() to read boolean properties rather than
of_get_property(). This is part of a larger effort to remove callers
of of_get_property() and similar functions. of_get_property() leaks
the DT property data pointer which is a problem for dynamically
allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/mtd/parsers/ofpart_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
index e7b8e9d0a910..abfa68798918 100644
--- a/drivers/mtd/parsers/ofpart_core.c
+++ b/drivers/mtd/parsers/ofpart_core.c
@@ -157,10 +157,10 @@ static int parse_fixed_partitions(struct mtd_info *master,
 			partname = of_get_property(pp, "name", &len);
 		parts[i].name = partname;
 
-		if (of_get_property(pp, "read-only", &len))
+		if (of_property_read_bool(pp, "read-only"))
 			parts[i].mask_flags |= MTD_WRITEABLE;
 
-		if (of_get_property(pp, "lock", &len))
+		if (of_property_read_bool(pp, "lock"))
 			parts[i].mask_flags |= MTD_POWERUP_LOCK;
 
 		if (of_property_read_bool(pp, "slc-mode"))
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
