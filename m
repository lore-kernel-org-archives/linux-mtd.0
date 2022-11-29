Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99303C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Nov 2022 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZpw1SNyVBCE3B2XFv2W4HI8fh0YqOreEzizrr7opyQ=; b=ShLEXAnSnSN8rx
	ULq/e1Y0NXrKTAWDaC8S3x0ps2aPlmC3YyiWmBXuSGz6Pyipa6G3cZPOYnGf3lwcf78tph8koom/4
	7NJg3RvHkbSmO8EJAMhy8aFsxCPJWanrXp1oFETCt5rVwSm28Ls/uY4f9SmeZFrZq0s3laC2W17Ph
	y/KDzz7Md95WAkh7ABpEXQXjnIMmMVpI0lKmLpWju8IKZiMnF7dRzdq+I6LI+68Pp9Lb4qP60qenX
	w0f6qFi27B8vOYxVWRn7WeBpZhSaU0hLDIQU48Pe4r3pg6HmmFUXNX4Vv4ThE9J5bOiruPqd05S0u
	b63fpx+zlyHRB+A91iSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvKj-0073B7-4u; Tue, 29 Nov 2022 07:47:13 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvKf-00738K-Qz
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2022 07:47:11 +0000
Received: by mail-lf1-x129.google.com with SMTP id f13so21187061lfa.6
        for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2022 23:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loSpF9AgG01RMo3LBV/v8v6fFtboHwkwvrGYRwDPayw=;
        b=BCIwFn6W/n3Cf25bMWz/YeiC1vDxWars4v8YMEFnaxBFn1+klIarsq0thr5IvFXBd9
         y0iEYk/HW1kb38E9fGJQE23xoYKh1JSMPNptDyAci8eDnjw187PoZRcMaTSsGScprKF0
         3JnzlEVO7XLzbb726ClGkCFzGKUg130Zltw6RkyFgarJr3EFrx3Ku1npNJ8ga77eTfkO
         69uWTfnN2vC1onzoddkNRL9JzocY4lCxV2vQJqwWxkWEMQCWlm07jXhcvDk8tqH+MEI6
         NmW+Z+mOT5piPL3GJr0IjEujQDbz1T01BGCV4QvqAHhK5GOztAAeZlu9lhf35ypj5sSe
         RrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loSpF9AgG01RMo3LBV/v8v6fFtboHwkwvrGYRwDPayw=;
        b=T+0nzOdWTJ1Q+hnlCwt+xLYn39wsozl963cwUSEu0xldM0JDR6CJzTL/eUn3jruBXl
         G3V4bIyK2LT659dOZOuOxJgfB8CvWutXkhpZtQ0XyLA++ptwBo8fgVVu/5XiAcPCq9hz
         nxdGuXK1bbAeurdTRMrbMJ8fA/qdT8hQro1kImy2jWeA+7Wm14Luh3027DERyg8HckjF
         iGq+6DMwxTOuEr+xoSjHw1fOiBXeGr5OvyWwyBho5RmZxrycIZPYG7pRXsWkEikQoXay
         2aGn0IR7MDJu/3Vq/9yVFY+y3M4D0AgwXvauyRHs8Tzl//ulxwuTUufK78RtczUFO4dr
         w6bg==
X-Gm-Message-State: ANoB5pm3QdPb5PSpiArZ8VKfwmYGnolblg0DG7Y8Itfqdzafxooj84Dc
	qd5HTzTGlq2s/WC4l75PBO11WJPEwFx3i9Wr
X-Google-Smtp-Source: AA0mqf6+wcgPAn5cslfEauv8J6Mh6lwM69/leKqgZb2AnXuqe0SSsSZ6WHFsED5uSwSOj/bep+llhw==
X-Received: by 2002:a05:6512:2212:b0:4b5:acf:8789 with SMTP id h18-20020a056512221200b004b50acf8789mr4757200lfu.549.1669708026761;
        Mon, 28 Nov 2022 23:47:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r13-20020ac252ad000000b004b49025f96dsm2096814lfm.187.2022.11.28.23.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 23:47:06 -0800 (PST)
Message-ID: <08ebc76a-0220-f984-b546-23dba8677be9@linaro.org>
Date: Tue, 29 Nov 2022 08:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 7/9] dt-bindings: spi: mtk-snfi: add two timing delay
 property
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
 <20221128020613.14821-8-xiangsheng.hou@mediatek.com>
 <9985d44e-977e-d7ea-0932-4879a3ccd14d@linaro.org>
 <f83184ae803dbe0afd37a31a8a83a369a9772880.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f83184ae803dbe0afd37a31a8a83a369a9772880.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_234709_901391_40307045 
X-CRM114-Status: GOOD (  15.03  )
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

