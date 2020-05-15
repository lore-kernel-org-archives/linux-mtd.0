Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433C8C433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 01:16:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CDD206D8
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 01:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nbNes15q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itr/+1UE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11CDD206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d+m1m6SC7+i5mVMuH4Xjg5h4KUjCE+p4Mh7+1Sr5un8=; b=nbNes15qYbM7kIrVyqSxiVHiKl
	/xxh7msbYsM5lF3+KdrmmmCW6whDkzuox6eLn8O3UF26JJnOlbt7XoVBv9aMjGkwarrI67urYfiC3
	dBw4y7GbWf8YduChmlT39/+57uxxwCCEx9glFdU0YGSM6B3ZHoq0svoE+4AVzCGRBx2gajC5k9VAS
	Kw1Id54eKkJJT6JxGefycc9u+IY2CZanMUtMRw9TQhHZXKrXmK7pyNEm0rmyICgpEbmF8xB+J2w/Z
	EtPdNzIXWejiLMgG7/LpNHgOQ/QAVt0Twrg8Ate0aCSU1FDTkVfkEILOVbztYe5S9wAycC0Xr295l
	X1rDn8kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZOxc-0000QN-EQ; Fri, 15 May 2020 01:16:24 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZOxW-0000PW-F5
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 01:16:22 +0000
Received: by mail-ed1-x542.google.com with SMTP id g9so624155edw.10
 for <linux-mtd@lists.infradead.org>; Thu, 14 May 2020 18:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=JLAyCKQ2H+cDWPOg4k3HPxHIqzbZY7ImXkNaRtTKnqk=;
 b=itr/+1UE/5Bf99ATWVYNZXShDE5zmFKWPOCvlghcjnotqtdwJFLSu2hcsiM9wbQCBX
 BG9+P3G44zKvqOy2bat3zXzb5dF3fqlRVrd31rYnC/YZDlWUwKMa6zfCi+Y5+pC1UkRh
 d7k/cdbEVHXQcvKzc58UT/cPxz4TjJXXA35i/qQKg7wYm0/El7ZMEVXkuy/+yLuqAQB9
 uMQNbwBJuHUh1Q0N/Mb9Rg9W7Fm7bB4emhNC4uLb1f68E2skOywx1O3pCd0INgVHFJz6
 8dPlI9/+0UAPr5PpQ+Ll/wv+4Ncd2iLwiwAxFhBXNhShbAKCpdqIQSudmXI/vp0Cq2VR
 lETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=JLAyCKQ2H+cDWPOg4k3HPxHIqzbZY7ImXkNaRtTKnqk=;
 b=R2mxZQJc7h24iDHQ4RUsEf3OxHaWqoSFybvUtObSxEfgnIpH+xnpCx9oFkkvYaIddw
 0Pkzk0mOnksiCEDvatoI4B2fuOI59FmXcEp7m2f7uGF2AfPk/QE0nIxk/N9zDE/rxsKQ
 smHhhj0Wfi3Dz25OL3xyM3vZKblvGYSI3uDMdjvcnDDzTJ8/mBoXlgsV/EEUd4nSoDoA
 Ryhlgy/YuzpgyprAxG+sjSTsjhtwdydgnERJ4sC1pkQCAEp2EBZ5p3OFQfYrz99jypAb
 ixpobQBJTUWFYTMiEKOZAE3CZOUqIIgp494UneQwqJvevK9trkFzdaTVNm+Xbh2tpSxK
 3rug==
X-Gm-Message-State: AOAM531xBZ12qlvt7zfrcYTnpfg5Nt/8/VlaQa2YbLTltp/iaLD6WQ9a
 In+TAEtUGLegPuQeeCxHJF7sUjGH8gjpFX9yZ8rSD0co
X-Google-Smtp-Source: ABdhPJy+p7Fp159UI5Ash0/RPaLv3Iz/dMR3SyFtmAteC9UtOh70aRDgOXboU9TdbM+5yC2WKIlu/dfMF24zTN7iFPE=
X-Received: by 2002:aa7:d894:: with SMTP id u20mr647065edq.205.1589505376565; 
 Thu, 14 May 2020 18:16:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a881:0:0:0:0:0 with HTTP; Thu, 14 May 2020 18:16:15
 -0700 (PDT)
In-Reply-To: <CAA=hcWT7eQ5nXjqRyOG7jaH=K8OEa5w_AwbB_fTJ6JdM-=YDeg@mail.gmail.com>
References: <CAA=hcWT7eQ5nXjqRyOG7jaH=K8OEa5w_AwbB_fTJ6JdM-=YDeg@mail.gmail.com>
From: Jupiter <jupiter.hce@gmail.com>
Date: Fri, 15 May 2020 11:16:15 +1000
Message-ID: <CAA=hcWTTD3uLOq91GAAm6GXvAmQrDbhd6Jxj2EMH40O8n9ExoA@mail.gmail.com>
Subject: Re: Any UBIFS volume image installation command with selective ECC
 (DTB) in Linux?
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_181618_528479_373E31B1 
X-CRM114-Status: GOOD (  14.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Seems I am not alone for this issue, found the comments from following
link https://community.nxp.com/thread/324502 6 years ago, it is not
exactly the same to my issue, but are there any new development to
decouple the MTD UBI ECC with u-boot ECC?

"It definitely looks as if the Linux MTD's ECC doesn't agree with the
U-Boot ECC.  For instance, I have the same message if I write a UBI
partition with Software-ECC and then mount with Hardware-ECC. Here is
some conversation with Stefan Agner and I

http://lists.infradead.org/pipermail/linux-mtd/2014-April/053553.html
http://lists.infradead.org/pipermail/linux-mtd/2014-April/053560.html
http://lists.infradead.org/pipermail/linux-mtd/2014-April/053570.html
............
"

Thank you.

Kind regards,

- j


On 5/14/20, Jupiter <jupiter.hce@gmail.com> wrote:
> Hi,
>
> I used ubinize to build a UBIFS image ubi.img, the image has three
> volumes, dtb-volume (imx6ulz.dtb), kernel-volume and rootfs-volume.
>
> To install u-boot and root UBIFS image to iMX6ULL NAND, I used a
> zImage-initramfs to install the u-boot to u-boot mtd partition first,
> then to install ubi.img in UBIFS partition by running following
> commands:
>
> flash_erase /dev/mtd2 0 0
> ubiformat /dev/mtd2 -f /tmp/ubi.img
>
> It was all fine, but after the installation, it cannot run ubi part in
> u-boot:
>
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from
> PEB 3
> 83:0, read 64 bytes
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 2048 bytes from
> PEB
>  383:2048, read 2048 bytes
>
> The problem was that u-boot installation requires a higher bit ECC, so
> that zImage-initramfs was started with imx6ulz-kobs.dtb, if I change
> to start  zImage-initramfs with a low bit ECC imx6ulz.dtb, that ECC
> error gone away, but then I could not flash u-boot to NAND.
>
> Are there any way or mtd / ubi command to flash ubi.img to NAND based
> on a specific ECC / dtb?
>
> Appreciate any your kind advice.
>
> Thank you.
>
> Kind regards,
>
> - jupiter
>
>
> --
> "A man can fail many times, but he isn't a failure until he begins to
> blame somebody else."
> -- John Burroughs
>


-- 
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
