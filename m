Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6CAC43334
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpeWxNCXbvB+M4KW/KtpF/5OkXBUxxOQWjxvlVc7wss=; b=fabAYgziaUTIMf
	+vtVf1Y7h7katjfmUjhe22b1GGN3EVROQfzyHsOlMNHtG6u4PqkGUPjPFxo1o0kMM+rEDOBwwBH35
	4Z5mwReTPSMuuizd3Rg7YbaIlxLQqBly5elGgYZhCMngt0U4zDpKUsIB0gXAtr8S6/yyPX+J2Wh+I
	kXIVheR3qkRekAbAqWsBCqwiU4lcso24s5F7oSTlAdy3P1F1H6gwQ5xtplzcnQtUoBRHxOKhhPvnU
	/9p/PnBbP25hov5mb/sS6qZJFuqOdE+8WltY7HOEvZ8uzpdmVhh4RbzAjBVWt415I4uFhT+7MDuhQ
	h6QMGgOO2PElBmnC60jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFJ9n-0066HQ-0u; Sat, 23 Jul 2022 17:43:15 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFJ9k-0066FZ-1h
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 17:43:13 +0000
Received: by mail-lf1-x130.google.com with SMTP id bp17so12294530lfb.3
        for <linux-mtd@lists.infradead.org>; Sat, 23 Jul 2022 10:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HlHphoZuLPE3CLbqX5TxLcWzRpVyhW7sASqwVEBH1/M=;
        b=CNGVPQBLY5Tr6aU6+prX28HGV6JBxo6xYQGD3TwyVH/5Jsc9WiP/seiZr0xjNFagpw
         qzRG0jG3xVioEbFWKJcoXdddNRpYNkqxufPKSXUXcxfQh5HBTBrVLWl9Zue1PngXLl93
         uOfX2gN9Ifd9Rs03FlUm6xePYlb0vSvW85v03WSNSPDKz4VkznKkD7g+FTd25k2mi1+c
         9xBO0TTvqnc+3vjghW3VUpFB+0+aKwuVx55F8cuDBno+IlJfOGRgpo+A2d9cfeGeKYod
         UV9JgxC+dlqX2VoZsCWJtl8XiB7DWtqfZIauLLwW5B4tjTjXx9cDGg5kOEOHFgtzzvh9
         fmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HlHphoZuLPE3CLbqX5TxLcWzRpVyhW7sASqwVEBH1/M=;
        b=MPsqtJq4t9tDVaWAsCOTFpdQZCh7n7+uPgU+h9jgjjeIME7p+zNP+s/6mtZbEB+7sR
         c08m002WIWcZcIvFx9b6lCG3dqetK9l1kn7SvtoOSORqC5HBtHh7THkSLUAJQEFNkGYK
         TX3BuF2Pe7KIFlXNLhfs0eJmuWvNLhs8OZie4UseG9f9Gu+oRnEIAY52XkPRubgexa5k
         2dzb/WcDEjNVV75Z/dbpZrhc2PZvf1QSiYJ34WwKz6eU38zwvLeeh6LS26JgTKxVLP7R
         6crexwIjH8ShoukJbMVwckDQc5HEMu281DJBZHJLYuYSW+jVJEPhydOe98s5TPnaamhN
         aXWA==
X-Gm-Message-State: AJIora8QYI9/K67lK+313h/dGhuT9JIFS0e+5WsppTPDPxfhqzrnnepy
	s29jnuBPRMtYiuu4y1bkC+Sh6g==
X-Google-Smtp-Source: AGRyM1uQNl3x42KCq0cGc9OqDnR54QTGrXDVh1wXSEUelvPCIfB7qPr5bBayswnv+Tpu0ay0JGCmIw==
X-Received: by 2002:a05:6512:3e0a:b0:489:e50b:1dc9 with SMTP id i10-20020a0565123e0a00b00489e50b1dc9mr2119685lfv.321.1658598187752;
        Sat, 23 Jul 2022 10:43:07 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b00482bdd14fdfsm1770938lfr.32.2022.07.23.10.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 10:43:07 -0700 (PDT)
Message-ID: <d1a0dd15-3621-14e9-b931-417cefaab017@linaro.org>
Date: Sat, 23 Jul 2022 19:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
Content-Language: en-US
To: Zhou Yanjie <zhouyanjie@wanyeetech.com>, tudor.ambarus@microchip.com,
 p.yadav@ti.com, michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com, tmn505@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
 reimu@sudomaker.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
 <487a93c4-3301-aefd-abba-aabf4cb8ec90@linaro.org>
 <37062a5d-9da3-fbaf-89bd-776f32be36d9@wanyeetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <37062a5d-9da3-fbaf-89bd-776f32be36d9@wanyeetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_104312_145902_908A7929 
X-CRM114-Status: GOOD (  17.69  )
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

