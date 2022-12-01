Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACDDC43217
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CgwMma103Kpyz8aeSU6QjiaV2pc2rKopSnRTNtlFRa0=; b=ktxUyDK9CoG6D/
	PSLWZjrhMW3osq5cjl1B1nm5RZjq6Ui+ak+Qns3CpWvm5R0Qmp1I2wWFcHyfLVqO0dzzUDUu7WAfh
	MXf3hNt4vr7en2xSgVLwzVhlCJjp9AsD/LXtnWIR5FYGvwtkzxkKKqYvT55ZioKyHARK3uE4e97bI
	dKpnHVl8SeR2loYtNG4xqEC1lYzHG/xI3rPcjl8aVlQPKsNG5OkANTaxF2DafV4Kn9XtRtgl7AAAA
	FDeaDP9F/K3Sq6MKeQ5WgWQ4Nz4wR7Y72jcBLj9BzS24aRQghvXyA7Ld/G+ubEOsFEoFETii3Y4X9
	qBYsZcK4Qz9IQth/bjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0o7e-009YUZ-Ui; Thu, 01 Dec 2022 18:17:23 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0o69-009XKz-0x
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 18:15:51 +0000
Received: by mail-qv1-xf33.google.com with SMTP id d2so1868595qvp.12
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPoSscocgW7JDIUXs9rfd3TYBr11h3l8OCCMgzWgJRY=;
        b=TZDj2d8tvXXmDQK/6vnsdgY24qoKuUwAVkOzLCVy2qs/nTid9C8wcnXc6X3qxqsilT
         aikVp+L05JEUnK/W0P7kOsWcpVj+FlcsKko3ovSj5o5G8tsma/PPXAKPVqjdUcYhbfw8
         wSNnm3CudEXCiEf7rt0ktJHRGKq3BToB4tAxjpJ8QKWMf/f0FiQIlbRJK/1NzbcAUUjm
         11EAd//5LdRoMI5IstMm0pNPL+ecGLnZ19kXq0aiwjKXlhVhVyW20VM5YY8iHk4v++O5
         mgEkhHTzGLHf9oSIa7sGvwC5WU9PETQvxA6MIHcj1T4GE5GTpaqIqQFxFBCn/lELTIUS
         1EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPoSscocgW7JDIUXs9rfd3TYBr11h3l8OCCMgzWgJRY=;
        b=qsalNulnQUu5j1h7XU+VnPDSUi2YB0PaEfPaYcFu+QF70Opv2ozSXBrGEII2FfjQ2Z
         HWdA+QJV1/2Yrm8+7uXa22nFxUqQY+v4uE//wAgnD/4xpq9JUCgQy8yzwE99TrIx0fmd
         bmCDftCPdVb3jZlAeJtcFCsU97+UlO2fjWxIo5l6PWZTtOn+YnakfYhIs7H1bU1yFHz/
         SHsi60lleHOh0weOY9f8tVjRwZIRlsKytgzH0n8OTVRXu2vhGAxuV5Lsh+3fCu/XM89s
         EYmJRqYxLZpYCOC33CrdsLtMI/Wx2EVbP9FsdqlaqxpIsUko+h3WxmMv2papTwl7oczG
         h1fA==
X-Gm-Message-State: ANoB5pl2GYMkarsDhpWEmQ9zc+YbfZd8LOQGebyJfs3ujH9wYaMctxHA
	kalATZ2/YyQd0hiwYWM62kItFw==
X-Google-Smtp-Source: AA0mqf7S9uF2secA2rtBk3MmlmF6Eyn41U5P0o1gc0zdV5JrdzrMofYWNlaru2vpeImzlpsm0QT/DA==
X-Received: by 2002:ad4:5768:0:b0:4bb:728e:b232 with SMTP id r8-20020ad45768000000b004bb728eb232mr24843734qvx.27.1669918543443;
        Thu, 01 Dec 2022 10:15:43 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id f12-20020ac8464c000000b003a55fe9f352sm2908912qto.64.2022.12.01.10.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:15:43 -0800 (PST)
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
Subject: [PATCH 0/3] mtd: spi-nor: Extend SFDP to support additional octal modes as per latest JEDEC standard
Date: Thu,  1 Dec 2022 13:15:29 -0500
Message-Id: <20221201181532.255449-1-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_101549_256208_D88BF08F 
X-CRM114-Status: UNSURE (   9.00  )
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
4 byte address instruction table for 1S-1S-8S and 1S-8S-8S modes

This patchset adds support for checking the 4BAIT for these modes,
along with additional NO_SFDP_FLAGS to support enabling these new modes

Nathan Barrett-Morrison (3):
  mtd: spi-nor: Extend SFDP 4byte address instruction lookup table with
    new octal modes as per JEDEC JESD216F
  mtd: spi-nor: Add additional octal-mode flags to be checked during
    SFDP
  mtd: spi-nor: Add support for IS25LX256 operating in 1S-1S-8S mode

 drivers/mtd/spi-nor/core.c | 21 ++++++++++++++++++++-
 drivers/mtd/spi-nor/core.h |  9 ++++++---
 drivers/mtd/spi-nor/issi.c |  3 +++
 drivers/mtd/spi-nor/sfdp.c |  5 +++++
 4 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
