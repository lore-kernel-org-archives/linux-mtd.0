Return-Path: <SRS0=0bx7=GS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0066CC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 08:09:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99B2D221F7
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 08:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99B2D221F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ipv44yS/gTa/r8mQ7nnf27nzzcEjlx8wo8hISkkWpB0=; b=ASuzZbKg3XeodzSUvTjMTrWkVz
	fEWXFE7uRJE8xGyO1IB0W16jO9wgk/MJpQqpQ5TK7kelFQgEb5WkU62lgIXoK0hjROgLI8cjsZEX3
	z1+LtPuPBCgkmFuEzgh4hKg5V56U/OusHFoj1nGktB1T6WM5COxM6vtywnURQ/lPiTPflcAJ7Qw/+
	04++hR0GZGuksUWt/FH+7+bwBe74B3eGATc6zCR1HuUmAM4L1AFMzACzROWnQS8YtffCMFbqYwGFg
	rMM0VFaQptd1Qt7IosPVVMEH/KOKchnruwexm53o3PQWNNVsB3qMfiRNXtYQMz/SPXm8W9Hs+0MGp
	toViEz4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0K9q-00049T-7W; Fri, 15 Jan 2021 08:08:34 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0K9o-000492-M4
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2021 08:08:33 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id y4so4289131ybn.3
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2021 00:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=EM4FtMnXMsFuWt+88Q8l9d5gyieX8v1qZgF1UwGxgNQ=;
 b=KBZcO36MvUPnBzQbRh/QDVIgXMLvP9HNTcgBc5LbflfROSSaYj8v4kKQXxbwwwWCPn
 rDXsHBrIF+Xbyl39Kf8V5gbuikIVPUv7LWGGM5tusDIcgJhtvBAhszO7EweLxAPacCAT
 Gro61sVOnk4Y46N547AoeYsN9YLIjfArjUhKWJLqfBk2uroSYKes6qUy+7uBooSOCTOY
 k0V7a/C16OdS6S25ifXlf5p1sDe3fRHnibQrI4A+lMIQHKGVpGUafmzK7r2WryqsRBml
 1pSp8bG58isuApeSJHIW8sFYzflU8B5Ibxj7YrUPYeaNpPcpQI7yz26vFMt/TtX/4xpt
 18Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=EM4FtMnXMsFuWt+88Q8l9d5gyieX8v1qZgF1UwGxgNQ=;
 b=ZHWtwtX1ScVAKjSoRbs0/wfAa1eF2amANmeuF/CjK/0VeEXsLLy1MNhho54zGIs1DR
 VAOss04DWUlNL7HDQ4z3KpdIFiWNxhus0ZW375ckOyBKNYwRGFt3Lu+WCVCrshKqb298
 f7qeFtj4uecrPQeVdhKCubq3elq30Eq8EctbivZQTUISGUMReuK/kq+tdyb1YxDd1VQa
 nOvaYzVsdNTFZBi/S3IyIEAa0Dp5G7P5qyBmjgy7058wRtaLyF60HQaK3arhGYOPxhqZ
 L6vEBIOtR2VffBi8B4ig4df4XxXNRpaI+ezkUkyDg0s7lPjGaawN8W7oxe9INCgB4WsX
 F+YQ==
X-Gm-Message-State: AOAM533A/sKgSTbd9F3bhnUiXpcEDAngoftVnqLKohm15Yq7MwyrwZlG
 XP1ueY5qvzh+xYDOW0qeVBveAZY3OJnoe6DiwWqbmVWt
X-Google-Smtp-Source: ABdhPJyucAbUInv0/1ZzlNRQ+1xI3Hibf7/xGgsX0wVEU5Mxly4SOeaiFvXXcXIbCJVkjAXpmNPzIDpqyy7+HgXxuwU=
X-Received: by 2002:a25:1505:: with SMTP id 5mr16929969ybv.289.1610698109913; 
 Fri, 15 Jan 2021 00:08:29 -0800 (PST)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Fri, 15 Jan 2021 19:07:53 +1100
Message-ID: <CAA=hcWR+nsKAEH+Y9+U+3j21QtpdnBTenLdd65-yt0zpYPzX0g@mail.gmail.com>
Subject: MTD UBI undefined reference failed to build OE gatesgarth branch
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_030832_734563_63349FBA 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: meta-freescale@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I was able to build MTD, UBI and u-boot on OE version Zeus branch, but
failed in gatesgarth branch. Here are errors, what could I be missing?

u-boot-imx/2020.04-r0/git/cmd/ubi.c:478: undefined reference to
`mtd_probe_devices'
u-boot-imx/2020.04-r0/git/cmd/ubi.c:484: undefined reference to `put_mtd_device'
u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/build.c:1161: undefined
reference to `put_mtd_device'
u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/build.c:1229: undefined
reference to `get_mtd_device_nm'
u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/io.c:1407: undefined
reference to `mtd_read'
u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/io.c:279: undefined
reference to `mtd_write'

u-boot-imx/2020.04-r0/git/drivers/video/cfb_console.c:2025: undefined
reference to `video_hw_init'
u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:51: undefined
reference to `dm_spi_claim_bus'
u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:55: undefined
reference to `dm_spi_xfer'
u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:58: undefined
reference to `dm_spi_release_bus'
u-boot-imx/2020.04-r0/git/Makefile:1701: recipe for target 'u-boot' failed
make[1]: *** [u-boot] Error 1
WARNING: exit code 1 from a shell command.

There are a couple of warning messages I am not sure if they are
important or just nonsense, like CONFIG_DEFAULT_DEVICE_TREE has
already been defined but it complained:

Device Tree Source is not correctly specified.
Please define 'CONFIG_DEFAULT_DEVICE_TREE'
or build with 'DEVICE_TREE=<device_tree>' argument

u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:51:8: warning:
implicit declaration of function 'dm_spi_claim_bus'; did you mean
'spi_claim_bus'? [-Wimplicit-function-declaration]
   51 |  ret = dm_spi_claim_bus(dev);
      |        ^~~~~~~~~~~~~~~~
      |        spi_claim_bus
@
u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:55:8: warning:
implicit declaration of function 'dm_spi_xfer'; did you mean
'spi_xfer'? [-Wimplicit-function-declaration]
   55 |  ret = dm_spi_xfer(dev, priv->nregs * 8, priv->buffer, NULL,
      |        ^~~~~~~~~~~
      |        spi_xfer
u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:58:2: warning:
implicit declaration of function 'dm_spi_release_bus'; did you mean
'spi_release_bus'? [-Wimplicit-function-declaration]
   58 |  dm_spi_release_bus(dev);
      |  ^~~~~~~~~~~~~~~~~~
      |  spi_release_bus

Appreciate your advice.

Thank you very much.

Kind regards,

- jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
