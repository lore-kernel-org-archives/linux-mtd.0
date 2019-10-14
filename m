Return-Path: <SRS0=jzn5=YH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EACC4CECE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2019 04:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3578520873
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2019 04:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="flaxeREK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0DtocMH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3578520873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q+8ANKsfVvu2a0RaXtcQ7peVcfu22K+xgPNQrYo2wh0=; b=flaxeREKkgB8Zo/7YTp/vjLWsP
	TpL82oCs6xjCKNZlsShgbxARAddm2VQaw0Bxj0WgbuDPc9wPWcWIUlHeYGekzYuQDx6gJMhuCTY8e
	EdzNrfwfg+cHYDfgMszJvI3loFTqCYa5VAhvGeakAd0u7dKP0NZyDqA0mrEqRZWE82Rw50cB2dOhG
	d+ecuEd3Vi7zY1iXYe4u+LqJfaztXKsUIHIlE3Qa/QbObfZaGgV5UEQhKSWEbzyipFysn2P5F9rMJ
	98T6R2dIAH6sE+ipd2M1D9WYNw6wISYDXBGtvSAAoth/DBEy1a/5vYHru5Ie+h7PtWmtsatl3nJuK
	Dz3XXIEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJsQG-0000ax-F3; Mon, 14 Oct 2019 04:57:32 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJsQD-0000aV-Jq
 for linux-mtd@lists.infradead.org; Mon, 14 Oct 2019 04:57:31 +0000
Received: by mail-io1-xd43.google.com with SMTP id v2so35182088iob.10
 for <linux-mtd@lists.infradead.org>; Sun, 13 Oct 2019 21:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=I/GauP8tnaH/TmPdVGAVF7OEwrfsNVpdWEPR+LMd/oY=;
 b=m0DtocMHFUZRGTNPVvnYE2jMIkuyssLjzENVc9kRc1dPhCjgIlzX4O3WCnBQ8cH0AZ
 fA0Mn63/te0vcfZDgiOBv6IPYqF8S17ilz+c30UrnGhH5JXuASnsAX5DZxzk3IZsiLL2
 +XI+yfrhDDiVn/qNpxfQgBgcuVglnW/rRZpXVHeiYpUWwmec6xqoVLcZqudjgIQFTwT6
 LE91WOsTBrOOcC/nim9OESupOe5GZhesnYPoVP4IG2AV7GR+WEAlOjN2RTU9qX/bzy9I
 KhOB8fTrYNHhWVqXka6PxTplTJxXctpLDYdZhfcycOluobrBQ6Djj7tdXaYgSaF140V3
 pufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=I/GauP8tnaH/TmPdVGAVF7OEwrfsNVpdWEPR+LMd/oY=;
 b=tq9IYAMoQMQaW3EtPtj6gxmsqczjlhnDx2k2uFEKXw1yuf3hx42VmMyFy7oDjGuxDZ
 GsNwD/05+J9mQGOcstc6MnU8PA6coSz8u0KA0Ja19zxfkMRZVwaMzzfNi3oqZCzqPjH4
 7gQgku7RxXXZasa8H9RNHWrnC+sDYOP1PSb9CNr5gR+dwYdEJ07BgknnNCP57fK1ppw7
 QD8wc1ebl7Y2tvpBT7nm5SJ0/HIpg7bKPnFu8EYfmZHZysu8q3Csz/mPVUwaeR1aQJWA
 OZm1PAJjHDwMzQc/39kiynDgnqrOYEOw3G1Bioo0q0ZfW/n++16HDXo969XRj+TdsOqs
 Ffjg==
X-Gm-Message-State: APjAAAU7uQeiUY6En3FP8UCoOSAWxEg3i8+JqBSd4By7DTt3/1KanHrj
 e4S7B/alJdBzXJuqmR29o8hkxDkgolg/m8/utPkSvli5
X-Google-Smtp-Source: APXvYqxNKMB59eGUeWbdaUn/P4ADE2Lo8z1FmhduVOlYdSifpEgDN82CFKZ+FMyZ1xzqE3mlS6cHvXdK76fWVywuizo=
X-Received: by 2002:a6b:6914:: with SMTP id e20mr31109750ioc.53.1571029047613; 
 Sun, 13 Oct 2019 21:57:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Sun, 13 Oct 2019 21:57:26
 -0700 (PDT)
