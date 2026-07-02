Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B2BC43327
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 02:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SAeKHhVvGqUUf91mMKxlsAxvqS6NKYLKYS6EAB8aHA=; b=jHK1n0WQBluKCV
	D0GZQ2N7rN4+N5+L+7k+PunSrEKjpyQiT3v6EY3p6qIm3HcmbdPdXXYkhnnFl5q7xlf/l+TL+1Mu2
	3+3j0aVxtRjg8n/odi6ckIIxkm82Jrxu/GBUdHExqjS7e5fvuGnCqPgXWMKmWp27Yu2wxDJhVyJel
	4gyL0RyoCfdGSIhRGXhFPN4giR/qb937g5qmjO315pTEdN206rZc882yFE9dSeVq73ZTkiqwOnz1x
	TWSyNwKZcUoBP3I1U6USLDC4YMOarzVZ9yZ4pNYJ1zsIpwjidPv1KpxJ6z4QfGiKCU4hd6zcPBn2d
	JFdVtF7K7DE9BhVAsC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf73v-00000003Prx-2cef;
	Thu, 02 Jul 2026 02:21:59 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf73s-00000003Pqr-44q2
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 02:21:58 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so119367a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2026 19:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782958916; x=1783563716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rk4f9pe08Y0Xymq/tiB3v7hgDPpfmTVL9D64rhPQKA=;
        b=ISrowWBRSOpE00KphTFOtIeIZAbRLe7W5XOj1AFJXPrhIfIm+qLyhQdyeN5pLENrKA
         c8k5lnrvSxKfu568zwPw3FoU+LDcASelJg4GfYDYOAmfe+pky/28SbxZ94C3WiMf50Hf
         tDgxv3x64g4w9zRTxXIWzeUNsHabnxgjxn0zUg+GReg6Z8TRkWl7rNTRy1lZEVC8NQ93
         BWv8Hx1KE6i39y6dVg90mcvIy+Zg1ASDZowvAieGjP3jP+nV1vnd/KvMMlnVXK9ctJfl
         k4NJz6eefE4MXdbCBt0zq3tkr+vz1RVUPIjcDIIQdis587CrNN2N5JYktfVHhXD/d2Yy
         mANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782958916; x=1783563716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2rk4f9pe08Y0Xymq/tiB3v7hgDPpfmTVL9D64rhPQKA=;
        b=AY9HLi9wc/3YYxTunxWOn/qQgPKq4XBJHYDrBQPG7Iq/nMMeIGCjX3z1qqapXoZFQE
         VqWBuF7XwxwINB/tCmdKKfzoJMulCc9pmV7g+6l9wXhtXw9anbu4hj0yrOcwBb/hVTWD
         6YQjRlVe0nzHvcJg/L6kBeAaoRN0ptfDPbNArpugespN5u9X93JL5QYJ73iwMGnMxUuO
         bwDqcZrvtzmiGVSRGLrF2+IywMjNQIfOCGFPhxairHU6Enqj2rSEkDfaC+PoeBTR2o7L
         kKMNpIY6Z1xd+ctjcPkdYFV3qgC2gzUdaJKfWardpNqeE/4LV/VW4jq5L5GWONs7Fv5e
         qyHA==
X-Forwarded-Encrypted: i=1; AFNElJ/mtWfjoLd8XZjZQWLDSyyYtdFqk1q3t4RrVV/CCEOs/BClazkX5G756OKJjX/Wg+ZOLHGk4OTAhL8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUM10ntfpgKxjHsUOK0hcn3eN4yFHNgXBHRVfvIaxOTnV2WIQB
	iC5o1jGGR8twJ61mH0X+/7gG6ExpEX8NB/jkidcjarkhlrajN1VLmjSUKn/wbQ==
X-Gm-Gg: AfdE7cnT4CX04NrNSlBQOKml8nLBlm1ovbd35kQRvVLOAQMuBYMIQYuZZGriWCmjZEq
	+KFXJQ5D7308NOkAdcV3AhjZ5UTdsgre20ZBk9I7YnFwvuLLCSSjmdVTP5QtWGL/tFCg0VPzWEN
	DaZ1rsz7pv7rOEomuSp18pJyhc2A8LZczuXkAW5ImqFGOUX4Oon9BbzUr/WdfJCDLqZNQgDIvMW
	VSvjnlWOJL7pnLi/ATF3kBddN6ATp9we3TFxteFuot476Lm5nr59ToOIxksu7muw+cgoEweNX97
	FcuA43u0TqCH2oKRI7fcK/9fH01ddbza65zIKhS3nazX8nm5zPsULTw6mq15intgprXHMzILu8Q
	uEzsJepjCc+P9dfZNEZ49LVOWEg5o/6eBfSMXfEwAsBiPkpf3OvF4NJ9c/mSEjgaePiH4LjptnO
	+xq5O/Jvb/HMf2FsYRvdIcmLX0T3fLSdogK74=
X-Received: by 2002:a05:6a20:a11b:b0:3b2:924c:567d with SMTP id adf61e73a8af0-3bff42bedd3mr3849179637.46.1782958915817;
        Wed, 01 Jul 2026 19:21:55 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10645sm587918a12.4.2026.07.01.19.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 19:21:55 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id EACF44168D45;
	Thu,  2 Jul 2026 10:21:52 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: stable@vger.kernel.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 6.6.y v2 2/2] mtd: spi-nor: macronix: add support for mx66{l2, u1}g45g
Date: Thu,  2 Jul 2026 10:18:42 +0800
Message-Id: <20260702021842.2771498-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260702021842.2771498-1-linchengming884@gmail.com>
References: <20260702021842.2771498-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_192157_013010_124FDDB0 
X-CRM114-Status: GOOD (  11.27  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

commit 797bbaa7531f75985b199e484451fa3f954382b3 upstream.

Due to incorrect values in the 4-BAIT table for these two flash IDs,
it is necessary to add these two flash IDs with fixups.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
Link: https://lore.kernel.org/r/20250211063028.382169-3-linchengming884@gmail.com
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b676a71822a3..fc43e0ffa3d9 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -116,10 +116,14 @@ static const struct flash_info macronix_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &macronix_qpp4b_fixups },
+	{ "mx66u1g45g", INFO(0xc2253b, 0, 0, 0)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ)
 		.fixups = &macronix_qpp4b_fixups },
+	{ "mx66l2g45g", INFO(0xc2201c, 0, 0, 0)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
