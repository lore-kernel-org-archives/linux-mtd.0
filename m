Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E07DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 23:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18F5A611C3
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 23:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18F5A611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6zI8jv+KdKK6E5jaJb4NFFflgNTcFcaADa/THHKGSE=; b=G7nawR3Ak1kso3
	sjop2HvIUenFsSdLZPzp1wS6mr0G5NV7G1ak5Hd/Sl1SqoaftdqhgMmEjCazw5lucYwSSSntrE2Cp
	ZcSmKK1SoWejdw3MECeoxqUe/oKGjPf+xxVX618snlIcjETFygH2HqFWGndruc/nl85+bUxFRlMZ9
	qxloBfS+hXS7v3F4tKXWLE7jGPEIBoe1WzNxtQGrq8KVcuRdSXUizsKdlce+0diWaffcCSjeRaOCq
	hQqGOHwtKtbVpllj/0OwjNYNig8I47P8iAi0syYMx3dUTLRrOn2+6lWvuGz3e7Rwbh7ax5Ye9XOlo
	twcdl3/T6WkMH+8Bqw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV02R-004tPJ-5Z; Mon, 27 Sep 2021 23:27:59 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV02N-004tOW-P8
 for linux-mtd@lists.infradead.org; Mon, 27 Sep 2021 23:27:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id t10so84384290lfd.8
 for <linux-mtd@lists.infradead.org>; Mon, 27 Sep 2021 16:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CNjVwNOreCVnGXxMa3eIII8LsiZt1BUYV58xP4ke9qY=;
 b=LhhH7IkIw+kfY7/iSu76gPEPRrZndBwB657Z3DEs/uhyyKaP/yz+ZiC7G3z1aYXLv+
 oKHnddZUWUjkKvdrXsl+/RNuYMn7NCeZmHHsweuWXBYhpixdbRNt+DEdqODe+dPKGeBF
 EwjTRFI+mcuuUzg6VvCI0Lw63lws375MhE9jhGs2qPtjNVwKwWLYdU+cwLt7HHzS45TO
 yaCRwnqlXtDUxUbhGt97b8a7Z+7yE5IonNMzC/MtIAhf2QrqS4XcknUlcOwd3bT53z8T
 kroZMh93UYDUNe4FcAQj5/PjBia8JuaXINvq7QaXhH6uoklT5EOyE+bX8sSlQ1cYr7g4
 V2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNjVwNOreCVnGXxMa3eIII8LsiZt1BUYV58xP4ke9qY=;
 b=EzREa7+MvQVVdGGHIAVgaWlaPRm4H5qW+KfsKSRORlWkXHUlcTzhcs5ofpXTbEKHv8
 tDSBqRir0BbaIYpN9YPjNDW9+vqcBghoVqEqVsXbuKjQufHBIdUUpwQ23B5kCdoi8gKc
 7H53HGMAQKeo/BxymVG6d/oy3JDE08zeRIOymAOYSsvNhPRBNtbf7EfqSfqu/WnOL3rv
 s01AYAHBB7GXzrTWEcDi5UG90+7vDuXe6mwOOKvG+kZQlj9SoKPU0hJ0T6P2AuIiD20R
 /X88WcwIQSQUsrMTz/NmkEmfM+rK1k2ptPoG/ocz4jAPAG4/jRXbrOMjyqMZiGSJg43s
 8qpA==
X-Gm-Message-State: AOAM532w9pYAVmeSC4sI+bcdQv9239/dm8rCmSnnEFwYa4+MVZ6APfRP
 1NojA7Up9l70GvCEFi8WeaazHUhV4Bknrpg1l+lCCg==
X-Google-Smtp-Source: ABdhPJw2EKvcRwRwNeXo4O2UwnzB+EKOgNqmwCSfbJZNDJd24C3ZQdno4QJnb9j9a92AOGS1jLIZjqOQhzQIdH7wjiE=
X-Received: by 2002:a2e:510a:: with SMTP id f10mr2595006ljb.358.1632785273575; 
 Mon, 27 Sep 2021 16:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210927141045.1597593-1-arnd@kernel.org>
In-Reply-To: <20210927141045.1597593-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Sep 2021 01:27:41 +0200
Message-ID: <CACRpkdbirEZiKQxSWSsiwwvpui5Pw6vON-C-=BLJei0s8znLxg@mail.gmail.com>
Subject: Re: [PATCH] [RFC] mtd: fixup CFI on ixp4xx
To: Arnd Bergmann <arnd@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, 
 Krzysztof Halasa <khalasa@piap.pl>, Arnd Bergmann <arnd@arndb.de>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_162755_838080_3CC931D7 
X-CRM114-Status: GOOD (  15.61  )
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

On Mon, Sep 27, 2021 at 4:10 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> drivers/mtd/maps/ixp4xx.c requires MTD_CFI_BE_BYTE_SWAP to be set
> in order to compile.
>
> drivers/mtd/maps/ixp4xx.c:57:4: error: #error CONFIG_MTD_CFI_BE_BYTE_SWAP required
>
> This patch avoids the #error output by enforcing the policy in
> Kconfig. Not sure if this is the right approach, but it helps doing
> randconfig builds.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

> Any other ideas for how to address it?

We will "soon" have IXP4xx transitioned to device tree and then
physmap-ixp4xx.c is used instead, and this entire driver can be
deleted. I will get there, we just need to remember to mop of cruft
like this at the end of it.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
