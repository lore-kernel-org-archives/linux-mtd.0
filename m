Return-Path: <SRS0=cCt4=KS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A15C47080
	for <linux-mtd@archiver.kernel.org>; Sun, 23 May 2021 16:46:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 920FC61166
	for <linux-mtd@archiver.kernel.org>; Sun, 23 May 2021 16:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 920FC61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwTARKv9pDn3jqWOohjZRx28nq5yCuvmTNqFprHT2jI=; b=JIR8uvBCqpgwfweUgLkQDu3TVS
	mLRwUcq6bguGlxL+DtAfUvgCkPJeC9sZ/4SNXB0AxhGd39yCk4dqBHWvG3kXj8WZZ6QLwJ4GgYN5V
	R7gZwiHN9QdzzW9qMakEWlBzSPtsSiAhuf+uMCFDdjyyFWU9Si3v4scmJF5Z7AgsJAlpsoJvdZYF0
	SSkXTSgwFlraxn5WiibNKbSlNMf12eYv88Ja49JbPuvTSSWY5W0iwE9EOTJqxoYL+iaklJfg/nhnS
	grwX9Cx0GrMcfgwFQAPduoI1qtGs6AOHGqndj1GxPMRkQ/fL4wT1yLR7b7Ree0Cht1mRGlbruvBZU
	mzSbQKwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkrDc-004dpj-Ss; Sun, 23 May 2021 16:44:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkrDX-004dpR-Lk
 for linux-mtd@desiato.infradead.org; Sun, 23 May 2021 16:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WAFb3erVyh9l7NbV9IVwXoe/tovaucpjdp9+mTsw0mY=; b=0iZtaL33s9/EEH38+NWQ1dilAQ
 xXqHf5B7RpOz+PLVTweV9+uUmXJ9F+1BtO/cD0xnAi5+rMB3tNXUzRRYoqWx1jjm7na5TH2yck3M0
 BsIBwA6V/FpMBcVaNudafabNbf7MaD54RJAQzgd0vvB68WIaU0RY7OcCaIEj5btSgpH/v2IHL6ue8
 NiV/tb3LzxsHIhWpn2QuRA6mXHDVlIJjepiXapPo/xO2wwYo7dZpM3cDKtbBJXlwpu6c60h/4mjCH
 77YkV1iCRsjK+oNKIWil/xUpXuAZ+pPV92OSADTaEUNW7DOZ0M8nDK8m19gbbB8dFBvmkT+WTZv82
 UtSIPxXA==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkrDU-000VBM-MO
 for linux-mtd@lists.infradead.org; Sun, 23 May 2021 16:44:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id l1so37959940ejb.6
 for <linux-mtd@lists.infradead.org>; Sun, 23 May 2021 09:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WAFb3erVyh9l7NbV9IVwXoe/tovaucpjdp9+mTsw0mY=;
 b=UNlC+LppBUnPJsgnPozFUrzg9ihAxdNmxtnSQo6Q0AyniKM34c5rh5mVrnIqVjIQxE
 NjCjWwrBVX5KJDhVh/WiKm48b3muANovfZoQfXnAEEynmOfQyzWIWJozeMmy+h27Lm8S
 D71HnsJHcQjEm3of8sdgSEIsUfajRmRYvFjYGOr+8cJZvLCBpSA3CAhqYYeV0WV/K7ed
 P4XqpbJocXZpzBic3+ExSV/gDE+d4hJVRPT2++yHQa1OnSD7xhia5NbSGv/hacHwWUMc
 e+qFPlhIe3NF9YJTsgIL0rNKzURW/gWP6EhQ/9NVvpQJmEZ3Ga3IPhsylPxE6ktbBOWU
 ZkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WAFb3erVyh9l7NbV9IVwXoe/tovaucpjdp9+mTsw0mY=;
 b=HzoXGB0ufqrWb+b4dMYhhufgwBlVIXO+8tG9GNEDlxmk47FXFiJojEBcSBgfnPw4Cg
 CytJ4kHmh7hdwPyuZWXxKUusoACetMtw4crp/1kfyUYJdyXvsql1Tj8t0jyiBz8py4If
 i9Bv4GKeGkDXfsBxtr90IIj6DI6e90BcpsEIa1YgkU/oywgObGtKRIqRd7N2JSOUO1pf
 fBlcT2pdFbWkl+TstP8N3kfbrJAZGoxtnBtZdZHavXjj2CQYob+xn3I/qyHx7/yN2D9c
 pyNrm2Rfe0bIW9bC1P6ga8L1EfIxk8A4DDcoqZH53qRCUsZiK3S/LpdBzZ+7W9T7ZyfD
 9fcQ==
X-Gm-Message-State: AOAM531sc8sdJ+tGX1ccF56ALZ6x+deCrxYy3WyannJsSy5jj1/PzPJJ
 QS+NkuHQvk8wUWlIv+oBkfva7VZ+WRXG6yX3+iM=
