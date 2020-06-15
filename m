Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DDCC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 16:30:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA832078A
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 16:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="se0ZPwvI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et3m76/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECA832078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9Glk5UTZ5armXDKIy6a4AV1Pjlh3ghpFvTwt/4Zq3Zw=; b=se0ZPwvIkGvG5ba8OSfaz/+mUc
	RLJGPeMq5Jmrmckg3jyU5PeQhs3PrUWTya85JaF7tSOQwJWHF2cwZr/Ux9TYQ925jIb9GhiT2SGhW
	ubejAlGQ2Vi5PnQwejrRPeXH8vohpq0BSTMzTgQssmmWwYcgth2RwQ0mUaGCS87+/DaDvIoCdB/QA
	hor8I54Z6vSBCR3WPekK9NEK6Enl09YPNSiTrMFuzuwTZdls8u4MWnmgDCQTLmasKn3fheUzLvqJf
	a68Dowbzwp/JzEOky6xoDL3wM8/Xya+bkjeT/Kfr1DBhq0Lu4JjuxZf43B5StOcZyjx4ms2+E7VLK
	+hHUTPXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jks0E-0004hf-Sy; Mon, 15 Jun 2020 16:30:30 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jks0C-0004hF-4Q; Mon, 15 Jun 2020 16:30:29 +0000
Received: by mail-pj1-x1042.google.com with SMTP id u8so62056pje.4;
 Mon, 15 Jun 2020 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ASmt28ZfnzD93uzKYATIUhSUcUfooSj22w2duyIt7AY=;
 b=et3m76/iHThHfneXsKeu5YnEa+PruBQQXKk9HqWY4ZoZOUTlnPRy9n10dLSgNeBqXa
 FxaXy+tVLhlV9Nsa/d78ifONIRhgp82gFfUecYCgQJrV7SSRBLVS3Hdm5WXCSqjKFz4U
 lxMvOyk7im3iX59lVLBFwEKrrauiggT/Eao2r340PMzYLo0Tw8nNE/2niSDKaVmaL2s+
 VwIcEccOfwRi38aACDklaFwAyPfPtJc1NPTfoYVVRFb+4MdiKCsOQ/MqgsDnpuKyoDZG
 KPdGfDG/CRCBvpQV8TI3Ud4B92KuEkSlF36OivFoH5megJrnyFKDFINZrlxH6vjNhHzS
 78eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ASmt28ZfnzD93uzKYATIUhSUcUfooSj22w2duyIt7AY=;
 b=eD6ZB0wJEnsDYFlc9/oqlXpcv1sX055/aaXGzA+v3fqpyhS0IqHMp18Ad/yd0G+egG
 1Gtfss9uYj44LEKnYxz3GUW1D94EFZLQ0jBbKOxfbrCdv6gL5IPajnsXqy0MC+JFRv4i
 HtPlC4vyXqOXRA3zWOYXkMJBeJI+IarEhJWohsUagp1uzZpLtr0LnW6xxxXL37/kNEDo
 tGBJjnk354z+xRjFa5/txBhGM7s5DCum7oeMhYr0PXYcb4TUQjHS3FAKvRO8NEq53N6H
 Vd1KuYH8bmRQ1RxsAiF3N/n1C2qp0zM/rWT3+vMMLNxICzg8WboB0ssgZ32UrqFvjC8l
 sRbA==
X-Gm-Message-State: AOAM532c4O9XbCigmGlwzKzrEPuSmdtvpa3qwV2wp9HWS2ky77Ao8crj
 N/qOYXDgq3LYNCsegaFGUNnftzZB
X-Google-Smtp-Source: ABdhPJxnlnBVRkWoafdExfTsdOI0XxhF/LQdTziOsh4cHc+YwBthLB9vTd2LIM4dNN9St0wT9gR4FA==
X-Received: by 2002:a17:90a:6886:: with SMTP id
 a6mr154721pjd.170.1592238627113; 
 Mon, 15 Jun 2020 09:30:27 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y5sm12126709pgl.85.2020.06.15.09.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 09:30:25 -0700 (PDT)
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 tsbogend@alpha.franken.de, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com,
 linus.walleij@linaro.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20200612073549.1658336-1-noltari@gmail.com>
 <20200615091740.2958303-1-noltari@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <748c496d-cdc4-d243-71bd-c7f16c2f8311@gmail.com>
Date: Mon, 15 Jun 2020 09:30:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615091740.2958303-1-noltari@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_093028_174011_0AA276E2 
X-CRM114-Status: UNSURE (   7.30  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA2LzE1LzIwMjAgMjoxNyBBTSwgw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOgo+
IEluc3RlYWQgb2YgdHJ5aW5nIHRvIHBhcnNlIENGRSB2ZXJzaW9uIHN0cmluZywgd2hpY2ggaXMg
Y3VzdG9taXplZCBieSBzb21lCj4gdmVuZG9ycywgbGV0J3MganVzdCBjaGVjayB0aGF0ICJDRkUx
IiB3YXMgcGFzc2VkIG9uIGFyZ3VtZW50IDMuCj4gCj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBG
ZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb25h
cyBHb3Jza2kgPGpvbmFzLmdvcnNraUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogRmxvcmlhbiBG
YWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+Ci0tIApGbG9yaWFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
