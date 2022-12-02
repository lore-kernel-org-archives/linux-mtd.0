Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FC4C47088
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gw+bybqgktIwgpCa8S5CUB9JS/hu0clrO0T8ZmPq3V8=; b=1Ew++pj/ZCqRdm
	qYcmJv/5ndt8+9JmyepiPiptC6xM0QEbyqjQ0EGnWvD/i/Ikx+gD0rhRxKtdcBWZ22KhprkaiDcp5
	sOa0UI48FOA2vwjdQCtw7pc/Lbrf23ho7SFfYXm81KAfpttmUlbsBKNWuaJrF6Yi1SopdHfD7eBua
	Dj7on33tbYH8JRTVPun9gPRQ8nlJDI8HPsPAokWCJJR9XGYHp6eD7tQ/1Y2JHI7gHHKgsCR7nMNyU
	47iXQ+c0kuiTlonXLOZqlNW/X0km16TGzX7vItdyKFB1gBsYuwQ8VY6jSwin7FRwLxdmpjfYZQWBv
	zEWVJStrq38ed0AHhFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16W5-00GhqH-Re; Fri, 02 Dec 2022 13:55:49 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16W1-00GhoA-4f
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2022 13:55:47 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id a17so3427512qvt.9
        for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2022 05:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ma98Ber9LAvBhmxU5rmkvA56b+DHyODh9Y9db65vmQ=;
        b=xEETpZa+sTCbLrOSSHNMPt5XlCGaj7z5rd2NeowjZW+RKxeSwIcOuP0qsfS3nbUFi5
         jZzbP+wYwlK7x03cEBfAe0tDaqQ8HEIOghjpAG9pHzIuRbwNX8VMJycPGmZvj+hFaB6a
         Z1T4fdX7FdJlPMMeZdhPs3MLpMiljriJbYgU9Dw/y62xKvKvCjm/BYEG8qHPRXqML1QY
         FrNzbqAGg6EHkatnf+nXwN6Q9zX9PPeUrXbXU6BUGSlcbq3L+xkDtSm0nyNk7PeO9pG9
         GT8jCEYIw1QJ3gFHDMRBG0z/qxlhaRKNgXY0uwzUWY4DSbh4hJ2EMqTu54uXQ2XyTLhx
         zqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ma98Ber9LAvBhmxU5rmkvA56b+DHyODh9Y9db65vmQ=;
        b=jUrY+CAJzFFH2NQZ5+V26eW3P6vQZQqML+QuyP0vITwVz5mVlaj96YrvDuJzTfXEyZ
         szUeaMy6RN20lP3CYNWJuNOOWOwYHGLoVLo4yjATvGQrD416T331w+88UGoTlWMYVpVb
         pg1+MnXvDrpkB0I+PbX27TmV/lCwF8IjJ0aM4PaBGIVD0cfHOLsyOL9rXh8yu06N4Dk1
         iLn/l9CA8lzfb+VtcwKlhbhl10RyTQ2N46q1dwjPhOU/MC8mZ6GaHZecPYHTyDBNjV9d
         DXkZ2M7WMFZmlLNQi0S2KYuK3Nqs8L5NHXINIs/4kr5oW89O5M4OmlvoZ8a10pJ3e/B+
         gpEQ==
X-Gm-Message-State: ANoB5pnZqz3n21b4IXF2ww9lZQFpojVyI8sbOep6fHRrSBnjdMuMusF3
	wVVfhj56DjOL1F9h5XPm8zX3VA==
X-Google-Smtp-Source: AA0mqf5rI3PAXd/bmA2UbF5U56MLOIeiWt+rsTVpCAU88xX1n7KPrJA7nVQcysc3/NCelGB8rAvOsA==
X-Received: by 2002:ad4:4d49:0:b0:4c7:2804:d69b with SMTP id m9-20020ad44d49000000b004c72804d69bmr8069489qvm.5.1669989343655;
        Fri, 02 Dec 2022 05:55:43 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id x1-20020ac84d41000000b0039a610a04b1sm4122237qtv.37.2022.12.02.05.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 05:55:43 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 0/3] mtd: spi-nor: Extend SFDP to support additional octal modes as per latest JEDEC standard
Date: Fri,  2 Dec 2022 08:55:36 -0500
Message-Id: <20221202135539.271936-1-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_055545_430089_4809456F 
X-CRM114-Status: UNSURE (   9.02  )
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

In the latest JEDEC standard (JESD216F), there are now bitfields in the
4 byte address instruction table for 1S-1S-8S and 1S-8S-8S modes.

This patchset adds support for checking the 4BAIT for these modes.

v2: Move page program commands into sfdp.c instead of core.c,
as this appears to conform more closely with spi-nor paradigm.
Page program buswidth appears to be automatically determined, so let's
follow suit and do the same.

v3:
 - Added missing SPI_NOR_OCTAL_READ_1_8_8 to spi_nor_sfdp check in
   spi_nor_init_params_deprecated()
 - Convert IS25LX256 to 1S-8S-8S instead of 1S-1S-8S
 - Tested and confirmed both 1S-1S-8S and 1S-8S-8S work on IS25LX256

v4:
 - Remove SPI_NOR_OCTAL_READ_1_8_8, this was following a defunct path
 - Correct the IS25LX256's missing BFPT info via a fixup instead

Nathan Barrett-Morrison (3):
  mtd: spi-nor: Extend SFDP 4byte address instruction lookup table with
    new octal modes as per JEDEC JESD216F
  mtd: spi-nor: Add additional octal-mode page program flags to be
    checked during SFDP 4BAIT parsing
  mtd: spi-nor: Add support for IS25LX256 operating in 1S-8S-8S octal
    read mode

 drivers/mtd/spi-nor/issi.c | 32 ++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.c | 13 +++++++++++++
 2 files changed, 45 insertions(+)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
