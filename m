Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AF5C001B0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mkrTIaH1Ijo90Q1XOHscBGJFddc+zqrZoInCKjKGEU=; b=eIoCMeNZVREZye
	q61m7wPtC7c/ncPImvyLDru4BLsOcCFj3qwcLDHRgeMcQBFksz5fhhyfhxT+p3w6hWGurykNY4d5V
	RjKgfDBjoyvM/kUQ8/V4SV8Y8KUPvmW+ZEvnXSwzzQnZuJdFjOXx/6GoZTusws3CIg0m3dn4y+tsk
	fCyP389BVGqCii6NZwdQikb34SVNiG2US9JKPNElt0oV3qJP9/sYrHB+8kT/b0mPEWkJdhFEeP56f
	xzRWf6jcWbwxN/RprKbdExQQ6g/3pwROv3942cWQSMm48HJl7qqP+oTKzijBzxYwJyqeq5D1OA1lI
	uaapWaU4sdyCva8ynV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgu-003CT4-2a;
	Mon, 24 Jul 2023 08:13:16 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgq-003CPO-22
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:13 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e56749750so5769815a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186391; x=1690791191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkHM3RFGQ0WIr5v2TWHAHkTdJrhHVucyrUvsad9WfOo=;
        b=deuRTZstRG4cjvLu+clvj8bi6F+b/ABQ00rFEdb/nZpASZp4DaGZWenjE4cGdrRm4M
         9htdKtMmA21QkObKsHHKINz2Oi0+UZDHkq02z0kM8zRu/LXF64qf6r/ISUdS0H5W9Zom
         QV0nxQycoAYQIcYpFqow0Szavf7JSW2OYa9OnlOjWcaAeeKv6deuP29rLjFcNs0acE8Q
         Zyhriv5zVWhdoaBXowGFJZSdRbmfvR5rtT2u3fNdq+g8PsopZCOxY/6I5c7SPZLEAgkt
         U09FFJzvp2lnk73nmBPpG4uD5VU3bvLaPjLdG7M8ghECJKRpGNsYy++jqaBtoDJQCpOu
         VnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186391; x=1690791191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkHM3RFGQ0WIr5v2TWHAHkTdJrhHVucyrUvsad9WfOo=;
        b=SgW/P2mJkA3le/Ipdf5T5nknCtfhFHwcLdHZAUS1UbttXF1U1suLcXhk9XsR6c3LcF
         JFcc5nhVXzZ9nhJlfs2M9wjl/AeppyK9RuP1fOqYFlrbi4TDXd6FilTWRpEgtvto/X+y
         5Wwo9DiOk22lsxetR6gGDFNVmnpmUnjsIIBJLt7QaYkIaygugjpg7Iqz+f6E+OwXcnVl
         AgK0Yt9vNw9KgIWpBgEXW376IwFsY02fM+9K0CVVHsLEHAHbt15P7Xe32a+dHaejkqLT
         X0UDaFP8k47dNQeIl0NWWZnFnYJofEJ+zjHLyfOs2lOeqWCu4mdo7J1E+I1qENgN1QZd
         2iOA==
X-Gm-Message-State: ABy/qLbb06p83j6gP5YihoK+WyiEAz29yFsfoHnpj+0J01Xxr9rR/PUO
	l7ByggUKLSMXpbO1RSbzY9TWzw==
X-Google-Smtp-Source: APBJJlHSxOp0xPKToV9ONheJ//o5w9GLr/jPtmw5rrpfHCOWAJ13ocXV1lLD8LOrgl9iQBS3bEGs4w==
X-Received: by 2002:a17:906:31d3:b0:993:f90b:e549 with SMTP id f19-20020a17090631d300b00993f90be549mr8877382ejf.37.1690186391119;
        Mon, 24 Jul 2023 01:13:11 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:13:08 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [RESEND PATCH v3 07/11] mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
Date: Mon, 24 Jul 2023 11:12:43 +0300
Message-Id: <20230724081247.4779-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=tudor.ambarus@linaro.org; h=from:subject; bh=ARtE+Fv/l4a+BkMfBrTfq2ov79VZLg+i8bYbcphxQmM=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ+bqmEDqHMfs1PJlBNahV34jcDlLvGaPX+Z cKEiovvOcyJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfgAKCRBLVU9HpY0U 6ed+CACMM3slBgYr2/UDm63/4pQWiMj1acdFTz6d2k3eD13QyQClOeGJIqfqwPCSfGWO94K8CAh h7DmAjYFrttVS6/Lb5HLhPkhtEY0holI46g6IRpyvipqRcdTK8hf7nQPejfO49PuwfnCosiEUzu zLJ2tBN5s3OUsZauWrCmBeC3Wpp4P6DIGfDQ4N5vxuwwAa4EFLvrRGHB7XzmK52llClTWmxDSmB 0IILcuxRBw9mqRytpVm+RGKB+cJg7WrDFkroIA43qvK7PVLJ20c5iLUJp7T1UVqy48Sz+zftLtI nh6dFLVBmFWwrHZVEQWZhiUbgkscQIdx8i9dARJ1bfXnrXdo
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011312_672763_38D74820 
X-CRM114-Status: GOOD (  11.12  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

S28HS02GT uses RD_ANY_REG_OP to read status of each die. In Octal DTR
mode, RD_ANY_REG_OP needs dummy cycles (same as params->rdsr_dummy) and
data length should be 2.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 28d0a995f3b9..2fc3e65686b3 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -104,11 +104,17 @@ static void spansion_nor_clear_sr(struct spi_nor *nor)
 
 static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes, addr,
+		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes, addr,
 					  0, nor->bouncebuf);
 	int ret;
 
+	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+		op.dummy.nbytes = params->rdsr_dummy;
+		op.data.nbytes = 2;
+	}
+
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
 		return ret;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
