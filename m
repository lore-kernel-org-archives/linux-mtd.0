Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C868EB64DD
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 07:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p421nDzJtOHcyczAPoPouPhC48t1VZin+J8Nfo+Fq0E=; b=0+zB4RCTx/bcHD
	cO5v/TL6XQ/kLPjP2ivNeZgOfjL2vvAxOwp8NftgfHsMkyoR34UB99hhojHwjCLzsYAX6USBo0Jwg
	O/OuCJ+4E9AvmvoNEz6BIZVCzcF/Z0200HmTbtk5kBlmA4iWirDqh1uUn1XXkSG++FgUXQigZfT4m
	0Xp8U/t12KDWcO1TPI0fz9dx88Rcp3SW5AeknOCDaSmalT6vsy5VzzBwyNaw/8rqrHiD+S4WQnrpU
	zPMJ57cUWxau/Ojgapcq4bh2WfDALqcX+nj0Gv3Nxdxny8ILDmFovZN41FzFzzrvouM1ou5bk5NnA
	D4roNZa7n/pOohxylJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkmj-00DDlv-2w;
	Fri, 21 Jul 2023 07:42:45 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkmh-00DDkr-0o
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 07:42:44 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fdd515cebcso2564371e87.0
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 00:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689925360; x=1690530160;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6b2RlLMnUcUxkONDEOiGaaHL2LvD7/k1R8DHltB5lI=;
        b=sXxNhEZxGZhTW89/oH4zXhDNMdpeXroeiAsJPAvNTZIj9lD2Tt7XmEEo7GAkcQXYEh
         Mz6ca5/qddyAAhHZtom2S3PGTAe69N2fbi2tqYm49bcc+sRu4OJU/pP0cPTQHmi/9tEl
         0wHBq9PXAY3V/38vjG6M6LS2Au2Bmbw8U05ivvoOB2/7bvOJglPrv/IcFvK8Rsp8/mNT
         6rtvkGmT4ilqHGRqJCCh2N5zr0bVQbYCzGEfOaccacBbvh0ULF5s/+M3ZQCrKeFcg+GA
         XJiHRrskx+nit95N0NNz1dPDP+e5QGy9gWqM9mkFTIei/bdVSbOcXbQF0rt067jHEQiL
         1WAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689925360; x=1690530160;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6b2RlLMnUcUxkONDEOiGaaHL2LvD7/k1R8DHltB5lI=;
        b=ItZQtg21Nev74+3jDR5OKoP3Hi4Y7/0S7U41N+aNjsHQrFwCvO7gkEIYPA4A1Nt7xi
         hJWKH5eFVWG2qL+tU5Igc9RlYAD6ZRRnqN74qPwNPzc/lLZRZoR0EJ3d04GH6nb3S+hf
         zy2BnOwJLpOuUDzKzEHQBv5de/Q1h5dwk+ml1GeGK2nlUsCpZHzq7RXbMKSf/DvdAvZu
         vkjowEFec5JKTVYFnwEAKtJgkMp4vIAzi31e28r6Z8v7lRJBnK8jDnY3HvugGbx0eGp+
         KJsIMtybqfziyVd1gkk2y+ZLDFsWDv6wMWSHlaX+ztPRTHtWL3HzBIkZozszyjSoQh28
         3kiQ==
X-Gm-Message-State: ABy/qLaAVI/eerD7YoxmRVVN9wnqeyyGc7YVvup3+NA0dtpKIWBZ4uVy
	R4k1xhPKmfrgZDQ+A74HyRMxyg==
X-Google-Smtp-Source: APBJJlEbYCNrn7C+6/E9uaWKDwNcBrYmJdLhv2uLorLqRu9XxP5utJItY7ejTIp1HFvL1ZgD9HM69w==
X-Received: by 2002:a05:6512:39cf:b0:4f9:54f0:b6db with SMTP id k15-20020a05651239cf00b004f954f0b6dbmr838258lfu.13.1689925360263;
        Fri, 21 Jul 2023 00:42:40 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id z24-20020aa7c658000000b0051e166f342asm1732520edr.66.2023.07.21.00.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 00:42:39 -0700 (PDT)
