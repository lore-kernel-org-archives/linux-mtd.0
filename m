Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EE9C43217
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 20:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCS7uIyXFCpsYkDz+lYOaGiDLv4SWsBkoaUUUVw9UUw=; b=oOeBLXaTi3Ncma
	XqhLns9lbg+/0bEZSnRJ8QC888/5WLmCOGuI6edkoxv2I695YNoxrmno+ngkzvliAMHgkR9L6Sklm
	mGmKLMCRZlTqdAYfifo5sHtJCLpKOzD1bzI/ye/lmYungGMwXRP4PH4wau1xyyiNV/KMqu8CiZGFb
	yvVXu0ZSKIZtdpldCcC0ljmE4lL8Rn2Is0JxzyNIKGqb5VkCeqTy5tqBWAWmicZky57Z9GgpAqT1I
	5FsXezdKZB1NtGBVVlARsAEDuPWGrps7/L3FB4JPej70G8q3SxTYPj4pRPIS1JGpjmUv+pzPbyPGn
	YJUdUI1hhLy7K5Dt/erA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osrcG-00Gzif-Rn; Wed, 09 Nov 2022 20:24:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osrcD-00Gzfx-OH
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2022 20:24:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 91757B82004;
	Wed,  9 Nov 2022 20:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770BBC433C1;
	Wed,  9 Nov 2022 20:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668025441;
	bh=7+5jyTKDsBSnzUCypgmhEzafnQWwO3MDHgaXspdMOVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YTvRSomozFkiUg/FfR3yII1xY8PkR+w5h0C/UzmWX0Itx4wzX7VptefOqXmMGxhuP
	 MLJcDXaJXSOVudCNuNYZLGjRZN8AzVQ465SU3fu3UfOoo7lX3vbjLPPQPCxLHY2SVI
	 MDQ/q4RNeM7fhlwIOJ5HjoN+Q2ipG0WlrtKMpfMePmp4kFbj7EdPipxB3q1saktGFX
	 1NVQ7oK3PxBPht7A8b/ipFkNUvUK/hJTW38VKoz2V+Vhpc7OjD5pckLOue2tng3hUG
	 Xg/RTX8xz5yGtuD4kc9AgisLEzwowboi0BftHtgGCAF8IHzvEvXsHAVjbkLHdyLz1x
	 MpcU0Bf7dqq/g==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-mtd@lists.infradead.org
Cc: dinguyen@kernel.org,
	tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	linux-kernel@vger.kernel.org,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Subject: [PATCH] mtd: spi-nor: macronix: Add support for mx66u1g45g
Date: Wed,  9 Nov 2022 14:23:48 -0600
Message-Id: <20221109202348.93666-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109202348.93666-1-dinguyen@kernel.org>
References: <20221109202348.93666-1-dinguyen@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_122405_953409_766166E5 
X-CRM114-Status: GOOD (  12.19  )
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

The MX66U1G45G is the smaller sibling (128MB) of the MX66U2G45G (256MB)
that is already supported.

Tested on Intel N5X socdk board,
  - random data write, erase, read   - verified erase operations
  - random data write, read and compare  - verified write/read operations

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/mtd/spi-nor/macronix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..46ba898f3dd0 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -97,6 +97,10 @@ static const struct flash_info macronix_nor_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+	{ "mx66u1g45g",  INFO(0xc2253b, 0, 64 * 1024, 2048)
+		PARSE_SFDP,
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
