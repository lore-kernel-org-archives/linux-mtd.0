Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE59C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 15:35:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1528961205
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 15:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1528961205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5jJj+cigkHRK3PCbj7sL0J8C9hV/tORzBc+B9m8z4ks=; b=zl2h9en5JZGjP6CvBCETNFGh+Z
	l7befzNTa5xsaw5ZTsPpH7wf+RoYxGymXW/pRs+PaySKX/rhDq1ZUvIovPrnRIJ9mh3KwB6U16GiJ
	gITgRQINTC1QDd9k49Mwgv2Q4hQPQfLp3gDcmkBXC+c8C3LmJngJyb09wLEBx5jAPrEnkD+EB7vqs
	90eCd9SxEnFwC9A0RjRo2lUYZbG1BVrThXcI0eIkqxSCRZ8j0vTkINegPcOjkojiBchWnFC4VuMpK
	8FdFh6N+giWq9qZT97G2Zr+c5MVxXeBWdjexMRc1mZBFIyfcyUj31dJhEKSSZYebDnZfo/iGB55VR
	neMLfQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkT9R-002a4J-T9; Tue, 09 Nov 2021 15:35:09 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkT9M-002a34-T6
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 15:35:06 +0000
Received: by mail-ed1-x531.google.com with SMTP id x15so47093147edv.1
 for <linux-mtd@lists.infradead.org>; Tue, 09 Nov 2021 07:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=qNKxbY+CJKEKz5I5jfTajE0gm0ARDEZSOX6nNnQ06Ds=;
 b=TXmn+AUrGkmNG6aVTCQ0ceEBQWA2M0tCUS/XInhy1eodftrDVpbDBrlqrZo3ouldi8
 NJkXvXRXOaayYgUBC4m23zYND11+H90KgMe/DtN010GUmH+cm1Ca1n7elJHv1GuOq93i
 jhdYBhtB4KGGjpHGGM7alNugiLoMwZP0z9QLW1x3qBvAr8c+csj5oVu8tUSZqu3SSgZL
 w7RgWjtzV6oyKMBvdonnmhOCh4vx/Ug1DvwGx8uRM504DeU1cbpsWiKNk0iRbFQEAYoz
 88cyNWDPAcDtw5ltRTqLeART8tt8Qzj25UE+9iScIm8svh+kBXJuTXw4GpPKmboPJjPk
 57CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=qNKxbY+CJKEKz5I5jfTajE0gm0ARDEZSOX6nNnQ06Ds=;
 b=6wr37s7swwTktKipK44/6eTb3rJ46dzl5NsnSPtVud6T+BI09P+00JFszebE0eCd7y
 WCDgkQU4ta7zqs/XAhxC6DKVc4SEXH/KhyddWC5auhguBK5bHZ5gll5imEAYIE+nF83J
 CJBzkti7a7VIBX3T7MBWquq+YIRc0l519k4p9yk3wjd9c8ZENhPnbYaImRQVn5C9J6tL
 u7+mOUEAPtK2M/Q5/Koqkfhl+WS5dNFwtwqq3FDwxHBAY7wLjBbSuTMYAs8ZL6rv8hbY
 2yC+7hKx1upbMsRluHUpP859TIQY7SaZyUftVzn9vtX4D4M1u6a8MNSwWMHiyxdyNViy
 WlmQ==
X-Gm-Message-State: AOAM533Z4bNjVfhnoq9Rv8w6JT6ZgsFo6ggXo50I7mUUiPzQpTAiLuOw
 GIiet8TwAjkyiP/a+IThozBAhXktUnARU6UHWmE=
