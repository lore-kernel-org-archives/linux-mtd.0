Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A7DC34033
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 06:38:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE605206EF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 06:38:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ow6Q1Fo8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="milyCRde"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE605206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qVxXLzCl9fy2qMUms9M8Y27dfPEKrytWlLc1Y0nCa0=; b=ow6Q1Fo8vvbaAK
	owu1h+ynVc6n15Rg+wReoUksxK58P4csgY9ukDQPGG4ozT9GxyGjOG6u9stdLP3pHDTGOSVI2MKe8
	gUIGNks1X2w75dp/wykR3YPFbZAQarV4K9qcsc+FVwX7GVwyV5z50Ym3KaZ3rNchbHx06NHQ9qrGT
	mLrke+xF11QurrrpuqU6+A4lleWkSOUbfNF51Z41Zlpo1Fyfp4AMDmOulrq60VqbepaJb2Wy4WtcV
	49xx5NBndKbJihRelqOXxkaWd9QuT77jATSZt4/uh/bSKK/YYKmOJrL+wYGEeFu95QAPFOj36scES
	MbUWMZxRStSiz8tZ+Nkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3wW6-0007oD-BM; Tue, 18 Feb 2020 06:37:58 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3wW2-0007m3-IO
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 06:37:56 +0000
Received: by mail-ed1-x532.google.com with SMTP id j17so23545382edp.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2020 22:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WefOljf8fdhmjWPE5xhjjCetqPi5nsbB6AvHzk0HJ3g=;
 b=milyCRdePcZEV76StfhQxZv1SbR0Ww9badKvRcFCd0+FJEm9oZCLy97bqi/fVapN7q
 C5N8iatUtbzCVRDNk/0bGzngNS1eWXOugNnzwqSpwJ2bFAhnBW2oiwzmZDFWUmlltZSO
 T6UZpx5bmPWJr0hbyQTq1F8P/3qjwL2uQMDwNLeznwmfwPaVa/WZZGrokxCrz1t5NqpV
 zbfIU0Lsn4VDV0LH/JH5MV+TEWWHMcKk4HWFFun33IDvx6iUeBq0RBfxQ2ySPeeXXjtr
 lxXjD5kdu4IJOb/cY6p5IvDBZOtl+Fr/fEVaSGUWtWh68RT7Vdr2yCEVWL9dLr7MiZvb
 qlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WefOljf8fdhmjWPE5xhjjCetqPi5nsbB6AvHzk0HJ3g=;
 b=Xqyqa5jS30Rs/Mnsu9A5P65tz58603XPc42cuyeQo3s3cqZFwZNwChHUoEL5r1cPt9
 lOy6cWvqG1dtx8FvT9iLMBliICG/WM2eTl4MXU1YhqHy0LhiG69gvEwUZ3laxkI0iYYN
 PMHuzbV9l+OMAiaUWriHN2t0YqOM/lTooJrC0zFix1AVj4hWIjodW9emW0rbzpDfWukp
 Gx4x2B5BfrrJHidR4UiovKa3j+qImRQU2/1Y9lnaaXUDjm90JKSo8sL2m4hXLxn+w89O
 Yo5oqJsO577eRjfcA5eVHn93EH6nqsicdDrBhpD2kWS184mD4pDUBYs/98xd0f+6h/Ay
 J9hg==
X-Gm-Message-State: APjAAAVqRiiiZiwpA5GDg3mcTqS7cjDdvbkNlr8v7t7z1X1YqLPTfwRU
 lgGNvb9cklYWXO7FqnK600eIa32kwAXmwDsdrfo=
X-Google-Smtp-Source: APXvYqzoTQoAxeXWAJlgpBBzqpoJGTz4kgwTP7iOZv+FJnkh+V75pB+m7sIHaMLuXtf5bQt1b9HzU4KEmfCFtK8sDxo=
X-Received: by 2002:a50:ab5b:: with SMTP id t27mr17383922edc.229.1582007872419; 
 Mon, 17 Feb 2020 22:37:52 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
In-Reply-To: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 18 Feb 2020 07:37:41 +0100
Message-ID: <CAAfyv34yO7bSR9GBod1bXpD0sFnsSETsJQAzcmSgyY0orGtfcg@mail.gmail.com>
Subject: Re: [yocto] Change RO rootfs failed RF Kill Switch Status and Failed
 to start Run pending postinsts
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_223754_610107_9BAE1046 
X-CRM114-Status: GOOD (  11.86  )
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
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Feb 18, 2020 at 2:00 AM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> Apologize for the cross posting.
>
> I am running kernel 4.19.75 on iMX6 customized device with WiFi and 4G
> LTE, it was running well in an RW rootfs. After I have just changed
> rootfs to RO UBIFS partition, it failed RF Kill and postinsts I
> suspect both try write to the RO and failed, any advice how to fix it?
> Despite it failed RF Kill and postinsts, it was still working.
>
> [    6.097762] UBIFS (ubi0:2): UBIFS: mounted UBI device 0, volume 2,
> name "rootfs-volume", R/O mode
> ..............
> [    6.151932] VFS: Mounted root (ubifs filesystem) readonly on device 0:13.
> .................
> [  OK  ] Listening on Load/Save RF Kill Switch Status /dev/rfkill Watch.
>          Starting Load/Save RF Kill Switch Status...
> [FAILED] Failed to start Load/Save RF Kill Switch Status.
> See 'systemctl status systemd-rfkill.service' for details.
Can you pls provide output of systemctl status systemd-rfkill
There should be some more info what issue is.
>
> [FAILED] Failed to start Run pending postinsts.
> See 'systemctl status run-postinsts.service' for details.
Pls this one also: systemctl status run-postinsts
> ...............
> root#
>
> Thank you.
>
> Kind regards,
>
> - jh
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#48463): https://lists.yoctoproject.org/g/yocto/message/48463
> Mute This Topic: https://lists.yoctoproject.org/mt/71363457/900721
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub  [marek.belisko@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-

BR,

marek

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
