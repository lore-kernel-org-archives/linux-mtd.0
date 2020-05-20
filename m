Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE705C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 14:38:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E8D207D8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 14:38:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BwVhxZ74";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ZsaZMuyU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E8D207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M9KUE9cMBhUFtY8ieT/5Frhx5i4pwmOTTk7n56/0F60=; b=BwVhxZ74yPbPg2J2Dl7OE6kAQ
	xWbmklsS6TcvpjX9sh9cJUzTJWHYNmrwdO5w5NoInwpusVPkqgyJgbNLPp0Ni2HdpMjNEmeTrscu4
	OlmBm2Q+qBISkpKSo9uSoP+PmFgk3TAo2gCeAbZfhNHFGxKhHAyPxOjAXGTe0htkiBLp8dGuAfSS0
	gwZeik9DsZhqRDn7yEyCzy7loeN1R6MKWl5plLmbY6lwavR62QJwrIYJUGzFhT7QY/adHUFtcgaji
	czQCDIkH87ABAgB3Ms/Lnnfz/7RsEJfcvYxTM22gE2z9wRFIMWNHBPaeRZmgST9XZ8NXn9Nfqs6E2
	+zciFhKKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbPrc-0002CS-03; Wed, 20 May 2020 14:38:32 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbPrY-0002A0-EB
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 14:38:29 +0000
Received: by mail-lf1-x142.google.com with SMTP id z22so2488414lfd.0
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2020 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=znHUMaP0WqalUm3z5ilzUoUiYdwHWCOzV+xNGyMse2E=;
 b=ZsaZMuyUG/c63T71KQnutZMRMecTwOQ9e+xZo1mwtMXh/HnEKFNpg6iTh0kD/x2p5P
 R+bkxFYJyI7Rb+p865Qe8h6ykpOUJMNvSyu0U3V/pLTMtebveBAZzBJLA2YlswiT/HiW
 3JEGWZi825qVMDTxy3uqUD51ogVTMWXV4IvuxYVsspGIrM68xA5o+KYz3ArvMqW0Ejp+
 Q+fj6ENz3L28xOqXgMxs5JyrVfE4PGh2nI/xLwkHNxbruBYJxETKiI00SYx4eAZZL5CG
 pwLHe19EutHqmeSHTOSnis/KoZgVnrqJ7j07FAeJdcUIsXQEcjZbolyR1Bkbb0uQhsn9
 RMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=znHUMaP0WqalUm3z5ilzUoUiYdwHWCOzV+xNGyMse2E=;
 b=qbHqtZMXoEobfHz50Orcx2gSitNCdWhEoa9Bghc9Ef3hR6FEI/+0K4mphQ6MZV8n2R
 ij/hB3CzfX5VEKI9ENul+r8kfWQJLdHz96L13ke2n3JlcN12Z6c1Xw21ZAffILr6lJ9P
 dFyIs/obGG9+gAue/NLvM1y6jtVxiIBEFaSLWS15LhN0zw5TSy0c1MoSQsb11Myrlo9K
 ypu6jFc7Ztwd1kTRaZBpyu60FCvBG4kPP1ORMe1/qZyhHtxjs7Z3vpq42L8ROumLbE67
 sT1I852QrafhproHyVmTEzeXg9Gwk3Ha5NzsokVPDcLjqJ8cQNnZOaFluk1pF6BamBw8
 8Ppw==
X-Gm-Message-State: AOAM533lzLZxdhJykbeK/uMsInI8t3io1E/P2Gaj/826hHj6q8a3+5SF
 A3NhgEn0XMss/QfBfRFHu5I20r5Ovns=
X-Google-Smtp-Source: ABdhPJycRSmEi00KXgljA417fS6M4KKf8K3xhBn/6ZZOQ6UlRRZvGO2YKvURO4P1Mi9nL2IPvfdrUg==
X-Received: by 2002:ac2:414c:: with SMTP id c12mr2685185lfi.47.1589985505282; 
 Wed, 20 May 2020 07:38:25 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4e2:ae96:6d06:66d1:d6f1:88dc?
 ([2a00:1fa0:4e2:ae96:6d06:66d1:d6f1:88dc])
 by smtp.gmail.com with ESMTPSA id s8sm1116394lfc.83.2020.05.20.07.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 07:38:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: document Renesas RPC-IF
 bindings
To: Rob Herring <robh@kernel.org>
References: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
 <116683d1-d402-4d7f-3357-1c8cde807076@cogentembedded.com>
 <20200501212547.GB15294@bogus>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5359d5a2-5d28-058e-ce37-bc91e1aa7988@cogentembedded.com>
Date: Wed, 20 May 2020 17:38:12 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200501212547.GB15294@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_073828_556221_53991FE2 
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
Cc: devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02.05.2020 0:25, Rob Herring wrote:

>> Renesas Reduced Pin Count Interface (RPC-IF) allows a SPI flash or
>> HyperFlash connected to the SoC to be accessed via the external address
>> space read mode or the manual mode.
>>
>> Document the device tree bindings for the Renesas RPC-IF found in the R-Car
>> gen3 SoCs.
>>
>> Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> Changes in version 2:
>> - rewrote the bindings in YAML.
>>
>>   Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |   88 ++++++++++
> 
> Not where we normally put SPI flash controllers...

    RPC-IF is not exactly SPI flash controller, it's bimodal.

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
