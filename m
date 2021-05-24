Return-Path: <SRS0=Em5B=KT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939F9C04FF3
	for <linux-mtd@archiver.kernel.org>; Mon, 24 May 2021 16:35:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60006613CC
	for <linux-mtd@archiver.kernel.org>; Mon, 24 May 2021 16:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60006613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XZ/FBfD1DNuaOQce5UMu6WlGO5tz/ImNJLHiDnKAq8=; b=doRPwvuANhMD9Y
	WPy5freMYdid/JjpoQvCNMttOZLsJfOSDDauR0jidMqTjoTYfy9eT91kRxyxRecny+MMZnMrMycdJ
	7AhNkp/WrohMc6rLpWxspR1UyK7L7sO4775Eg+F0Y2Mwk2tzYrU7RvZVKR2H/Adzd6nzo7oV20WYw
	AZiN3NuuefHv7Te1GIxyPV8aU2kT7TjMw/80WRxhnPgoDoGZO4cAOviMVMUitU/uA7tNs3mNTVVNq
	xJpbfTV2YEoWuuF0guL0vsqaWP0iDxEymf7jpNtoFTg21jwEjrtF3cbU/yR+tj0MnhK6D/5iA3T6H
	BKC6RBXsg8QKw3kcHlKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llDWX-0017iX-S6; Mon, 24 May 2021 16:33:50 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll3pM-000iOp-Ag
 for linux-mtd@lists.infradead.org; Mon, 24 May 2021 06:12:38 +0000
Received: by mail-ed1-x531.google.com with SMTP id o5so21534625edc.5
 for <linux-mtd@lists.infradead.org>; Sun, 23 May 2021 23:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hhOQ+3PnmtXS7jeKF5xJhY6qbzCwQzVVWo4zeree8hs=;
 b=naebN6p/UxIcQ+V8vhy/F5D16md5+KHPlmOf0s4j8UQFANhGSp73jwvATUo5DFNrxt
 +56s1O5opC7ATWauOKpMAAydTIc7HLCpYfCoHleweVKa85mEYRfvLh+Gd0fetwpvNZir
 hNIyHAUVfgXmWwhk0Y5HXZu/5nZI7PNhiCCn71GS0pWgzewlKf9JPdQRFF9PUOJ5XMbN
 nNqAMRfSiTJZVHhzvgJk7O+BHmENmr+5FRUylYMTMjI+QaQ0pI4tLc8FGCySfyR6TGpv
 o6fFXzcvZT4fjHc6l0OJ9v5TAZ02HWDerrVL0bFILYnfmhM4+aTGYpbqeszXq8oji2nI
 jRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hhOQ+3PnmtXS7jeKF5xJhY6qbzCwQzVVWo4zeree8hs=;
 b=GusMvqNjraGYCL8jsrXzCRpRr2HJf5A9vyxR9xiHZ7EeixgbttgNa7Ar8aA9jUy9Fp
 tg2//JC26PJ28ag0gNWBZ+VIdtE6hzenJb0+DQOzBA6yfTGpy4GfPZxSoVga5B/T0Hou
 UV4QDuX939Qj7A/Bgu14J6mQFOWUoaiKukSxby1Gbw6lyNvFgAqD3EUNnB8YFNrLw1iq
 N+2iPyC8epXous0UVwvWNjVoJtVJJ+Yj7nEZ4ZNP1gn/2QRxVdUIeIi8OU9mjLw2PvD1
 1YttM6vpey9q+h2ftpXWl8KfeWtcWirB0ikZBgfD30HtS53pGhqmxnOvPca03Vpsypg/
 lIEQ==
X-Gm-Message-State: AOAM532m3JmFqMeCY2czqiwDewd46D4n/HxiqUMH16KFaoRyWFNBI95H
 uQUK0qOlDJZm29M/CPJulyGY7o1NG3UXqXiPiIk=
X-Google-Smtp-Source: ABdhPJwH3q+t5hXk5XDVhhsG59ZC4OyYkN8bOTpJTY2NX3pC/1QQKPuncW3mIoKpw4XD6LbfKO9bAidTvvoCA5tlbkY=
X-Received: by 2002:a05:6402:15:: with SMTP id
 d21mr20753715edu.66.1621836754681; 
 Sun, 23 May 2021 23:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjgpkBh9dnfNTdDcfk5HiL=HjjiB9o_=fjrm+0vP7Re2Q@mail.gmail.com>
 <CAOuPNLh_0Q9w96GKT-ogC0BBcEHgo=Hv3+c=JBcas2VgqDiyaw@mail.gmail.com>
 <CAOuPNLjmJ0YufFktJzjkyvdxwFTOpxVj5AW5gANAGSG=_yT=mQ@mail.gmail.com>
 <1762403920.6716767.1621029029246@webmail.123-reg.co.uk>
 <CAOuPNLhn90z9i6jt0-Vv4e9hjsxwYUT2Su-7SQrxy+N=HDe_xA@mail.gmail.com>
 <486335206.6969995.1621485014357@webmail.123-reg.co.uk>
 <CAOuPNLjBsm9YLtcb4SnqLYYaHPnscYq4captvCmsR7DthiWGsQ@mail.gmail.com>
 <1339b24a-b5a5-5c73-7de0-9541455b66af@geanix.com>
