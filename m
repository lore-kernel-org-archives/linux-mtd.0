Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DA6C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 07:59:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E0F222C9
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 07:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c1wjnVUZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dxpX0/PK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84E0F222C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5+MVG7+J2zbIw/G8HBhDEmM2ZH0OiRtAUzr47pDOBzs=; b=c1wjnVUZr/bijh2o4wl4wUXOXk
	3KzgmZJT0SgcTVNsokis51C6RH52qnYo49dgeAo/SCO5XGoJvFCOYiJB0TNZCHjIAcZK1CIoXZ7Zz
	RbEidRH16Tganfjrq5UOz/1qaxm37pppqgoMOIyW6hI4JPVOPfGGYC2Fc7p4FvZYmccZyCR0lk9Qg
	9xlURUvABX+4XAEDeLE8uvn+uXl8kuHke1NuDmNC/qo6mgziHUvs0i8/13pRwA5dkAeTjZBBTOH0K
	yyUC51klLV+GXMQwTh57gepTwRWmYBRoWPqBgfRDRtMSduJYaSP1aSSJlFVBS2yMkCKHyeD5UYY4T
	InGxIlLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtpSA-0005nC-0j; Wed, 13 Feb 2019 07:59:34 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtpS7-0005m4-Dr
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 07:59:33 +0000
Received: by mail-lf1-x144.google.com with SMTP id q11so1051987lfd.3
 for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2019 23:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=LqTLba8KUnjF7iQRn1S7JZwMM9XurhBu+3uPYsrrOV4=;
 b=dxpX0/PKOldgG8QuRNQ3qXNNV1lfAM+kPv/8zPmc6IhAfTbD5ZVFG7m2x5o/tRSyfV
 tftdBOUh0PRw9JnN1Uop15RWx/27f4n6MvalLk2MDE50/ipVGHNhgv1ZBszing8QJQJk
 yYQMhC+USVORRJZwjLh1PcFoD8Y0fWxYFQRPTIDN3JB0Rj6qYoSL9siFNOW8tkhPBBT/
 7vBqw+MVUQnZb2qRoPHwX8Tnhbye6HZeNEntZ26qCVNQMQ2Rgzw17BpTEkZqwqbH5krR
 6xaeWQOanmcXtTjjoQV+XVDaIqxRlevUaDumSalY9/C4qpLB3u4edeWuXYyLTAu9AqOf
 2Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=LqTLba8KUnjF7iQRn1S7JZwMM9XurhBu+3uPYsrrOV4=;
 b=JyxohH/HW3h4LOGrwYRRxMwfMhUzHvTL/f8VkouUE1EtWyLFiS8SB+emfCPxfA2iTV
 7pOSE7EzJfIeI37+BdR80fT+xUHoqUlL6VS9vVk5VLtj1PMmtIDJyQOHLdhle8NjvUZ6
 fJaqALwpR6Saw7Ra0n5lzETP8Ez9AYv7YOslhbP5akFWsCrCtJX+0/dQe6v8BpqlS19Z
 D0j/Lg4vIn4hqDEQ19hzVgBZo+QxehPmCOA1GHUJl888C961wBaNnDQ0eR4sGElUcusp
 lPiSgdKrDDWQDa3K+IMxqH2uab8QyQJuR6nLYdpO8h8Pa9iMpCwvT4hEHdyEq6pgPg+Q
 26wA==
X-Gm-Message-State: AHQUAubiN0SJMwWFwz+t3zfyRJdXLF3bL4O20Sy2o+EbiUCHPQSUu2Eu
 r/vg2HhqAweQVHwlr7DuModPRsYRO32WcGtqkdgo2g==
X-Google-Smtp-Source: AHgI3Ib/mLIuMGWz1E7PPGkLbahECbn5WA+BaL7nONlY/sC4luK5RrsSuxHwhKWmnfIU4xBuEvLLu61VsSs9pvIMw/Q=
X-Received: by 2002:a19:ec0c:: with SMTP id b12mr5144368lfa.27.1550044765507; 
 Tue, 12 Feb 2019 23:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20190123122910.19024-1-linus.walleij@linaro.org>
In-Reply-To: <20190123122910.19024-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Feb 2019 08:59:13 +0100
Message-ID: <CACRpkdY5andeJnYJdNhTfQTbwjxBbXceBnOyBk7HWdgzqN73xw@mail.gmail.com>
Subject: Re: [PATCH 0/3] AFS move and OF support
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_235931_477662_3F8D2A80 
X-CRM114-Status: GOOD (  16.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

On Wed, Jan 23, 2019 at 1:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> As a starting point to fixing up the AFS support on ARM
> reference designs, let's move the implementation down to
> the "parsers" subdirectory and add OF probing support.
>
> More refactorings will be done on top of this change.
>
> Linus Walleij (3):
>   mtd: afs: Move AFS partition parser to parsers subdir
>   mtd: partitions: Add AFS partitions DT bindings
>   mtd: partitions: Add OF support to AFS partitions

Can we merge this for v5.1?

If what you're waiting for is DT binding review I am pretty
sure they are uncontroversial and will not happen at all since
noone responded for three weeks on that list.

The follow-up AFSv2 series would be nice to get in as well
so I can patch up the device trees to finally have all
DT platforms detect the software binaries on the flash.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
