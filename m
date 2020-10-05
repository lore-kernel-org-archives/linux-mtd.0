Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD82FC4363A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 14:44:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FEA207F7
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 14:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ymB/ApTx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AUBIqNhq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FEA207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q30PYkIFSubxBmb/uMxyMeZaGImNX5QJtkzt7PVquWY=; b=ymB/ApTxOs6UcV8njcxTMxYYo
	3YzrpdvdjqkEKR1S8gY/UApwIBWn1vQTMVaa5oSO5OE8fyk84LeSpc4cicgwZG+48Ko0LRh44n8Ze
	erMnXhxyVvAhHFaNM2gg7lz/pTuOPJd9pDCXQOzCxKtuoF4fvoeIXlidj67iSqzwRbTXpB9PvoeP3
	jDEJlEckzuqLwnmB17S/kQOHZiJ2f7uZ6XDWRQFMCvNMEzyG5TBTm/I0jAZSJcQSKTwsKmPe3SVWJ
	r8LjSwMEOR1T9q4cmdyLT+BasfjY0QptgQUA1ss0C5JqCs5MYz38EJBK40u7zRERZijTTeXzxp5TF
	qbTpLDpAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPRiK-0003Co-Nz; Mon, 05 Oct 2020 14:43:44 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPRiH-0003BQ-UP
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2020 14:43:42 +0000
Received: by mail-vs1-xe42.google.com with SMTP id s15so2070941vsm.0
 for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2020 07:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TU+j+Xbieh3FK7psjds/MoW9/sFR78wjEXA54zTt1Co=;
 b=AUBIqNhqqIjxGu5JNrH+FhF31uWdVM26CNAWD5OoumwwqeZWHte8dEyW+WdIHRaHEf
 U5H0w5E4gnmRWqV0eqDgSAREaCIm9B+bdHSe0ZNZviL6o2bzCa/gKxNDOVx1bGQ6WVeR
 IrTXsFPHUXMHIFX//x/rzb0POtn12pszquBG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TU+j+Xbieh3FK7psjds/MoW9/sFR78wjEXA54zTt1Co=;
 b=BHPqhL5nNM61qgsk489PS+DBr45isETOSdSBe8Qz4FJmTAaJD4T+L6cJNJC5DsXMJY
 2BKjFn58VsMZYkuny+5s6OkR+bYsND6fF5pFQJyc5q0AxLkEqRQqGHjFEIJ76ELIaDcc
 HsaIGL12Yfrgiifu5CUACl26y5g8KQ+h0Px+6kWHDl7tqos2Qt6N4obud3PUVIdfisvj
 yvH/y0+cPxtRc60DH8YRFk5iZyjWcFXxaz5beVnwdhoJUQdp2FUkRMqHQLZF/vQAyvS4
 bmEGIPeeJ0F33y9xd8HM1oYD/v/lzPDjUiNCIxpxXJfOP7VlO0a+y1ZP7UHcgf3gT1dH
 5fow==
X-Gm-Message-State: AOAM530k4XDJfqUitxGP4F0L4zCnP++mb38gg2N7gn3peSkETzo0y6Kh
 XzrCBdTnr0AF9pS9M6SRioJJJkqV4qORSg==
X-Google-Smtp-Source: ABdhPJzA66e4N8xx8m28yqLO4XJBvoqpptKJUUhGEsE0Hd7j2rVks22cIgM6BU/JB1h8zFVhJB9/Uw==
X-Received: by 2002:a67:d090:: with SMTP id s16mr223719vsi.0.1601909013952;
 Mon, 05 Oct 2020 07:43:33 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id t71sm34302vkb.7.2020.10.05.07.43.33
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 07:43:33 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id r24so4351536vsp.8
 for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2020 07:43:33 -0700 (PDT)
X-Received: by 2002:a67:f4c2:: with SMTP id s2mr287395vsn.4.1601909012755;
 Mon, 05 Oct 2020 07:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201005090321.8724-1-vigneshr@ti.com>
In-Reply-To: <20201005090321.8724-1-vigneshr@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Oct 2020 07:43:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLWgyS0T5h9JtNpDSo4PebUYX-YEAW9nBo5VyhKRbvYA@mail.gmail.com>
Message-ID: <CAD=FV=XLWgyS0T5h9JtNpDSo4PebUYX-YEAW9nBo5VyhKRbvYA@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: spi-nor: Prefer asynchronous probe"
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_104341_981767_F676C27C 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Oct 5, 2020 at 2:03 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> This reverts commit 03edda0e1edaa3c2e99239c66e3c14d749318fd6.
>
> This leads to warn dump like [1] on some platforms and reorders MTD
> devices thus may break user space expectations. So revert the change.
>
> [1]:
>
> [    1.849801] ------------[ cut here ]------------
> [    1.854271] mscc_felix 0000:00:00.5: device is disabled, skipping
> [    1.858753] WARNING: CPU: 1 PID: 7 at kernel/kmod.c:136 __request_module+0x3a4/0x568
>
> [...]
>
> Reported-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 1 -
>  1 file changed, 1 deletion(-)

Thank you for the revert and sorry for the breakage.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