X-Google-Smtp-Source: ABdhPJyATAZTZbl8eyO8apZqTIlULc0XOMVCun2e1vUJkIhWR0MkASvVTYla8WDJRXsEuXTtwt8NkzXo7a8rO2RlyhA=
X-Received: by 2002:a17:907:2646:: with SMTP id
 ar6mr18934656ejc.293.1621788278247; 
 Sun, 23 May 2021 09:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjgpkBh9dnfNTdDcfk5HiL=HjjiB9o_=fjrm+0vP7Re2Q@mail.gmail.com>
 <CAOuPNLh_0Q9w96GKT-ogC0BBcEHgo=Hv3+c=JBcas2VgqDiyaw@mail.gmail.com>
 <CAOuPNLjmJ0YufFktJzjkyvdxwFTOpxVj5AW5gANAGSG=_yT=mQ@mail.gmail.com>
 <1762403920.6716767.1621029029246@webmail.123-reg.co.uk>
 <CAOuPNLhn90z9i6jt0-Vv4e9hjsxwYUT2Su-7SQrxy+N=HDe_xA@mail.gmail.com>
 <486335206.6969995.1621485014357@webmail.123-reg.co.uk>
In-Reply-To: <486335206.6969995.1621485014357@webmail.123-reg.co.uk>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Sun, 23 May 2021 22:14:26 +0530
Message-ID: <CAOuPNLjBsm9YLtcb4SnqLYYaHPnscYq4captvCmsR7DthiWGsQ@mail.gmail.com>
Subject: Re: [RESEND]: Kernel 4.14: UBIFS+SQUASHFS: Device fails to boot after
 flashing rootfs volume
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: open list <linux-kernel@vger.kernel.org>, sean@geanix.com, 
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_094440_773183_E36AAB43 
X-CRM114-Status: GOOD (  28.41  )
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

On Thu, 20 May 2021 at 10:00, Phillip Lougher <phillip@squashfs.org.uk> wrote:
>

> Then run it on your Squashfs image
>
> % unsquashfs <your image>
>
> If the image is uncorrupted, it will unpack the image into
> "squashfs-root".  If it is corrupted it will give error
> messages.
>
I have tried this and it seems with unsquashfs I am able to
successfully extract it to "squashfs-root" folder.

> I have not used the MTD subsystem for more than 13 years, and so
> this is best answered on linux-mtd.

Yes, I have already included the linux-mtd list here.
Maybe MTD folks can share their opinion as well....
That is the reason I have changed the subject as well.

> You appear to be running busybox, and this has both support for
> "dd" and the "md5sum" checksum program.
>
> So do this
>
> % dd if=<your character device> of=img bs=1 count=<image size>
>
> Where <image size> is the size of the Squashfs image reported
> by "ls -l" or "stat".  You need to get the exact byte count
> right, otherwise the resultant checksum won't be right.
>
> Then run md5sum on the extracted "img" file.
>
> % md5sum img
>
> This will produce a checksum.
>
> You can then compare that with the result of "md5sum" on your
> original Squashfs image before flashing (produced on the host
> or the target).
>
> If the checksums differ then it is corrupted.
>
I have also tried that and it seems the checksum exactly matches.
$ md5sum system.squash
d301016207cc5782d1634259a5c597f9  ./system.squash

On the device:
/data/pintu # dd if=/dev/ubi0_0 of=squash_rootfs.img bs=1K count=48476
48476+0 records in
48476+0 records out
49639424 bytes (47.3MB) copied, 26.406276 seconds, 1.8MB/s
[12001.375255] dd (2392) used greatest stack depth: 4208 bytes left

/data/pintu # md5sum squash_rootfs.img
d301016207cc5782d1634259a5c597f9  squash_rootfs.img

So, it seems there is no problem with either the original image
(unsquashfs) as well as the checksum.

Then what else could be the suspect/issue ?
If you have any further inputs please share your thoughts.

This is the kernel command line we are using:
[    0.000000] Kernel command line: ro rootwait
console=ttyMSM0,115200,n8 androidboot.hardware=qcom
msm_rtb.filter=0x237 androidboot.console=ttyMSM0
lpm_levels.sleep_disabled=1 firmware_class.path=/lib/firmware/updates
service_locator.enable=1 net.ifnames=0 rootfstype=squashfs
root=/dev/ubiblock0_0 ubi.mtd=30 ubi.block=0,0

These are few more points to be noted:
a) With squashfs we are getting below error:
[    4.603156] squashfs: SQUASHFS error: unable to read xattr id index table
[...]
[    4.980519] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(254,0)

b) With ubifs (without squashfs) we are getting below error:
[    4.712458] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0,
name "rootfs", R/O mode
[...]
UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node type (255 but expected 9)
UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node at LEB
336:250560, LEB mapping status 1
Not a node, first 24 bytes:
00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff

c) While flashing "usrfs" volume (ubi0_1) there is no issue and device
boots successfully.

d) This issue is happening only after flashing rootfs volume (ubi0_0)
and rebooting the device.

e) We are using "uefi" and fastboot mechanism to flash the volumes.

f) Next I wanted to check the read-only UBI volume flashing mechanism
within the Kernel itself.
Is there a way to try a read-only "rootfs" (squashfs type) ubi volume
flashing mechanism from the Linux command prompt ?
Or, what are the other ways to verify UBI volume flashing in Linux ?

g) I wanted to root-cause, if there is any problem in our UBI flashing
logic, or there's something missing on the Linux/Kernel side (squashfs
or ubifs) or the way we configure the system.

Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
