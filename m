Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1617AC43602
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 02:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/oj3TPaw/tR99M9hUjko1m1o/5SNGA19mQ8KPNFgvsg=; b=ORkXcGh7faKHit
	wXvY4TI1nep0G5wQ0x/Cb/4MzlZ+hfmsOLM3FT1iJQwowdsUUwAvlIeVOBUsa9IAW6OVxXJ5NTaL0
	Aabu2yEuZ01T/pjLhpyZIBXAopBF3f0sekRs+5Pg/+ER4FJaTEmFc1xShefbFGyKuOpuEeP8Y3/3Y
	QbOPFzC8VsUYFCl/8o+4kux7991EtZWEfzObx5LFJ7BVSpUgUCRMaI9rQq7PjxTnws84lQe4txPMw
	snQgIV4B3RiQx39WUY796HGReispB199VoroO62kzQLyg0DZi00egeSyaFoK6JVfFdd0rRwIvVsxy
	1rTGFD6KWB6ZprQd0dlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf73v-00000003Prr-2FsP;
	Thu, 02 Jul 2026 02:21:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf73s-00000003Pqp-2LUS
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 02:21:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ca1479dfe0so11551055ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2026 19:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782958916; x=1783563716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k9h5YwF6Ov71FIffCR/uSYv3hmUYhtMq0eI0sDB9+mE=;
        b=geCCGY+RuRWpzncrO/aPpT7BW24Wuo+7VYRG1j4YL2yaGGSu5FHI09r0DwUhBH0bTp
         SwncfLUuHbWhfHE406qi1XrUbsLlhnWx/FXNTLYZZ2laNcPlVig+yC/pM54bDu2FGLKv
         lS2OBsvJqsbyWtp7r5DZImQ4SmvANTuCliJMWWMpqZlEpM2Cl+yF8SFRWoGIUFIt2pXn
         Ewf7digppU/yW/ZLXOHTogv2aoFGx1DnllhlW9viEyOSUCBwC5RbMihChkXXxie+Grq/
         028wIsrXNtQpVMDx4/tLUjLHmXoarFbWkQffM6pijG0rwZvqiWw+uwHa0DjCagFY8Rll
         n7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782958916; x=1783563716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9h5YwF6Ov71FIffCR/uSYv3hmUYhtMq0eI0sDB9+mE=;
        b=tZNs9fGSUMvyCKiaMmvwe432VkY7E5MP+86JsdSzHM+dUJLXX5tGaoRkiRG59bBX+x
         Wy7YW7Ize857BY30ZyB3/aNrCEZIzecHLfRB78n6KFvksOEVQzlhZRuY4wAjrgAuYr+Y
         Ya6stsGfJrym73Qu6wLRMCh4FGuw0M2pzrejLYAPei/k9BgU1vdodZuPRdWlsr4gqOvq
         84n19HDqbu3LbG4XaglFwYn2ARK2iVvpMj9LxPeUlE3OZS9CRFrlUVLoJaYJRfSZeN9V
         aXAl/7MEtntfBbMaGtB9/WYPkCYSSLXQu/8/6OYk2U3qqieE2gy6ky5/1MScUO9+hFvo
         sFuQ==
X-Forwarded-Encrypted: i=1; AHgh+RosgTQAPjKatEhjw+6y6RYh5h5b+5JJWQp7dhiV2g+lQXNB8BcsB0aeIfB7veIOMdwj5wpphuy9qvs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpjKCyacycUDRXoJANFnIygoYecquQlsrhiZQ9ikkOg4Wrj2JP
	wPTrlbLoDp524bx1yUqZmKhkTkQlk8mbTo0P4nXiiXwe5MZPpD2ePpRphe0kgQ==
X-Gm-Gg: AfdE7cmFxvV9LMGATm1H1ZRbtJv20Me0fAv+KX74/4WocVMrzRM6RDfUulyO5ywblzY
	M10EKR+dgOKmO4SULLp3hKMIQzNez2nFpZQx80tHC6dSxfE58ua8avv577Djc0yLHOITELdez0h
	M8c88Q5iwvoek2jsgp9mNjbT+x+s76t3XxxDdgcjCyoiXJKLmtJf2xSGISqEzXcU5yOVC597ktW
	xrENFvB2x4clNZLH7n1GgTYiv8DPLwvbrQXISCCBsGgiUR8fQogsR9e48yV3ksxhuw/FHD+Gb6u
	v1f1/EjfLsCFT5K2MJaLOlnw1Fu2TOeChQPOstpzLxULZQ0lHi3vLgFGsvgbkzgk12fLZYjz9Hj
	z+J5nvhgvFvnmAm89+XHefsYdxsXH9pulvDnRiAjmcYYoDCuPCKxKGfoUuqkLO7F1kC40zkx7wD
	wB7RmleYoNmFRmCWurKUI+7Z0+qJc8kbgSOBG/XPpcqUIngA==
X-Received: by 2002:a17:902:e807:b0:2c9:97a7:71ac with SMTP id d9443c01a7336-2ca7e91c1a5mr43734365ad.39.1782958915539;
        Wed, 01 Jul 2026 19:21:55 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8da8aasm6154135ad.8.2026.07.01.19.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 19:21:55 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id DDBB34163B72;
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
Subject: [PATCH 6.6.y v2 0/2] mtd: spi-nor: macronix: backport Quad Input Page Program fixups
Date: Thu,  2 Jul 2026 10:18:40 +0800
Message-Id: <20260702021842.2771498-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_192156_625853_C73B5B0C 
X-CRM114-Status: UNSURE (   8.30  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This is a backport of two upstream commits to 6.6.y:

  commit 798aafeffb36 ("mtd: spi-nor: macronix: Add post_sfdp fixups
  for Quad Input Page Program")
  commit 797bbaa7531f ("mtd: spi-nor: macronix: add support for
  mx66{l2, u1}g45g")

Neither commit was tagged for -stable when merged. 6.6.y also predates
commit 09e5a29fa3ad ("mtd: spi-nor: macronix: convert flash_info to new
format"), which landed in v6.10, so drivers/mtd/spi-nor/macronix.c is
still in the old INFO()/NO_SFDP_FLAGS()/FIXUP_FLAGS() macro-based
format. Both patches have been adapted to that format with no other
functional change; patch 2 depends on the macronix_qpp4b_fixups hook
introduced by patch 1.

Changes in v2:
- Patch 2: added .name for the mx66l2g45g/mx66u1g45g entries. v1 left
  them anonymous like the upstream (new-format) entries, but on 6.6.y
  drivers/mtd/spi-nor/core.c:spi_nor_match_name() does
  strcmp(name, manufacturers[i]->parts[j].name) while walking every
  manufacturer's part table to resolve a flash by name. A NULL .name
  makes that strcmp() dereference NULL as soon as the scan reaches
  either entry, i.e. an oops on any name-based spi-nor probe on the
  system, not just when probing these two parts.

Cheng Ming Lin (2):
  mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page
    Program
  mtd: spi-nor: macronix: add support for mx66{l2, u1}g45g

 drivers/mtd/spi-nor/macronix.c | 37 +++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
