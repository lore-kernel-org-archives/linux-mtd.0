Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52284CD4846
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Sep 2024 06:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X9aHhF/KQTTV/Umo5Epg68d+Ps4YaNbEAi0yLTNaAos=; b=sKej0dF29771k3
	Re2GP4q3ybsQNJEoe5+XAVx2Qj4fbexffDwq739bNrUxXze9O3yL/ra/nSKkG+ERz7rVJfslso6au
	dKhf2JUxtl9XSqYRPyYhLdN2pZZ0rIptx7Io+TCl8UIGvyLOyza4vJb4W/ep6yJkE7m61idp8jRv+
	yxu1/ueRsCsKZE2WixeFYXNBsSJfn+x6P1PpxTqJioJY5YjT9firH70dWF6ZXyvI3cwGzW99f27mU
	0eiQwJ0401HMfs56mrPhf89Oju1l0EyYhAejZX2TozM//yho6KYkC+lVsuGLvTnJrfnR6fOIORBHO
	6klTtp2NjSxTuBlf5flg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smozd-0000000EUG2-34L2;
	Sat, 07 Sep 2024 06:32:21 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smozZ-0000000EUEy-38ZV
	for linux-mtd@lists.infradead.org;
	Sat, 07 Sep 2024 06:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1725690727;
	bh=6PCxOPhH4pc5zWqAmBT2Y6vNrLexjd5OGQB7tCEPWPI=;
	h=From:To:Cc:Subject:Date;
	b=vbq//FlCN4MlmSSSO8bw/h585sNx3tRtFZya/AYlZq6nvZQvOz+yhphM+eOu18A/w
	 47i4aZoC+xwuVam8nmXR9vrBEUN0D5+XebPew4X6gXYF8h+GHwBw2bvHLGqrhMBy7J
	 VlsU5rFrYvEjr9ljGiqemQ7dmiqmeW9Gsq02WnNg=
Received: from localhost.localdomain ([171.223.88.74])
	by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
	id 7FB19A96; Sat, 07 Sep 2024 14:31:59 +0800
X-QQ-mid: xmsmtpt1725690719t11a4eqc4
Message-ID: <tencent_E68F624B67F256EA24115857B3DEB5E84907@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjIMeIJKLpiTQNDy6iX/T1YBneIZWcd/EK1ZCjdRoe+ZBf3EG6U1
	 7r2kxiPMEzMqbFfDaurB1lRYGIVSFDS6qfX424/Ei1KJ9ZGuPU/K7INTFHDbaugvOZDaVpNVQTtn
	 5C8Pzsf5k2OL4kq5BypDJLWfOuBCF6nni3Nl438FpBKvg6wf8Rcpm+w7fzch3l1jdappwDw+6zad
	 LkeNt8s9Fy7+rRXl2N4NKnDEh8Uaq8SwIqbHn+9lMIqKFO46LBXYdmaWz4CAfbUHYnIEetZK9zf8
	 A3BiwKqUSwAfwyMpLj6AMx0tRJinTd0fL+xY9gw6rh2IoGCCLmFp0EC2iJigwvodhac74C+fv72p
	 qYBnpN6SjTm3UHqj2QA2xCV/2ldKlqAND+XjrWnDiR9hMheKIvAm2PtkWb9325D5NV/uRzXjZkJh
	 QI16/CK7vvfBSn5hJ80rpgoTc/5Zg8cTqM4ryxvEezkIGvMt55c37lrwWr9XXfZaaQ2fCCBw4TlF
	 b8EdoloQCVWc4T564Txjnr0JStrZdEtrarnisd7tu7NQjKRzdLW3bzygqfw1BOpKqP+agcqh6Yj1
	 8jKk38xRDQxN1VXR9LK0Gl9uuq1AZuzivmYE1DaM0BvgaI5u9QG33srF6fDOTC59LJ0140YQmBzN
	 JLdXeLHlahOd1SG6YFaTxV2segVBJ6pXylGCa3k4c2XGfF0JMSDPpqpaEn371bMpsnXVVM9XuXf1
	 uJFS/jKlh5VnfFJiGAITt/z5pANCJnvIHQorYbqJDdXUhKMkFwsB0URgk2CVxfgyJ8vEIGH8ImPt
	 vlUlmVWmlBpfnzmVKzKyhtRpT4R0pLTeOArU86p0P6Kw4nbsJCcKBz+4F+e455x3XhQlBJH7x0Z/
	 Spsw3Ahd/dVFP3/nGmU6wgPVY4F145Oam/tmQZhXcOB7scEUeqMbgJKxmUKkRyFvYPe811RlcNf0
	 +rvBialJk9R4Ce65lvPkX8zD4HtW4c10RRtY9kVTUnkc7VnbrV9BPl2Gw80pst1OiJVf+4gmaBED
	 QHyrWEKIU458FGdIzhHdX1m86huEL8C7Yp9zA/4M2mMWJwc+5K
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Renjun Wang <renjunw0@foxmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH] mtd: spi-nor: Add support for XM25Q series chips.
Date: Sat,  7 Sep 2024 14:31:36 +0800
X-OQ-MSGID: <20240907063136.387184-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_233218_166549_99C720CF 
X-CRM114-Status: UNSURE (   8.53  )
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

Add support for XM25QH32A, XM25QH64C, XM25QU64C, XM25QH128B, XM25QH128C,
XM25QU128C, XM25QH256C. These series chips are already tested on Orange
Pi boards[1].

[1]https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/drivers/mtd/spi-nor/xmc.c

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 drivers/mtd/spi-nor/xmc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index d5a06054b0dd..0532d2e2f193 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -10,15 +10,49 @@
 
 static const struct flash_info xmc_nor_parts[] = {
 	{
+		.id = SNOR_ID(0x20, 0x70, 0x16),
+		.name = "XM25QH32A",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
 		.id = SNOR_ID(0x20, 0x70, 0x17),
 		.name = "XM25QH64A",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x40, 0x17),
+		.name = "XM25QH64C",
+		.size = SZ_8M,
+	}, {
+		.id = SNOR_ID(0x20, 0x41, 0x17),
+		.name = "XM25QU64C",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0x20, 0x70, 0x18),
 		.name = "XM25QH128A",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x60, 0x18),
+		.name = "XM25QH128B",
+		.size = SZ_16M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x40, 0x18),
+		.name = "XM25QH128C",
+		.size = SZ_16M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x41, 0x18),
+		.name = "XM25QU128C",
+		.size = SZ_16M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x40, 0x19),
+		.name = "XM25QH256C",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
