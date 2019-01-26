Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94631C282C7
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Jan 2019 13:11:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6328921872
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Jan 2019 13:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F26CAX2r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="XlxxHOM/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6328921872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sY/gO7VWsTCLPzV4qu/BMswgHueJmxHqb+5RfbiOvso=; b=F26CAX2rS8Kc+R
	dVVP/yafzBB/1AhbrFlaErFq/C0N6FzGuDGUpD/QYfO5v8FjFUvP4/DRXV77P4igDYz3iIhFZ72YE
	d1NXJ+NYS4F8ao/RIaEIaxFad4ALNtJVzW7ZJG++b0DdeED+C2rGFwKlOeaSozrQ/DSy9RDe93Z9D
	6ugi2NKKlsXx0asM+shLCjDaMAmWEIK5dUbiTCfyPoqC/oxjyvrwY0XqZEhEUiTN5/Fbw4xKKG+nU
	vUtSKakVH/mrmzdNVzLe9Oy/kfnlORZItJGCtTnNXxHftXL8sT86Ams7q5hUcOLfTW0d664W5oFRv
	0o3NizILWlN7CNiO3WHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnNjr-0003gW-6W; Sat, 26 Jan 2019 13:11:11 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnNjn-0003fb-EZ
 for linux-mtd@lists.infradead.org; Sat, 26 Jan 2019 13:11:08 +0000
Received: by mail-lj1-x242.google.com with SMTP id s5-v6so10549070ljd.12
 for <linux-mtd@lists.infradead.org>; Sat, 26 Jan 2019 05:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XA5NLDhV30gS07NuF5vW5+O0eIjY1EdoatKv5HFYMHU=;
 b=XlxxHOM/Uw9+b06ncf1epzykozPgrLbdk5OCvfojmbbNw+3HlH01soA9hbScmY+XrI
 5CZPnye4rz6GEvwcafuYj9O5IUtekfottYvJNDnU5sRCEbcTsB8wSECPVGTUL7NOqTHd
 sokK2jmELoBeBwyyLQBaBLn9mkH9DcknNIoEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XA5NLDhV30gS07NuF5vW5+O0eIjY1EdoatKv5HFYMHU=;
 b=Dc2KTY2zzwlocEbVOi45HC+l+MNpizXppMrDle/TOb5bPDVtqB0ZP/T2JxSpl+rFCr
 sRuH8kghtpUIUrnTgODygXtEr89wTj2olExOfKgpX0SSV5uZVPqBgKZNFJPtKDB4eXIa
 +0tuAOEVldV2jMnkWhvuXYNUlI75YUvxU9+zjhKwM0lIsbyA8Aha1iuJQKredO+dYyvH
 99r5wGgE9nujefLYwzRwOTYcSjCIqK9w45MRKf7Kc5rBJospbmrC6LQGcEaIWa0wz0tn
 Y/+kRd5N+hkdOvgSgV9E3D9Q5YIE9ic/uuRE9u+ksypH1FGGuvF4ZE1OrowZDqzktptH
 2D9Q==
X-Gm-Message-State: AJcUukd5LY2HlC6FiOLDTgsWsQdGpnhr3cwQ2VRK99kJ1bUQqUBgR2Ru
 ajzNUpsk4HTqIhHYMXpXFSAB6g==
X-Google-Smtp-Source: ALg8bN7QhGde0bIf6YbZGlm/9ySf0eWALfFcVwBJ4khYm7E2waDEfIg8Yc+9ztCV7KtqUtoDk+4RyA==
X-Received: by 2002:a2e:5cc8:: with SMTP id
 q191-v6mr11876827ljb.192.1548508265061; 
 Sat, 26 Jan 2019 05:11:05 -0800 (PST)
Received: from linux.local (c-ae7b71d5.014-348-6c756e10.bbcust.telenor.se.
 [213.113.123.174])
 by smtp.gmail.com with ESMTPSA id s127sm2109390lfe.8.2019.01.26.05.11.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 26 Jan 2019 05:11:03 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 1/2 v2] mtd: rawnand: fsmc: Reset NAND timings on resume()
Date: Sat, 26 Jan 2019 14:10:55 +0100
Message-Id: <20190126131056.11364-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190126_051107_501041_C0715FBA 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When we go through a suspend/resume cycle the NAND
timings and other settings may have been lost so reset
the chip to bring it up in a known working state.

The FSMC only supports single CS chips so we only need
to call nand_reset(chip, 0).

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Update commit message.
---
 drivers/mtd/nand/raw/fsmc_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index c9149a37f8f0..4050843dd35e 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1164,6 +1164,7 @@ static int fsmc_nand_resume(struct device *dev)
 		clk_prepare_enable(host->clk);
 		if (host->dev_timings)
 			fsmc_nand_setup(host, host->dev_timings);
+		nand_reset(&host->nand, 0);
 	}
 
 	return 0;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
