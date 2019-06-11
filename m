Return-Path: <SRS0=yQQQ=UK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F727C31E44
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 23:01:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3980D20872
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 23:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GIdinT+4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcWd0gWy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3980D20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krrI+C70UYADUxqe0SJEIwOfi6f9RPU/oPLz2CG6te4=; b=GIdinT+42XeErC
	Zo1o9Ejw3KSB4FewxpNP46uimiiKJiAbvawrP5kkGC6c/Do9mkjNHFOnQkc8OnP+UC0T2lGCOuT6Z
	NOZrgLJJqJEMp+zoht/9Tg6Crf6N/wJ9N0jgE3I3eWrHebh09C6tC8mZMny4Ew5AATUg7ZJt3J8tN
	BUGHXqz0p6VwEjg8Q8rXV9nH0LTcyKd2U6HtRIHFda11Ng7ujsJeanT58Ukgrdd8YMDZdm4TCBkS5
	ZaDbUrkvQiiE5XX9gTVdtmIZOMJHlvvzdNNLpHnzgqmJLJkhOuLxLxfEYODxUgGiDYBJ+aR+qnrQy
	Cfzne3tzI+JVrjhOiXoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hapm6-0006u0-0y; Tue, 11 Jun 2019 23:01:54 +0000
Received: from mail-it1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hapm3-0006tR-8J
 for linux-mtd@lists.infradead.org; Tue, 11 Jun 2019 23:01:52 +0000
Received: by mail-it1-x12e.google.com with SMTP id j194so7809500ite.0
 for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2019 16:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=36huIhPT6WuREwQG2bbZ4puE81KayggxvbCshnctrh4=;
 b=kcWd0gWy7F2co/OOBy03N+22o/8Y2R/WO6nkeSTq1Ie/KXnnI0RlCMVmnPaXVLDwxP
 RLvo0EER2tnFKlWH6DGIS7MTNAmOLnn1dMWE0Ow4LFiHE9g5GhoTmM+utSDH5SrtlJrc
 u3VAzAsv+Orc0tJnzGlAMuF6c7JaFLFDt2DCdYfBD1pLxtepy8WfVCpQpKplE5/0Bx/X
 HGgiblGat/kY1x+Dnx8HirF7pzS+Qlmk1zCHwCIbXHGDD/0y+XzA8aC34IGo8gx4eaHA
 QvN2deRBFDfrd/exNg9tilq947Me/Nj68lKq4cC/y6lIyaZaGwoAriJUJkNNt5e+Ur2B
 yszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=36huIhPT6WuREwQG2bbZ4puE81KayggxvbCshnctrh4=;
 b=rGv7Qx3w773658cyDzJJ/+EcvcBfq4aRCe3nCNNvry2CVs5BHgE0uXeIRsFkSATbxq
 0sTEDMUdBajC71j9LuF5R4AEAoEgUD3GxPexlejSMYcyvtXsyVa+h+dWeXlDJdidEk3g
 HhE9NAy+UqBiFj/MnprPWEJK5uvPMzix3nk3a5o5mSur4DUe+btgCR1uAM3LCfNycKLB
 xMuQ0TBRtWp6RNyp9XuYB8Uvqe1kOTDhNng0vWpqv5KLzBkyKCKapXXewK2/qVZThWx5
 K7wEcrGoR67huce3ykwgCOQg1t1xSR4NLuIv1SjL9HMrxinlPBaNyTWBmIgdP0chs7Zl
 G3xQ==
X-Gm-Message-State: APjAAAUPeDKlKL6lznBLuVaBjuowLTbMq+A+/F4MQG/43BKaC+RgaT7Q
 9lex19/EXQrclavCmd/cvcodhQvTCbX1ijUxcD0=
X-Google-Smtp-Source: APXvYqxto0ykdZguKBCdV5fkPHroK7vP1GbP01UiW3pU+evZYFIbt/ouEWSsUQUl+GjEv0gOg/xEtzs2YOQer/J2HTg=
X-Received: by 2002:a24:b009:: with SMTP id d9mr2786224itf.168.1560294109991; 
 Tue, 11 Jun 2019 16:01:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:92cf:0:0:0:0:0 with HTTP; Tue, 11 Jun 2019 16:01:49
 -0700 (PDT)
In-Reply-To: <CAFLxGvzAHGVA9Pe0rvJWqjUgaPZKyExvV1gu3pZAezhNGDXryg@mail.gmail.com>
References: <CAA=hcWSKQ4+BsQ9XPEhP+f=-oTA7CnbJ6=4upRZughg8mOUSUw@mail.gmail.com>
 <CAFLxGvzAHGVA9Pe0rvJWqjUgaPZKyExvV1gu3pZAezhNGDXryg@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Wed, 12 Jun 2019 09:01:49 +1000
Message-ID: <CAA=hcWRTPsk=zX=bnV6xAt-EpnyXy+dZdYGuLk8M-0UAjWHM1g@mail.gmail.com>
Subject: Re: NAND user space program
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_160151_322917_42598481 
X-CRM114-Status: GOOD (  10.20  )
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

Thanks Richard, can the Linux zImage or rootfs load to NAND directly
via JTAG or serial line?

Thank you.

Kind regards,

- JH

On 6/11/19, Richard Weinberger <richard.weinberger@gmail.com> wrote:
> On Tue, Jun 11, 2019 at 12:20 PM JH <jupiter.hce@gmail.com> wrote:
>>
>> Hi,
>>
>> In NOR flash, access flash in user space is integrated to the Linux
>> system read / write, is it the same story for NAND flash? I installed
>> mtd-utils, but not sure if I can still use Linux system read / write
>> to access NAND flash or not.
>
> Well, Linux exposes both NOR and NAND flashes as MTD.
> So there shouldn't be much difference.
> But make sure you can deal with specialties of NAND, such as
> bad blocks.
>
>
> --
> Thanks,
> //richard
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
