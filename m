Return-Path: <SRS0=LjUq=RI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB8EC43381
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 08:22:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAD1320842
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 08:22:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOBrTE8U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="yqKO7ETo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAD1320842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JWbs8Vb1FiFX7JBfyRqfXY1swnFOcYA+hlqGtYpiRvw=; b=TOBrTE8UkzvaXCrYCn2ILe+u2
	T0WrBDFALcprH/tZKGZebQHzuIwwglyKoNJb/RKwciVbgFlpMRSO7bWhQC117NeKRAbH6YeakpaLt
	T36s9xdwbZIYQMQE/d0f26AXUI1NErQtZiRWi5NZtqc1jBb3NCbvVwmKQFXpds5W83Tk7eYZMmHvt
	kkmDYHRMMezZPQD986p7OkliwNJxAmbSuWLuVF/2pFPDrNicB8N2GXOHXor8NP5RiscMPE7GCxXGy
	h4HfoIvFdWGpGjy4/AMHiy10Rl9PyNiKnQ6ib3O77TuEG6323laYAFQ1GMJGISQ3AZKc8sCiafdZC
	inYzXHfIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h15La-0002rs-Pm; Tue, 05 Mar 2019 08:22:46 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h15LX-0002r4-9G
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2019 08:22:44 +0000
Received: by mail-lf1-x144.google.com with SMTP id d26so5538995lfa.1
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2019 00:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lBt4S0FA1EkxSjGgyIh59AKcn3Q1GYOcPWe19fy/ias=;
 b=yqKO7EToAesfw0V366u0WHlAcmFrUJHa/2+9ot2m6I82bnK6P8UICK+IW/mLFrL7TV
 xItjEBB20c3RqhAOtj4HYFuRo9gtWHTUC4zcA7E06vI2iap9MXHAKoZNs1YKTpqvAcdV
 7ZE4HlEYlnWavSAPnlYK0JUtn3nD2LqbcHe8A8jkqnkHHP7Mi+xi1bAE5gli4NoAm6/c
 5V8/80GnH0eTDWm1UVxXqssgxxsn889NJZi3xmSwBSAPJFs5vmI7hzu2IG2MGMFxYYKK
 Ufh94MJF9FqB3O0+RAwNrTQCAy2AJPN4vb4Wqg+CZyaCgfIB6iowZfImbBlvczm8bKNd
 PEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lBt4S0FA1EkxSjGgyIh59AKcn3Q1GYOcPWe19fy/ias=;
 b=iMfZj/82H2zZEIyxgI+Fdck9/jsfbF0fErFG9F9i603oG8gy3uaFpI7d7WjNBpqQHs
 RCDykD90mnkYM+71IzpdT/NKZMnvqHpiaBzuebuJ8SQde1A4A8eTBnB/T4rks4XsixSX
 fS7QuQO49hz8B2dt7rHjKoSj51vZ1foinHgYJeROaVuJzD3dZ2oZZ9Nfv/LsSz/QEM1G
 BEVASxPKfw5BQH/FG3mIzmCAi9JU/l7N6+01OHVq2zJR4IWu/oU1r8SZStAQgvEk8PNw
 FO0GcCW/a0eBYVbFoy7gdg1gYbSfd2/KOMNjuUiNUbCyqqoMrsrhr4YqwxSA5ET0x94e
 Et5w==
X-Gm-Message-State: APjAAAVj26LHB9olttVeWdoZ+G7TAOMuJAoBoMf7VmXp+1nr90YodaMG
 fB70DC+qTzHSOgNzFV5vd2b9yQ==
X-Google-Smtp-Source: APXvYqyjC4mUKNMxUL/pZN9tNVjC+xAkOAacV+xbs0xkbuQ8pj1SjsrQD4qdtpSw8xiQyTjNjUtHKw==
X-Received: by 2002:a19:f506:: with SMTP id j6mr12715lfb.159.1551774159067;
 Tue, 05 Mar 2019 00:22:39 -0800 (PST)
Received: from [10.105.82.250] ([81.16.143.135])
 by smtp.gmail.com with ESMTPSA id w69sm1952438lff.22.2019.03.05.00.22.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Mar 2019 00:22:37 -0800 (PST)
Subject: Re: [PATCH v2 1/6] mtd: nand: omap: Fix comment in platform data
 using wrong Kconfig symbol
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
References: <20190304222226.12682-1-miquel.raynal@bootlin.com>
 <20190304222226.12682-2-miquel.raynal@bootlin.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2d2d62ab-e76e-7686-f4b7-720ffa7b4ab6@cogentembedded.com>
Date: Tue, 5 Mar 2019 11:22:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190304222226.12682-2-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_002243_506303_095DB7F9 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: Vignesh R <vigneshr@ti.com>, Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 05.03.2019 1:22, Miquel Raynal wrote:

> The symbol that is being used in the #if/#endif bloc is not the one

    Block?

> mentioned at the bottom.
> 
> Fixes: 93af53b8633c ("nand: omap2: Remove horrible ifdefs to fix module probe")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
