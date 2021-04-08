Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B263DC433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 11:01:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C73608FE
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 11:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C73608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D0yfxm/f7AY/kRDflaHZ+IE6ETRuEGjlJ+mXYQRltI4=; b=QUJV/kG66VMpmgeh/ID2S0/dN
	jCtBVEh7Pk7DpIkeAyqg/VzwlBA2YpOSopBYa0yw9FgkM9V254aE0CuVLBDan7BTm4A2lfkfeqEqk
	NTthJn8b0zi30SEp1LMeDiQ5G2jyvXWZwzg16dzM4gYC34eMAp6d5jk2act9oQ1EgseJEq8m6Wyb2
	l73BCV8I1fWrjf8mpT/TQRi5+L1JoN+9fc/QEWlxZfCq80iQrv2oBYytXHPU42DzDLLQof47e2H0T
	ygL7gClUIfmB6dIGECb8eT+qHSxCjNhmgqUIr6oxbqpVIBLSUqeI4c1r8PooSKZm3SGFtXo8A7kCH
	NA4xbgP2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUSOs-007jD2-1K; Thu, 08 Apr 2021 11:00:39 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUSOU-007j6O-V7
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 11:00:16 +0000
Received: by mail-qk1-x732.google.com with SMTP id v70so1658543qkb.8
 for <linux-mtd@lists.infradead.org>; Thu, 08 Apr 2021 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p+TrzxkT4/pA7rMQQxNc7F6VDz/UlBkQcXIzCh88OTA=;
 b=D3UR9940CV9rltT6/fFsIjXanARdK/eK85Xf8Au4dYngOeXc7iHwoqKr5YlY92TDdi
 CmXxtFy95BqX1L1vdxjzhirGsSEIGHdcUg9yZmO/P5ndhRKF8zaIWNNzrfN47WbplYxL
 QRWEG1Vgi7SjMC/TjOtT4DxcUq6mOfjvggdxqHnFZUMDIgex08jvXKif3futWNAznzUg
 XH1XFsOmWn5tfKwiAl+JXxSYrT4WBiUR8EvQNd3QK8sjHoXWvV6YKchOHpeltywcqJf2
 THIfUK5haKrl9jHE8k0VZ7/j3GeMF7/kTj2ePOmNO+HxZnQAf/MXUjinJrzUF4U4kTkH
 dGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p+TrzxkT4/pA7rMQQxNc7F6VDz/UlBkQcXIzCh88OTA=;
 b=VVozdIWex8XSX8Q/+5YoXsjNJRMaoauVD+0VEYbEVnEwBfRWHyYs88cAghCokdEQFn
 0ITz+Ci1xabRFBut4ZafRVk23AeiCHuhAFIklXdNlCH+EUY6cWkGiopDWkJFJUhx6ODh
 zYIWTY2BbVXd3zVCDMr++ZdB40z8Y9lVi9Uwb7jf744gYk/nfdjfx6dnwF5ZOZIDogJn
 XI+jXgU2rJpz2t3vkF+tYHQbQbRQaBNGz6i2+zcJ7SYyRct/1hi/SgX3NGKWxhULQ5Xk
 YfT37PiDZqI0Mx1sTvAhw/Wmnvl54PAMgKffHhNix9W/t46yR+cjykdZfzbx4qEtOl3N
 jvvg==
X-Gm-Message-State: AOAM5316WoBjN4Y72SDsUisOg3dtEuw4jDG1sDS+rhNjELW6tOsd9nH9
 xxVXjT9HMLkxSHDbgi9yOzA4XrKDyOIfL+Qm6Jw=
X-Google-Smtp-Source: ABdhPJwyvhz/YUOWJ7RzFYYV0oYX078qwfM/1ORcl08CB6mnDlEx7PbfhbtOQV3ArrOjadzM5yjVGggRhcCCEvPyx/8=
X-Received: by 2002:a37:b947:: with SMTP id j68mr1922844qkf.108.1617879613854; 
 Thu, 08 Apr 2021 04:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210405152935.148129-1-rsalvaterra@gmail.com>
In-Reply-To: <20210405152935.148129-1-rsalvaterra@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 8 Apr 2021 13:00:02 +0200
Message-ID: <CAFLxGvwhtRY-6kT-sN=AgjvyssHb5qdTS6WQHkhKu3YrPuTkdw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: default to zstd compression
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_120015_224452_7ED6FF5E 
X-CRM114-Status: GOOD (  10.55  )
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

On Mon, Apr 5, 2021 at 5:36 PM Rui Salvaterra <rsalvaterra@gmail.com> wrote:
>
> Compared to lzo and zlib, zstd is the best all-around performer, both in terms
> of speed and compression ratio. Set it as the default, if available.

I was about to NACK this patch but by looking at the diff I realized
that you change
the default compressor only for the default filesystem as created by
UBIFS itself.
Queued for the merge window. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
