Return-Path: <SRS0=H28k=XK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0197DC2BA1D
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Sep 2019 22:05:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4F22067D
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Sep 2019 22:05:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gWcp0NPu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgVwyPhL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4F22067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Y9neahR6NHJvIU8/zCFrkyUkMIB5LdtV68JMCo8L9A=; b=gWcp0NPuvb4PDs
	nwtCxil0yGMmTMFEmwSTenvbryDYJpE/epx2GQW78jbFQGvwACFhYB0sUi5HtdZXd3PsSDoeBAmg4
	GLrGxAZRqIAu21TKiysZulon07z2OsjLnwRwYl4rE3yg40KMZCleA6PFydjB92K+VxZYtiUn9wdcq
	pBD4pWSVYAv875nsnVJyLJwtjK7S8uTZd46xOHIFQCdudwW7rhOzdl8AsWQOuSSF5084L6gOVlvxk
	2L7JbGvTMawHwtWPRBU1sdy7MJuLYBHYhw2e/NDwj/VcOBpMc1ee9C4YMUunTyq6v/6PRH0ihhayS
	4G6vIcfw7hNLmEA/KCvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9ceK-0003g0-SS; Sun, 15 Sep 2019 22:05:40 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9ceG-0003fO-KK; Sun, 15 Sep 2019 22:05:39 +0000
Received: by mail-wm1-x341.google.com with SMTP id t3so8046335wmj.1;
 Sun, 15 Sep 2019 15:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/qGRId8HPyCcUJt+meL2ndjhZqkfHIvlq5BmskD0fJU=;
 b=KgVwyPhL9h+l8sXGn+rFQxxI8Av82WTT1v8slexgQxOB2/eB1TKgxmHQvRuoiTsQnT
 NLiWuqa5CiyD97Mutk/Q0L/6joKRL3N8W8R9+/1/7JLEMCj8NRSZtnZha4h/WF+/1LeM
 svF5PcawhWr1bmkLdn0DSXnaz2A4K122sB44k8qtlAES+RSa966YSPFuzDxboa1MH9ui
 DpnvryDvPz0Oyd2bQg70uZ9qHYuDerMblZoX9ap21i9PJGEh/okbfJPbxgt0BxUQG3Hs
 anm2qtzrmGC9jP7zS6172aGeTMw5fo9GsnMiylnRfyGFRpRtYOgY120LGBuesC8QmXSV
 WIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/qGRId8HPyCcUJt+meL2ndjhZqkfHIvlq5BmskD0fJU=;
 b=YUCiOAo3EQ0KiLmsFXSjYnQvoe6oTB8sYZoT3wVTakaoLIL4x3x2vHhLdKbCCh59dC
 wpW7QrYOT2Fa8C4HjzyHWgnqh8aoLH7NP2L83R+Pz88sRtHxXzizZBPRhXsuBut0Dblk
 aO0WtPXp2OwAPWDdmN/ohaEiik9v7z8s8+9CuxpLReEowSB0tDCpAmUZt9Rjn4m3forn
 Hn0WOGseiy95sbL3C3PnHoTUTh8Q/dzGe+uABgqri2FUcHaSbHvLucheViSdP6wig5jk
 5x6Wl3l3w3QPcXnbf/ae2OAgBQSDPx5OioRfvy5tzHjg1neJuRY9/PNIKoVwSAiMq+oC
 SBPQ==
X-Gm-Message-State: APjAAAVWBR80KC0ciwOmezfXBkS9KGWCCFxV1HMr7RFMsSEiwSmNjw7C
 CzBt2lB7IA9VzjOm/TpYnu1EvLi0uehuIGXX8tU=
X-Google-Smtp-Source: APXvYqwoxJamB2WY3r2L0UosojzF66nkNlzWYjucDWD6h26BMykh5xEl2EB9gd/wu0AtkvkIx4p8MhEZE2TowqWrUeM=
X-Received: by 2002:a1c:1d4:: with SMTP id 203mr11441862wmb.104.1568585135428; 
 Sun, 15 Sep 2019 15:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <1563451437-15725-1-git-send-email-stanley.chu@mediatek.com>
 <CAFLxGvwLTTN+S=Bd0gZWKJbjvanCe_HV_dfmoZzyb1hzWkkGpQ@mail.gmail.com>
In-Reply-To: <CAFLxGvwLTTN+S=Bd0gZWKJbjvanCe_HV_dfmoZzyb1hzWkkGpQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 16 Sep 2019 00:05:23 +0200
Message-ID: <CAFLxGvxG3rhr6w7xNthJco1nHgZgGhw+cda0anHuNz4OdD7ntw@mail.gmail.com>
Subject: Re: [PATCH v1] ubifs: support page statistics in vmstat
To: Stanley Chu <stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190915_150536_693007_55FC22A3 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: linger.lee@mediatek.com, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, kuohong.wang@mediatek.com,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 chienwei.chang@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jul 21, 2019 at 10:15 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Thu, Jul 18, 2019 at 2:04 PM Stanley Chu <stanley.chu@mediatek.com> wrote:
> >
> > Currently PGPGIN and PGPGOUT statistics in vmstat is only
> > hooked in submit_bio() for block device I/O path.
> >
> > This patch adds this feature for ubifs as well.
>
> While I think updating these counter for raw flash makes sense,
> I wonder whether UBIFS is the right layer.
> Why not directly in MTD or at least UBI?

Ping?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
