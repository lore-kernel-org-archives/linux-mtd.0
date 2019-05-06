Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B26C04AAA
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 09:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C06E20830
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 09:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDSsx/ez";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiczZxhl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C06E20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6flsob6910PPE100QUbmVaHKBmRBdumtu4Bme34MTEs=; b=KDSsx/ezhL7O/z
	teyWD4rxw3xEKzWbBY539ccftcqclnhoCqEWxj4+ZCZ4kV7H0kjYPon/LEoskMtt06NdxZ9dGcKB6
	P56q2lSPpDfRAebFC+KxVSNwnbR5FTmwtL7eqBPmVyNSNx2LVREw+t+Hg0nXIFH6mLb3Ko8vECDAR
	bdGaos4odJMp0FBI+4LIjFDRbUw1Vlq4cWx9HiqyEBf3ZIf5ZOuDC0QBGjVNIoW9+Tsv7P8PyqMOb
	dUbxkZT2BCiUpeDut+yDaRaNFU7zhv4f6iv/VBfISqpvUxjmyAQ6ShKZAlSn0rlxwv2HK6wUL4bgB
	8SxPNX+1EYacH7B1yJ7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNZXY-0004ZT-5t; Mon, 06 May 2019 09:04:04 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNZXO-0004SF-1s; Mon, 06 May 2019 09:03:55 +0000
Received: by mail-pl1-x641.google.com with SMTP id e92so6049686plb.6;
 Mon, 06 May 2019 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2zkFvMfXSuPxA7TswP4qZ+QIZKRpTzLAUwlBxIZ9PzU=;
 b=YiczZxhl+N5iLdzUGTmZ+vv61ahbfT5sYkO+ZKl1O183V89+BhJz/LVCYZW69Rs96I
 B9L09hT9RKBTMzQPy68tiva/wZUTF1HeqiQA0wgIQKQi9hc9wauqzRc3OKkCm1b+45xD
 /TIxR7gFTxFuR4TGryfYzNp53n1d0MoSOlSKqUI1PygQXIr4DIq/BsZfwXixIBOH9ZxQ
 yFa4fMS2Zky76vcoykF14xxJXsTp6HA89kojG6J76npL+WXgKQ2KtB8ZUuikGBrAHTkD
 gd51bYyzDfYbsyUC+pmkXYFFrzi2nJRQ6fAyiK8dpDyV02X1sRuhxEHafOiBQ4LbnHZJ
 uFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zkFvMfXSuPxA7TswP4qZ+QIZKRpTzLAUwlBxIZ9PzU=;
 b=oi0rhZRZr0YwXjAQ/5w969TCgW4mg317XT6b96z0sMoLHQDfKWGzfsULXGjj6/qIn2
 B8Y6SEi1snq2nhaB4DwyV17AJxGESGSnHp3y6Ac82QDJQYAiU9N7bPpiWFu6IY2ul65v
 cupXlpNBO7GgAiQZnyQkLwiUDFt9HLiy/LCfpJrA/4Vf53YO49NoCGI8K8vcmCydJ8/v
 nL6oQ7Yrpz0c/l8LUx/KifLaTWfA3DF6ERifgMAEY7N88eeBIjNmCm7XT7yiR0h8yxFG
 +/7M8SJOPnC85ZMFBNwZ9xfoQVXhoJ4R+6t20StSjVziaJVlpNMrwOts8hBrclKfqfKA
 M3Ww==
X-Gm-Message-State: APjAAAWt7GXTe4y37KyTydnrlnsaEZIV6vx1SvN+d0vg2x21KQ3GMTyZ
 5MfdUwnPAdibBMg70L/x2gBhdF4E23QzDQ+yjsM=
X-Google-Smtp-Source: APXvYqzcd/LiJVbbE8cCf+fOVIBhczP6XN4ND6V/1pkV1QnBDFee3E6dAicqEB0BMR5uY867+F0seVXH98gF0RaaX4M=
X-Received: by 2002:a17:902:8349:: with SMTP id
 z9mr30421370pln.144.1557133433288; 
 Mon, 06 May 2019 02:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190416202013.4034148-1-arnd@arndb.de>
In-Reply-To: <20190416202013.4034148-1-arnd@arndb.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2019 12:03:42 +0300
Message-ID: <CAHp75Vc2-zzRYk0vpdPQm5duZwW+v=svEndTPV4Sr59QrGcMHg@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] compat_ioctl: cleanups
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_020354_139980_88B32C66 
X-CRM114-Status: GOOD (  12.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linux NVMe Mailinglist <linux-nvme@lists.infradead.org>,
 linux-iio <linux-iio@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 linux-ide@vger.kernel.org,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 sparclinux@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-scsi <linux-scsi@vger.kernel.org>, linux-bluetooth@vger.kernel.org,
 y2038@lists.linaro.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 linux-input <linux-input@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>,
 "open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 linux-crypto <linux-crypto@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Apr 16, 2019 at 11:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Hi Al,
>
> It took me way longer than I had hoped to revisit this series, see
> https://lore.kernel.org/lkml/20180912150142.157913-1-arnd@arndb.de/
> for the previously posted version.
>
> I've come to the point where all conversion handlers and most
> COMPATIBLE_IOCTL() entries are gone from this file, but for
> now, this series only has the parts that have either been reviewed
> previously, or that are simple enough to include.
>
> The main missing piece is the SG_IO/SG_GET_REQUEST_TABLE conversion.
> I'll post the patches I made for that later, as they need more
> testing and review from the scsi maintainers.
>
> I hope you can still take these for the coming merge window, unless
> new problems come up.

>  drivers/platform/x86/wmi.c                  |   2 +-

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
