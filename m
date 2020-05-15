Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E733C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 07:00:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9FA2206F4
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 07:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="opjEL8yC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2m40HRY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9FA2206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=78zuyrZyaEOWPay2IRkoJMs/DMBOP6CNIZFiziE25vI=; b=opjEL8yCsvynpHqxPcnbHA/eK4
	vUxx5ktYoShVlTrffej3FLuOe7lAtBz+P77sxkbBV2yGX1oGxBD2EWrzSWH/tpAkuuxKLvza6QbCU
	fI+zwqidPaGNbknowusIEPKD8KS5ROQzP8XTcPCFrXd6qYriGI2SSQarWzgt0kQ8luov9O6D7cgUq
	DZ1D3WkmuJ3lk8FafyDDX3qrDzfLKcO4dDJd+YOS/AbjQsaiUU7Xggrgma07jhMt6mH8UZRnnkTlE
	3kVF76pPihZl8MpphL/pR0D7XgQRLqQ26mJ6+4kmH/yY92JBQ/KexWXX7CkfzwoIiC7wEC3GE8bQe
	xaINYzFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZUKE-0007Ki-TF; Fri, 15 May 2020 07:00:06 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZUK7-00079C-Qy
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 07:00:04 +0000
Received: by mail-ed1-x544.google.com with SMTP id g16so1346019eds.1
 for <linux-mtd@lists.infradead.org>; Thu, 14 May 2020 23:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=wEggQ15LmoDOxt7zx2jcmblPaUjaSQ2ojLub2u0HnPo=;
 b=W2m40HRY1049+cAJXHj26eAEj4aSUQmYFN/h3SKWBLoFGYfcSsEJ/a05sv4qGdV5zQ
 9Jx30v0BYypzm060EZ4n6QvYzPvc7vZxhDtI5kpiYO7wXMhGUn3mYuqFgv+GcD5LQUr0
 kN3BMFLXMboOmqQSbdB4XAjEhAYuwillI0Cfpl8kIVSzj3kAkBgF2+lfwanfxf8DczlF
 MqQ0KcUWLOJs1GXOPQMNQm3WJuLQ+KTCMOMFPbRJTup2f5d4rgHL+724MifWtqVYGUIk
 pImQg7tPTF37uJwLl9AtL57Wo3Ulg9C4b/m4/cA1jk7HIql16RV2qU+R8AdChIY7pPF3
 cQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=wEggQ15LmoDOxt7zx2jcmblPaUjaSQ2ojLub2u0HnPo=;
 b=kVClss+IjtrPZKT8L3cYAHTIgSlvQ2aXrLaiLliHxJkdUjrrXLWKyve3xw2SQsrUMK
 lGTY1TQjMuzLROmgvfPXYSY4bqupzKjar3cpcz4x55ssfpzSHH950AYUFkKzaNN0KL98
 JSGcwt/bw4Ynwm4ecBq7XucXACWXC8BF0LOECH7C9Q/yc9zwPrVyewyCxjMP1PSkhFNn
 E2eiW1tXQ5Mi2v6efOhEnZiKHHt0ChsshshjvErGza552h7w1A+9vLA0JpUkol0AjkTV
 9iOVNntL1rMsszwfKqoAI9x/KQHXGjWaoVAh3cNqfoZAD/VbkfRBmorJ4xA96FWCkAwD
 8m1w==
X-Gm-Message-State: AOAM532ueAyBL9L4iti76PkqWDophdou9dJSxmuJxiI/UqCQu9D56lWx
 vih+xyx1Kd8IBXLXhVN5I3DEk1YAc8cH3ficVZL3MmzJ
X-Google-Smtp-Source: ABdhPJyR4NZDJH7LddLXo+QBTNIOViGWyRN7XBzWwX2FqMG11/bbgm2zbV/GCZQxOTxdv+fGIGVDlD8p2BU201TjWL4=
X-Received: by 2002:aa7:d0d9:: with SMTP id u25mr1361056edo.377.1589525993838; 
 Thu, 14 May 2020 23:59:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a881:0:0:0:0:0 with HTTP; Thu, 14 May 2020 23:59:53
 -0700 (PDT)
In-Reply-To: <CAA=hcWTTD3uLOq91GAAm6GXvAmQrDbhd6Jxj2EMH40O8n9ExoA@mail.gmail.com>
References: <CAA=hcWT7eQ5nXjqRyOG7jaH=K8OEa5w_AwbB_fTJ6JdM-=YDeg@mail.gmail.com>
 <CAA=hcWTTD3uLOq91GAAm6GXvAmQrDbhd6Jxj2EMH40O8n9ExoA@mail.gmail.com>
