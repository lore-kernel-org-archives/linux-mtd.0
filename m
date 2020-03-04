Return-Path: <SRS0=wBEz=4V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160B6C3F2CD
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 06:00:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA78A2166E
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 06:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKatDT7r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfMG6weO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA78A2166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EB8OqDwYXqjzMP87hDv/L2To3vuyCVWKDgrQ6Z40ggY=; b=AKa
	tDT7ruPHiNXFy+9zN8zXWEKHlCyfrXQLVvjnR8AveiX/pXdw62rpRwewNfSD11beDxUReArw2Iazb
	2ufncgNokTR9LdPMn5qUJTXeabbY6XcDnYcOXRN+tLwizpuAhxr+ZDrjqwnRKBcUFmUlZnLTPatfb
	7AYJ3MBzCTatbZMEwDav/u9xdvVy5JPVd9fi8tmhzpa4+57VwNqaiAJskuspKX/8fB12ez3cSl224
	17g11Kf410N8wKgq93VBh22BS+L9mcPIAqLw0sPrBNqUv6x1HZGf4JUcjtkR6MIi/Wr4kIB5E/RSR
	GX/o6QfJxYlscpJRJe2A0DIcNKRpY4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9N4x-0002XM-OR; Wed, 04 Mar 2020 06:00:23 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9N4u-0002Wx-PN
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2020 06:00:22 +0000
Received: by mail-oi1-x235.google.com with SMTP id g6so946296oiy.1
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2020 22:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3d7LEvuYRGpvIl/nbb36/Ygyj0odngs/YuymmVNQHXE=;
 b=pfMG6weOrZDyG4aIXHvJv9Z+By6uzi6lgDmu46BWAMA6ig2AF4tKD8PEhfBhNA0SbS
 XVnqlm7c2UHiDGDGx0Hr/VQKyRToVn1mPnozaWPn/7+69XHPz7oXrUAKci0fKP6IMflo
 Mch1QOZB1BihTRcypxS+nvwNC9Za88iE7a9GQ+rZrjiGHDCmQQJg6pANKGonG7C/dHIB
 C82Fh0MQrK6KwsmFqAR41u1uiCvhCayPNTMY47g1Kstsc2lVrw+fgJUuWx167MaKc5tq
 khVFCmROr4GeMpEq8+CyPt8EtPLSeWg+2TYk18d/vE51oPyAH3m3IAOM2PR356BX5Av4
 axRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3d7LEvuYRGpvIl/nbb36/Ygyj0odngs/YuymmVNQHXE=;
 b=ktpYq5XZ4vXZ2GYJj/I03IvVaYkfUpltuB6OlFIT2I5fSXdsHqksdxX40WFI8jw5W+
 Kx93jptilkXM2yzzFOLlbZwU29pKqLpcDn/xAMjzjxJ31p3Q6ewS70N0hntkBlpCx5E7
 m0YJy6tdOFzHpIS+CFTTpi18VTHrtDk6Gsqc2tR4dMEkm3OfF7J6iyCJSvGKJwP+2K7m
 PP5ieXSdcz8CFJtIzFYOJoUmbI6+oECHJo5umeF9lu2sFjo3eXijdbuF/WWcbyn5AZyY
 5tPbZpw5rODfVHkTCdT7I6zbsF2u2G8ZVc+jcnbGbMkNUnE1oyOwmNIiN6UrdvZHc7dy
 WXrw==
X-Gm-Message-State: ANhLgQ1cFtuggxJgLd1vw2P9hbXxhb8bvWZUB7VPdgjT4wEYKhhrnRQ7
 sQIpwuiUlPRg4MlRI04xyvVjjeW9IJubGYcsz7BjnBMohmk=
X-Google-Smtp-Source: ADFU+vuOePUdr3Iap85S8NrVIbXo0Tbz9zWpsU06racWOP9XhVy2kQjo7VayPLO70f05W1W6pmGPHyyRcVU1Ir+iWZM=
X-Received: by 2002:a05:6808:8:: with SMTP id u8mr663227oic.37.1583301618868; 
 Tue, 03 Mar 2020 22:00:18 -0800 (PST)
MIME-Version: 1.0
From: ron minnich <rminnich@gmail.com>
Date: Tue, 3 Mar 2020 22:00:06 -0800
Message-ID: <CAP6exY+ZMOA5jr4xku02VasP6QNcnsHDt6VXehdqizts5ZFbkA@mail.gmail.com>
Subject: x86 mtdparts for 16M part
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_220020_831213_086AD0C3 
X-CRM114-Status: UNSURE (   5.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I'm trying and failing to set up mtd partitions in qemu with a 16M part.

Reading the syntax I thought cmdilne would look like this:
mtdparts=0:8192k@0xfff00000
to just get an 8M part at start of flash at 0xfff00000

problem is, I don't see anything by way of parsing in mtd ever being called.

I've set the following:
CONFIG_MTD=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_ROM=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_COMPAT=y
CONFIG_MTD_SPI_NOR=y
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y

This is on x86, again, what am I missing?

thanks

ron

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
