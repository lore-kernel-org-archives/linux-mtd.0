Return-Path: <SRS0=2ZLh=B3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B682C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Aug 2020 03:39:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBB3205CB
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Aug 2020 03:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FSGsqZfP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSK7KHaE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBB3205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t3y0Qcwu/NeYlTIPjJXRNyzkHdaObm0d3/HZB+woqyg=; b=FSGsqZfPNaQ/9LHDVXjc7m2rV
	rQuZG+rJMjr2udJVbLhY/f5cIBaYdCtT5GO2Wsnx9K6khxolkJj3u2nWGueuV8OhVaXTIqp4Fqfpk
	qHO7yTtMvUtsLjqcEM00t0Q55AjjBs1M4cUdLjTsXNLsoERTjXQzDjhsVwTxuYRH3NzI+xNeCmpM3
	XVtSARlNXBm2wcsjAXbfkSS4xJFOp8sYrXk1ezXV15xjFWkd0YNcUBdPk6G+/5r59O7JPRv9srGl0
	TtH5RWra1r3lZjpo2CfO8xcjUMfw8URjJK22l97sOGxUP3zOBXzo5QwXhvq4kuhzUCv8k5E9jjsCA
	yI5JRBJdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7VzE-00036L-Bn; Mon, 17 Aug 2020 03:39:04 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Vz7-00033U-Cr
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2020 03:38:58 +0000
Received: by mail-ot1-x344.google.com with SMTP id a65so12340028otc.8
 for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2020 20:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EudykbgiajKkBFyEFrjNb1xNg9i7JJeJ3nfskGk9cZE=;
 b=aSK7KHaEebsuRKhFfatFZvlqhmccw8I4of5b302xJArSQVHUqzANbFZy6m0Oph25oq
 QAOLR5Wwic2uYxlriKaCxW/idlRJeZwUNzngnsl1YTslAozU9hS+FgvFe63wfTDYO0y0
 9CuzP7RO/fp6Xm3S/jbyapHlNbJcIdMadIfXfbbH53uhIpbnAMm3sau8wK1mmOFdj67u
 aaYbi/RlbPOBbBGf/1BggQoVQHq6eS/5PFubjQf50/3WR53h8G5/M3W46HlrW1ardimr
 4BEnf/OIx6PO8dJ2aFX2HslkgE/xKfza2sjybffebMRZU0OKNEIJ0szqmjmgFCr0fcGL
 EoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EudykbgiajKkBFyEFrjNb1xNg9i7JJeJ3nfskGk9cZE=;
 b=jVl8eyjZwnDxzAMJWxtLiilpnfin/bY9o8p0+WnrEW1aOnFvKTBJ7/GaH9FxckYc06
 KKCBAXU9TwvfuhKaIcro2CECQWLoKh9qcOC+352yyyt/P2x7slibvKa+i7eUNqC8q8Zo
 3mfuIDCRdF7i2oNKdPidBnYyXJc3mgEFVtfHjiuR9NfnYKFA6Ncl/77AM9XeNchqofvb
 7b0vJgSainWBqpn+GLqKsX7ur3HTvphIFfqkaQvmuaxGNotnlzAwbtfToFEkAleyjQa7
 pcA851hWF0G4BwuYMpaKhqiQ8swDTxt0VKn8fzkjokyW77DZCmRFSookRHq85xK7Tbsi
 vgCg==
X-Gm-Message-State: AOAM532aNrt0hi5fXnQ7l+VdXuocBXSZeG295sxL5uFUrzs2R1iWBt9E
 z9kvrmHJPdmcprNwmc0nrQxCEiPyXHXiAhW+J54=
X-Google-Smtp-Source: ABdhPJxFWxwR93cmp/Bw5jOKvh7x6ENsvVJ3ArPhSf9ofZLHUzV/MO6yrtMUwsz7ztBi5kbxgHnSq4LZbQnDuxb6iDw=
X-Received: by 2002:a9d:4717:: with SMTP id a23mr9195702otf.70.1597635534015; 
 Sun, 16 Aug 2020 20:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200815172725.28765-1-hauke@hauke-m.de>
 <7f504d17-c222-40ac-e820-5f93bf662bcc@hauke-m.de>
In-Reply-To: <7f504d17-c222-40ac-e820-5f93bf662bcc@hauke-m.de>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 17 Aug 2020 11:38:42 +0800
Message-ID: <CAJsYDV+nZQ2rj7ndJ0X=NHctLZ+RJ_54nfZRWjHXvPipBLGX0w@mail.gmail.com>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F4GQ4xC
To: Hauke Mehrtens <hauke@hauke-m.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200816_233857_489525_51DB3F30 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, wigyori@uid0.hu,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Sun, Aug 16, 2020 at 9:36 PM Hauke Mehrtens <hauke@hauke-m.de> wrote:
> [...]
>
> Tbe GigaDevice SPI NAND chips have a QE bit and it has to be set to make
> the quad operations work accordingly to the datasheets.

You are right. I copied code from winbond.c back then. I don't have any
qspi capable boards to test it and didn't notice this QE bit and the incorrect
QUADIO instruction you mentioned below. Sorry for that :(

> Does the flag SPINAND_HAS_QE_BIT mean that the QE bit has to be set to
> activate quad operations and when we do not have this flag set it means
> quad works also without activating it?

No.

>
> Does Linux assume that all SPI NAND flash chips support quad mode well?

Quad mode support is indicated in SPINAND_OP_VARIANTS. spi nand core
will match controller capability against defined supported instructions, and
use the first one supported by both chip and controller.

>
> Even when I add SPINAND_HAS_QE_BIT, quad mode is still not working for
> me with this chip.
>
> SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP looks wrong to me, currently it
> looks like this:
> SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
> but it should be like this:
> SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
> The operation only has 1 dummy byte and not 2.
> I can send a patch for this, if you think it is correct.

Please do so.
I've just checked datasheets of GD5FxGQ4xA/E currently supported and
they all use only one dummy byte in quadio op.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
