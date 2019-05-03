Return-Path: <SRS0=RfYw=TD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7346BC43219
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 08:53:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454382075C
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 08:53:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="opk9HzFX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+E/rFtL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 454382075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eSVaEl0gzVVv5DbHqin+goHkvnLdAgCkKVo7VbY1g2k=; b=opk9HzFXeJT5Sl
	KI4/3gSklb6R58SMJ+tm8BWBIFIYPPtcLhUIEWLV3KBo1l6tXXVDbLQk5f//k6ZIp68NR5CrAxC1V
	Se8WJ2wT2vrLAoPSbjae0sSjT7bRMz4tMBXSYiJenT3w3xGTcaZuIM9gCideP/piRtfcJnqKO5xiT
	80qr4mr83uary5A5u6A4NCJfznItjP+gTXJ3RKKdQWkBf9i1ypZXyUgwbG89MR1blt7VL4hJZPXhN
	UtVQaRscR11Cw6nsZPDgaPUzbYk1/N3abwaMkGrFB1Ql8oqQjHYuCFyoWv3RoDRZg/WiEfnCxiUzt
	0QqgkSKposa8skkSP1pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMTwr-00064s-UZ; Fri, 03 May 2019 08:53:41 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMTwo-00064B-F6
 for linux-mtd@lists.infradead.org; Fri, 03 May 2019 08:53:39 +0000
Received: by mail-wr1-x442.google.com with SMTP id e9so6843016wrc.1
 for <linux-mtd@lists.infradead.org>; Fri, 03 May 2019 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hxORxRJg8TxDLlfuGy/ZAzRDEoGhmOHyilLw0cwtIHE=;
 b=P+E/rFtLuKo6V7IcftbeFuvsBWZeqP7fBd+qzztLJW0ivZCuv4J1MTupMIdRatPHc+
 jCqDWa9HRy0FkT6ADVuV1mQoILMGi/0rM3X0RYGI5za2prQj+yNlQlNAogSkBHKvBnRP
 H1wDJ2677itFTXmNklMmXOKwU49L1xvclp2iN23D2bQJGKNKkYoudtk9jNO7mpHIDorv
 SmStRN62OLDBSrep9FjlSONJ5O8zHPKW+H6ZPoE87XidNFqjA8ZjZki/CX0RkZkpKBI7
 Hd3kKoR+gk5Dcey9oAEJDd4NbRlCOJLlKIBt77abr8jWRj58CMkRtvL83MBr2kOFpoLW
 R7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hxORxRJg8TxDLlfuGy/ZAzRDEoGhmOHyilLw0cwtIHE=;
 b=SElHRsujzvSTanRx+0q/Xk8ynH78DhkQu/mlSuK3CvKn/FDQ1e/zetCOXwTpuuVRHG
 0Gs593xfocvIgCWEqMHlhBOO+y9U9nj10bWTR17iZVxcRWSjyrhFXoUG5YNxumIPBGxo
 ZOFCjSABlxBqdZX1iXEo6FpCcjYXdDgZ0N4UNe66egIy05h1nA9thWkJsb4B7QC5f1XB
 fG7ryL9YMJm0UnidX758VbuVCKpkPCdNnteZ3zIcPs5nHXKTlrLGHeAMdwmqcSVDvw3S
 crJtpVqgt8aDItbWr7U5KC+pgxLShdkdtrlM26lXY4e5z809J6+iJUkmw8niWQUGSri5
 4BqA==
X-Gm-Message-State: APjAAAX+f73+yL3jytD/QoFBLIkCgCypErhYJ6X8laTD8eeEm/Rk7oXV
 uouSupYhEm0hsFGflbwVZLo=
X-Google-Smtp-Source: APXvYqwI/B+ifQHb8MGrb4+OoTqIzMr8/P6113ljMVFprinxPlpWqnPFz4flV5bbkp7rFn9RLl/ORw==
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr5780238wrv.104.1556873616425; 
 Fri, 03 May 2019 01:53:36 -0700 (PDT)
Received: from SiBook.guest.pepperl-fuchs.local ([80.150.243.190])
 by smtp.gmail.com with ESMTPSA id t27sm3592912wrb.27.2019.05.03.01.53.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 01:53:35 -0700 (PDT)
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: enable 4B opcodes for n25q256a
Date: Fri,  3 May 2019 10:53:26 +0200
Message-Id: <20190503085327.5180-1-simon.k.r.goldschmidt@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190503_015338_536490_4557E494 
X-CRM114-Status: GOOD (  11.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tested on socfpga cyclone5 where this is required to ensure that the
boot rom can access this flash after warm reboot.

Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
---

 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fae147452..4cdec2cc2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1874,7 +1874,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
