Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448F2C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 12:01:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB2E206BE
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 12:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JajXz0Vn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exmfEMnl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB2E206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zSaKzqckYNWCFOQBflJhFPF2roNqowu8tBr2v1e5YrY=; b=JajXz0VnBQZsAQ2C/0uJDaWxZ
	ehnsLPw/HsbzggnmyXFx/SEJhTknizCvCEOQDoFYmh4sd7ZOWZuD7SrcgFE9T2oui6wUPAPPiWFrx
	dFkrR6ZYcylMo1pQE2jC1L0TpyuJlzgv58yUx0aGvAORralHjVhMKGW7hll4v3ErMLd9ZHK/To7z2
	iJ7/Ms/H7IzSdQp26ZhoZR864lRiZYSJ3arhMpFDcuDKkD3/nuyMc6tdmm++JbB9jv7vdNmyPaPPk
	aqjiu+XiTKgoNqC/fO0s+ObJnRWRfa1eBdRCVWqkUuqq688gIlfM0zJlZek85D1QbLsB0UWBxH5sT
	6CW+EnMsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsmH0-0004F0-OT; Tue, 07 Jul 2020 12:00:30 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsmGt-00049l-M6
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 12:00:24 +0000
Received: by mail-qt1-x844.google.com with SMTP id a32so1215330qtb.5
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2020 05:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bd37E9tUV6I2kHO7ixYLIJhfiLEbYAIkfX6HdSE0W4U=;
 b=exmfEMnl9DGIOwLzaACC1D5c3xz9fW+YspjRXo/mWPFeUclHarcQasZfkgKOyOFDQ5
 an2tA/LI6rPTp2lcsWAm2eokpItCZA3LhwJfDi+lZ/CrDbxe7Ti7Ra83iEbmk/Sy3UHX
 2RDzWLjHV6ph+zEVjN4DbTkh1JWttHhgD90VxCqQxRf07ihNNF3m0j1HyrZO26zGGMMo
 1rNyuY6AKS35eQmDjT5P1kuY02RLhqWYSg4jXuqCHgGFc2d6Eh/CegDJDOaHgCu6y0no
 AnKI1JbGhWGxDAf2y7SUv2DHBH1LqXK7LEF/SLFpjBwSVORkoqVUcwF2gsT6RQ62hetu
 J0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bd37E9tUV6I2kHO7ixYLIJhfiLEbYAIkfX6HdSE0W4U=;
 b=ZsOL4HXqmEhsAdJxcil8sDKHGTGuaQRE8BKtzjyTSLb2NkGh5MNAlQzSJqdgP4kgnM
 wyfxOxNNnHPZHXJy2hdQWFdDQT7H8/PD6JuwSCZjROXKBZtGwjy7GYG5S/TiMr7gD/sZ
 sFyvjHiQAMDXHC00j3pgzy51Sfdzy8bBwGvTJmY0ue1AFsUfw8uCElk1/i50dsSpX1AQ
 FdgzX1Ld1aOasoXam7oOv43BGZ9hw3394Pg5RspGVuHV+zx4sPzxf3mFJvxXarxy1Ltt
 RMd0aD7QYGUfahgUhVXhQOmO8LgULIzHA7RGw2ZgQS8CaudR8Ce5Y5qUGhfdty8D59TV
 415Q==
X-Gm-Message-State: AOAM5308EQad6UxXeBtoqmT84Q8RxMbpXrUdgi0Y2bc+A7rImrPIbWRq
 7EgKEaSKHsVGV6alaKRg5OX689+46mZTFDujRZj8Ag==
X-Google-Smtp-Source: ABdhPJxIhtKBfFr+vAdNIYizPbJfpKC4dcn4AeqFiuiba+DzaYKVehaQeKxB1Bvo1THergKq1K2uGaC5Y65oOZ4HztA=
X-Received: by 2002:ac8:1305:: with SMTP id e5mr54459421qtj.78.1594123221834; 
 Tue, 07 Jul 2020 05:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200707103159.12267-1-martin.kaistra@linutronix.de>
In-Reply-To: <20200707103159.12267-1-martin.kaistra@linutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 7 Jul 2020 14:00:09 +0200
Message-ID: <CAFLxGvyrJQZKfP3jJr8ify08rjagv7TqiOspn3kY2-xt=2Bxqg@mail.gmail.com>
Subject: Re: [PATCH] ubifs: add option to specify version for new file systems
To: Martin Kaistra <martin.kaistra@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_080023_785653_5F0FA95D 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 7, 2020 at 12:38 PM Martin Kaistra
<martin.kaistra@linutronix.de> wrote:
>
> Instead of creating ubifs file systems with UBIFS_FORMAT_VERSION
> by default, add a module parameter ubifs.default_version to allow
> the user to specify the desired version. Valid values are 4 to
> UBIFS_FORMAT_VERSION (currently 5).
>
> This way, one can for example create a file system with version 4
> on kernel 4.19 which can still be mounted rw when downgrading to
> kernel 4.9.

Looks good, nice improvement!
I'll queue it for the next merge window.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