X-Google-Smtp-Source: ABdhPJz3XYwx9pVakfx2STu6CYLqj/G+Ya7i+K/njYwnyhQXDgoupRe5ikHsWAMxrdD4KeZhZ4/qfjONVlKpPr2sjMc=
X-Received: by 2002:a05:6402:3586:: with SMTP id
 y6mr11479655edc.332.1636472102206; 
 Tue, 09 Nov 2021 07:35:02 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLinoW5Cx=xbUcT-DB4RiQkAPpe=9hsc-Rkch0LxD0mh+Q@mail.gmail.com>
 <CAOuPNLgquwOJg85kDcf67+4kTYP9N=45FvV+VDTJr6txYi5-wg@mail.gmail.com>
In-Reply-To: <CAOuPNLgquwOJg85kDcf67+4kTYP9N=45FvV+VDTJr6txYi5-wg@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 9 Nov 2021 21:04:50 +0530
Message-ID: <CAOuPNLjFtS7ftg=+-K3S+0ndyNYmUNqXo7SHkyV4zK4G9bZ4Og@mail.gmail.com>
Subject: Re: Kernel-4.14: With ubuntu-18.04 building rootfs images and booting
 gives SQUASHFS error: xz decompression failed, data probably corrupt
To: open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, dm-devel@redhat.com, 
 Phillip Lougher <phillip@squashfs.org.uk>,
 Mikulas Patocka <mpatocka@redhat.com>, 
 Richard Weinberger <richard@nod.at>, Florian Fainelli <f.fainelli@gmail.com>,
 sumit.semwal@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_073504_968010_A93BFBD6 
X-CRM114-Status: GOOD (  22.76  )
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

On Tue, 9 Nov 2021 at 16:45, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> Hi,
>
> On Mon, 8 Nov 2021 at 20:00, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> >
> > Hi,
> > Here are few details.
> > * Linux Kernel: 4.14
> > * Processor: Qualcomm Arm32 Cortex-A7
> > * Storage: NAND 512MB
> > * Platform: Simple busybox
> > * Filesystem: UBIFS, Squashfs
> > * Build system: Linux Ubuntu 18.04 with Yocto build system
> > * Consists of nand raw partitions, squashfs ubi volumes.
> >
> > What we are trying to do:
> > We are trying to boot dm-verity enabled rootfs on our system.
> > The images for rootfs were generated on Ubuntu 18.04 machine using
> > Yocto build system.
> >
> > Issue:
> > Earlier, when we were using Ubuntu 16.04 to generate our images, the
> > system was booting fine even with dm-verity enabled.
> > Recently we switched to Ubuntu 18.04 build machine, and now with the
> > same changes we are seeing the below squashfs error, just after the
> > mount.
> > Note: with 18.04 also our rootfs is mounting successfully and
> > dm-verity is also working fine.
> > We only get these squashfs errors flooded in the boot logs:
> > {{{
> > ....
> > [    5.153479] device-mapper: init: dm-0 is ready
> > [    5.334282] VFS: Mounted root (squashfs filesystem) readonly on device 253:0.
> > ....
> > [    8.954120] SQUASHFS error: xz decompression failed, data probably corrupt
> > [    8.954153] SQUASHFS error: squashfs_read_data failed to read block 0x1106
> > [    8.970316] SQUASHFS error: Unable to read data cache entry [1106]
> > [    8.970349] SQUASHFS error: Unable to read page, block 1106, size 776c
> > [    8.980298] SQUASHFS error: Unable to read data cache entry [1106]
> > [    8.981911] SQUASHFS error: Unable to read page, block 1106, size 776c
> > [    8.988280] SQUASHFS error: Unable to read data cache entry [1106]
> > ....
> > }}}
> >
> Just one question:
> Is there any history about these squashfs errors while cross-compiling
> images on Ubuntu 18.04 or higher ?
>
One quick observation:
This issue is seen only when we enable dm-verity in our bootloader and
cross-building the bootloader/kernel (with Yocto 2.6 toolchain
arm-oe-linux-gnueabi-) on Ubuntu 18.04.
The issue is *NOT* seen (on the same device) when building the
dm-verity enabled kernel on Ubuntu 16.04.

Is it something to do with the cross-toolchain difference between
Ubuntu 16 and 18 ?


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
