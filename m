Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FFBCDE00D
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9D2bJqQCOwDaVvjV9CvTOmHwe14xi9WKSnBKJGAAxfI=; b=IxSdZ3TiWjVhsh
	+O1m5Isj+VCkI51BG6NEZgV4P/qImbxjnyghp5/1IxLbIxuQNSHJ/32acTnCpVwYhv4Omenz1MjvZ
	zJ9lsbdn4wAoBzhfE0udVTWHZlrvQdAKjzUuGIXeutzanCEVja94zPXmDYoy/GK5Bn6hO9wIwtXAz
	AsCeSH0b96PTFwrTdeApN93q0QDR4zlMoexBZH1xZAjcDz/n8OLl9fXOEIeTZC83/Jv6oSOqcBwMQ
	eZPNs/Mr205jgx8tPAsL4wRl4THPhbMNg3gjgCSxrZTH+jovfq3UEe4Q2kxBGlOEgbL1mBF/dt6r0
	jYEYXceRW/xgOu8dpKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQg-00000008aMZ-3vDv;
	Thu, 26 Sep 2024 14:25:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQc-00000008aKR-20mz
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 14:25:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2068bee21d8so10771275ad.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360710; x=1727965510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDfixlWfB11NTzG+DiZcp+HxxNjjLl7YE7F3FyH5220=;
        b=JTuEeNbl6ADCoUffG6zpe2u6fJHYiCjcMzijl0Kuu+by0SYSmHwrKwSRCydwUgGI2U
         VV57XI9z3F0gv3ncbFFOyfJaUt1eGqKvHratzxyLGzoifrVrTf5NRc+kwG5jn0u6IJln
         AoPIJgzATJynWjA/+OcSV4kDtzBirU8nxJAWzGGrdjtvQdfJhbXUyqemlN4MaBjTuDWE
         OQpXMk9veVjpgwJgXJ8AgoRLUDkmAIjHnpde+lSl/gaicceyOAbVb97+Mfnpqx+vzNPN
         0MQizKgMTH+70oNtjoSqsxi3ZRmDlCWSWGxj01kY2FcXzZrgSsr+Cp+V1MHe/l+KNkBf
         8rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360710; x=1727965510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDfixlWfB11NTzG+DiZcp+HxxNjjLl7YE7F3FyH5220=;
        b=MwiBoCVb6lnCcpCzn9qlQjAMDDzMBqx2gy+YO7WmEyupQdcr3jzV1ybLap8OColysO
         WKR5oiB5z2xVE/uRbW/0SPVW4435Url6ziVhpUO0LIZPv26QA7fCVxJRp6YkX0HM4gf6
         LrMGVvEn31uwyVo+w0e5NAUNgqJ+RGweKAZyPt5/3oVfJew3HGmcVJttTih0BLhAMA4G
         QSnerkzKekMI5HKyl8ccQrkXqhhDqj3nhBPmRNCmLyINLqH/KURMvuiiYc26r4U47cEC
         qr7P5xKpkvL5XEweMhcpIvVPSRvGtAEvpbtyXbvtJmhkkLOjgwRCflOePJme+NYNRxa9
         MqFA==
X-Gm-Message-State: AOJu0Yz/rlSiXqoRFdqrMA4e3Hl1t5oPTCH6GNo+a+0TMv8onBUY4mr8
	7g/ynzZCbyp1L7tb1cTQXaxHu/svPN1zuZf5T/NTe2SnjGOt0L0b
X-Google-Smtp-Source: AGHT+IE333dRtcjB/bH25gT70pEVLd2X2WNyQw8Cm5nP+frUF66NPd8Bf0+H2KFZjKoSYqFWdRqr2A==
X-Received: by 2002:a17:903:2a85:b0:206:8acc:8871 with SMTP id d9443c01a7336-20afc4b98b8mr84561385ad.31.1727360709537;
        Thu, 26 Sep 2024 07:25:09 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b25059b5bsm10130265ad.155.2024.09.26.07.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:25:09 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 5A1AB802C9;
	Thu, 26 Sep 2024 22:32:57 +0800 (CST)
From: AlvinZhou <alvinzhou.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	AlvinZhou <alvinzhou@mxic.com.tw>
Subject: [PATCH v10 0/6] Add octal DTR support for Macronix flash
Date: Thu, 26 Sep 2024 22:19:50 +0800
Message-Id: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_072510_607409_A216F5A1 
X-CRM114-Status: GOOD (  11.33  )
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

From: AlvinZhou <alvinzhou@mxic.com.tw>

Add method for Macronix Octal DTR Enable/Disable.
Merge Tudor's patch "Allow specifying the byte order in DTR mode"

v10:
* Further explanation on adding Macronix manufacturer ID in ID table.
* Correct some typos.

v9:
* Change the name of the configuration register 2 for Macronix Octal 
  flash.
* Fix the bit value in __pad of struct spi_mem_op.
* Use the local variable proto instead of nor->read_proto.

v8:
* Supplement missing S-o-b
* Remove function spi_nor_is_octal_dtr_swab16
* Split IDs by MX25 & MX66
* Add dump of capability in debugfs
* Add dump of parameters in debugfs
* Add dump of result for mtd-utils tests
* Add SNOR_ID(0xC2) in last of Macronix ID table

v7:
* Add dtr_swab16 judgement to enable/disable Macronix xSPI host
  controller swap byte feature.

v6:
* Add byte swap support for spi-mxic.c
* Remove flash name in ID table.

v5:
* Remove manufacturer read id function.
* For increased readability, separate Flash IDs based on whether
  it supports RWW feature.

v4:
* Add patch for adding manufacturer read id function.
  remove patch "hook manufacturer by checking first byte id" 

v3:
* Add patch for hook manufacturer by comparing ID 1st byte.
* Add patches for specifying the byte order in DTR mode by merging
  Tudor's patch.

v2:
* Following exsiting rules to re-create Macronix specify Octal DTR 
  method.
* change signature to jaimeliao@mxic.com.tw
* Clear sector size information in flash INFO.

AlvinZhou (6):
  mtd: spi-nor: add Octal DTR support for Macronix flash
  spi: spi-mem: Allow specifying the byte order in Octal DTR mode
  mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode
  mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
  spi: mxic: Add support for swapping byte
  mtd: spi-nor: add support for Macronix Octal flash

 drivers/mtd/spi-nor/core.c     |  4 ++
 drivers/mtd/spi-nor/core.h     |  1 +
 drivers/mtd/spi-nor/macronix.c | 95 +++++++++++++++++++++++++++++++++-
 drivers/mtd/spi-nor/sfdp.c     |  4 ++
 drivers/mtd/spi-nor/sfdp.h     |  1 +
 drivers/spi/spi-mem.c          |  3 ++
 drivers/spi/spi-mxic.c         | 17 ++++--
 include/linux/spi/spi-mem.h    |  8 ++-
 8 files changed, 127 insertions(+), 6 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
