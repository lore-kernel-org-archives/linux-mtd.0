Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3938DC433E3
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 11:59:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B4712070A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 11:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nkWxlpBf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pzO5UY59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B4712070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MHlg+7ncaPcfUJ0dDmrN/xEOHfzzn/Jqo2uSAH5ZDd8=; b=nkWxlpBfLHfokPHM+rmR0Uyci
	VBbG0GSxtdA371kZlA8cvILnWweW/cRWXi7RYsI8Dvw/9qZB92+ONjqQN4bnrnX5rTo2MpadKVb45
	eJmZ185boa3y1MPE33pYrilFetv1MPoeFpgVRQ8ri9Er5IzQbTnPNutknREHp51Y9jlsgTLQ+MGHy
	l8jDE9E+RTetKxtpll7QqVCFOWlZVG86cGRXTOcIC6wi8e8IFaqVEX3ePrmv6zUePwo8uxkiD0vbq
	KN/PMQETO7qEk94hF0oMydAWk7qB+WRtuSDNYUlFNuM8AWP5PsB2dgvQooeupb4mmbFqxRBft38Vy
	4Y2KSfY0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxURM-0005fB-5q; Mon, 20 Jul 2020 11:58:40 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxURI-0005dX-RS
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 11:58:37 +0000
Received: by mail-qk1-x741.google.com with SMTP id g26so4737175qka.3
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2020 04:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oyadEz0eZwOz4veMiu/99Xwk84Lj2bAOI1P6STGAbTM=;
 b=pzO5UY59E2I78nkbHVVchIb8xSq5dpsUcOpNS7Gkxof5sNSjCEODEhGzsvVVjAfJyl
 VSwzSp6U1Zs9krrRKUF/u2Bk2AkyMb7A4vyZNN5lBySozBpWv75kuuSymSQ75I0lOQIq
 /aNfumnu9UNKeQqzNIgsFnNCRnWlLEXCl5HKsdcBqoLY2AX4WupdTDUkutMtkReFDd/p
 7rLcMb8CsQvVO2aMkGCvC0cISIr9opF8PILSUSavYLWpTTSmyGJ8atrT4DsGICF1czPS
 GjukeM8re+7Is53uuqLc1gz9fVVpsyasqxmhyXdVNJb4jwNSaNcNEMbvPaz5r/mI8alC
 KLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oyadEz0eZwOz4veMiu/99Xwk84Lj2bAOI1P6STGAbTM=;
 b=sAA7PH96Y7B2MAtrg2c7c+aJkEy2d8wxW2h2Z8k5GRbm7AgBOexnKe0eYS5ZTkErTy
 7FEJPB7afpBu+yMLGAvge/QwlOZljarXy8ch+PyyLV1RO3Zw/5tJypNqoYoS4fsnLo34
 GuzDQF7475RCruvj3aXou7syTo3zvANOWhvvYh40PiUHZl4Lt+r4gM/wAFFKlreSn40G
 v3EFZX/fxJlBi6FF/U0dikIFpvGE1LTInInhNlQFrhqj5yWkQuebVWixyLlGWRH2Rdsq
 pie0BEYOSb8KE1wmBRjHNXlE8ZealyCItL/GhuPO09hQuCJweGtLikNxLxFB7nCuktxh
 XK3Q==
X-Gm-Message-State: AOAM5303TCSaVuN01RQnZsf09buZFQumBtzYvRT3w2AKwQZ+HEKyxfn+
 Qer3kOQUOyx5/KFYkyas+LqOSWaeHsWg6D0xJlY=
X-Google-Smtp-Source: ABdhPJxZvpi5p/rGIGspu/X0VuST2fAly2yyAucRwLGlbJciYxHfYOGN4y9O3LRxtfeMHSSpDlexGGV5rTPgQNTp1kc=
X-Received: by 2002:a37:9147:: with SMTP id t68mr20753351qkd.34.1595246313907; 
 Mon, 20 Jul 2020 04:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200720075148.172156-1-hch@lst.de>
 <20200720075148.172156-5-hch@lst.de>
In-Reply-To: <20200720075148.172156-5-hch@lst.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 20 Jul 2020 13:58:22 +0200
Message-ID: <CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
Subject: Re: [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_075836_934648_60D0099C 
X-CRM114-Status: UNSURE (   7.27  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, device-mapper development <dm-devel@redhat.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 cgroups mailinglist <cgroups@vger.kernel.org>, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Chrstoph,

On Mon, Jul 20, 2020 at 9:53 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Set up a readahead size by default.  This changes behavior for mtd,
> ubifs, and vboxsf to actually enabled readahead, the lack of which
> very much looks like an oversight.

UBIFS doesn't enable readahead on purpose, please see:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_readahead

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
