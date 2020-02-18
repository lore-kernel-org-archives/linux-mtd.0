Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4C5C34031
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 04:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CAC020801
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 04:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="be6QY8rd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOUEdj2a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CAC020801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fk90wrCFWknoQSpIhscy2iX7pF2qv4PQyUcGHFTtvKg=; b=be6QY8rdhE4XS8
	MJV6ij0NaN34P4nCAS41GnZF2nVQyJ/9WmGPbcDgQ2rpsG9zXy/VdTPl2PbynovoZcVVb6aOLt0H2
	bn2uZ43WXdBRmxDO0TPhc5sM5wubvbwrqVubn3KnHOYDS7j8ZF8AZC67T7WdKlpgExCL4LWPGAAea
	5CxLUzy79Yar6r7MIKyVNIcD9QQevnPBeD5go2WdzufxW2j1EC+VkCeN47NnyMnOyByVkj30rqXyw
	6jIxJTaFoaf2BACAEL6tOl0Oxbavq+XYf4p6aNVJYjaPSiQ2t2gq3HC617bjvSERmXpKQXl8pmTPn
	cr37jL9/tp9qhgm6DQbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3ubb-00021k-2a; Tue, 18 Feb 2020 04:35:31 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3ubY-00021O-9C
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 04:35:29 +0000
Received: by mail-io1-xd35.google.com with SMTP id z193so20853560iof.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2020 20:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=TUcXvtRx45Y+TZ52Ol/EkqkzI32zvHfIfp9ABJYLpog=;
 b=QOUEdj2awMSDsHUYaWS7FIU3Rjs7FxXUK8MOc5tBpgUhgFFASAdR1ZBGXmWl96iF3y
 FupXapPp5hnVBEto8/yhXCeHdcBZ/GX+5G0yew17AB/7cpwB1FGQpDFjwWoewl0Gc3DR
 7Xbiz0EU9j8OUju4MFTLJJLx1FT/HKvsmGXyHcFgeRnpKJVovqi44E6MZs3uRilp1BJ/
 xGhqiGnAQcV2Ma9xovHOABu4QvNWY2PBkd9dZKJ4gkhNMTewJCvDPvmimzC6DWUDn2fQ
 58fZNrQCw694of/x73HTAzsPBJrVGoe1A4fYe+LPP4Lid/Xo0uA/UfrHCt9IB90SxCdd
 Beew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TUcXvtRx45Y+TZ52Ol/EkqkzI32zvHfIfp9ABJYLpog=;
 b=cKJ8Q4bgjfjvQpYzFHhuH0hskUwtwxGf4FDzNjDSJJxR0y856JmbVnB9GsqXU+sYka
 4aLtYVdhEFRLGI8L6qVrPWARJHsGWZYblBv1mupNLTnJ96724g/8tVxjNt89h9NLd9Xs
 LKkldUGk4KrFeyXdmOFI5foFADUzoz/L3GaT/+vPZqksTk8WuxUx8sQrGk+ajSa/s6c6
 t2qTGB+NZa0ndK2sIf2PtXZY+StqP597hjtA4PD1+vsTan7oxEvsmPybzF2CiLdiB1gf
 yNy99ErecqYKI8FMl3LWgTeUMclkgiwtSueY8/rFWTx2XdyYL3TuS/7Uo3bh58cchdiQ
 U22w==
X-Gm-Message-State: APjAAAXIMh+SVKeaprxCEWcL29zwbqZzgJ4QoXHgu3fH5XMPSdr6T4rk
 3Du0xeZEvK9euuCJ19eXWIjIXF07ij41SyikiIw=
X-Google-Smtp-Source: APXvYqzuJ8+MKyZupZqpupr12gG9m3qPLdz9X2HRBPDd3EEoZTOsqe4KhfFrVPWtcy0wBoThKgP/0zBkQrXCV05Y0/U=
X-Received: by 2002:a6b:d912:: with SMTP id r18mr13828656ioc.306.1582000526158; 
 Mon, 17 Feb 2020 20:35:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Mon, 17 Feb 2020 20:35:25
 -0800 (PST)
In-Reply-To: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
References: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 18 Feb 2020 15:35:25 +1100
Message-ID: <CAA=hcWQ_6n4Sy66GoYxLgFJu-CwtaS1m-vAT_wVMTgDZ2qkarg@mail.gmail.com>
Subject: Re: Change RO rootfs failed RF Kill Switch Status and Failed to start
 Run pending postinsts
To: linux-wireless <linux-wireless@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_203528_347772_C3FBC5C9 
X-CRM114-Status: GOOD (  11.34  )
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
 linux-mtd <linux-mtd@lists.infradead.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It also seems mwifiex_sdio tried to write to RO rootfs and failed and
triggled RF Killm, does mwifiex_sdio needs some system directories for
RW?

[   26.636845] mwifiex_sdio mmc0:0001:1: mwifiex_process_cmdresp: cmd 0x242 fain
         Starting Load/Save RF Kill Switch Status...
[   26.852990] mwifiex_sdio mmc0:0001:1: info: MWIFIEX VERSION: mwifiex 1.0 (14
[   26.861518] mwifiex_sdio mmc0:0001:1: driver_version = mwifiex 1.0 (14.68.36
[FAILED] Failed to start Load/Save RF Kill Switch Status.
See 'systemctl status systemd-rfkill.service' for details.
         Starting Load/Save RF Kill Switch Status...
[FAILED] Failed to start Load/Save RF Kill Switch Status.
See 'systemctl status systemd-rfkill.service' for details.
         Starting Load/Save RF Kill Switch Status...
[FAILED] Failed to start Load/Save RF Kill Switch Status.
See 'systemctl status systemd-rfkill.service' for details.
         Starting Load/Save RF Kill Switch Status...




On 2/18/20, JH <jupiter.hce@gmail.com> wrote:
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
> [    6.151932] VFS: Mounted root (ubifs filesystem) readonly on device
> 0:13.
> .................
> [  OK  ] Listening on Load/Save RF Kill Switch Status /dev/rfkill Watch.
>          Starting Load/Save RF Kill Switch Status...
> [FAILED] Failed to start Load/Save RF Kill Switch Status.
> See 'systemctl status systemd-rfkill.service' for details.
>
> [FAILED] Failed to start Run pending postinsts.
> See 'systemctl status run-postinsts.service' for details.
> ...............
> root#
>
> Thank you.
>
> Kind regards,
>
> - jh
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