From: Jupiter <jupiter.hce@gmail.com>
Date: Fri, 15 May 2020 16:59:53 +1000
Message-ID: <CAA=hcWT-Noe3hk-YYs2K+WYA9b2dLtT6A5boYyf3x-3YOKr-Dg@mail.gmail.com>
Subject: Re: Any UBIFS volume image installation command with selective ECC
 (DTB) in Linux?
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_235959_897171_7F31F5EE 
X-CRM114-Status: GOOD (  15.24  )
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

My apology for keeping posts while reading more to understand the
error -74 (ECC error) from
http://www.linux-mtd.infradead.org/faq/ubi.html#L_ecc_error, but I am
still not clear why the ECC error occured, let me rephrase it:

- I used ubiformat to flash the UBIFS volume image ubi.img to NAND MTD
partition 2 in Kernel 4.19:

ubiformat /dev/mtd2 -f /tmp/ubi.img

The ubi.img contains a dtb-volume in

- In NAND boot

Calling ubi part ubifs_partition before caused following error before
it could read ubi readvol 0x88c00000 dtb-volume:

ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes
from PEB 3 83:0, read 64 bytes
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 2048
bytes from PEB 383:2048, read 2048 bytes

The document says UBI tried to read some data from the flash, but the
flash driver found that there is an uncorrectable ECC error, and
returned -EBADMSG.

I can eliminate the causes in the document such as buggy NAND driver
and HW issue, or flash image improperly.

I am baffled when ubiformat flashed ubi.img to NAND, who wrote the ECC
to the flash?, Does ubiformat write ECC to NAND? If so, how can select
the ECC for ubiformat to write correct ECC to NAND?

Thank you.

Kind regards,

- j

On 5/15/20, Jupiter <jupiter.hce@gmail.com> wrote:
> Seems I am not alone for this issue, found the comments from following
> link https://community.nxp.com/thread/324502 6 years ago, it is not
> exactly the same to my issue, but are there any new development to
> decouple the MTD UBI ECC with u-boot ECC?
>
> "It definitely looks as if the Linux MTD's ECC doesn't agree with the
> U-Boot ECC.  For instance, I have the same message if I write a UBI
> partition with Software-ECC and then mount with Hardware-ECC. Here is
> some conversation with Stefan Agner and I
>
> http://lists.infradead.org/pipermail/linux-mtd/2014-April/053553.html
> http://lists.infradead.org/pipermail/linux-mtd/2014-April/053560.html
> http://lists.infradead.org/pipermail/linux-mtd/2014-April/053570.html
> ............
> "
>
> Thank you.
>
> Kind regards,
>
> - j
>
>
> On 5/14/20, Jupiter <jupiter.hce@gmail.com> wrote:
>> Hi,
>>
>> I used ubinize to build a UBIFS image ubi.img, the image has three
>> volumes, dtb-volume (imx6ulz.dtb), kernel-volume and rootfs-volume.
>>
>> To install u-boot and root UBIFS image to iMX6ULL NAND, I used a
>> zImage-initramfs to install the u-boot to u-boot mtd partition first,
>> then to install ubi.img in UBIFS partition by running following
>> commands:
>>
>> flash_erase /dev/mtd2 0 0
>> ubiformat /dev/mtd2 -f /tmp/ubi.img
>>
>> It was all fine, but after the installation, it cannot run ubi part in
>> u-boot:
>>
>> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes
>> from
>> PEB 3
>> 83:0, read 64 bytes
>> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 2048 bytes
>> from
>> PEB
>>  383:2048, read 2048 bytes
>>
>> The problem was that u-boot installation requires a higher bit ECC, so
>> that zImage-initramfs was started with imx6ulz-kobs.dtb, if I change
>> to start  zImage-initramfs with a low bit ECC imx6ulz.dtb, that ECC
>> error gone away, but then I could not flash u-boot to NAND.
>>
>> Are there any way or mtd / ubi command to flash ubi.img to NAND based
>> on a specific ECC / dtb?
>>
>> Appreciate any your kind advice.
>>
>> Thank you.
>>
>> Kind regards,
>>
>> - jupiter
>>
>>
>> --
>> "A man can fail many times, but he isn't a failure until he begins to
>> blame somebody else."
>> -- John Burroughs
>>
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
