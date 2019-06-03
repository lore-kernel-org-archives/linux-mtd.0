Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019B2C04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:33:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7DD024278
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PhYfyS8F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aos6/Eru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7DD024278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYDNCyc9/FK3E9VPoL9p46p6h1CCnPaGiYpzXYDrEWg=; b=PhYfyS8Fae9SdH
	nXLQwqBwb4XEaMiHoJIBgT5zyxcmt7ClBSlSCl0lVXe3b0LrLPI/O8dt5r2Adl99GTI/+16tWJmEA
	tcqlgScYcQyZ8BY6Ca39pVZdTYHlGIQefFUBUsmHes3M7DJbUDJMWJsQBLoe1NTVSMYtNAFg3BaV2
	KlfsVVXqca0EJiV6Sr8NsoMmUc62ywe2ota3fz6vq7T9Wtm/IE4XcZQPTUTFvojayaaZO+8YEtSvv
	t8ROFXl6qt3F3+ogawqJsZdA3V/AxHNMHTGTvq1QkX2kk0nzNsgazUCN/HN7amP/0THX2Yb5/7QpN
	TmjRbOtWEo5LNAFA0Z6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXm9d-0007sI-IJ; Mon, 03 Jun 2019 12:33:33 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXm9a-0007rk-QM
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 12:33:32 +0000
Received: by mail-io1-xd41.google.com with SMTP id e3so14099015ioc.12
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2019 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3jr1XVD9a7rvePlgkkK1XrxIvGJuTVGmXONZIGJaUnY=;
 b=aos6/Erub83eDgknCif0KMeCmGkFtkeRw8QEygMV7PIf2FlnODBb/tUvmFjnM7oCnZ
 VJXmMQZjTl9mkpWXBYKEA5pKJLcXojdRhyhfPfHSgkh8G5tEo8iRTNxW5rXbmvXvZY//
 PtL0HM0IGJnACfupYrDfvdjma5Fs8TJnsZ8mC9cW+TJLChuNMxXzcLb2eb0s6ohonPD0
 a2OnVw6T50vY+zgVQdXywmDUY+s4Ic1jSCfFSNp31zn9Ic3x0AV/Qz2/frBtpfka1VJC
 i3J7Yk2JYrmh6K7/+fUAB0ECYRyQCUxpast6hAmHfPAwS2uPDt3dTdxtcVAWtRlhLvM4
 OZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3jr1XVD9a7rvePlgkkK1XrxIvGJuTVGmXONZIGJaUnY=;
 b=CV6toZE9YbeLAbtvk7bPuJUEdN++nLG0b6MzFi0y/yrMy0fzfCWHgEE0Z/nJbiz3sx
 ua8iFKrjSUh/d8TpR8Gis5lw74OctdfgTASjo1Xi8Th5aWaypu1eB8OjfA5TnCn/5QMx
 mYgwJMlk+28z7BscYZSuW/5gvgQR/a/EFG96yPU1SKXu6GBZLWJRtNOER5h0qXdQHdUg
 ycxthkCqSzbrCH34uKeqd7fcUkqImAbums9azK9JvkUkbDUbSRrr0GgGSH/2Yk1IoS3S
 Emnf1pOANur92aUV0CIfHDygJEixZQX5IyYFadNUAIBR2YX7gImR1VF6gI3kWuDfTpNu
 9KCg==
X-Gm-Message-State: APjAAAWNaK3t4k2gRK5YtALInpnEpGGGbo8hnjY9Fre3i9QSfE/9FVfK
 dlYY0lqiSH36cc2fSXPqgV8W995AvLYdXNtOC2c=
X-Google-Smtp-Source: APXvYqz9Qb7NPKy5J9m6AidJdk5f30EBZ7KD8WtP2cBX176LNZYxMcI2QDnNo6rXGcHRVZiLdR+tDmRKcBQFU9sF1RQ=
X-Received: by 2002:a6b:90c1:: with SMTP id
 s184mr14738673iod.244.1559565209431; 
 Mon, 03 Jun 2019 05:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAM===sSAP-qRv7jxBs9KZDFyuL+Dx3wSkQfSOiSQtp8Z8FQcMw@mail.gmail.com>
 <CAFLxGvymOZbBM=wtK-fcgYOv7OOucpcZ1eZJ9GQmUH8h9Jcc+Q@mail.gmail.com>
 <CAM===sSzy4=joOnzLxbSDoC=4HgmXj7QF14vzFCKTWt8z-JLoA@mail.gmail.com>
In-Reply-To: <CAM===sSzy4=joOnzLxbSDoC=4HgmXj7QF14vzFCKTWt8z-JLoA@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Mon, 3 Jun 2019 05:32:53 -0700
Message-ID: <CALLGbRJRLoEPW4dTVCvjp7qBDXEefjBTT4_731m_9XD=KgH8Cw@mail.gmail.com>
Subject: Re: UBIFS on write-protected NAND
To: Leon Pollak <leon.pollak@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_053330_876715_45BC90A9 
X-CRM114-Status: GOOD (  13.54  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Leon,

On Mon, Jun 3, 2019 at 12:31 AM Leon Pollak <leon.pollak@gmail.com> wrote:

> > Using a write protected NAND is not recommend.
> > You basically remove the wear-leveling feature from UBI.
> > Blocks can gain bit-flips also in a read-only environment, consider
> > read disturb or other influences such as temperature changes.
> Well, as I said, these NAND is updated not more than 30-40 times in
> all its life.
> So, wear-leveling is not so relevant.
> May be this is relics of the NOR past, but our HW engineers always
> keep flashes write-protected to be on the safe side and avoid possible
> false writes/disturbances/problems at the power spikes.
> The main goal here is to keep the system bootable despite everything
> in the world, except nuclear explosion...:-)
>

Your HW engineers are wrong and did not read and _understand_ the NAND
datasheets. Nor do they understand the software and what it does. The
days of the HW guy designing something and throwing it over the wall
and asking the SW guy to make it work are long over.

If you want NAND to stay bootable "despite everything in the world",
you can't run it write protected. NAND will bit-rot over time. It is
the nature of NAND. UBIFS detects this and will move data around as
necessary to keep it readable. There are certain areas that really
only get read at boot time, so if it's write protected at that point,
you're sunk - UBIFS can't do the work of preserving the NAND that it
is designed to do.

If it were me, in u-boot (or whatever bootloader you're using), I'd
flip the GPIO holding the /WP line to make the NAND writable before I
booted the kernel and then I'd leave it there.

The other way requires more effort - you could go into your NAND
driver, find the low-level write sequences and flip the GPIO to write
and close it to protect after you're done. But, pay very close
attention to your datasheets to be sure you have your setup and hold
times correct if you're going to do that.

The final way to do it is to not use UBIFS at all.  Run a R/O image
like squashfs and run the NAND with way higher ECC than required and
hope that over the lifetime of the device you don't accumulate more
than that bit-flips in any sector that you care about.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
