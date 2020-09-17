Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4E6C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 17:13:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78925221E7
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 17:13:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZNCmbglz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP4JN3wP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78925221E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IDUMGwAo/BGvWAQgl9xEUaB9tyIkmpeYdlg/w2o1L3k=; b=ZNCmbglzIw0DHG8r2ek0eMXy4
	EhO011T8Qaq+0c6WDPhvKdokgNtna5doQ1v9a9aF6zyz8FPAW1GiUO6eHjnYXvgBhTqyCcd47ligf
	PVzRkOcdbNekfZehwJFnjouH2tJ9E3VOu8jOwlxVkSPrz64xW9qrrGriScoQb4mYZr37KqX1nSbUo
	zv5H8TwN7319qVE0dQA7RiGLFaiG7YjnMC59LgAMf5+ekX0j4yk8wwTh1q0QIcUCq1ejefas3rhrA
	Cxj3xZFwX1JGswxrXp9w6DQDujsZFUf8idbexpHUVuLGAxoQ3F7GTRrgyAbxQEHQXXDBVwsHQnUFe
	sx0xbO8qA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIxSf-0004bp-Gc; Thu, 17 Sep 2020 17:12:45 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIxSZ-0004Yq-Af
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 17:12:43 +0000
Received: by mail-lj1-x232.google.com with SMTP id b19so2672988lji.11
 for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2020 10:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YzTfAmwcB+l5AdylYKbvOmaAbr7BrnwSMUUoy0/i7Wc=;
 b=UP4JN3wPEoxRi4R440x26QIhowGXs1WkEQOTtjontnf4UY4uSmFketDQM5YChDaWOM
 BI46MtPXSSkJHUTL3/4utBk3T7rlnnvTv8p8z9inNjeXiB1XbxIZSakEeCEXAGykTmJ9
 QbHFwAkkriqSwGkRZ3MRC3EAv9JUm0kKJ4McehsLcr8ClY5zKIpiCE/ie4gCrVz8Q9Wp
 9DK5sjj5UiQWNFYzu3HZi4j79+uezqPUy5RMU77mZkcTlg5X5F3LzVKv7y4SARoxLiN9
 pGvT3Kx6S2VauTAsCzIeNMiMbVeyZzAzx9ts5Nm2lh1foHcjBuo4Fhb3Qs2yGUeh+FoC
 On7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YzTfAmwcB+l5AdylYKbvOmaAbr7BrnwSMUUoy0/i7Wc=;
 b=XTooBOD9SRZiQ6zsunFYoJqgfHgIhA+sJrKaheNZIWRyT0E5yDr+F1EUpdITwSX5jd
 p3FqSbEaadVls8cxycMuw/UW84yJpoU4ixdC8YY70S3K0x4NSvnZ381K+CupvVZ7hG3d
 SlCRsfco0flmWZ7MT1HBEhOIeANuWvz2Ph9szNrYtdSMv9lf9X8jX2ERrrVvrnQf5vCg
 fqwzOAPT8+cFDHfb8TkCNZON5R0TEriqS0QY3WpDAUZY6IkrUeMgTm1635Gw7y8WD7M4
 7aRjr54VpMRYtyHMUTttn7uW2Mt+2CNaLcfkpdyE3uD+bHnBnQdUn1Qpp0t/LcrBNZ0l
 7fdw==
X-Gm-Message-State: AOAM533EIQ9n+Ejg+91HMqJ86vaWn4k+2U3v8Mit9vLfkCMSWY68Dha5
 oy5Lw5ZZxikytGHnPSdtM21uRVhfT7nVHJnLBeM=
X-Google-Smtp-Source: ABdhPJyzjCQvlj2z797BJj0PRwOSPIGScJBWsOii948+/wxNy1cw9VcPtOJvL3uwqHiPlx+0LGL0wDeyxQNGcTTKVQM=
X-Received: by 2002:a2e:9743:: with SMTP id f3mr11482089ljj.310.1600362756640; 
 Thu, 17 Sep 2020 10:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200917181318.3fd9965d@xps13> <20200917184524.44500d51@xps13>
In-Reply-To: <20200917184524.44500d51@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 17 Sep 2020 14:12:25 -0300
Message-ID: <CAOMZO5ANsDsR==jjej1=Ukj_pSvT1y84q5ECjrMer=odP3716A@mail.gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_131239_494368_75A0EE6F 
X-CRM114-Status: UNSURE (   9.34  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Thu, Sep 17, 2020 at 1:45 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Perhaps Tudor's series is related to your issue, would you mind testing
> it?
>
> https://patchwork.ozlabs.org/project/linux-mtd/list/?series=202344

I don't have access to the imx27 hardware, just noticed the problem in
kernelci, but I can't test it myself.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
