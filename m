Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE8CC282CE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 21:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C902075B
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 21:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JPB5YkuD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfscdB2b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0C902075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ve5dscsuWyCtF2nuroM9kg0DvhSK2+g+IjBdkiZU/Cc=; b=JPB5YkuDKQM9Xb
	KC5J1JfKIwc0UjPNpty7TRb8PjSBndhq5uPsSIsWCb72X1ihAOQRWVV9kPyiA5/McLZHQchP3QJU8
	nfIVL2xTY7gGMGQV/b463qtDkSfC8Rn7yxq7f6B+iEVCniLXpsX1qjqnu5XSHkyp21PTdSFn6mX0p
	WLGh0AhnVLTGJr83cpUUBWxqxtrwiNOWhiStZsj9BG3J+D5k5DnB9CzQfKZgaD3qCJce3bZ3FbUJk
	rxveuqVa8LWd2bDW+Y73Pc2qZYj35N81vvsbri5MBPRjiHfFAHIiO916rYP0//aLUdRuCjwKEEPf4
	uYR+mLCTl0NUcc6zN/8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYGbt-0007ov-Py; Tue, 04 Jun 2019 21:04:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYGbq-0007oQ-Ub
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2019 21:04:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id w13so17240634wru.11
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2019 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2yqsO4dtNK+yilF3bRIgywpkE3I0LiEzTxImvFNFr6M=;
 b=BfscdB2b2Bfuh9IiHRKATsrKkkvmLY1aCUY4ZBSkE+dH0JtveCm0yY/5gcRFb86JIF
 +8/PmDd4c4LgrRa9oFYteH3DgEtINgtTjKH7ITNUR9woLBPsOO4ZoylNV3W5RsKQslF1
 pNMJclBeK4fbVMw3VZeASUfCd7ynEJHXzvcrBmvvzazhTrQYW1J0eGpIkDW4dNcOOoAQ
 oyUFfwDAAY+HYoA5xf5A5y8wMKm1s1K/JwcxZ2tE6ySLPR1r+moOHdVgXvbCwJ8J+H10
 uzNkImyIpFzGBfwZgA1ap1to8gCdVW/ZrgUN7ySWH7I74RI9QlErX4donxu/DT80+Pad
 E4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2yqsO4dtNK+yilF3bRIgywpkE3I0LiEzTxImvFNFr6M=;
 b=YgJi0gEWlhzWGBUgYf+lpwNyGIV6W3HJpna3quhlsbnSXmYrqF45FQftgJOvoDaA69
 qKcHKYh/w1vswQWT8d+1KiNk15UAeDK+QC5tnm6EXxX8PaKN7fobaePfH9mNB2zym4tF
 DjLCJeJOTebUZKDXzYmjzdT+tBX08jgW+ERKbHEJEDo8BnTOACcfne8w3jbMhhEamO8v
 fFUvJFHIzyCeF5X/0zlr+JgThS2ZyibLWhlvRcV2XqudbrAR7U6VIXk2fUYpmwxPq2Hw
 ohxqoEDrCa0ewKPOoIQ0V5DXUCyMMU0tI95VJTvHi0KKD8pUJ/+GO05h5ezOwJqd6uP1
 ZEGw==
X-Gm-Message-State: APjAAAVll0qogiMwqFmrhaOUc5tgehmD3E4rdTQnfQI5s708E2ngKVED
 VUajnWqyMXw9It15YbdmrJdKPHTaSf8hXa2h9sM=
X-Google-Smtp-Source: APXvYqxgb8n/IZNYCggPD2YFMCs10IFZPtfnQDBx5YF/eDNUJv3RNYsuEnoZxoNLkE1C0UlIAp5e9p/ntu0ISTgoR/w=
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr22219693wrw.306.1559682280882; 
 Tue, 04 Jun 2019 14:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAGu8XfRM6MtAP7v2F2jp9CGYERj5niAvhHYtXQmpzOS0uHoUrg@mail.gmail.com>
In-Reply-To: <CAGu8XfRM6MtAP7v2F2jp9CGYERj5niAvhHYtXQmpzOS0uHoUrg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 4 Jun 2019 23:04:29 +0200
Message-ID: <CAFLxGvxXcvmZtVC_AqgT65e6o-+V8uE30Y0zXQnaJOkxMgDbyg@mail.gmail.com>
Subject: Re: File-compression on ubifs
To: Shibin George <george.shibin1993@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_140442_989888_44BD14EB 
X-CRM114-Status: GOOD (  15.09  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, May 17, 2019 at 1:37 PM Shibin George
<george.shibin1993@gmail.com> wrote:
>
> Hi everyone,
>
> Had a query regarding mkfs.ubifs tool. I created an empty ubifs
> filesystem using:
>
> mkfs.ubifs -y /dev/ubiX_Y

No need to run mkfs.ubifs, just mount an empty ubi volume as ubifs, it
will auto create
a filesystem for you.

> I was wondering that if I now create a new file on this filesystem
> (after mount()), would compression be enabled or disabled for that
> file by-default? I am sorry but I could quite grasp this from the
> mkfs.ubifs code.

Compression is enabled by default, unless the filesystem is encrypted.
You can also override the default compressor using the compr= mount-option.

> Another query that I have is this:
> Would ubifs do a better job at compression if it knows the root-dir
> contents ahead of time? In other words, is on-the-fly compression of a
> file (i.e. compression at the time of creating/writing to a file)
> generally worse than when the same file is known to ubifs at the time
> of image creation?

UBIFS compression works on 4k chunks, it should not matter whether you compress
at runtime or at mkfs.ubifs time.

If you're looking for better compression rates, give our zstd patches a try.
You can find them on the mailinglist.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
