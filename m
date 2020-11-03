Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AA7C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 09:50:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35DA02080C
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 09:50:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UMPZzBcW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0z3qX6y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35DA02080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r+k184yLHRCRIkKMc7ErCp3RZ+hr9PrDOWxuC4jy/9I=; b=UMPZzBcWpX1xehpuvgBqwG3jv
	mObzGZHQ+JKBqpLxiabIV8v18db5YeV2/GiJjHZGsNgSFvC3Gv/8bjE7I4tgGWKbGYsReIML8SSzk
	qE2mu2cta+iQImmTUpJM2FsA4Y0BU4xWGOSDcBVbCY5zrrEv8IkBFfItLWuiu7uymspq6/+Dfg4R6
	LsjIyZ4xuesIIw9afRHHCx2cQ6eLu2d5enhn1dacqaIj5zcIiBLzmEGwsq2n9orzevBscXknhzRWv
	zFusKxElQS0PJikHAAc40jmBbNipIIQKGMCQlGBq2f6+ahybZh4lTEMOPXDa8Pw3zBpiON5FfBlYM
	cGM5NMOpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZsvv-0001U2-8k; Tue, 03 Nov 2020 09:48:55 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZsvr-0001SG-6x
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 09:48:52 +0000
Received: by mail-qt1-x833.google.com with SMTP id c5so11189215qtw.3
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2020 01:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ZNiWsfowz6161LLYF6mY1Fdfs9Ah66gVHNKW1pHnPc=;
 b=L0z3qX6yLk+ALviPJQ8Sen/f8Axw7ZBm5sVi6ZmoYb4nkRqf36lpUygyC6KPeuJYMl
 ozUGurgnz3hoVP49iwFzehTJx7dLB8zl+vrnV0b34UPaJ9+mXpxUs3ODmldeA2vYV/uM
 htgDNUxY3iDZoANIxkGjVBHNooFfihTImq+5o6wKqQ9JvetzEjNsiXmQ3caoj0YyGtKy
 EmNpBC+cB74w8Vz6CdhJLcrGKR6ZYgI7zO01jvd+v0Kib+3EkgO8DmlM5xG9Hc5zdd28
 3XvGC3tfFvUVDmAeQDj2F14w0bBAoKYN3sJpl6KWYZbMihn1EOils9fcdbVZqcjOwJf6
 J/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ZNiWsfowz6161LLYF6mY1Fdfs9Ah66gVHNKW1pHnPc=;
 b=rbG6DasQUTEFxzlKpJHb5yv+I89PJOvuTyT6AwDUFVk5G1ihIg72d6VjaFy4ahtHuK
 2daLoWAEcwi/s5kzp28Glb44Oo+8ZGRkLp1uJLpyChPUTDl9/AVdenR2AQleNnejSCpn
 s79s4g6ZcPhWmR/rSJJ1gBMf7T/UlLf7QpU08qJU7Wp5Rh5i+aue6tBCKFOCklFyIUmB
 pug11tNUNjP86Vmp3120uwuw9nyWe71EZl+Y0VZNZyy0mXrdYE3J5Lb/2HikEI59OdCf
 sYbaNrRGpyZWtjeE1z7KJqLs2upwSslOTZF9JQs8anG4Z63WSz7JuRAIr8evgEchhhEp
 5eiw==
X-Gm-Message-State: AOAM531xI5KzWinD8czfNLwts3K744IYEGi/Qi+mD0sNSyaYsMhEUmdu
 wklyJm8rFOvc3BpzCB4mfPBB72TqSsRYRdL4S2s=
X-Google-Smtp-Source: ABdhPJwQTy1cdkZ9zfRChsTN+lFkeRdT0Fo9XBhVdHWCVTAAx2wcoEnlqb1PCPAEK6Aes1y9ugCP/7eZSBf9LRdHbPQ=
X-Received: by 2002:ac8:5417:: with SMTP id b23mr17275632qtq.166.1604396929262; 
 Tue, 03 Nov 2020 01:48:49 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWQnJ1yRTwPF+9kubSt6FQPxwCRYFwXcYR8RnVLs4LMb7A@mail.gmail.com>
 <2234110.ZDGxJVC3CD@ada>
 <CAA=hcWSAsKEcFaR1dCpCey_m2Z2zOxYT1N8NNjL6bNQxSrHj1A@mail.gmail.com>
 <3029789.gPz3SqCoUO@ada>
 <CAA=hcWR9gMxtCbhDdMEbzJ0okZ7aYGHeaP6j7bkfqT4EVkO=Dw@mail.gmail.com>
In-Reply-To: <CAA=hcWR9gMxtCbhDdMEbzJ0okZ7aYGHeaP6j7bkfqT4EVkO=Dw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 3 Nov 2020 10:48:38 +0100
Message-ID: <CAFLxGvxwQmeDwC3j-HAuw2_tnjovzyWmq=bh1ogmxR-rss=b=A@mail.gmail.com>
Subject: Re: [yocto] Install Yocto image and backup
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_044851_463673_1A282AF5 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: Alexander Dahl <ada@thorsis.com>,
 Yocto discussion list <yocto@yoctoproject.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 10:17 AM JH <jupiter.hce@gmail.com> wrote:
> The reason we don't update kernel and rootfs because the size of
> kernel and rootfs is too large, it is hard to download 60MB image OTA
> via 4G CAT M1. If we are going to change to use 4G CAT1 or higher
> speed, I'll use either RAUC or SWUpdate, which one is the most popular
> for embedded system using uboot and UBFIS?

You don't need a full download.
In the past I've used binary diffs with great success.

So if the update size is your biggest concern, the tradeoff of
computing and applying
the binary diff might be worth it.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
