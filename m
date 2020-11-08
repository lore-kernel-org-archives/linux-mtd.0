Return-Path: <SRS0=+6Wf=EO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E157CC388F9
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 14:35:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD29206F4
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 14:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sj8GTC3f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cc6D2+ML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AD29206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ohtyDv9jT/P7wgkwIqMce9+Jw3/auuL4F2gTsrCGg4M=; b=Sj8GTC3fFO2AUwBqNzW30B4y0
	5WQOzp5j7rOICPHnSFqgvtqLwBVnVBK/ICZsIH4isw/yD0t7G9xErrhUHnq5jrhq2j1BSPkzwsYyi
	TTBNfDyL0LktsTH7QZMStsezGOskZsLT16dd7NwhpsEPNnfDio4aWf2G9lRDvKwszNvvwaMFl1ToO
	8Vw8KRX7qbpCB5S30zZ0RkXpIg4CsWr/8mI1VYE1uv3rBIvYgoA7M20Dd3uEevqi5HwUwA9WXs7DA
	zdrTt1NK0JH45RsIsR02wjNc1ndJMKDYBnIMFnOMIa/Z5sNmByrlLyyM+tvd6Yod2SVGev/PgjdBK
	zLF0Xgdxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kblmS-0002yw-V1; Sun, 08 Nov 2020 14:34:57 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kblmQ-0002yc-Bt
 for linux-mtd@lists.infradead.org; Sun, 08 Nov 2020 14:34:55 +0000
Received: by mail-il1-x12d.google.com with SMTP id z2so5944292ilh.11
 for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2020 06:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I/hajfbDBhWPyuSG1FXJgfVpGK2JD2d1UCKyN7jvqEo=;
 b=Cc6D2+MLiS6otK/8DhbQ5uA8yerdIrTcKvRZlBWpTFeCTmB8anU80yCHpLn/3g7LBz
 LqN3NY005zC/+2d84B9DDeP6In5T/5VKiN6O+a1t8IVpfLo7Dn+OGr9J5RQrEnKZTHEZ
 1l32wU7bHfjLZUGEbnk0GkajfUEO0sF3vsbmupsuYp2wzLoOA2VziyDmNRGY8qO/eca2
 gZmkuViKm6sqJk+788R0qsruqaqEH2+EpLHT5vNyZYVLdlMG/Px2mzj76/FBdB5xBs1u
 pV5R67hze39Nis7YDiadNdz1sZZCDKMX/LbuQ5muMz2P3wpcJRjyUyVlEN51tGyfBEtC
 8tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I/hajfbDBhWPyuSG1FXJgfVpGK2JD2d1UCKyN7jvqEo=;
 b=UwHhZqUFWX/9fxswZZePJt5KHHaKoSoYIEJbFT9YPVohwopDU0x74BsqWTh6aR2ec3
 Hi9NxBCYMTcFk4nlowZc0p5C2qQs6wS7xkMft2O7645Eab/xFWE3mgDUqJJK938rnQ6T
 CppfHVqgZepQtNgy1q5WAltvnjl5SPeIuoZ0Q0EMKHU9uIqELzz/DwThqSDljaTPOpx8
 XQae2z3OEJcGAYCixtsWCU86jikpsHMjZZ2qCxZz5hKRG1jV6jqv1CGr4k/Fsgq4owm4
 qlF5bjVOVxJC0edyfYQmBJkJrVw59+rWntgDwNxLg+GKAYGXyjEteeImjMpQbBNFWBhF
 TgqQ==
X-Gm-Message-State: AOAM531LA67E2B52pRXtN4MxYWtWTSx/HssR28mXWMrX6HaH01kFztEL
 P/ihCvOl41OonjJsVLbC49kwkRg1prF2FLGeX2I=
X-Google-Smtp-Source: ABdhPJxNragDyPzG/mk4YRldhZPoqb9pGN1pWZ9aosLAt+Zc2b82MBp/DCm+c7AwtqPtUuXXPkYxyzdlO6L7/PiK1Xs=
X-Received: by 2002:a05:6e02:149:: with SMTP id
 j9mr3652283ilr.276.1604846092246; 
 Sun, 08 Nov 2020 06:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20201016132047.3068029-1-hch@lst.de>
In-Reply-To: <20201016132047.3068029-1-hch@lst.de>
From: =?UTF-8?B?5buW5aiB6ZuE?= <gmpy.liaowx@gmail.com>
Date: Sun, 8 Nov 2020 22:34:41 +0800
Message-ID: <CAL3PxMqzgza_GSBVVTuzh1u1EH=h=Zce4VF-xftY9f30ANnGSQ@mail.gmail.com>
Subject: Re: simplify pstore-blk
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_093454_455089_98DD2C25 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 Anton Vorontsov <anton@enomsg.org>, linux-kernel@vger.kernel.org,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>, linux-mtd@lists.infradead.org,
 Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

hi Christoph,

On Fri, Oct 16, 2020 at 9:27 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> this series cleans up and massively simplifies the pstore-blk code,
> please take a look.

Thanks for your code. I am going to redesign pstore/blk referred to
your idea.

I want to split pstore/blk into two parts, pstore/dev and pstore/blk.
pstore/dev is a common layer that handles all configurations
for users. All devices including block devices, ram devices and
mtd devices register to pstore/dev with operations and some flags.

Besides that, we can delete the codes for the block device to
register a panic_wirte() interface since there is no block device
needed. But it should be easy to implement registering if necessary.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