T24gMjkvMTEvMjAyMiAwMzo1MCwgWGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCkgd3JvdGU6Cgo+
Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9tZWRpYXRlayxz
cGktbXRrLQo+Pj4gc25maS55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc3BpL21lZGlhdGVrLHNwaS1tdGstCj4+PiBzbmZpLnlhbWwKPj4+IEBAIC01NSw2
ICs1NSwyMiBAQCBwcm9wZXJ0aWVzOgo+Pj4gICAgICBkZXNjcmlwdGlvbjogZGV2aWNlLXRyZWUg
bm9kZSBvZiB0aGUgYWNjb21wYW55aW5nIEVDQyBlbmdpbmUuCj4+PiAgICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPj4+ICAKPj4+ICsgIHJ4LXNhbXBs
ZS1kZWxheToKPj4KPj4gTm8sIHVzZSBleGlzdGluZyBwcm9wZXJ0eSwgZG9uJ3QgaW52ZW50IHlv
dXIgb3duIHN0dWZmIC0gbWlzc2luZyB1bml0Cj4+IHN1ZmZpeC4gU2VlIHNwaS1wZXJpcGhlcmFs
LXByb3BzLnlhbWwuCj4gV2lsbCBjaGFuZ2UgdG8gb3RoZXIgcHJpdmF0ZSBwcm9wZXJ0eS4gVGhl
IHJlYWQgc2FtcGxlIGRlbGF5IHdpdGgKPiBNZWRpYVRlayBTUEkgTkFORCBjb250cm9sbGVyIGNh
biBiZSBzZXQgd2l0aCB2YWx1ZXMgZnJvbSAwIHRvIDQ3Lgo+IEhvd2V2ZXIsIGl0YHMgZGlmZmlj
dWx0IHRvIHNheSB0aGUgdW5pdCBvZiBlYWNoIHZhdWxlLCBiZWNhdXNlIHRoZSB1bml0Cj4gdmFs
dWUgd2lsbCBiZSBkaWZmZXJlbmNlIHdpdGggZGlmZmVyZW50IGNoaXAgcHJvY2VzcyBvciBkaWZm
ZXJlbnQKPiBjb3JuZXIgSUMuCgpXaHkgeW91IGNhbm5vdCB1c2Ugc2FtZSBmb3JtdWxhIGFzIG90
aGVyIFNQSSBkcml2ZXJzIGZvciBzYW1wbGUtZGVsYXk/CkFuZCBkaXZpZGUvbXVsdGlwbGUgYnkg
c29tZSBmYWN0b3Igc3BlY2lmaWMgdG8gU29DLCB3aGljaCBpcyB0YWtlbiBmcm9tCmRyaXZlcl9k
YXRhPwoKPiAKPj4+ICsgICAgZGVzY3JpcHRpb246IFJ4IGRlbGF5IHRvIHNhbXBsZSBkYXRhIHdp
dGggdGhpcyB2YWx1ZSwgdGhlCj4+PiB2YWxpZAo+Pj4gKyAgICAgICAgICAgICAgICAgdmFsdWVz
IGFyZSBmcm9tIDAgdG8gNDcuIFRoZSBkZWxheSBpcyBzbWFsbGVyCj4+PiB0aGFuCj4+PiArICAg
ICAgICAgICAgICAgICB0aGUgcngtbGF0Y2gtbGF0ZW5jeS4KPj4+ICsgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4+Cj4+IERyb3AgJHJlZi4KPiBXaWxs
IGRvLgo+IAo+Pgo+Pj4gKyAgICBtaW5JdGVtczogMAo+Pj4gKyAgICBtYXhJdGVtczogNDcKPj4+
ICsgICAgZGVmYXVsdDogMAo+Pj4gKwo+Pj4gKyAgcngtbGF0Y2gtbGF0ZW5jeToKPj4KPj4gU2Ft
ZSBwcm9ibGVtcy4gRGlkIHlvdSBjaGVjayBzcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sIG9yIG90
aGVyIFNQSQo+PiBjb250cm9sbGVyIHNjaGVtYXMgZm9yIHN1Y2ggcHJvcGVydHk/Cj4+Cj4+PiAr
ICAgIGRlc2NyaXB0aW9uOiBSeCBkZWxheSB0byBzYW1wbGUgZGF0YSB3aXRoIHRoaXMgdmFsdWUs
IHRoZQo+Pj4gdmFsdWUKPj4+ICsgICAgICAgICAgICAgICAgIHVuaXQgaXMgY2xvY2sgY3ljbGUu
Cj4+Cj4+IEkgdGhpbmsgdGhlIHVuaXQgc2hvdWxkIGJlIHJhdGhlciB0aW1lIChlLmcuIHVzKS4K
Pj4KPiBZZXMsIEkgY2hlY2tlZCB0aGUgc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCBhbmQgdGhl
IGRlbGF5IHZhbHVlcyBhcmUKPiBkZXNjcmliZWQgZXhhY3RseSB1bml0IHdpdGggbnMgb3IgdXMu
IEhvd2V2ZXIgdGhlIHVuaXQgb2YgTWVkaWFUZWsgcmVhZAo+IGxhdGNoIGxhdGVuY3kgaXMgY2xv
Y2sgY3ljbGUgYW5kIGl0YHMgZGlmZmVyZW5jZSB3aXRoIGRpZmZlcmVudCBjbG9jawo+IGZyZXF1
ZW5jeS4KClRoaXMgaXMgZmluZSBpbiBzdWNoIGNhc2UuCgo+IAo+Pj4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPj4+ICsgICAgZW51bTogWzAsIDEs
IDIsIDNdCj4+PiArICAgIGRlZmF1bHQ6IDAKPj4+ICsKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
