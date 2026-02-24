Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5CEEFB7EB
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Feb 2026 02:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WGCcOS0Zm8SCEKkjmafyZo18tollU/P7WubtVZjhRrI=; b=iiaJWear/ZjSa4
	WbTRew6Id4eA01lOEEaCO5ng3fzjXlFaHKxfcO1kmZrY6cNQy38fV3mCG1XTfqBmy99iPFI+FIgBx
	2WBdnYJmfcgr9Uu0atLqztyiKjV2ks/PNVplPjo6qGemnTkws9VT9JVpxRLuX5IRwCW4CuU/sWeIr
	MxJRIY0HSZaB4P4mH1aP9zHXNdfqW9QC737ZwXIBmHBIXzbgn7oizyRDQPgRN+Puz7gUB0MU9UW7K
	2cKvJDZzLbwwCgMYRQyCKhVXEtoQ3lGyTBtWtaxUogX6LMqkGfPRfkqB70RZq0L/I86jqDHhvrAXE
	eZxSX+iZ0CKvYIy81eQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuict-00000001NgM-1U2p;
	Tue, 24 Feb 2026 02:58:19 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuicr-00000001Nfo-1nJ6
	for linux-mtd@lists.infradead.org;
	Tue, 24 Feb 2026 02:58:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-824b32875e7so2355514b3a.3
        for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2026 18:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771901896; x=1772506696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66KCJd/pILWRGdHs3t4QOX0a1rmkvvfDci4VwcS/sME=;
        b=Zu7H8+L7QgAVBV9i0MWNa6FlBGz24Ea0pSxxtJCjSMGnCI57O0mWhF5rS+QOtup7wq
         a4hXZrXY2gsiIEpdaaeRKQUBlt0hF6LTstKp03J5NozfhEEUz5KpOJArqex0ZzJs1j5L
         VQJliGBx9Qr4oOr5WMVFTsptI86TyzYQV4jbQ0HmuA/y+Luvm8mthWq2xDA2SdksG45F
         hmgV4umwxNs2KatrutLtt/b+wsQFhDIhlzS3pFezdus4WC+h+gowYMSPEONgHpzEZTQq
         BoWlCCDQcXUsLNeEhDIDZHBnksdT5wMv+cby0oAjTuI75I/dSNDIn15zhV3HIQzQzpdL
         4j5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901896; x=1772506696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66KCJd/pILWRGdHs3t4QOX0a1rmkvvfDci4VwcS/sME=;
        b=uXySzcesOjrI5JlRwk+Did0I1CGY1lvvBaMEwIEi92ZfA4tInbXttT2K1r1o8bXBtW
         dABlFH68rHmSOKBxsk8bLjJ+eH3XoYN8ox5WN4bqfaXLrKunJji80IvHMn7MRxcQ4Or/
         7St22982GmW7r2tSId6Pj8T+i2ywI4zFN7NdxP4L7LC5YwrWlwKEk57hckWYlRbV490Q
         JMRADr3d5+Xu1/vn1i5mM9YykM9N+ejfumXnYdRjwvHDQd9W9yCoDr3/p3d3zwh+V+Bt
         78AbWKcY7ayVmlQ7hrnR5nq7eDyH5kSgHLBXqlY0A2qLSzHdKj34+C0dEmYut+lzTvlF
         LLBg==
X-Forwarded-Encrypted: i=1; AJvYcCUL/bo7rKS2Z1r36Rhlbh44xWRQeSytQKJ38osG35NaMBPwSB8ETXwuNr+dQoLOowP4nu16aDr1two=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNi1spOd3M3S4mjSoSaL0BUpGjL2gsFODNKOOs4gIypmpe769n
	yeeyn50BmUYJnDu8TDk5fpEkkyXAs70JwtKI3x4eOndUoia58PN5HA0K
X-Gm-Gg: ATEYQzw+qOAOOGmjjh74eWmIWAvODyCqx5Ei+fVUo6shZo3oG4PPZPUDZMqGB1QYkxn
	tz7KUuQUPcfcLOvxf/zY0xkvP1YoCZKfwlcGccRbUwMz98Acpk69echoGlsHL+ssHan3g8IGXdK
	QT3OpstafMTjxHZPN3XEBQY9xjzhHTHgQZdCPGnhHoBBqwZkm/qGBm1HWR3GNWXYb0CxYrspDRa
	rryGdDnxOxPnH1rTgC4udMOD8Yq4oBE8ajrU0i0AotXMicTho0U+mGIXOXKwQE50wMDdFlleJ4p
	qs8jLh/9uUVE+QFPD9z4J/t1qIUstQ96umBZkFTArB3v0BryuBLM/p1cbErYYFuJ9XVBxrnb+Bn
	6DaPys4wv5rDD67fzOpSQv+D6d9hlFaQIE8UftyxNL/uwXuBw9UNAcnxRnheQBBHS342Np3jJ8I
	Eninkhbfqu5KfAq7mHPUfAwCdnhu05Vb0/n2VPxs2XgQMn9PwbKHKV+zrm
X-Received: by 2002:a05:6a00:854:b0:81c:717b:9d38 with SMTP id d2e1a72fcca58-826daa25785mr8203782b3a.47.1771901895957;
        Mon, 23 Feb 2026 18:58:15 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd68e147sm8121442b3a.19.2026.02.23.18.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:58:15 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 9F1094136071;
	Tue, 24 Feb 2026 10:58:13 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Jakub Czapiga <czapiga@google.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH] mtd: spi-nor: core: Fix false positive in Read CR capability check
Date: Tue, 24 Feb 2026 10:55:50 +0800
Message-Id: <20260224025550.1102660-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_185817_496468_0A0754D1 
X-CRM114-Status: GOOD (  11.78  )
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

The current code uses spi_nor_spimem_check_op() to check if the SPI
controller supports the Read CR operation. However, this leads to a
false positive where capable controllers are wrongly flagged with
SNOR_F_NO_READ_CR.

SPI_NOR_RDCR_OP defines an operation without an address phase
(addr.nbytes = 0, addr.buswidth = 0). When this operation is passed
to spi_nor_spimem_check_op(), the function overwrites op->addr.nbytes
to 3 or 4 to test addressing capabilities (as it was originally designed
for data read/write ops).

This modified operation is then rejected by spi_mem_check_op() in the
core spi-mem.c because it has a non-zero address length but a zero address
buswidth, which is an invalid combination.

Fix this by bypassing spi_nor_spimem_check_op() for register operations.
Instead, directly call spi_mem_supports_op() to test the exact operation
without altering its address phase.

Fixes: 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support")
Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8ffeb41c3e08..13201908a69f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2466,7 +2466,7 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
-		if (spi_nor_spimem_check_op(nor, &op))
+		if (!spi_mem_supports_op(nor->spimem, &op))
 			nor->flags |= SNOR_F_NO_READ_CR;
 	}
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
