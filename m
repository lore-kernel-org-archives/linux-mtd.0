Return-Path: <SRS0=Yojm=UM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3C6C31E45
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2019 10:42:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CF47208CA
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2019 10:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fGGJOLyP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u7EroPQk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CF47208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JlPENM7wd/NGdYyWvPGlyB31FPFkb5VZHDpD/6USYA=; b=fGGJOLyPTd88M+
	D6QjgOeHy5BpOdlQ2kyjv3jyAHO8EHxPQ45GAHB3YD0yHifjJNtfsAvYD6rK0AMlTtPvVB/Jq+D/v
	gofvefEE6r/hf9pqSJ4zfSLAL6u0MFdMtUfK/XJbRYLCfa5QgMfvG9wziTADZQEhlYTBRR3kgWtxa
	4UemoDZ0AatlDIP+a8Y9VqsEx+h99+It2gr9NJ9hT9DnCuShdIaAX+fsCD8pZ9RhzohjOZagkvyfv
	CjpexYL+Lgr7KzK75Xh7I5fkyrl6UHU/b1nQ1ErTaJxm+L+Chiu5b8Rr3DyaHdN+gzZsyegoS7P3m
	998wY7Az7FlluSn9mzZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbNBG-0004Wn-OJ; Thu, 13 Jun 2019 10:42:06 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbNBB-0004W6-6x
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2019 10:42:03 +0000
Received: by mail-io1-xd41.google.com with SMTP id n5so15740597ioc.7
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2019 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zSuItO13sVdQTxFatCV5/c6atUnwHhpHtFgwIcmMGT4=;
 b=u7EroPQk4mcgojtbvui2HNF21mtK5Iv/g+8TzmvjEEspRgtHQlM3y1DsuQpP28NVhD
 hHhuNH72TCXlBpdyJ7gPCvyl1VdBDrVX3ycPFYY+IHaIp36geO2OXVXDtn1jXPTWO/+m
 OPrfs4tkubBmpzP9cBw5jNUNzOrHN96Ukh/y9dFDrTkGg0b24vBM0fuMaUOWdqiOX5DG
 kyUcW0hdLqlXf4UNZcrCwagdlGn6avQC5UhQaWL9tSlCELV9wrqQxQaTLfFn9QXeBpiu
 cKvhCK0TcIXApQs2HCurEQN1HfiJF3mhUhdeSXbsO9v7RCRcMRP/4eY58GRX67begY01
 Mqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zSuItO13sVdQTxFatCV5/c6atUnwHhpHtFgwIcmMGT4=;
 b=sgc6cJ3AMUSdbekrf9zHsXad1OdolM7KjvpvkP/oCp4xQMTYBETSWlNVqWCZCc9mRa
 7i9Sx1DJrpkf4Zf57umabLBBJHGbzrJKdVEGFoPfIqv8CqCEO+jTJaOZPeHARgJNSPVu
 XXC26Ujs1KfvDSrZNmql5MJYVnr67vaWRZD2Vv2w0N1n5HSIX3bsOuFyshybkqijbw4G
 AfIaG2mletKm/Bd4rJI7yWsizJqY+uMf5FlH55SUTxTuIxu4qTF4CorAJKGhgY5Iw/3Q
 Rip971gageuAG2uK1ls1iFsZrSI0ByOAeU0GMKD67NjZwpx0jIfllvZnjfIlItuJf9aL
 Akww==
X-Gm-Message-State: APjAAAXIQRixjj3LWAqRMFnk9Wyq10l9ePSEuKS+dtnEHpZGf/wX2y8e
 TVoZJcIv8hnTxKMpMcjDrpV/FUEiYbRziy0k16tnagWl
X-Google-Smtp-Source: APXvYqz9Pvb/gp0nE1RXQn+yP0ZoPDMNflKL1jqFcB13hlPi3jRiFYVHmbXSv01uaKnswnwvF5NyUTvj6Kg4eYRCOIs=
X-Received: by 2002:a02:69d7:: with SMTP id e206mr60312254jac.21.1560422519992; 
 Thu, 13 Jun 2019 03:41:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:92cf:0:0:0:0:0 with HTTP; Thu, 13 Jun 2019 03:41:59
 -0700 (PDT)
In-Reply-To: <b931537d9268184b1c98e316a6b95a72847bbe69.camel@emcraft.com>
References: <CAA=hcWSKQ4+BsQ9XPEhP+f=-oTA7CnbJ6=4upRZughg8mOUSUw@mail.gmail.com>
 <CAFLxGvzAHGVA9Pe0rvJWqjUgaPZKyExvV1gu3pZAezhNGDXryg@mail.gmail.com>
 <CAA=hcWRTPsk=zX=bnV6xAt-EpnyXy+dZdYGuLk8M-0UAjWHM1g@mail.gmail.com>
 <b931537d9268184b1c98e316a6b95a72847bbe69.camel@emcraft.com>
From: JH <jupiter.hce@gmail.com>
Date: Thu, 13 Jun 2019 20:41:59 +1000
Message-ID: <CAA=hcWQ708X-QuyZy_WLP4b0wg0Cpm8YcuBt3o3g2VzfP4jQvA@mail.gmail.com>
Subject: Re: NAND user space program
To: Sergei Poselenov <sposelenov@emcraft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_034201_532534_013BD60C 
X-CRM114-Status: GOOD (  17.40  )
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

Thanks Sergei for the clarification, good to know that mtd-utils  has
already handled bad blacks, I don't need to worry about it.

Kind regards,

- JH

On 6/12/19, Sergei Poselenov <sposelenov@emcraft.com> wrote:
> Hello JH,
>
> Going back to your original question, if your intention is to write a
> Linux image to a raw (ie without filesystem) NAND partition, so the
> bootloader (eg U-Boot) could be able to read the kernel image from
> there, then the suggestion is to use the mtd-utils "nandwrite", which
> is able to deal with the NAND bad blocks.
>
> Regards,
> Sergei
>
> On Wed, 2019-06-12 at 09:01 +1000, JH wrote:
>> Thanks Richard, can the Linux zImage or rootfs load to NAND directly
>> via JTAG or serial line?
>>
>> Thank you.
>>
>> Kind regards,
>>
>> - JH
>>
>> On 6/11/19, Richard Weinberger <richard.weinberger@gmail.com> wrote:
>> > On Tue, Jun 11, 2019 at 12:20 PM JH <jupiter.hce@gmail.com> wrote:
>> > > Hi,
>> > >
>> > > In NOR flash, access flash in user space is integrated to the
>> > > Linux
>> > > system read / write, is it the same story for NAND flash? I
>> > > installed
>> > > mtd-utils, but not sure if I can still use Linux system read /
>> > > write
>> > > to access NAND flash or not.
>> >
>> > Well, Linux exposes both NOR and NAND flashes as MTD.
>> > So there shouldn't be much difference.
>> > But make sure you can deal with specialties of NAND, such as
>> > bad blocks.
>> >
>> >
>> > --
>> > Thanks,
>> > //richard
>> >
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