In-Reply-To: <CAA=hcWRj_dhRPqRez97hHDVQ55tXbRV9VGs-okF-eKSg=6x=4g@mail.gmail.com>
References: <CAA=hcWRsrE73HPc0qzcUY7AEHha3NUYQCXj7tTK8o-KN0xLbzw@mail.gmail.com>
 <CAFLxGvybooDyV_D55A1rCh_jfSjBdp4SDaHHua2F-eMYomZpLg@mail.gmail.com>
 <CAA=hcWRj_dhRPqRez97hHDVQ55tXbRV9VGs-okF-eKSg=6x=4g@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Mon, 14 Oct 2019 15:57:26 +1100
Message-ID: <CAA=hcWTx7Zpd-PNCp+oFp3+CXzOR=Py6H_0vonbBSUU4ArLU7Q@mail.gmail.com>
Subject: Re: Where to define multiple volumes sizes in one MTD rootfs
 partition?
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191013_215729_677743_EC47992A 
X-CRM114-Status: GOOD (  15.36  )
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

Hi,

Sorry, if it is not right the mailing list to ask helps for multiple
volumes in a single ubi0 instance, any advice please?

Thank you.

Kind regards,

- jh

On 10/11/19, JH <jupiter.hce@gmail.com> wrote:
> On 10/5/19, Richard Weinberger <richard.weinberger@gmail.com> wrote:
>> On Sat, Oct 5, 2019 at 2:51 AM JH <jupiter.hce@gmail.com> wrote:
>>> Recently, one of my device is broken failed to boot up, I still don't
>>> know what was the cause by hardware problem or software, to be
>>> precaution in the future meltdown, I am going to separate all writing
>>> data from ubi0 to to another ubi volume ubi1, to keep the rootfs in
>>> ubi0 read only. How can I define the ubi0 volume size to 160 MB and
>>> the ubi1 volume size to 30 MB?
>>
>> Don't setup multiple UBI instances on the same chip.
>> The wear leveling domain should be as large as possible.
>>
>> If you want to have multiple UBIFS filesystems, just create more UBI
>> volumes.
>
> Hmm, wandering for several days how to do it, reading lots of
> documents, still not clear how could I make that work, let's say I
> have following a volume configure file:
>
> $ cat volume.conf
>
> [kernel-volume]
> mode=ubi
> image=zImage
> vol_id=1
> vol_size=10MiB
> vol_type=static
> vol_name=kernel
>
> [rootfs-volume]
> mode=ubi
> image=rootfs_data
> vol_id=2
> vol_size=110MiB
> vol_type=static
> vol_name=rootfs
>
> [data-volume]
> mode=ubi
> image=rootfs_data
> vol_id=3
> vol_size=10MiB
> vol_type=dynamic
> vol_name=data
> vol_flags=autoresize
>
> $ ubinize -o rootfs.img -p 130MiB -m 512 -s 256 volume.conf
>
> $ ubidetach -p /dev/mtd5
> $ ubiformat /dev/mtd5 -y
> $ ubiattach -m 5
> $ ubimkvol /dev/ubi0 -s 130MiB -N rootfs_data
>
> $ mount -t ubifs ubi0:rootfs_data /mnt
>
> If I have a single ubi0 rootfs in /dev/mtd5, I can set
> "root=ubi0:rootfs_data rw ubi.mtd=5,2048  noinitrd rootfstype=ubifs
> mem=256M rootwait=1"
>
> $ tar zxvf yocto-image-rootfs.tar.gz -C /mnt
>
> It can boot from the a single rootfs volume.
>
> But for multiple volumes in ubi0, I lost completely, how can it boot
> from volume configure file with multiple volumes? Where the
> volume.conf should be placed in Linux rootfs, in "/"? If it is correct
> to copy volume.conf to /mnt (the "/"), how will it boot from NAND with
> multiple volumes? That is most confusing parts, I could not see any
> clear examples and statements in documents, appreciate kindly advice.
>
> Thank you very much Richard.
>
> Kind regards,
>
> - jh
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