T24gMjMvMDcvMjAyMiAxODo1MCwgWmhvdSBZYW5qaWUgd3JvdGU6Cj4gSGkgS3J6eXN6dG9mLAo+
IAo+IE9uIDIwMjIvNy8yMyDkuIrljYgxOjQ2LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+
PiBPbiAyMi8wNy8yMDIyIDE4OjQ4LCDlkajnkLDmnbAgKFpob3UgWWFuamllKSB3cm90ZToKPj4+
IEFkZCB0aGUgU0ZDIGJpbmRpbmdzIGZvciB0aGUgWDEwMDAgU29DLCB0aGUgWDE2MDAgU29DLCB0
aGUgWDE4MzAgU29DLAo+Pj4gYW5kIHRoZSBYMjAwMCBTb0MgZnJvbSBJbmdlbmljLgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIDx6aG91eWFuamllQHdhbnll
ZXRlY2guY29tPgo+Pj4gLS0tCj4+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9pbmdl
bmljLHNmYy55YW1sICAgICAgIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gICAxIGZp
bGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9pbmdlbmljLHNmYy55YW1sCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5n
ZW5pYyxzZmMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5n
ZW5pYyxzZmMueWFtbAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAw
Li5iN2M0Y2Y0Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwKPj4+IEBAIC0wLDAgKzEsNjQgQEAK
Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZSkKPj4+ICslWUFNTCAxLjIKPj4+ICstLS0KPj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL3NwaS9pbmdlbmljLHNmYy55YW1sIwo+PiBGaWxlIG5hbWUgc2hvdWxkIGJl
IHJhdGhlciBiYXNlZCBvbiBmaXJzdCBjb21wYXRpYmxlLCBzbwo+PiBpbmdlbmljLHgxMDAwLXNm
Yy55YW1sCj4gCj4gCj4gTm8gb2ZmZW5zZSwgZG9lcyBpdCByZWFsbHkgbmVlZCB0byBiZSBuYW1l
ZCB0aGF0IHdheT8KPiBJIGNhbid0IHNlZW0gdG8gZmluZCBkb2N1bWVudGF0aW9uIHdpdGggaW5z
dHJ1Y3Rpb25zIG9uIHRoaXMgOigKPiAKPiBUaGUgdXNlIG9mICJpbmdlbmljLHNmYy55YW1sIiBp
bmRpY2F0ZXMgdGhhdCB0aGlzIGlzIHRoZSBkb2N1bWVudGF0aW9uCj4gZm9yIHRoZSBTRkMgbW9k
dWxlIGZvciBhbGwgSW5nZW5pYyBTb0NzLCB3aXRob3V0IG1pc2xlYWRpbmcgcGVvcGxlIGludG8K
PiB0aGlua2luZyBpdCdzIG9ubHkgZm9yIGEgc3BlY2lmaWMgbW9kZWwgb2YgU29DLiBBbmQgdGhl
cmUgc2VlbSB0byBiZSBtYW55Cj4gb3RoZXIgeWFtbCBkb2N1bWVudHMgdGhhdCB1c2Ugc2ltaWxh
ciBuYW1lcyAoZWcuIGZzbCxzcGktZnNsLXFzcGkueWFtbCwKPiBzcGktcm9ja2NoaXAueWFtbCwg
c3BpLW54cC1mc3BpLnlhbWwsIGluZ2VuaWMsc3BpLnlhbWwsIHNwaS1zaWZpdmUueWFtbCwKPiBv
bWFwLXNwaS55YW1sKSwgbWF5YmUgdGhlc2UgeWFtbCBmaWxlcyB0aGF0IGFyZSBub3QgbmFtZWQg
d2l0aCBmaXJzdAo+IGNvbXBhdGlibGUgYXJlIGFsc28gZm9yIHRoZSBzYW1lIGNvbnNpZGVyYXRp
b24uIDopCgpXZSBoYXZlIG1hbnkgYmFkIGV4YW1wbGVzLCBtYW55IHBvb3IgcGF0dGVybnMgYW5k
IHRoZXkgYXJlIG5ldmVyIGFuCmFyZ3VtZW50IHRvIGFkZCBvbmUgbW9yZSBiYWQgcGF0dGVybi4K
Ckl0IG1pZ2h0IG5ldmVyIGdyb3cgdG8gbmV3IGRldmljZXMgKGJlY2F1c2UgdGhleSBtaWdodCBi
ZSBkaWZmZXJlbnQpLCBzbwp0aGF0IGlzIG5vdCByZWFsbHkgYW4gYXJndW1lbnQuCgpBbGwgYmlu
ZGluZ3MgYXJlIHRvIGZvbGxvdyB0aGlzIHJ1bGUsIHNvIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkg
eW91CnRoaW5rIGl0IGlzIGFuIGV4Y2VwdGlvbiBmb3IgeW91PwoKCkJlc3QgcmVnYXJkcywKS3J6
eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
