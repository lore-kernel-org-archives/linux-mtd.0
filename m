Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71A0C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 15:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71C060E78
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 15:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A71C060E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NG7uYD+a1WRJ4iiVyIT2FZi5JAThqoYOhnIn0a11nAE=; b=HMFoWtEbP9/gk2
	z/BS1ae7iTeKQdSv6u2tBEc7E0hGcNcmu1l6cmo3UbN2uyzRz9J5t1C7C84ukGS3TY6sWmoe68OPS
	0MqQl9pwsw0k9U77H8xzXlsx3a3ZUIuBtgBoelDlm5n1OBkjHgp9wpLOSc5fmJr+AVNbF6bPgtL0O
	oMwG++XqtS09X99pFT986sit7rFuAPpX5p2n6WEnnPQ0q1VLW7ujtqqNhjbKSlScufhhfDJKeUYz1
	8l+K8Cn3nbzuF1C9+gUbcETJzPor3FeHJ2X4qv7ICScgbnUTKuN2zVuBTnKF6eCy44sjbZmFWFb6U
	kAA594kEDIpOdEe3R1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgUAX-00BOY3-QY; Fri, 29 Oct 2021 15:51:49 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgUAU-00BOX3-BZ
 for linux-mtd@lists.infradead.org; Fri, 29 Oct 2021 15:51:48 +0000
Received: by mail-ed1-x529.google.com with SMTP id g8so40481940edb.2
 for <linux-mtd@lists.infradead.org>; Fri, 29 Oct 2021 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NESlwwMORorwSWYzWjNc0O70aEVgaVjtuvkdZI1/8es=;
 b=KtJDps6dyol74mgZwTFC89lUznMWMTflRjyEGBQg8fGTIHN4eS84jauTuUjHSkxHST
 dg466nqGzuri8/DlWUUN8zd2NaCCz0U8kvOGxHCqjTMGdZ6iMDYunWvuGt2cOtXkcv/e
 Ue2xn0HPWcE13DrP2OOnzAVehZzgf7sonec4sRhiS1xjKpw6AHFzBdaM06bbQlJ7Ja6j
 DqvSlb2Et8rx+kql0yC4WX+v7blifYbbw8XxCxbiTrhkRNvvRa2UjvXED5+77b1wlOPY
 lBS+nUPNJn2q/KU3a4esLsUmSIB7aVNfjuXrsKyw+tg80XBA+VjpMSYDL8e2U0sAf4mG
 8W+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NESlwwMORorwSWYzWjNc0O70aEVgaVjtuvkdZI1/8es=;
 b=IFt2YhNChF5uJf3DyqQl9WWWZ2kDztn+yQFoDOOxmj36uFWXHKYBayaz8xp17fTwkd
 2DoUkAFHKMtTkzLgkIINGuw9gsGv7JjCsyskGNnq0TWNxBlowRiG4JMWamoHaOCn3+7F
 ew91v7X3hlgCJruiNwnbNHBcULUSTfMmgtC/RlA7sXsfgRE/j0w6/2E7RTG04VNHY+cs
 EMp/+/Txe6NQAlisefiuPmWvWLb2DSBCz1HY0Bof1dljjhDu08h77V5kdeOZDH1UPaDP
 04IS/7weG1x38RQzP/N3gfhQeRTYpIqhcrjmPFpA/TJiHyCZA16InEzv5R5HDc0jcww8
 p9KA==
X-Gm-Message-State: AOAM530uhg8R7pCXHUwZeE6g4pIFNlYIoUhvhDlrDeinlbmHkLO3WS45
 lcJk2MLPcNcjUvU6dWru1prAOncabKJ07IA+RLE=
X-Google-Smtp-Source: ABdhPJwaZoIDWVCGaHYKcnttqgtKxA/h8msb9rhToLx+whKahsfVfCWinU7ltf1BsXNc6XsBxJ1fumjug1/uaYuC90g=
X-Received: by 2002:a05:6402:274f:: with SMTP id
 z15mr16361253edd.306.1635522704379; 
 Fri, 29 Oct 2021 08:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
 <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
 <CAOuPNLg0m-Q7Vhp4srbQrjXHsxVhOr-K2dvnNqzdR6Dr4kioqA@mail.gmail.com>
 <20210830185541.715f6a39@windsurf>
 <CAOuPNLhTidgLNWUbtUgdESYcKcE1C4SOdzKeQVhFGQvEoc0QEg@mail.gmail.com>
 <20210830211224.76391708@windsurf>
 <CAOuPNLgMd0AThhmSknbmKqp3_P8PFhBGr-jW0Mqjb6K6NchEMg@mail.gmail.com>
 <CAOuPNLiW10-E6F_Ndte7U9NPBKa9Y_UuLhgdwAYTc0eYMk5Mqg@mail.gmail.com>
 <CAOuPNLj2Xmx52Gtzx5oEKif4Qz-Tz=vaxhRvHQG-5emO7ewRhg@mail.gmail.com>
 <YTinqiH9h+Q9bYsr@kroah.com>
In-Reply-To: <YTinqiH9h+Q9bYsr@kroah.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Fri, 29 Oct 2021 21:21:33 +0530
Message-ID: <CAOuPNLhzfGDoQsEZB5eH30WvH2w9hyMEU8Bt81SzK-scaAwgwA@mail.gmail.com>
Subject: Re: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sami Tolvanen <samitolvanen@google.com>, 
 snitzer@redhat.com, Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 open list <linux-kernel@vger.kernel.org>, dm-devel@redhat.com, 
 Mikulas Patocka <mpatocka@redhat.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, agk@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_085146_460690_F38132FC 
X-CRM114-Status: GOOD (  19.81  )
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

Hi All,

On Wed, 8 Sept 2021 at 17:38, Greg KH <gregkh@linuxfoundation.org> wrote:

> > > > > No, but you can backport it easily. Back at
> > > > > http://lists.infradead.org/pipermail/openwrt-devel/2019-November/025967.html
> > > > > I provided backports of this feature to OpenWrt, for the 4.14 and 4.19
> > > > > kernels.
> >
> > Can you please let me know where to get the below patches for
> > backporting to our kernel:
> >  create mode 100644
> > target/linux/generic/backport-4.14/390-dm-add-support-to-directly-boot-to-a-mapped-device.patch
> >  create mode 100644
> > target/linux/generic/backport-4.14/391-dm-init-fix-max-devices-targets-checks.patch
> >  create mode 100644
> > target/linux/generic/backport-4.14/392-dm-ioctl-fix-hang-in-early-create-error-condition.patch
> >  create mode 100644
> > target/linux/generic/backport-4.14/393-Documentation-dm-init-fix-multi-device-example.patch
>
> If you are stuck on an older kernel version, then you need to get
> support from the vendor that is forcing you to be on that kernel
> version, as you are already paying them for support.  Please take
> advantage of that, as no one knows what is really in "your kernel".
>

This is to update this thread that now I am able to successfully
bring-up dm-verity with NAND+ubiblock+squashfs on our 4.14 kernel
itself without backporting the patches.
Now, I am able to boot dm-verity using both initramfs and bootloader approach.
The initramfs booting issue was our internal issue which was related
to Kernel size configuration in UEFI.
The bootloader approach issue was related to system image size issue,
where we need to pass the exact image size to find the verity-metadata
offset at the end of system image.

However, I felt that dm-verity documentation still needs to be
enhanced further with a better example.
With the 5.4 Kernel, I may further explore the option of using
dm-mod.create option, then I might get more clarity on how best to use
it.

Thank you all for your help and support!

Regards,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
