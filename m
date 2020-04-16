Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19302C3815B
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 17:04:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E244D20732
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 17:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N1CVtkgt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lglq4zhg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E244D20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnQ5mBggUFAgjjfExITgSGzihYWVHAO+8kw/LxEbvoA=; b=N1CVtkgth51UdI
	pLg+fZhB5eFoCQqXqWb1CqEKEI1yk/Kot62cxnmJXAWgwLF8btkHvLdzQU7NB5U0FuUOz08XAl9bo
	svd8Q46SSaBBessa0NqgsaDPd52nVVM9dnxEwHE/9eS73BJE4VjSCM14a2b69Ej0ETRT28MtGtMz3
	pBSFtY1tBdYaufQmqoaWBJAF1bkIFmyeDbNQNRnwdEvHlT0qbTqPzobRv3VXh0bai+tW24/bou1sZ
	kOA5n99aupws+Nr2HNJ/13/BAkqrCv58c6BCjyL1ovos/C9GdsB+mArv0jNa1l6Zbt68Ft1SiyOyf
	sg9s71jUIDOZIIJeimXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP7vj-0000lj-RK; Thu, 16 Apr 2020 17:03:59 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP7vW-0000Qr-GK
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 17:03:48 +0000
Received: by mail-lj1-x242.google.com with SMTP id r24so8651507ljd.4
 for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2020 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xbeLxo73NH77r68D3ullEkGVb9CgBQ2dP7I8rPq0gBs=;
 b=lglq4zhgkl9AFMiztMa/60ASuCavgd7BeXA1U/yykbdwX8EvR3U55v42PeKXS9/HjK
 U7pfVJciaVw3V1yhUfvwfi7XX18EnNu4VKtwdEMTWcf2lqatT/ghwWPMZq9wCxha1EE+
 7hEheLmvRDX9HxLAphuWGJBlR/7gfGSKyO8pnVRdA0RAUGTlwaz5t2hOykPCR/Uq5Fiq
 6vPevB89+ypqtYR+WWEj+moMOnu9ZjzncRc2LabOgoswbgurcZ1Mq6v7rzYgMf7LS7Fz
 HcakLEfNWcDGbahcoXgi6i9rD3biVQnWmvuivnfm2cXHWQUwTojpBQj7gWBhl3i0N1/t
 Qcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xbeLxo73NH77r68D3ullEkGVb9CgBQ2dP7I8rPq0gBs=;
 b=EO7wJHDSQuL7fdk9diQXzABrJbfZBH6Ea6rDHi+nhK+vSuI4RWQ5tHdQQR6cFWI13p
 eRSdAf1nJ02DAlFpSfgFVkfsY93cbbrd4Oi7GhO/I6+WU09AP5fgMoTPs/a+fMf+3c+I
 WPV+htZRy2LIvC2yYbXjHPThPhxGvlzVUSLIXtJBIkwqszGuJGhXrNFStY33vmxGqcbU
 QFQKFKLrqBz/JjGjw2NneB7eo0QPYy00/O7/sTkXUrKhOCIAvof7poIPmYgsW9Mhwo57
 bSqSbtwxqqWOiiiXW2yTZgMHl/Z/n0SjMyBoLuY6LJXLWIdIGLT9HzwRzw8MkiYBsurk
 QrTg==
X-Gm-Message-State: AGi0PubGoNQzBdhkRpHcOHqaweZEkcyGuYjE5GGcCb9CIMbx5Kwwjw5K
 79VxJOqQywOMx4C1OmMZ5JOeAltKGjkrg7tKR2m/Nw==
X-Google-Smtp-Source: APiQypIgAYo0tcs0mvZyrFJ0IfPRE7Z5YfjzA0P0F0vr9dOwcIYigV95sjzKOcQ2uMBapEh8+yyey9Uer4dhCviCNLc=
X-Received: by 2002:a2e:b6cf:: with SMTP id m15mr6819492ljo.168.1587056623096; 
 Thu, 16 Apr 2020 10:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200406160914.14698-1-rminnich@google.com>
 <CACRpkdYVwFiCf5MJGLEyhxL8omxr9Tav=8Le_zEX-D89SXjV1Q@mail.gmail.com>
 <CAP6exY+pDg8rAi4RZw5s5jZh1awtWg6_Q5=tm6RYC4c+XZz+cQ@mail.gmail.com>
