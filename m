Return-Path: <SRS0=Jc64=KY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949E0C4708C
	for <linux-mtd@archiver.kernel.org>; Sat, 29 May 2021 00:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29353613B6
	for <linux-mtd@archiver.kernel.org>; Sat, 29 May 2021 00:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29353613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ldztEf6bk8TyvTsvqJXymQImIN4w/dnHs9iST6wtXjQ=; b=clBS3smFFcTE5wTnU1Lzrby/sN
	qoLdqiW/4ZvEdZwLjhyhk2N6Wp4qzyxeqDKLX9dtWupgSSTLUuZYRHQS5weEDjIfZTPbzMcvUuZC2
	8vRuqJtsRNKmBWyvcG1caDY6moQIzkkwW2oXZ8KnKGC3psCSCIz1kWtTlczjipoaVGK3KJBlBO+Ii
	4XsxLWo9r7dR26ybeFMDggPzGntoBSTivrdod+ZrCZeHJiaiSSG4hMH6gdHBD22PAX7Noh/siWjUD
	NRP3lOqKfYEUyMRuZCRaijuKVhowmDO5fKXekzxXrITgnV/ty3foAwmGgOGLMNGPTXq+AGs0EHr9N
	rZxrQsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmmXV-0022v5-2x; Sat, 29 May 2021 00:09:17 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmmXS-0022tk-QQ
 for linux-mtd@lists.infradead.org; Sat, 29 May 2021 00:09:16 +0000
Received: by mail-yb1-xb31.google.com with SMTP id i4so7831031ybe.2
 for <linux-mtd@lists.infradead.org>; Fri, 28 May 2021 17:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=PNIRG0haHFiv4ZcXObfFIZbPJtxpijUi7jGPqtFrOnk=;
 b=uIbSVfqvMVEJ+w/UlePij/eQJSfgCvuNYf+rqz5d5dpRgOEBKqJrArYnTGG27Uhc30
 GNJNnWX7hhSFL082OIxlSmRxBQvylGYkSjt0K3OVCjUpufE5t2Nq4iJHRZX0oKRPQgN3
 kPdzioeFwGa7NnUfUdxr1Vh0scFSYpwzQ5hIlV+zKYrAqF0WnZq3xEwAar4oMq81Pi0f
 zww/dJ7mMpWcrsf6c6mlkt0TSnp3MEJAVTpbRPYG8ypEpPiF28T33SPgms9OsMnYARn1
 naVRYeCcDVIDcHhQoSjN7hazdZ6/Uk8w2mgKDiFPkJ1TMW6ehxDrrfvxS69u549RbdtU
 NjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=PNIRG0haHFiv4ZcXObfFIZbPJtxpijUi7jGPqtFrOnk=;
 b=AsdrgGDHeYw4cV7uAEpaZIVPyUOIfFtkRzvlxhXzg2AxOiApM7ufvIZLoPaEKrQzdP
 D2IWNYpqZpnMHQksAb2QgcLS1gFSqjAO+T+V9Crc4QlVFYzeE7/CzcpaJrm+3XIUiX08
 MunGnfMo9G5CMDhBihm+ankh/TMUl6yxdVtIBpxQCyU3oOI+deybqlqVc9jJTIjwWYKY
 f17zfHGZhcwfuCczupuYv60qVN5qx75SrrSh1D9oN79Jd/0CpssnNz1AZkWiBVKblYCY
 IOZhZj+EDJw/XDxHw1kNSP1Pnek6TlMx9RC0jizbX86BdcLOlpKP3G/iVetgNtlqDszv
 y1pw==
X-Gm-Message-State: AOAM530W1eqHqPBAfeqEBTdijXGjUun80gwqkBeS1jNg/rqr3tPYtBQS
 Q7LPokeTLnlfNjppmZUAS+Iw4gdvGV8DAtsE2cEjtvxnreI=
X-Google-Smtp-Source: ABdhPJygxTPi7Isdo2tbKQQwPJ1ZyVfFLMdrcAT7ILIz2nCGrqvPdajQLWv6jPOYaHCuw5kyg4N+gSCERqbPVuXJFBo=
X-Received: by 2002:a25:8190:: with SMTP id p16mr14996641ybk.156.1622246952150; 
 Fri, 28 May 2021 17:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWQk84==-Y2yq44M-EL_jwqb2Yg2QKJXY9fNycDfLUGOgA@mail.gmail.com>
In-Reply-To: <CAA=hcWQk84==-Y2yq44M-EL_jwqb2Yg2QKJXY9fNycDfLUGOgA@mail.gmail.com>
From: Jupiter <jupiter.hce@gmail.com>
Date: Sat, 29 May 2021 10:08:35 +1000
Message-ID: <CAA=hcWRpmobm35uB53Wh=OVy1AdB0ziZphHsREctXcTG60Pa8A@mail.gmail.com>
Subject: Re: Failed to create MTD partitions
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_170914_883748_785727B4 
X-CRM114-Status: GOOD (  18.36  )
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

Hello,

There is another statement before the device found, is the Error
setting BCH geometry : -22 caused by ECC or by invalid JEDEC? It is
kernel version 4.19 on iMX6ULZ MCU.

[    8.130891] nand: Could not find valid JEDEC parameter page; aborting
[    8.137591] nand: device found, Manufacturer ID: 0xec, Chip ID: 0xda
[    8.144246] nand: Samsung NAND 256MiB 3,3V 8-bit
[    8.148995] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB siz
e: 64
[    8.158330] gpmi-nand 1806000.gpmi-nand: Error setting BCH geometry : -22
[    8.166690] gpmi-nand: probe of 1806000.gpmi-nand failed with error -22

Thank you.

Kind regards,

- jupiter


On 5/28/21, Jupiter <jupiter.hce@gmail.com> wrote:
> Hello,
>
> I am using MTD in kernel 4.19, I was able to run kernel boot to create
> MTD partitions when I used NAND Winbond W29N02GV:
>
> [    7.961966] nand: device found, Manufacturer ID: 0xef, Chip ID: 0xda
> [    7.968545] nand: Winbond W29N02GV
> [    7.972267] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB
> siz
> e: 64
> [    7.986814] Bad block table found at page 131008, version 0x01
> [    7.994254] Bad block table found at page 130944, version 0x01
> [    8.002152] 3 cmdlinepart partitions found on MTD device gpmi-nand
> [    8.008479] Creating 3 MTD partitions on "gpmi-nand":
> ....................
>
> Since we could not get Winbond W29N02GV supply anymore, we changed
> Samsung NAND, Both are 3.3V 2Gib devices with the same memory
> organization (2k pages +
> 64b OOB / 128k blocks) so these two parts should be equivalent in
> terms of internal organization, but it failed to create MTD partitions
> in kernel boot:
>
> [    8.137591] nand: device found, Manufacturer ID: 0xec, Chip ID: 0xda
> [    8.144246] nand: Samsung NAND 256MiB 3,3V 8-bit
> [    8.148995] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> 2048, OOB size: 64
> [    8.158330] gpmi-nand 1806000.gpmi-nand: Error setting BCH geometry :
> -22
> [    8.166690] gpmi-nand: probe of 1806000.gpmi-nand failed with error -22
>
> Since it is a new board, I suspect one of following problem might
> cause that error:
>
> - HW
> - MTD does not support Samsung?
> - Need kernel configure?
>
> Appreciate your comments and advice.
>
> Thank you very much.
>
> - jupiter
>


--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
