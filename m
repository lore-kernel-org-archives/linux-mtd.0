Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F181BC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Nov 2022 07:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZosQ2r+xxojJAgPqsoY9sienvrve5uIfcGd9hUplvY=; b=JFBkRa3uvW/mjE
	b87DlGv9sIDILOkhfrJuWBCA1iGq/ysIU4XMoG/T6OneqYK/Y9+yQRaSEPnPwrl9BbfJbtfS7NYFR
	B2GvZAu+rgd1ksPdUIIaBR0eih8baiWyAjAGQhpfS/uEsB8WdOOjqVx2eJ/qlXOuNcsuC6WuYDoTl
	lu7EQ1ur9JqatQzvveOV47o1U2vGqRrwHdfBVi14pcemyV04GkNH2E+6PN5Rp/dKYeWGEb21hlj3g
	k9KlF+I3+tpDdZQkJecEoW5QPQ2SAEe4+2ycS9840dt2voUbaaG3rg1rRH1aN5H2FXvU2lWwb+SBk
	Gq0ASZ0+AUlmCBlmX5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvLp-0073go-Mr; Tue, 29 Nov 2022 07:48:22 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvLQ-0073WF-Lw
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2022 07:47:58 +0000
Received: by mail-lf1-x12f.google.com with SMTP id r12so21246220lfp.1
        for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2022 23:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=etxMVrTTVJSTddGDgARHAHEO1RrGD5Hs7SuIw9ap/3I=;
        b=rJ2CHbAyVDgULRTpj4MDVg2dwBK1HADystIZFbvhbTYoLIME+/tt+UNXjiftguq7ib
         w244K+6QPoVERfMg79BoElJO38d82eLScZZat5sFVE49snZOfOK2/+f0fnJIKBPDeYwr
         FMbKUIjfcevvcaBgXAKIO3MbRsFR3P6ZtMV7rNa9PIY4woHjOWMCcZuqv4pX0tOMHtUg
         i6K9FHqMYrX/NmhNXcCLLkLhSjNQEx5ifmowHQHPkWFrl7Bjgf4qKioahqfbJwtbyu+O
         kUj+dvJ58qD1SX7rLqgkoUAxuWicMcWgz3BzKtCsL8WBGDD+0gJi4HnxuReDXO62n9lO
         ykmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etxMVrTTVJSTddGDgARHAHEO1RrGD5Hs7SuIw9ap/3I=;
        b=mHS/8N6Xk+310aalWd3txenoVWQoJGdhoX8AEbU+nmNU7I/N7wVcLK7HRfP+FDnCGB
         65MHM6gdOJK2VRQ/2b0EeHRkGo8fFa7OZw8CFvCrRQtoSJsCMlxl+kIjVGrRGJbpa0yV
         A63l0deCLJWmo6psvf4EouOErykxc3QO0g506XZbNfsSv/HRUrgwmKDAE3PXVX3YQ9lz
         a7OQjyrl7vs1zRipSiiNEMWVu7KclG13y3F35uc1dMjWXtQFj7bLP5OGJMUAZy1hffEw
         IorMCMByMZhxunEZnu+5HnVT4MjYFnhfyg84uYmliUCX1GGQfbpZn/rfcGwz3Fsy/PeQ
         XFXw==
X-Gm-Message-State: ANoB5plQxbofYpoiumVxgNF1kz9X3WoticEP7APW6HGG/e5PSseIRiZV
	0F5oYGwmgp+bh97Df40Vsi1siw==
X-Google-Smtp-Source: AA0mqf67TcbUg0koPs/HiroxNXgbbcwrSRcrk/nihBw0w3MO/AQgLVDwdMtZH+S68ivSZKmzzQx01Q==
X-Received: by 2002:a19:ae18:0:b0:4aa:c879:5bc with SMTP id f24-20020a19ae18000000b004aac87905bcmr12172113lfc.498.1669708074608;
        Mon, 28 Nov 2022 23:47:54 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k16-20020a0565123d9000b0049e9122bd1bsm2080686lfv.164.2022.11.28.23.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 23:47:54 -0800 (PST)
Message-ID: <e512b7fd-3404-3c2d-dbf6-dc66ee662a06@linaro.org>
Date: Tue, 29 Nov 2022 08:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/9] dt-bindings: spi: mtk-snfi: add mt7986 IC snfi
 bindings
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
 <8b8e4b23-a3bc-7e3d-199a-e8f591d05d71@linaro.org>
 <5f76482d33933c19e191ea618f8622cd0660597f.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5f76482d33933c19e191ea618f8622cd0660597f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_234756_733625_53F2DFC1 
X-CRM114-Status: GOOD (  12.00  )
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

T24gMjkvMTEvMjAyMiAwMzo1MCwgWGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCkgd3JvdGU6Cj4g
SGkgS3J6eXN6dG9mLAo+IAo+IE9uIE1vbiwgMjAyMi0xMS0yOCBhdCAxMDowMCArMDEwMCwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMjgvMTEvMjAyMiAwMzowNiwgWGlhbmdzaGVu
ZyBIb3Ugd3JvdGU6Cj4+PiAxLiBhZGQgbXQ3OTg2IElDIGJpbmRpbmdzCj4+Cj4+IFN1YmplY3Q6
IGRyb3Agc2Vjb25kLCByZWR1bmRhbnQgImJpbmRpbmdzIi4KPiBXaWxsIGJlIGZpeGVkIGluIG5l
eHQgc2VyaWVzLgo+IAo+Pj4gICAgY2xvY2tzOgo+Pj4gKyAgICBtaW5JdGVtczogMgo+Pj4gICAg
ICBpdGVtczoKPj4+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBjbG9jayB1c2VkIGZvciB0aGUgY29u
dHJvbGxlcgo+Pj4gICAgICAgIC0gZGVzY3JpcHRpb246IGNsb2NrIHVzZWQgZm9yIHRoZSBTUEkg
YnVzCj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogY2xvY2sgdXNlZCBmb3IgdGhlIEFIQiBidXMg
ZG1hIGJ1cywgdGhpcwo+Pj4gZGVwZW5kcyBvbgo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGhh
cmR3YXJlIGRlc2lnbiwgc28gdGhpcyBpcyBvcHRpb25hbC4KPj4KPj4gT3B0aW9uYWwgZm9yIHdo
aWNoIHZhcmlhbnRzPyBGb3IgYWxsIG9mIHRoZW0/Cj4gSXRgcyBvbmx5IG5lZWRlZCBmb3IgdGhl
IGl0ZW0gMyBuZmlfaGNsay4gSXMgaXQgcHJvcGVyIHdpdGggdGhpcwo+IGRlc2NyaXB0aW9uIG9y
IGFueSBvdGhlciBzdWdnZXN0aW9uLgoKSSB1bmRlcnN0YW5kIHRoaXJkIGNsb2NrIGlzIG9wdGlv
bmFsLiBGb3Igd2hpY2ggdmFyaWFudHMvY29tcGF0aWJsZXMgaXQKaXMgb3B0aW9uYWw/IEFkZCBh
bGxPZjppZjp0aGVuIHJlc3RyaWN0aW5nIGl0LgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
