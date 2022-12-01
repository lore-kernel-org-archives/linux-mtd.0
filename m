Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D490CC47088
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 19:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/a3V+aCYyrTU8BhFoTdqUJGqfXOew+oXTKaIBxXzsEg=; b=Ofgb4gu3D4t1NB
	IcpL/rnyRqMlVY9w/egql94TDyHBDae8ecQVQovFdIrCek+e4tPIfTekljzWeQB5q8zrd02okAVnU
	q+Tzn00aB2oy+2ND8e5ax1m5uWqnmyHJP8sP+TNH++BwMYVYLrhIVYOrjLB3JQsYElcFtO2Yunbc4
	7bRYewF7+1lY+P5TbtH2ol0GRRXKgSjoBfgA3rY73k3/oi9g0MMzD7faWoAmbRLO7OZOl8Lmp1/n+
	TakkrvMSCVIVDF4aw0kZn/A+hQ+4AG1Ofl44kHU37vBx7cRlEsnUqf+yPMY5RPELcF12B5uYFxXu7
	G+S7eDO5mgogNnSgISQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pJn-00ALjv-0O; Thu, 01 Dec 2022 19:33:59 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pGG-00AHHS-9q
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 19:30:22 +0000
Received: by mail-qt1-x836.google.com with SMTP id fz10so2203676qtb.3
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 11:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tsmRXs1XrARV8x2b98wPvkGWEv+wWS8i+zTUmm0QBMo=;
        b=kx13LBQYrQj0PDhS8TjXdPpnrGsFG+moF4OhMOT/dDaZR59xpURwUxLcfLYJmejSko
         9bKQZFeWjQ6PGdVwmcjZvlpwrIPOcRTrIMbKmFqxXOwTOFKb8fnIpFv5cjC0oj5ZbwQ7
         3ObDICe7H50Ofjn6thvG7xuAHqulYJ1Tv6JQNNsBUzfxpJjoogrlis6kjsDoW0x6jOz1
         KeRWzqqySBEV9XOeq8URBgZL2WmQItzrfklgsqs/P3IyrB+mKTYJnm6THUoUQN9r6oE1
         4cm0r9kmo7zTaYHI0gDaWZIre5/LHs6Y5l4eZOEDq8GMtmIejaA7DUNv6UG72kGy9a7E
         L2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsmRXs1XrARV8x2b98wPvkGWEv+wWS8i+zTUmm0QBMo=;
        b=eNsQS/u1coto1sIALbvuC+FLRX9VHHWYuh+Q19lD3hyxkHhk52zKtNIIJx8nrILpHY
         YjwuYVegsQZvAy5CX47m+mLOjPmUAZOvPotVCkasAEUk73Q9DCuMXoMrQpEY3xijtyzW
         Kgg85xRjgXKmLs7KUIrrS2d2vxK4eQQ6Das7qAYqBSDOMafctJByIDT6HX2K0LuTtKt1
         72S18Z32HzstkiLqQMiXsP26y2Mmu5q2rR1jTHN0KqrLOdl7VZGZw9kT0K4L3+Dno7ZA
         /olBlo4nzjrkgy4YC5RFISgEajaYTqPaqdQlsaURJ/u+pAayBhG1V5n8w6o03yuOhHth
         1zPA==
X-Gm-Message-State: ANoB5pnnZl5eIvEmMNdYwG0eOFEWze60CUG2Rt3zX0TApmlW+6UIP1r7
	UklyJ0/Vhx1xHsUpJh73n576Lg==
X-Google-Smtp-Source: AA0mqf7X7qi2w52qIfDQ55qcQ8HNhQma5ohGztXlAbQ4fSTTgCgUZ23tqFB5YNBiXAmQynnKQRYkGA==
X-Received: by 2002:a05:622a:90c:b0:3a5:4086:a46 with SMTP id bx12-20020a05622a090c00b003a540860a46mr61808193qtb.200.1669923016031;
        Thu, 01 Dec 2022 11:30:16 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id h19-20020ac85153000000b003a6328ee7acsm2977748qtn.87.2022.12.01.11.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:30:15 -0800 (PST)
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
Subject: [PATCH v2 0/3] mtd: spi-nor: Extend SFDP to support additional octal modes as per latest JEDEC standard
Date: Thu,  1 Dec 2022 14:30:03 -0500
Message-Id: <20221201193007.261690-1-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_113020_559163_2432826F 
X-CRM114-Status: UNSURE (   9.40  )
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

v2: Move page program commands into sfdp.c instead of core.c,
as this appears to conform more closely with spi-nor paradigm.
Page program buswidth appears to be automatically determined, so let's
follow suit and do the same.

Nathan Barrett-Morrison (3):
  mtd: spi-nor: Extend SFDP 4byte address instruction lookup table with
    new octal modes as per JEDEC JESD216F
  mtd: spi-nor: Add additional octal-mode flags to be checked during
    SFDP
  mtd: spi-nor: Add support for IS25LX256 operating in 1S-1S-8S octal
    read mode

 drivers/mtd/spi-nor/core.c |  7 +++++++
 drivers/mtd/spi-nor/core.h |  5 +++--
 drivers/mtd/spi-nor/issi.c |  2 ++
 drivers/mtd/spi-nor/sfdp.c | 13 +++++++++++++
 4 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
