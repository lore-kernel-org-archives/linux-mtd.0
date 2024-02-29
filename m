Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA00BC48BF6
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Feb 2024 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WkMQUfoYO1xLIy48MWXgQ5DhYXk0lZ2Yrt2TeRaxUrw=; b=ICNicbPZQUBJaQ
	3t362+kRP5ihCI8Kz1Ei15Xm2f0UhB86UMR+nTtAngiL/ljjtcBY8F/nRws/fFPxnJzylGIW7Gskc
	vJkVIzWETWMplCVhb0wchUAHLqqIerpH815fLW+wljcn5Lbe14rt2kHFykamOkYbKAeJcRs1s0DtY
	p4sOTXzTGb432qLHZiNKF5ZQKmK2u44slxseS75CcTeMoyIZNo/BumP8RbD5zH9dYeDUPbMscrRxI
	dP6zBtSs1PdMkNt4f8BCQd82mmxWT9asA/soh7koJ/3vAHKOCB2Qnwfdxe3g78QVm3bU29PCHoNE+
	ec8oVcbCMqXBTywTyKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhCJ-0000000DoyU-0QjI;
	Thu, 29 Feb 2024 14:15:43 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhCF-0000000DoxG-3sRu
	for linux-mtd@lists.infradead.org;
	Thu, 29 Feb 2024 14:15:41 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a293f2280c7so195825466b.1
        for <linux-mtd@lists.infradead.org>; Thu, 29 Feb 2024 06:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709216137; x=1709820937; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdiYeP9gdKejGJeuXoSTrrP8jz3vu43onSQ+Sz9yJJc=;
        b=O4C7LXgY8MTfgfS5cktYkKrVdYadHXGRsnI7L3S8EEPliNKMePbumPunqECkpmyzur
         iY+Sqv6U7NnTSq8npH+B/K0VyahkQ9UnVh2LDX1MVaYhjyjOEy0WDhq1wwnM+GrHnD7W
         XEwpVCtNqu9CfscKFukMy0Dq/NWVf5vt/G7iSwdNwFjGgv1/ph8pYzYeBrjRnbH8/tl6
         tw+g/mig1J6BHLlFVbcQvS7WeN4xjXO+Bzpdoty4FN+SkY8sFSH2rHht+CKJKTfqIAVN
         pxeHpJ+/HibVP/LAg4Gg9iPRh8c4IdjReFiu17exWDx7+nJhqNWfT7jFzRW37NjDrbG2
         PU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709216137; x=1709820937;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JdiYeP9gdKejGJeuXoSTrrP8jz3vu43onSQ+Sz9yJJc=;
        b=VmcGQRnFl+CnSR5nZSDvOQvpJ2ogAeXVOwYLr4tvygxMw2P3UXlwPov7zKps5oDFem
         3Hbag1OQtfpX5um/lY4YPT6IwpyFeEeSaESYs2cM+HeVP48aAAyc8FikSGZ9gl1wECW/
         aDLbdUL5gTkpI+5z88FOfPVt9Er7F+x20wGuj4cFqBXuhn+oVvNb2/BXMKYZc501InMG
         FMTZm3vKL2971ijS5N6lw6ESODLMHRYHZxgGEPNKXLaqIxW7gRx7RmIwyw5OdvIpclsQ
         kgwCRpEI0SCMpaMPJHdRdlpoHw0cwhIwRS8JShEbtQfHbygXaW1n4cQAlDFsoe6gms6z
         MHEw==
X-Forwarded-Encrypted: i=1; AJvYcCU6L+TVeB7ASuYehBZ0iGOtAtK+Vd95vX5BQvw+yPBg10B4GY5i3kRBQpmNyyOX9mrRNb6ieravYWkcaMaSyj+iGuZdI9+aMM1nON1ZWw==
X-Gm-Message-State: AOJu0Yy1WGD0QMm7LJShS8NUPNf5EQ6fmdNNOG4sRJLa0meErqzORu8Z
	Mx7u6SEl4bxD08H86bZDiG0C0uZUjNp0FtD3Gl548B4Mwk+A0h9tDCD5gnV6VUk=
X-Google-Smtp-Source: AGHT+IE8Vx59BoLpL7+5Vtu9R/pjvwkAyYQTgj4Z0GzcwQ20cKWboZo2uun53VKTGosbuX4Jy/KT8A==
X-Received: by 2002:a17:906:4917:b0:a44:4f9f:1270 with SMTP id b23-20020a170906491700b00a444f9f1270mr1194613ejq.37.1709216137656;
        Thu, 29 Feb 2024 06:15:37 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id i27-20020a170906265b00b00a441c8c56d0sm720455ejc.218.2024.02.29.06.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 06:15:37 -0800 (PST)
Message-ID: <7d391df2-09e4-4166-9116-312bfa74e738@linaro.org>
Date: Thu, 29 Feb 2024 16:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: spi-nor: changes for v6.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_061540_002023_6536C0DC 
X-CRM114-Status: UNSURE (   5.63  )
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

Hi!

Here is the SPI NOR PR for v6.9.

Thanks,
ta

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
tags/spi-nor/for-6.9

for you to fetch changes up to 6a9eda34418fc4dc05c2a7d6741c475e287d418c:

  mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map
(2024-02-26 13:29:09 +0200)

----------------------------------------------------------------
SPI NOR gets the non uniform erase code cleaned. We stopped using
bitmasks for erase types and flags, and instead introduced dedicated
members. We then passed the SPI NOR erase map to MTD. Users can now
determine the erase regions and make informed decisions on partitions
size.

----------------------------------------------------------------
Josua Mayer (1):
      dt-bindings: mtd: spi-nor: add optional interrupts property

Takahiro Kuwano (4):
      mtd: spi-nor: core: rework struct spi_nor_erase_region
      mtd: spi-nor: core: get rid of SNOR_LAST_REGION flag
      mtd: spi-nor: core: get rid of SNOR_OVERLAID_REGION flag
      mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml |   3 +
 drivers/mtd/spi-nor/core.c                               | 187
++++++++++++++----------------
 drivers/mtd/spi-nor/core.h                               |  30 ++---
 drivers/mtd/spi-nor/debugfs.c                            |  26 ++---
 drivers/mtd/spi-nor/sfdp.c                               |  47 +++-----
 5 files changed, 128 insertions(+), 165 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
