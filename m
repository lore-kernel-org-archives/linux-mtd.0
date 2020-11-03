Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B0BC388F2
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 09:18:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB3A2240C
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 09:18:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lcab6sng";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4YDmLi/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB3A2240C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cq7RDFi2cGjGHaj5/13hg3HO8DLBOwbK+BWOCUdj8qw=; b=Lcab6sngBEwC4sUqGc27Vaa+8
	9nXT1oO33M+A/uCLDcx5VLkB0qxTaXJ9pQlI796v/ez3FdeE/gdZgLxpcvyWcrUKvVn0l9MzsWW56
	lAOOuXE60BHdBrPfTPgh+aXJTyLDG/copBaNAqExvBAq25+G9TYrxO9AMCgkwcmlUKd29v7WWH4Zt
	hWWioN/nf1DbLDpmyFz/X/93XqAGBE1MnMb+RC+MEIGy7k/RsN1nLHbbs7bg67Pm8+rW8gVHtWxhO
	GZHpPl85zQsEVTn6D6kShWf9ZM39z3XeXSSDHGnHkEDjTKGl+F/sLs9/bRpAecM6Rr4ubLaBmfDoK
	kbn1PtuAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZsRp-0004mg-MK; Tue, 03 Nov 2020 09:17:49 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZsRl-0004jP-B1
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 09:17:46 +0000
Received: by mail-yb1-xb32.google.com with SMTP id i186so14196736ybc.11
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2020 01:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=uZiuIwLR7Nl38rNFOX/06Gbyl/0YvN7AFCs38Kj8EOw=;
 b=j4YDmLi/xlTABuyiFpMuMH9UrCqq5x5LG7QxacsC9C8CMw9oklS0c1uLFmCc292SDS
 2tCy+amsit950oZfbBW0cflcqnqxwxM8txspFjWekq6k9+I3Z/E2fY0MJX8BZhee72ga
 0TWWG/OFvh33tay1ZKbOW1eD7mK0mNB+zxoycj8l+pANafEesEM2Cd+IAs642+vFqXlm
 BoFfZ7ZXhme1dNGqGBpFIfjOngs+aUPQbQ6C2+4WOsr8XmBIoVnVCfXufYupsyR3QVhk
 w+gNh3jBFPQpnqopBaxzCZY5OjHBLJhL+gQxBTPpb60x2FhamAoE7MBOY5ZsTZjgFZR8
 igRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=uZiuIwLR7Nl38rNFOX/06Gbyl/0YvN7AFCs38Kj8EOw=;
 b=CH3N4SlVTvvyo1bJzZxxadRtkElPz0P5wmY/Wyje36WLV+5r0nLmK2GOXvciM7jXWS
 SbJIKfJtLVc4JrH0Nohx0u4oBUj8GvJbdDZ4mZWbno9uNkkPsgo2+Z2zIZ1ZqmlhIipd
 xE1Yqt1lBsMkg9QurcEEj0jCWfeGx0zlK4F2m8BVMSEKVpKlkoYNLT6OK+4hYwZYu4mw
 gJZl3NfmuVm7xt45zH3aDOtxmwC29JYMDBk74yKHSy8t554g6zau6JUQ8Znu537/5MgH
 LinMzzMOM52rQSSDU9v/D1hMdnrNRepUGsMAiDdmgY9baKKrv+JqYSHWBRnvIFfn3LOI
 /3zQ==
X-Gm-Message-State: AOAM531u7axhzNU6UVgEeHLFVqEtOasZCb44MmWSiJIfn2rU7rPJDZT4
 BVidpL0LJ2K1k0kjeRBgH96NcoheYBGw9XKcYsJRj50uM+4=
X-Google-Smtp-Source: ABdhPJwbn1OK0+s8KZZ4adTUTaKaMGYIzw7mMy1kM6h6eoIBLTKbbgVZ9lsPCo9RuvGv9nuxCtQo5zIDErTTYLTnIOQ=
X-Received: by 2002:a25:4656:: with SMTP id t83mr15142462yba.65.1604395062105; 
 Tue, 03 Nov 2020 01:17:42 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:a16a:0:0:0:0:0 with HTTP;
 Tue, 3 Nov 2020 01:17:41 -0800 (PST)
In-Reply-To: <3029789.gPz3SqCoUO@ada>
References: <CAA=hcWQnJ1yRTwPF+9kubSt6FQPxwCRYFwXcYR8RnVLs4LMb7A@mail.gmail.com>
 <2234110.ZDGxJVC3CD@ada>
 <CAA=hcWSAsKEcFaR1dCpCey_m2Z2zOxYT1N8NNjL6bNQxSrHj1A@mail.gmail.com>
 <3029789.gPz3SqCoUO@ada>
From: Jupiter <jupiter.hce@gmail.com>
Date: Tue, 3 Nov 2020 20:17:41 +1100
Message-ID: <CAA=hcWR9gMxtCbhDdMEbzJ0okZ7aYGHeaP6j7bkfqT4EVkO=Dw@mail.gmail.com>
Subject: Re: Install Yocto image and backup
To: Alexander Dahl <ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_041745_524815_AE7DB370 
X-CRM114-Status: GOOD (  17.09  )
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
Cc: Yocto discussion list <yocto@yoctoproject.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Alexander,

Thanks for your clarification.

> If your kernel and rootfs partition is just one UBIFS in a bigger UBI volume,
> then no. Single bad blocks affecting the UBIFS partitions would be handled
> by  the underlying UBI. You should however consider using ubihealthd or
> something  similar to become aware of badblocks over time and handle them before it's
> too  late and you can not boot from the rootfs anymore, especially if it is read only and not
> touched for writing in normal operation.

Yes, I use one UBIFS for 4 partitions, RO rootfs, RO kernel, RO DTB
and RW application, no write for RO partitions, that should be safe, I
feel relieved.

> your device is somehow connected to a network. So what I suggested was having
> two rootfs partitions. One is active and the device boots from it (A), and the
> other one acts as inactive (B). When you update, write the new rootfs to the
> inactive partition and then just switch over and boot B instead. You might add
> a third partition for recovery or factory reset. Only the active partition
> would be used in the running system and can still be readonly there.

The reason we don't update kernel and rootfs because the size of
kernel and rootfs is too large, it is hard to download 60MB image OTA
via 4G CAT M1. If we are going to change to use 4G CAT1 or higher
speed, I'll use either RAUC or SWUpdate, which one is the most popular
for embedded system using uboot and UBFIS?

Thank you very much.

Kind regards,

- jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
