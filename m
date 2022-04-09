Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2077C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 05:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ju0jKaeJC8RicUjQQAonAcFtHwOA79D6dTGMJMYCMJE=; b=rKUm3Din1UgyFW
	M2QRT/cd3TTtXM28Y8BW5G22ezqXah8+AP9laCtxpmdfoFcCbTUFBvTAgn8Hjl3iJZv0vp1kbzA2g
	vDoKL+mvnRF6sfQxdYvCrrZfOwkPhmD3r8otZZUWElBJ/9p0IpQhi3X6vfHDqjO/IdrUNin5XvMBU
	O2cp4xFv46zn+E8yqdkY0NnhE9nFLt2EUDjW80mCQUM+4+zG1pEY7D8rARRmuIFIxQK7ORYOuGpmQ
	ex+zVu33S3BPOWt+6g/X1ziJdehP3Zfmsqz1SktZb75XAjD7CrvimKoamRys2iBg9Q2NdU42ib1xL
	e78bfVPeWcrPsbvX+4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd3fK-002JfO-F0; Sat, 09 Apr 2022 05:29:43 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd3YB-002G12-Nx
 for linux-mtd@lists.infradead.org; Sat, 09 Apr 2022 05:22:22 +0000
Received: by mail-pj1-x102e.google.com with SMTP id bx5so10437486pjb.3
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2022 22:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cIdqjLCFAxoIp4Ta8Sa/kLWiG2xTZyv1wodCLDa8stg=;
 b=PQZgjAf4GQRLJ6M2/BS05ElPfRJXPffzAfjrrtKqoKnCHmeJRknvqOkL0J4VvwxyHw
 BaO5FCyTQkjhrVTUB95fcNO6g2yy+A0aMQnyH2p6id1CY7vsqDn2dT9OpwCizEbk85Cn
 T6UF6d3LD5eUsQUx+18lNYnOqycletll+YHMx6Pyl/tgteQIdpqIjNpsunk3SYk3hn+M
 n748KW643Lrh697qXNJGzuTUsG2PoKy1ZrvjfTeSEK8sKHfwcnIb6ufcbQNcXGJi/ZRV
 haxLtbOHIVgLLYi6G+fvtrmIjZVl9sJEOPNaVuvqpXkyoUHZnhNNSkBjBhMlC8IIPLd4
 FxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cIdqjLCFAxoIp4Ta8Sa/kLWiG2xTZyv1wodCLDa8stg=;
 b=YTQwZYfkeBOqZfjkXb6B+TwAwnyQwujIQkCuaA13i7aFq4viF78tPShqVshDmESexU
 Ve9EG5gLyvtfrzjvfg4xXPn86obkeY8ynHF0PraMQFUzrVWPCEtxB4pB3UzkKoxwGwdi
 m+DDX/B6rYjhAouT1BBOl06y6N6SAwB6r2ITyx1lLz8HyhbkLg6PR6Nz9INHrBQdQl6X
 wu6X5ERn5M5OwQqFKEADJRkpQuSkIKtKEnL/i1o4IIHy70nehOQ4XjvBfuxNwI85FxCI
 u5CICwNfIGRTUHosMV0/0NoJHTEN5SmKOEc0DdgKgug3pq3a+1A1Lcs4cagi1EvsHwkZ
 R4rQ==
X-Gm-Message-State: AOAM532ub1foiFgnJ+PejryXzfCqfUxLXHyjCQqjuwkarGZKruc4VmIF
 UWFBLGiA6l2WY16KKNZbH2yLvnKJ1p5Dlfmp
X-Google-Smtp-Source: ABdhPJzQgq8RmOhb/NBbi3TLFvH6U9CaNQA5403UTa8mrKRnOYGR9Gk87pzcZE9kwJbiKQ/2Jppceg==
X-Received: by 2002:a17:902:e5c6:b0:155:ceb9:3710 with SMTP id
 u6-20020a170902e5c600b00155ceb93710mr23274831plf.59.1649481735053; 
 Fri, 08 Apr 2022 22:22:15 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a636808000000b00398e9c7049bsm21694446pgc.31.2022.04.08.22.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 22:22:14 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: nand: separate ecc-mxic from nandcore
Date: Sat,  9 Apr 2022 13:21:48 +0800
Message-Id: <20220409052148.2159196-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_222219_978464_50424346 
X-CRM114-Status: UNSURE (   9.10  )
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

ecc-mxic contains its own MODULE_* macros. It should get a
separated obj- entry in Makefile instead of being built as
a part of nandcore.o

Fixes: 48e6633a9fa2 ("mtd: nand: mxic-ecc: Add Macronix external ECC engine support")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/mtd/nand/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index a4e6b7ae0614..dbc62bc7b2f9 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -2,6 +2,7 @@
 
 nandcore-objs := core.o bbt.o
 obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
+obj-$(CONFIG_MTD_NAND_ECC_MXIC) += ecc-mxic.o
 
 obj-y	+= onenand/
 obj-y	+= raw/
@@ -10,4 +11,3 @@ obj-y	+= spi/
 nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
 nandcore-$(CONFIG_MTD_NAND_ECC_SW_HAMMING) += ecc-sw-hamming.o
 nandcore-$(CONFIG_MTD_NAND_ECC_SW_BCH) += ecc-sw-bch.o
-nandcore-$(CONFIG_MTD_NAND_ECC_MXIC) += ecc-mxic.o
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
