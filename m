Return-Path: <SRS0=P+6h=ND=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C36EC4320A
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:03:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2421F60E09
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2421F60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9sl3wtTbVukjuTCBam7Q3niGG0KfT7n/DgAwxe/VLkg=; b=Uv/iit/TSn2dMv
	uqR3W/rnUS8W5i6bEiXUPQ8Tk3WwdRXBHpUd3ev+YpCzwKCD0/hypETLR3DjwrUQDlBcmq2NCs61c
	uGmAxoL5RD7R3HLkm24ELxmrnRwHjZCMztTqNMEuaZfVg3koIdRraMfnjo6L7z1gtp1tile90l3vz
	25QZZviWU/WuM/F1djAh3X85GNspzauvoT1hxCM5uZwazUEWVs6bO5KyPFcNsj5KAC2IcsL+pJuYa
	hyYI+17CazKRZYsnWAudMHkChJ+1VmHe8k+wS3xhTz/IG4o77oVi0qFn0ZvPr6K6vIkk1+waegGfA
	zZqskOl+9JgyRAT1gCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4js-008pT5-VP; Thu, 12 Aug 2021 07:02:53 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4jn-008pRi-Fh
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:02:51 +0000
Received: by mail-pl1-x632.google.com with SMTP id t3so6052445plg.9
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=o0VcgEeiEKjwZR9/Iyz1rePFFyiWvxMbEY88mI+aNYc=;
 b=HMyyVAglMLwyLwQQnqkz9rVZuyan7O+woL9jnHdtUbDRm7NL5GowkLYWPGuGFZBXnZ
 k00qkXQ3RIxdB5R8EVnFLVlJ2jhsANDKXJjE4KPw8vyFN8U0lMy2Jj8fWfWAI5XWOtlZ
 3uQMjg1W4xDEyBN1y4GatFa1XsfhJcp7B/f4w52TdhDfAE4vkZ/V5YD9JAcO22gwO2FS
 1Y0Y3d20+g6hJFoKEKqXiJI/1SN1K0VfzWd7zkyzSfIzOAeydSBytF+PIr8lsr4kRAZl
 eCjBnAAoKpHX6VRUU5X2vsIt0JW0TAo5pYy2uOjpETYX+kSXPbrOm6YcGI21PPwqm/lr
 s8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=o0VcgEeiEKjwZR9/Iyz1rePFFyiWvxMbEY88mI+aNYc=;
 b=jm9a/T5KX0qhQWUJj+mAc+ihBtTfQIg5vAXN1iwDgJGeaT9IueQYP2MeP6S15sXm0w
 pTUPLRE1/UOrGl8d7iV2bvTxtE2v4ZOUYM6+vcImepYtSSk6vvkhVSezWiTX3jV16WoX
 RU4blDgnMS58ikm650PYjrU9NKp3/FOnCtCVQ8km7oVmWeKKwECo691xidUhaLl+k8gs
 HCf+h4CyQHAZxGzllvW2WnvJDf0hC7x6zyRfzBE4y9nCXqNkKC1l+R/MRz/YeaGpEvCP
 qa58aF8aWIKs3wYJhnKECFqiFH/bvM9inOE0ZbrhKwZ3Gr6R8TmtBPBXKgfb68ltFPxn
 qYmA==
X-Gm-Message-State: AOAM531PDoBeEtV4BNGUeaaQEVv5J/paAR4vayDQufFKLoxFTaHyv+dJ
 wos+8LY/JMlImQ27a9SuR7U=
X-Google-Smtp-Source: ABdhPJyVuUWjUrmNYU9NVkpGVi5gFg+4/MQO0yDSL73mmOCTwKk5/WEnsjA+Bjn4AU6/nYDzvQHqwQ==
X-Received: by 2002:a17:90b:102:: with SMTP id
 p2mr14983766pjz.126.1628751765712; 
 Thu, 12 Aug 2021 00:02:45 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:02:45 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 00/15] Add octal DTR support for Macronix flash
Date: Thu, 12 Aug 2021 15:01:20 +0000
Message-Id: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000247_581327_B6C25E26 
X-CRM114-Status: GOOD (  13.62  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series adds support for Octal DTR for Macronix flashes.

Changes in v6:
- Based on "docs: mtd: spi-nor: Add details about how to propose a
  new flash addition" hexdump SFDP table in the patch.

Changes in v5:
- Based on Pratyush patch[0], modify the length of the value written
  to the Octal DTR register (1 is changed to 2) and add check ID in
  SPI mode.

  [0]https://patchwork.ozlabs.org/project/linux-mtd/patch/20210506191829.8271-3-p.yadav@ti.com/

Changes in v4:
- merge patch 2(support octaflash Id) to patch 1(support octal dtr)
- add switching back to default mode(1-1-1) support if octal dtr is
  disabled
- delete the duplicate code settings initialized by the Profile 1.0
  table. (such as cmd_ext_type, rdsr_dummy, rdsr_addr_nbytes, etc.)
- add a description about stacked die

Changes in v3:
- Add support for Macronix octaflash series.

Changes in v2:
- Define with a generic name to describe the maximum dummy cycles.
- Compare the ID directly in the loop, no longer copy and execute
  memcmp().
- Add spi_mem_dtr_supports_op() to support dtr operation.

Zhengxun (15):
  mtd: spi-nor: macronix: add support for Macronix octaflash
  mtd: spi-nor: macronix: Add support for mx66lm1g45g
  mtd: spi-nor: macronix: Add support for mx25lm25645g
  mtd: spi-nor: macronix: Add support for mx66uw2g345g
  mtd: spi-nor: macronix: Add support for mx66uw2g345gx0
  mtd: spi-nor: macronix: Add support for mx66um1g45g
  mtd: spi-nor: macronix: Add support for mx66uw1g45g
  mtd: spi-nor: macronix: Add support for mx25uw51245g
  mtd: spi-nor: macronix: Add support for mx25uw51345g
  mtd: spi-nor: macronix: Add support for mx25um25645g
  mtd: spi-nor: macronix: Add support for mx25uw25645g
  mtd: spi-nor: macronix: Add support for mx25um25345g
  mtd: spi-nor: macronix: Add support for mx25uw25345g
  mtd: spi-nor: macronix: Add support for mx25uw6445g
  mtd: spi-nor: macronix: Add support for mx25uw6345g

 drivers/mtd/spi-nor/macronix.c | 155 +++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
