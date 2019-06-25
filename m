Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC347C48BD5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 08:37:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C15EF20659
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 08:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OlXLT5qT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkBxmbHy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C15EF20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksl7VgCXlVEKGsrJ039O1Iua+WwGxt8BShp5mkj0V9M=; b=OlXLT5qTuEYZD0
	YqNGsfbUaytobg16HTfLL7BcrHedpxgnUpETljgLSl9zPpg1+lH0qCeslvKvxGS19o8xpPmBKjOaj
	YjtTftu/4hGEvi9kGkCM145rKxAAR6elRqGNlQu6YwrhYPYKzDZdbguEOIgh9nRluP6WPCXMb3pm0
	f05B/Mhw0QNOjOkJupQACmtblyfogoXPye2CycT8jpdf1K5TM2TuG4yzfugaF4CHgZdm6xv5tYCpz
	7H0WZbzCf+Np182ma59uwmdJigxAEmrh4GFb96CvTlVc4P5Lr5PzF07liZwvW0X4CE11fxZTIXuAq
	ohgpHjflx+r/+0mTb7vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfgwl-00088Q-Mp; Tue, 25 Jun 2019 08:36:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfgwi-00087p-OK
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2019 08:36:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id c66so1905372wmf.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2019 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kTJ8F48NT1YnAWhKl5uH0IrTHlJGpWWgyHea0b4llJI=;
 b=TkBxmbHyZh9MW/LCVtOcb64pwqTsmehKqtkj6n1gTX9sinNfC4lRIldkfOF+F/pt//
 RZFmAIWER6WPms/yi1NitR8DdiNMkf/CQa9efq286ZsdfzKaPAgzP6b9mLoJR5laXeFo
 Kizcw6ixfr/dVPVLjpfOBKrMzrN0UCcePOt+VKM1UeD9awlWRtp/2O/q51mqaXDFnwy2
 GU5eR1r6dzcqyboA0s1QJHMPSXQNNjr8QXH8uMXvf5QV17GEIaXU8IfWFt82SDaFtmTz
 xwTy8zJIraJ+BMtJyS7ZWE9zSCpgkzW1HTba+Oe0t8DzjBgJuT8U2txU3HLD1Hp0drxr
 q9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kTJ8F48NT1YnAWhKl5uH0IrTHlJGpWWgyHea0b4llJI=;
 b=OHpIrkwYj2FYHCF/1WI2U1oYsXfW7ELHtntaT/z6i1aZ5Nq6cUW6+WyQITkCp8yDsE
 hYaYGIR9xJfhhc3YBcdwLM9CxYs/A7nprphHAURTR19XWHgrBQPFoBfMK6gY/lzDIlGW
 KBWzu9z4KzWFDfXq1xzKMUysF8kph9fJIsdA7kCvnNZRkDaNzj0F0Dj+TiTX5TU6d/0K
 pltq1RhAaP8XKo7ihkzXS75+Bdu71Wnnx3JpBmhPmhX2mmtd+ZS2ut1H4R9N0Q9FLW0e
 bq85dK5WvJ1plGgjx9gMqWXtQKGgjvClq1ekdITyDJwIDzNdksX92Ey1Eea2tUijbVhY
 UgkQ==
X-Gm-Message-State: APjAAAVM+BKQGJdZquTSqpaFwwQaQnbNqD4cZPNfaveIkS8qT6Uokvju
 1rH2l0h7hShvbE44tDOBphzALM3r4Zxoqw67SjZSZw==
X-Google-Smtp-Source: APXvYqzphEKlzggpnQvJUl7gXRp2ZaVsxF5xLrx3nsRKKXg3UEMCqlAhUrgFg9wTkpmFal1bBc6E5Zp18JxBqVkp8c0=
X-Received: by 2002:a05:600c:2182:: with SMTP id
 e2mr18787474wme.104.1561451814713; 
 Tue, 25 Jun 2019 01:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWQdnUZ22XApaiDKdJ1zS3MOMNW5xrOsVKDkGmk496hQXA@mail.gmail.com>
In-Reply-To: <CAA=hcWQdnUZ22XApaiDKdJ1zS3MOMNW5xrOsVKDkGmk496hQXA@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 25 Jun 2019 10:36:43 +0200
Message-ID: <CAFLxGvwY2PU5Gj9mvaWT4koF_UFvqncNq+ZYQkxrTmXMUqtieA@mail.gmail.com>
Subject: Re: How to test NAND bad blocks management?
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_013656_815110_69036F7E 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jun 24, 2019 at 10:00 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> I learned from the list that the kernel is capable of handling NAND
> bad blocks to use the mtd-utils "nandwrite" which I believe has
> already included in kernel, is there any test problem to test the NAND
> bad blocks management? What will be the symptoms when hitting the bad
> blocks, segmentation, kernel error ...?

If you try to operate on a known bad block, MTD will return -EIO.
Linux maintains a bad block table, it contains factory marked bad block
and block which got marked as bad during runtime.
If UBI finds a block which does not behave good, e.g. shows bitflips after
erasure, it will mark it as bad.

What exactly do you want to test?
You can set a bad block marker by hand, or enable UBI's bitflip emulation
via debugfs.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