In-Reply-To: <1339b24a-b5a5-5c73-7de0-9541455b66af@geanix.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 24 May 2021 11:42:23 +0530
Message-ID: <CAOuPNLiMnHJJNFBbOrMOLmnxU86ROMBaLaeFxviPENCkuKfUVg@mail.gmail.com>
Subject: Re: [RESEND]: Kernel 4.14: UBIFS+SQUASHFS: Device fails to boot after
 flashing rootfs volume
To: Sean Nyekjaer <sean@geanix.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>,
 open list <linux-kernel@vger.kernel.org>, 
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_231236_413232_EE130645 
X-CRM114-Status: GOOD (  37.88  )
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

On Sun, 23 May 2021 at 23:01, Sean Nyekjaer <sean@geanix.com> wrote:
>

> > I have also tried that and it seems the checksum exactly matches.
> > $ md5sum system.squash
> > d301016207cc5782d1634259a5c597f9  ./system.squash
> >
> > On the device:
> > /data/pintu # dd if=/dev/ubi0_0 of=squash_rootfs.img bs=1K count=48476
> > 48476+0 records in
> > 48476+0 records out
> > 49639424 bytes (47.3MB) copied, 26.406276 seconds, 1.8MB/s
> > [12001.375255] dd (2392) used greatest stack depth: 4208 bytes left
> >
> > /data/pintu # md5sum squash_rootfs.img
> > d301016207cc5782d1634259a5c597f9  squash_rootfs.img
> >
> > So, it seems there is no problem with either the original image
> > (unsquashfs) as well as the checksum.
> >
> > Then what else could be the suspect/issue ?
> > If you have any further inputs please share your thoughts.
> >
> > This is the kernel command line we are using:
> > [    0.000000] Kernel command line: ro rootwait
> > console=ttyMSM0,115200,n8 androidboot.hardware=qcom
> > msm_rtb.filter=0x237 androidboot.console=ttyMSM0
> > lpm_levels.sleep_disabled=1 firmware_class.path=/lib/firmware/updates
> > service_locator.enable=1 net.ifnames=0 rootfstype=squashfs
> > root=/dev/ubiblock0_0 ubi.mtd=30 ubi.block=0,0
> >
> > These are few more points to be noted:
> > a) With squashfs we are getting below error:
> > [    4.603156] squashfs: SQUASHFS error: unable to read xattr id index table
> > [...]
> > [    4.980519] Kernel panic - not syncing: VFS: Unable to mount root
> > fs on unknown-block(254,0)
> >
> > b) With ubifs (without squashfs) we are getting below error:
> > [    4.712458] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0,
> > name "rootfs", R/O mode
> > [...]
> > UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node type (255 but expected 9)
> > UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node at LEB
> > 336:250560, LEB mapping status 1
> > Not a node, first 24 bytes:
> > 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > ff ff ff ff
> >
> > c) While flashing "usrfs" volume (ubi0_1) there is no issue and device
> > boots successfully.
> >
> > d) This issue is happening only after flashing rootfs volume (ubi0_0)
> > and rebooting the device.
> >
> > e) We are using "uefi" and fastboot mechanism to flash the volumes.
> Are you writing the squashfs into the ubi block device with uefi/fastboot?
> >
> > f) Next I wanted to check the read-only UBI volume flashing mechanism
> > within the Kernel itself.
> > Is there a way to try a read-only "rootfs" (squashfs type) ubi volume
> > flashing mechanism from the Linux command prompt ?
> > Or, what are the other ways to verify UBI volume flashing in Linux ?
> >
> > g) I wanted to root-cause, if there is any problem in our UBI flashing
> > logic, or there's something missing on the Linux/Kernel side (squashfs
> > or ubifs) or the way we configure the system.

>
> Have you had it to work? Or is this a new project?
> If you had it to work, i would start bisecting...
>

No, this is still experimental.
Currently we are only able to write to ubi volumes but after that
device is not booting (with rootfs volume update).
However, with "userdata" it is working fine.

I have few more questions to clarify.

a) Is there a way in kernel to do the ubi volume update while the
device is running ?
    I tried "ubiupdatevol" but it does not seem to work.
    I guess it is only to update the empty volume ?
    Or, maybe I don't know how to use it to update the live "rootfs" volume

b) How to verify the volume checksum as soon as we finish writing the
content, since the device is not booting ?
     Is there a way to verify the rootfs checksum at the bootloader or
kernel level before mounting ?

c) We are configuring the ubi volumes in this way. Is it fine ?
[rootfs_volume]
mode=ubi
image=.<path>/system.squash
vol_id=0
vol_type=dynamic
vol_name=rootfs
vol_size=62980096  ==> 60.0625 MiB

Few more info:
----------------------
Our actual squashfs image size:
$ ls -l ./system.squash
rw-rr- 1 pintu users 49639424 ../system.squash

after earse_volume: page-size: 4096, block-size-bytes: 262144,
vtbl-count: 2, used-blk: 38, leb-size: 253952, leb-blk-size: 62
Thus:
49639424 / 253952 = 195.46 blocks

This then round-off to 196 blocks which does not match exactly.
Is there any issue with this ?

If you have any suggestions to debug further please help us...


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
