Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F6DC48BD4
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 10:14:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389B420644
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 10:14:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uv4KQ8sk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eM2wZsHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389B420644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijJtsVJzwEC33/utqDTwdj1rK7CjjRvayO8RuV9CoNs=; b=Uv4KQ8skE2GZ7b
	jCec59D0lU0nysbNprIntkCNyi0at5uwP01jBnhkyWwzyFTYIUuxAI49l1llWZKEiGiCMdw+F8ed0
	9ijKpZ/ss/QfhbQZuZuuKmnKIQX3kyEnT9YDNl8hI3UfgbUxuCwXIvjAThRBmecmgdpqrdYzstO0D
	u0JTCnuRiyf9FoFvehyrnxXjkse9s+4NZyJ+f0Yc795rVPkgAzDU2f8ydfHHGtVIQFbAsiAhx1aa3
	O2ekbPiVdXRTStKIE1e1tRdeiYoWVVXeQ7PLfQK3Ox9hbkps8a6fOy3Z3Fl7NWeL4skokn6YIMYMj
	NK/gk/7oH5nI3faVJM3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfiTS-0006ZP-TZ; Tue, 25 Jun 2019 10:14:51 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfiTG-0006Oy-16
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2019 10:14:39 +0000
Received: by mail-io1-xd32.google.com with SMTP id r185so1744247iod.6
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2019 03:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ggJjXdOxK1rbCFPYvSciSwdbzWNH4PgUBu0D68yV2yw=;
 b=eM2wZsHr3sIG45PIWUbXmgqiL647Mqh7bUr+PTST2pwR0oN8hcJMKLIo8QE13jN6G8
 dw8p5Cnzny5BylRXMW4j+9YwLCF6WnXUZA1WB5Zb/BV7l4BJ8oHdkmOseTSm4/er4KPd
 t4nR1IxQ4gTWmZ6jO+aKaZkXWy40aX819f9k87A8gYT0odcUvvCvwVef+Q/myMgsaWlo
 +sVNKvzDL+ujk0MdQUZnWTb2BMezCkQCcanShajGgsp3nPHkk90FQ3fqtDhOjQR8qs1D
 aGTTVFpOke5/YLAVNEe9f5wMTWCXNkufFSL1c+8KtR3PW46RyPwsQhfTOIdsLvjoRvv8
 YXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ggJjXdOxK1rbCFPYvSciSwdbzWNH4PgUBu0D68yV2yw=;
 b=niPHUPSvRNKHoidk/02res8CkcgNLqwItr4Z6angW/ZCszi6XWD76ELNBceG0fVVxr
 ljCbQMY7LvrbRIqmjQMqHEfKuhpbxGsd62IVBaX9IhKw5RCpWF6BjxJSNDjy4NRF3lof
 cblW12MNwnyZJhRS73Fx0GS8RnTTH43P/RB0jkIiUFWvgW+x44qrrhvjNS5CgjeJr0VX
 pqvs7U7f1Anqt9xm7f6jXW0Z2GlXxkm0itQ6nrDMUwYlGt4eOXEo1lgsnkWA4pHQfJzI
 TlN4edulu2/oikwPvIINVlmfcWYw1Sa/xfjZyRBZLiarQ+mnq91K+P8tRTa0h0xNJec5
 J9bg==
X-Gm-Message-State: APjAAAXmyl3AjxSVwy8sBbsai+YiF+a7l+ZXQSd635m4lB/P44qpzaaY
 Hp2I/vm9FZsLegxDttD1Bm+DIOCX2nSKmqd10xY=
X-Google-Smtp-Source: APXvYqwwbkaL2Czw6nbqIGo847SWZqsfdHOUZ/5TQI4ivLM9rxmg0XBKa+jfwDqICLmdDXRRZPUSDDiwlVXHN5Uw398=
X-Received: by 2002:a6b:3b03:: with SMTP id i3mr45165268ioa.302.1561457676832; 
 Tue, 25 Jun 2019 03:14:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:8a3d:0:0:0:0:0 with HTTP; Tue, 25 Jun 2019 03:14:36
 -0700 (PDT)
In-Reply-To: <CAFLxGvwY2PU5Gj9mvaWT4koF_UFvqncNq+ZYQkxrTmXMUqtieA@mail.gmail.com>
References: <CAA=hcWQdnUZ22XApaiDKdJ1zS3MOMNW5xrOsVKDkGmk496hQXA@mail.gmail.com>
 <CAFLxGvwY2PU5Gj9mvaWT4koF_UFvqncNq+ZYQkxrTmXMUqtieA@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 25 Jun 2019 20:14:36 +1000
Message-ID: <CAA=hcWTdR=gV96dA19VhkThuaaOX9nBHjiEiQyBa8RNKzbZACA@mail.gmail.com>
Subject: Re: How to test NAND bad blocks management?
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_031438_193664_355DD979 
X-CRM114-Status: GOOD (  13.83  )
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

Thanks Richard,

On 6/25/19, Richard Weinberger <richard.weinberger@gmail.com> wrote:
> On Mon, Jun 24, 2019 at 10:00 PM JH <jupiter.hce@gmail.com> wrote:
>>
>> Hi,
>>
>> I learned from the list that the kernel is capable of handling NAND
>> bad blocks to use the mtd-utils "nandwrite" which I believe has
>> already included in kernel, is there any test problem to test the NAND
>> bad blocks management? What will be the symptoms when hitting the bad
>> blocks, segmentation, kernel error ...?
>
> If you try to operate on a known bad block, MTD will return -EIO.
> Linux maintains a bad block table, it contains factory marked bad block
> and block which got marked as bad during runtime.
> If UBI finds a block which does not behave good, e.g. shows bitflips after
> erasure, it will mark it as bad.
>
> What exactly do you want to test?

Well, it is an IoT device installed in remote sites, I've never used
NAND before, have no idea what will be the consequence when hitting
the bad blocks. Reliability is the major requirement for the device,
how can I know if kernel bad blocks management is functional or not?

> You can set a bad block marker by hand, or enable UBI's bitflip emulation
> via debugfs.

Thank you.

- j

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
