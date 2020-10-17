Return-Path: <SRS0=9jYX=DY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBDAC433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 21:27:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5706207BB
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 21:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BYzVqU3c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZmuaj6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5706207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BZjmG4ZdULa6GHg9DDHqIc0Dcerm8lEELIALrDxTQMM=; b=BYzVqU3cEGp33bVEHzFpa8Lgh
	OZj+VB9N6k7d7si4fzDhegOgRJHGN+tL2d9aeGO/pdqiPmU4+x091rGpTjj784WdHeFN9NVciKzTB
	aCFkHhZ2oaJt+FHwmXVKkze14mBQ061HX+my7eRmUgaMlniRGheUNN8A0ouZ/TT9lIHUWEq6T6d7D
	sW7JVdzNcu8B63iCANsi06Bz2JCTlShCjwZIK/Yfg5fg4xFkleG62cDY0/88KbPt9LZeQzM5LCK3W
	OohSikmMRtWssIJ8qXfq4f6XIGjeNbfc6auAyZs6+S3soR5HnmAsRm5P741/QpOz+H0CC0YW+Tr2F
	cVMed7POA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTtjH-00040m-5u; Sat, 17 Oct 2020 21:27:07 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTtjC-0003zx-Sj
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2020 21:27:04 +0000
Received: by mail-qv1-xf43.google.com with SMTP id cv1so2671721qvb.2
 for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2020 14:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RgqP4vHnc4YDiTlhc+DyGim3+aRVm74aNzyLcpYY0fw=;
 b=PZmuaj6kYiBeitep5A8CWeHOTvYXeyFJAyRaHVdMV6bMV1LzBS3KK2jii9zU5COWH+
 8cwF7adReOhXYx0Bxl9H4v0itgBHLPXt4q7reYVavQs4IRM9nOX9723LdDHJzev+TmOP
 vN+0YJaSNCoCUksvcqkDQ42wt43VAScBFy17g/L4BP0s0/GMT4FOCWtDgUExuFOk+XHX
 cgA0MFCyn+MRxd+KsBNe0yf+Jy5kR/dfqIjq4kpIM77W9+rduK7cJlkoSJwaCKZOBijH
 au4D6VH8qgWzTdrA3xdrEsl+WmUJgqn8XTNYFvGQFiffDbOf+/RnjvLTLcJUmfQ3Nerh
 8rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RgqP4vHnc4YDiTlhc+DyGim3+aRVm74aNzyLcpYY0fw=;
 b=jjPwjY2pkuHa0mw1ymSusW6Sz4447WPT/K0IGJr1+r49nSgg3e0sZeFNdBmmo+WPqf
 /LyAYUFTRhcG7iB3ASuDw5AMt6tdQRg2YY0pFmifA6NXRfQioZTF1WDzq7ickafUBgi6
 /U1eJbk6Vf0TixNe/ApmZuvrNzeVMvC3ME1j95CNICcu2Bwp00xKS0fS69rA4kkjOFr/
 p/l8wJ0oN+h8cDhbWHBFHlWlug9SxpahHPJHWvKk0rONK9Bj9WKA2XH0RxF1g0GbtBJg
 5+USm5cpUJvAYMm1j+jLs6uJVdsEyzF7wx6GWd1VMWhF6dTjhs3c5vRepMkix3Yf7PG9
 xbzw==
X-Gm-Message-State: AOAM532ubg4/x5ga9vciv8Yx2+KurWqreLkkqttRBHr8FS2cdvpwYJ/G
 hODPf1ajJ5Sp+3XLOeM4EdHoy/BGu4ORHCP3/ok=
X-Google-Smtp-Source: ABdhPJzHMIlaE7BBQEDZ0mFISjyYxthNy4f6eo3fsalZEZoMEKWY+bdZrehWAQ36IvGeOLV3Ot51vto2zJ2e6FBQFyM=
X-Received: by 2002:a0c:8064:: with SMTP id 91mr10454087qva.34.1602970011343; 
 Sat, 17 Oct 2020 14:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200805024935.12331-1-rdunlap@infradead.org>
 <62f3156d-a720-437e-d859-3b1c203a0653@infradead.org>
In-Reply-To: <62f3156d-a720-437e-d859-3b1c203a0653@infradead.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 17 Oct 2020 23:26:40 +0200
Message-ID: <CAFLxGvzwka1SBSXiEeDXP+awab+4e4heOczsRPh713scCvQwyQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: delete duplicated words + other fixes
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_172703_122562_FEF0EF30 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 7:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> ping.
>
> On 8/4/20 7:49 PM, Randy Dunlap wrote:
> > Delete repeated words in fs/ubifs/.
> > {negative, is, of, and, one, it}
> > where "it it" was changed to "if it".

Applied to 5.11 queue. Thanks for fixing!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