Message-ID: <5cf51874-f622-fc3d-86cb-b12f09dc57d1@linaro.org>
Date: Fri, 21 Jul 2023 10:42:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V1 1/1] linux: drivers: mtd: spi-nor: gigadevice.c
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Vlim <vlim@gigadevice.com>, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 akumarma@amd.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vikhyat.goyal@amd.com
References: <20230720042834.12296-1-vlim@gigadevice.com>
 <62663146a51c2beac4eff48abe1f61f8@walle.cc>
 <TY0PR06MB56580D3FEE55389F41E33398BB3EA@TY0PR06MB5658.apcprd06.prod.outlook.com>
 <55d60aec-3b20-d9d3-aeb2-77abbcc47d16@linaro.org>
 <TY0PR06MB56581B9A28DCD7A7270CFC0ABB3FA@TY0PR06MB5658.apcprd06.prod.outlook.com>
 <130b3742-fe0b-2030-654f-0cf8863c1479@linaro.org>
 <3795b6594981a236481f70f9172d140b@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <3795b6594981a236481f70f9172d140b@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_004243_307388_2CEE6168 
X-CRM114-Status: GOOD (  10.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

CgpPbiAyMS4wNy4yMDIzIDEwOjQxLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4KPj4+IHsgImdk
MjVxMTI4IiwgSU5GTygweGM4NDAxOCwgMCwgNjQgKiAxMDI0LCAyNTYpCj4+PiDigILigILigILi
gILigILigILigILigILigILigILigILigIJGTEFHUyhTUElfTk9SX0hBU19MT0NLIHwgU1BJX05P
Ul9IQVNfVEIpCj4+Cj4+IFRoZSBsb2NraW5nIHN1cHBvcnQgaXMgbm90IHBhcnQgb2YgdGhlIEpF
REVDIFNGRFAgc3RhbmRhcmQsIGJ1dCB2ZW5kb3JzCj4+IGNhbiBkZWZpbmUgdGhlaXIgb3duIFNG
RFAgdGFibGVzIHdoZXJlIHRoZXkgZGVzY3JpYmUgdGhlIGxvY2tpbmcKPj4gc3VwcG9ydC4gU28g
Zm9yIG5vdywgaWYgeW91IHdhbnQgdG8gZW5hYmxlIGxvY2tpbmcgeW91IGhhdmUgdG8gc3BlY2lm
eQo+PiB0aGUgbG9ja2luZyBmbGFncywgd2hhdGV2ZXIgdGhleSBhcmUuIFRoZXJlIGFyZSBkaWZm
ZXJlbnQgZmxhdm9ycyBvZgo+PiBibG9jayBwcm90ZWN0aW9uIGxvY2tpbmcsIHdpdGggMyBvciA0
IGJsb2NrIHByb3RlY3Rpb24gYml0cywgdGhlaXIKPj4gb3JkZXIsIGV0Yy4gWW91J2xsIGhhdmUg
dG8gY2hlY2sgdGhlIGRhdGFzaGVldC4KPiAKPiBJJ3ZlIHNlZW4gdGhhdCBnaWdhZGV2aWNlIGhh
cyB0aGVpciBvd24gcHJvcHJpZXRhcnkgU0ZEUCB0YWJsZSB3aGljaAo+IGFsc28gaW5kaWNhdGVz
IGxvY2tpbmcuIEknZCBwcmVmZXIgdG8gaGF2ZSBhIHBhcnNlciBmb3IgdGhlc2UsIGVzcC4KPiBi
ZWNhdXNlIHRoZSBwYXRjaCBpcyBjb21pbmcgZnJvbSB0aGUgdmVuZG9yIGl0c2VsZiA6KQo+IAoK
WWVzLCBJIGFncmVlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
