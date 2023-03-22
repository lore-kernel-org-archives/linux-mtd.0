Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADF3C7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JVX3rFUNWht2+HFCOPYbezLxRz/6gm85sQpgxSvqB+8=; b=uPL9nkzVb1Cm26
	hJUZQ4q4tFlYlvGePPEjEj//zKomMzKpEnOD69whLWL5ZntLI51wAWl5zxWJYHr1XzciqkrcYtszf
	dI/wFR/jRfWFoBAyOeRff50J3XtqLKU/batoCI4/rYZ7v0QxgBfu1tZlvdj89QH5scVtLqV2uQzxe
	5dbhwM4QKl0Cq9vwFovuQzaRmpyn9D47vMQCwnNQc76XUyAu09zhiQtIcqNDP/Wy48/zpXB5h05RB
	VhorwayM0GEQrases3fmwkj5GufEy4+xBsWH++f1TyHNZXG3F0vFM1YqU6QRnNbLxZui5Hh7vN2lX
	oGvwzFE67pTXNQ+12omg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9L-00Etm4-25;
	Wed, 22 Mar 2023 06:40:43 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9I-00Etjn-05
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:41 +0000
Received: by mail-lf1-x131.google.com with SMTP id x17so22068336lfu.5
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1iYp4UG4GMTK4dV58emsPNn1cJbQnTLnJ1m9QiHq4Q=;
        b=oVPBv0nfiGcz1Mz1QHwYjIqddtk9mdP1g6mDNvft/d4vd+5Oh6TcJDcl8OLZYX3VUQ
         /Mo5Pvg1u9mgWFFThPgsCI2rTqm1pMCKUvAEI3DkZH+p7P5F9PkoYbBut2eJgyIaQqJo
         n+xPQhIKZYNfnOLw80yE61AYAYSLpfYdC/nOtM7IvTw8oLmF7TlK3qtm/ERYEQftpvDk
         yEJyD4PuNhdHIvvJ6eMrrmLBBzemiEFcGvCZrxq4HpguCbFaRvN86n32fO98n6I9o4kM
         PgvGN75tAFTJkWZQl+HYz7UTIQY+f381mDlbXjcVqmSVfNkeYOoKda7MVRfuoDUbYHO7
         9PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1iYp4UG4GMTK4dV58emsPNn1cJbQnTLnJ1m9QiHq4Q=;
        b=Hekxz0qJM76v4QAjjSzWrpiInW2XMPSM5In3HZC2OyVwIR4+lKTuXywdxMQE+fClc7
         KJJysIyyPo3x9YG6tGacCKNJpolymATvxye4y8abF5M09fY4PVgXQeN19p8DWUBxhGV2
         WbrnFh1pkZxPiyMDmdrzHGRl8tF2UvDaS+hEJEBet1/9Wqseu88bHsBk0S7ILLYH3bma
         DBOcMsaxuYZq+AwpHzKbnkV2DAw/TGQehQSJ7ISCeHoryNfO5mRGSmuAuo4qQCTiqwSp
         IpgKrA3XG4mAUkih0Xva7FJiffIlT8Z/VeI1CUzglZ3x95sctWrU3Y0dSDQzmmN6XgT2
         jBmg==
X-Gm-Message-State: AO0yUKWtETlfZnFxj3jXNbS35BD5ASXNcfmke7m31oRlCi4tdmBGdgFa
	WxEI0YVHy41qsReS6lfkT/FPJw==
X-Google-Smtp-Source: AK7set+MMv93QezuXA8oiWNP7p/rZYXq7UdPRafaFjMM68cyrkAZdVBDMTT/FhwQPysiuhWt+FL0gQ==
X-Received: by 2002:ac2:5dc7:0:b0:4e8:43e2:a8 with SMTP id x7-20020ac25dc7000000b004e843e200a8mr1727406lfq.8.1679467237489;
        Tue, 21 Mar 2023 23:40:37 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:37 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 00/11] mtd: spi-nor: Address mode discovery (BFPT method & current address mode)
Date: Wed, 22 Mar 2023 06:40:22 +0000
Message-Id: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234040_136432_892EAFE2 
X-CRM114-Status: UNSURE (   9.13  )
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

This is a new version of the following patch sets:
https://lore.kernel.org/linux-mtd/20220411125346.118274-1-tudor.ambarus@microchip.com/
https://lore.kernel.org/linux-mtd/20230315034004.5535-1-Takahiro.Kuwano@infineon.com/

Changes in v4:
- consider the BFPT retrieved address mode as an enumeration,
  manufacturers could support different methods at the same time
- split renaming of set_4byte_addr_mode methods in several patches for
  better clarity
- have initializations in a single line, even if bypasses the 80 chars
  limit, as they are < 100 chars anyway
- new patches that introduce spi_nor_set_4byte_addr_mode() and handle
  spi_nor_restore()
- clean Takahiro's patch

Takahiro Kuwano (1):
  mtd: spi-nor: spansion: Determine current address mode

Tudor Ambarus (10):
  mtd: spi-nor: core: Move generic method to core -
    micron_st_nor_set_4byte_addr_mode
  mtd: spi-nor: core: Update name and description of
    micron_st_nor_set_4byte_addr_mode
  mtd: spi-nor: core: Update name and description of
    spansion_set_4byte_addr_mode
  mtd: spi-nor: core: Update name and description of
    spi_nor_set_4byte_addr_mode
  mtd: spi-nor: core: Make spi_nor_set_4byte_addr_mode_brwr public
  mtd: spi-nor: Parse BFPT to determine the 4-Byte Address Mode methods
  mtd: spi-nor: Favor the BFPT-parsed set_4byte_addr_mode method
  mtd: spi-nor: Stop exporting spi_nor_restore()
  mtd: spi-nor: core: Update flash's current address mode when changing
    address mode
  mtd: spi-nor: core: Introduce spi_nor_set_4byte_addr_mode()

 Documentation/driver-api/mtd/spi-nor.rst |   3 -
 drivers/mtd/spi-nor/core.c               |  85 +++++++++++++--
 drivers/mtd/spi-nor/core.h               |   4 +
 drivers/mtd/spi-nor/macronix.c           |   8 +-
 drivers/mtd/spi-nor/micron-st.c          |  30 +-----
 drivers/mtd/spi-nor/sfdp.c               |  11 ++
 drivers/mtd/spi-nor/sfdp.h               |  28 +++++
 drivers/mtd/spi-nor/spansion.c           | 131 ++++++++++++++++++++++-
 drivers/mtd/spi-nor/winbond.c            |  13 ++-
 include/linux/mtd/spi-nor.h              |   6 --
 10 files changed, 267 insertions(+), 52 deletions(-)

-- 
2.40.0.rc1.284.g88254d51c5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
