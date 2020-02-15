Return-Path: <SRS0=hSdi=4D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E195C352A3
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Feb 2020 07:18:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 113CC2082F
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Feb 2020 07:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zp69WDBn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2MZLn0q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 113CC2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d71Ral7aUWvBqsIME1X5wuVfMhCJcISpFHRzsab4lRU=; b=Zp69WDBncpTbmr
	Z89TUCg2Wp8r21na/X+9zgJ6OUQz1CG5vyV5MjoNChO5/bYEVMGbvnwTS7geudwBmXKBhj+KASbVW
	IziIE6BiRJu02FQewiIHlyIwCyUXuLLxI7ud2lW7nhKyCzj5F9ElmD0fKVEYrvSjSezevjPolJ2tL
	LG3ZujnWaojw30XCgdaH7mohJ2bvA44n/LDz0DBJEx5KyhhpqGVjoxXYYeKmJZ0v778IKo8qgGutz
	G0w52CzlS0nBcYbvXZr8ZLID1nhlWDgzMN+2zK/VEjFW6vtRvLVsUudWrBPaVNM3Nt9NZ8GHO/LyZ
	OKCHRkXtfWdygBh8Aaxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2ri1-0004Mm-K5; Sat, 15 Feb 2020 07:17:49 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2rhy-0004MD-EL
 for linux-mtd@lists.infradead.org; Sat, 15 Feb 2020 07:17:47 +0000
Received: by mail-wr1-x443.google.com with SMTP id u6so13545203wrt.0
 for <linux-mtd@lists.infradead.org>; Fri, 14 Feb 2020 23:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FxEdbMpjwAYJZVcWv2Y3i3ntbKIrXnjoUBcd1Az7pa8=;
 b=p2MZLn0qCBloeIdASEzs9xj65UV4MhaNVRj63HFcyKq1DLG3Otxlvf3XJ8oml1Prx/
 Bobz+jEL9H7K3aLLN8HNiVyRGbATpiEr8ch/6UAm5bnIetFq612nDFEZvnpJTLOquvWY
 rOn/bzYxCzfexjN4sG8XoHwrlkNbJfseh4aA7YrMNktBhcsIfJcFJ/71EDgwBjMRkFzU
 5cPBoYvKDA1tOj1zRpBnnBXheb9xRZe+PUjVnO+G9oNwn3p+XJ11LAuPB11d8Kenmhf8
 SGQ6JlE10Kx0WB26a1nH7JAmtd1Ov6tG1FfUKLhR8aA2qzvN+vE4qMhdCjQ1k0J2bfe4
 c0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FxEdbMpjwAYJZVcWv2Y3i3ntbKIrXnjoUBcd1Az7pa8=;
 b=fTbJdg+EDWffQ/+qKjJON9C4oT9jWKr6J8JnKWggbqIqJOF2X/HuzDo7f5FT7W/Zqi
 IrcVivt9fdPTCtpPxaCAK2YzRQzMQT4IlNw7P4NkuOXKrie3Ex7qvx39uTf8HQmROIaH
 JxNmOUq2DgplBDI/gZ4qPgrGB0TsCGqRecJMI8B+2Pto8i5ivV6d/am7n6CdagkL/LW6
 VEAE/Fl1gQXvmW/LlCvWYktBMO0SpFyC9WXIRgTryD01bKFFOIM8LBuF2CaGTkr9QZlb
 9PmGajyGcFuauDcQYv8QEnde7KrZ1YUgego55a2A5pRnr9OyyPxTV/WpGA/8c/6HK8v9
 haKQ==
X-Gm-Message-State: APjAAAVh66JTIwCgztmsRvzLzZ2rFf69EY4xs1ZLkuo9O1aYXUdOxB3u
 iQ8FhmI8WfdWimqzVvYXDgas/21y1dHmCIzOpQ4=
X-Google-Smtp-Source: APXvYqxa8++rPSKaPN1u5FvHHHe8FjS/CZjfIDegdsuH5Z6fIKK7KYu0BVS76Sb0WsP0AKVJUkC8v2dFfrLZUYocSBE=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr8574777wrs.184.1581751064418; 
 Fri, 14 Feb 2020 23:17:44 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWQY82OCzv9Pscb2E+8gV0rQ-YRoEaALZ9VV2=0mCoQK_Q@mail.gmail.com>
In-Reply-To: <CAA=hcWQY82OCzv9Pscb2E+8gV0rQ-YRoEaALZ9VV2=0mCoQK_Q@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 15 Feb 2020 08:17:33 +0100
Message-ID: <CAFLxGvwKX5y7ZUR+Kv9=fBM-1cC--HtTYPq8Te=pK4MqW7LKHw@mail.gmail.com>
Subject: Re: Unable to mount root fs (UBIFS volume)
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_231746_509736_1B1AC7E4 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Feb 15, 2020 at 4:09 AM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> I am running MTD on customized imx6ull evk board, the root is a UBIFS
> volume, installed from s ubinize image.
>
> If I boot from a ramdisk to Linux, I could run ubiattach -p /dev/mtd2
> and mount -t ubifs -r -v ubi0:rootfs-volume /mnt in ramdisk Linux, but
> it failed in NAND kernel boot, looks like that the kernel was not able
> to attach the mtd device or not able to mount to the rootfs-volume, do
> I need to pass more parameters to kernel? Or what could I be missing
> in the u-boot bootargs setup?
>
> => setenv bootargs "console=ttymxc0,115200 earlycon
> mtdparts=gpmi-nand:1m(boot),1m(ubootenv),-(storage)
> root=storage:rootfs-volume ro ubi.mtd=2,2048 noinitrd rootfstype=ubifs
> mem=256M rootwait=1"
>

[...]

> [    3.206295] UBI error: cannot open mtd 2, error -19

There is no mtd2.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