In-Reply-To: <CAP6exY+pDg8rAi4RZw5s5jZh1awtWg6_Q5=tm6RYC4c+XZz+cQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Apr 2020 19:03:31 +0200
Message-ID: <CACRpkdYVL+DtxgXk5F=jH8dPD=6qu=DbekOYZmTx9vu7L=MScw@mail.gmail.com>
Subject: Re: [PATCH] mtd: parsers: Support '[]' for id in mtdparts
To: ron minnich <rminnich@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_100346_563004_3D59B3B4 
X-CRM114-Status: GOOD (  22.49  )
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
Cc: Vignesh R <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Ronald Minnich <rminnich@google.com>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 4:55 PM ron minnich <rminnich@gmail.com> wrote:
> On Thu, Apr 16, 2020 at 2:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > I suppose the use case is using PCI-based MTD devices for testing
> > something android images on desktops? I'm surprised it didn't
> > come up earlier.
>
> Thanks. In this case it's for systems that companies are deploying
> into their data centers, using linuxboot (linuxboot.org) and Intel
> chipsets. On Intel  chipsets, there is a 64 MiB SPI part, but only 16
> MiB is directly addressable.

Aha, now I get the use case.

> Linux goes in the memory-addressable part of the SPI, and UEFI loads
> it into RAM, since to UEFI the kernel is just another UEFI driver --
> in fact in most cases we replace the UEFI shell with Linux.
>
> But we need a file system, and with the huge amount of drivers that
> come with UEFI there's not much room in the top 16M. (we're working to
> fix that glitch, a process we call DXE-ectomy, but it takes time).
>
> We wish to place a file system in the low 48 MiB -- lots of room there.
>
> So what one can do is put a squashfs-formatted file system in that low
> part of SPI, and, using this mtdparts capability, point the kernel at
> it ("root=/dev/mtd1 mtdparts=[a:b.c]etc.etc"). It's a lifesaver for
> those of us using u-root for our userland.

This makes a lot of sense.

Something I have had ideas about upstreaming is the partition
splitter and automatic rootfs configuration from OpenWrt.
Is this something you would have an interest in for your type
of deployments?

I post some of my (never finished) commit text for your reference:

What the MTD partition splitter code does is to take a
partition, already covering an even number of erase blocks
in the flash, and subdivide it at erase block granularity
into sub-partitions.

This structure is created when the raw images are produced
during compilation of a system: scripts that are aware
of the geometry of the flash (such as erase block size)
will catenate the different parts into a compound
partition that can later be split.

The typical consituents of a split partition are:

 [kernel (z)Image]       "kernel"
 squashfs rootfs         "rootfs"
 JFFS2 writeable area    "rootfs_data"

In the simplified case only the squashfs and JFFS2 are
combined into one split partition, let's say this
partition is named "firmware" (a common convention).

The typical scenario for the above layout is:

- Begin compiling the flash image with the kernel image,
  pad that up to the end of the current erase block
- Catenate the squashfs and pad that up to the end of
  the current erase block
- Catenate a JFFS2 emtpy filesystem" marker at the
  beginning of the next erase block

When the splitter examines this, it will split this
"firmware" partition into a kernel partion, a
squashfs "rootfs" partition, and a partition with just
empty space named "rootfs_data", while still keeping
the overarching "firmware" partition in place.

When the kernel boots, it will mount the squashfs "rootfs"
partition as root filesystem, and then when the system
properly comes up mount the "rootfs_data" partition with
overlayfs so that the root filesystem becomes writeable,
while keeping all the read-only content in the squashfs
and all modifications in the JFFS2 partition.

This way all the available flash memory in the "firmware"
partition is used pretty optimally: "kernel" can grow
to the size it needs (such as a new kernel version taking
up more space) same for the squashfs "rootfs" after it.
Whatever remains after the kernel and the rootfs can be
used for storing data.

When the device kernel and rootfs needs to be upgraded,
it can simply unmount the filesystems and overwrite and
erase the "firmware" partition with the new version,
and the whole system is dynamically repartitioned with
the new images: if they grew over a flash block boundary
then the filesystem will be augmented upwards.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
