Return-Path: <SRS0=PPpL=24=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB989C33C99
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2020 09:53:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8120C2081E
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2020 09:53:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fHJCBeis"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8120C2081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcRDxZaHOoqtcC+CDAeoNdhZ1hf4vOt2UzLA26m6q/o=; b=fHJCBeiszFGE4y
	s3NbVKICEimPHwhToj1zRjPzDRQ/4RZBuXxyhofGWGoCOvbrfVRnoIMsroKZZAtFxqXBy2gvTG45c
	dK8gxESZHlYU3G2NBgVgg9Mk9jG9mBemDXKDs/fiToB2mX4FnjQnD/oEb/RotevAZ8g4U2RuLjwwr
	ZRxONpHMfAg8Rrolow34FayKcJRoOqYE/68iUQMyPkXzsw5QdLM3UiTPqIVXggEMTthRmWHZE36YA
	6bghxfAQkfbN+2W2C0xdZde4+9VYnKGxfFwSTX4AshImKI8VsuKzVYYnIioFCrZur7jLqIEk0vkMx
	THVz1dKHszIDtiTvrRVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iolY6-0002Y2-8f; Tue, 07 Jan 2020 09:53:18 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iolXy-0002R4-Az; Tue, 07 Jan 2020 09:53:11 +0000
Received: by mail-ot1-f66.google.com with SMTP id w21so67952051otj.7;
 Tue, 07 Jan 2020 01:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rcKJiBOHF/a0+MDVGltwkYmA7kAiSShXv3OfBucNo/w=;
 b=pe4RPRfIY9fTPoD8IcMt+0jxr6fSPWQOhoDeI5uGclBPNrUdlSdSCdMYlMK+cGtEkc
 dvdoDnMt4uiEOFF3NXuhCBEiukfx0vyyDjcY72KzEjfYtUczDfRkdBHU/fk/KIQJF0Dm
 nHCnJVhCaeAR9I59Dm9JSZ7VEdk5ZdgZQ7l2OZbhAxmPXFYW6Uy/2SiSHMU3VB5F+AVc
 BM872P4OQMfmhkvtLoGk2UTnSednY/Xs3LpU/5cb8xyUdeveyTiwY8u5zEkeKVMIYTT+
 HxrNWY9PffQPYw3mjALYpK2lb8wJqL/zBcqjcRuxyckDXxMLnTmfIvrgeeZ7DG/b4QFl
 MefQ==
X-Gm-Message-State: APjAAAW0efuIR0cbBk3/UUdLj5CZ3TxjJzncoEM9+T+dEvSh8F39fpAS
 fI3W7JUOjaPB9Xn84Vxgs/MRBsYc3aPMY75isFw=
X-Google-Smtp-Source: APXvYqyijdjeyq4HJ5FCDcI015uTWnvTRQoFeaQRgxTWy1DfLN1zgBL6llgNmNnOtPrGgkpTZXmDGjkn5Is6S8EHkt8=
X-Received: by 2002:a9d:62c7:: with SMTP id z7mr111166052otk.189.1578390788841; 
 Tue, 07 Jan 2020 01:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20200106045833.1725-1-masahiroy@kernel.org>
In-Reply-To: <20200106045833.1725-1-masahiroy@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 7 Jan 2020 10:52:57 +0100
Message-ID: <CAJZ5v0jBEq+GiTP8V4ZzQvR9qbSBdEz_P8EZNX7yNZMzTjB86Q@mail.gmail.com>
Subject: Re: [PATCH] treewide: remove redundent IS_ERR() before error code
 check
To: Masahiro Yamada <masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_015310_378241_7ACB561E 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, linux-gpio@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 6, 2020 at 6:11 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> 'PTR_ERR(p) == -E*' is a stronger condition than IS_ERR(p).
> Hence, IS_ERR(p) is unneeded.
>
> The semantic patch that generates this commit is as follows:
>
> // <smpl>
> @@
> expression ptr;
> constant error_code;
> @@
> -IS_ERR(ptr) && (PTR_ERR(ptr) == - error_code)
> +PTR_ERR(ptr) == - error_code
> // </smpl>
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

for the acpi/scan.c change, but there seems to be a typo in the subject:

s/redundent/redundant/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
