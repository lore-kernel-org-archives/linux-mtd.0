Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DA1C76190
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 21:02:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5573A218D4
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 21:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r9RAPkOs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nN1nf9Kh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5573A218D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0Rriuf6U7mzApsrhjHnwgjGRBGuECu/QGL6v5/DpPU=; b=r9RAPkOsY7pEU3
	50CMIuFgMnByHUTaiCDnl+SFVb4vchvg+hMrJhMGkK8UXVWIFJcpsE1pPcF5FpVIBZnREOqWgHWm7
	IvFXyi4rzP8JqTsgSzxJkfH9QjuQqy9wuz0Wh9n52fFkpZDzD2tBsGmsqz0NB3JADHGNi2ragXRX0
	tThSlplLSXpm1mwTfT10hH54M/rss714iTvtSrO/vaMrxUdWIP72EraufvZshXl1+zlA+3emgKF4/
	wVaC2b+zwLoIU6WFnEr5kZZT1efWUhYj/EjbQlrzmuor3IiYAumpeWHo6PsmlP7jgQeuWtq4+wuy+
	yMEvLd4ixRZpt9kueodA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqksl-000063-Fj; Thu, 25 Jul 2019 21:02:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqksj-00005k-69
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 21:02:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id v19so45926715wmj.5
 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2019 14:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VH2j9UqcG5THXeXlXzpZe34OtN+FEZ2Jpu3FKAObkLs=;
 b=nN1nf9Kh+HfsV2BmEEpCuS5zCB1I8sJ5uBJ0qhLPFfaYIpHD3xtV7QFvgJVEbvgw9O
 cfNwRbTm9+ZxPxGMRMEcyKf2dmtOXZkvVe2TIqDttI7ta/s04ebXOXtiliM28AlmlbI6
 em+MICQ/K52T9IC90c7TdRLhfza+uShVg6zcYRoMxqka79IdWdXxmsBE7PbmSCkyRyEO
 Yx6q861tYkFi+7yJ31Qby0+teNLubPXL2JasF4sNCbNlA0y66AUm8NCVfQCTnql0J3UP
 FMSfKBkfsWTH5JiI41KBxTgJh1DlW1+VRrgYwYHrwm3GdBZ7WOhswj/vza+uZAfOcMcu
 O+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VH2j9UqcG5THXeXlXzpZe34OtN+FEZ2Jpu3FKAObkLs=;
 b=qGMQbfKgDNQhwmT9jtewtKzkJw2AQOCP2mHnIuny3rgI6etFkOHMYwtCZfWWnuEzSb
 l326M2rksX4jCX6CsO+vCsD6nvtx5AO1vGyALC/b4KNJYWoLJfktgXwu10eZ2tCoaLgo
 IcJy10sL80nFCioAnZIM5PLcFs0cwT9P1x+K+4+FjB7Ur3avyhNaxLd7+B3VafT9qKKl
 Zl+PA45KI1mwtaKOQjfnDhSySShc0xhov7RE9dl/B055Dng95W3g5W11EI6832S38gSF
 LcCrpsh+jhChXogKheq591b9PuYcrSj3niDW4J1B6P3zYNafCiStTwUWlKItf/TReGz+
 Esdw==
X-Gm-Message-State: APjAAAX2mLPAxdtuzM1c2Y6OjR3B2x000FPfoHfk9r9sTkoxRVmJwjqI
 7sGrb7v+NZEItS04sfJSxiGzZqdo0e1jrPA6j0gEAQ==
X-Google-Smtp-Source: APXvYqx+mjFATu2/gVX8Zxp8iZfPhTgkl+0ZNNGdEyLK4/K1Wc1kNvrJEaDvAnr0bAvcoIOaPTTCmIZ7noePnn40tpE=
X-Received: by 2002:a1c:2e09:: with SMTP id u9mr81929407wmu.137.1564088551075; 
 Thu, 25 Jul 2019 14:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <1c8ba7bc90fa4695be180e106309819d@eckelmann.de>
In-Reply-To: <1c8ba7bc90fa4695be180e106309819d@eckelmann.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 25 Jul 2019 23:02:19 +0200
Message-ID: <CAFLxGvwWf2Ok=C7VAJFfB5ths3TV+X+ah8WotOC0gCCxW1H5Ow@mail.gmail.com>
Subject: Re: Does a chattr -c/+c on ubifs automagically compress/uncompress
 all blocks of an inode ?
To: "Mainz, Roland" <R.Mainz@eckelmann.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_140233_233977_E9EAE482 
X-CRM114-Status: UNSURE (   6.09  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 25, 2019 at 6:18 PM Mainz, Roland <R.Mainz@eckelmann.de> wrote:
> Does a chattr -c/+c automagically compress/uncompress all blocks of an inode in ubifs, or will the change only affect newly written or updated blocks ?

Nope, only new writes are affected. No re-compression.
AFAIK this is also what other filesystems do.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
