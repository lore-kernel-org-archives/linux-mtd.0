Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD0AC77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zmKg84HHeJs1x+KQYUw6S0GigV8n7fiQpzHFRUNo5w=; b=o2/WWecMR5h/zt
	Nkz9mQn8ew5iBxIylmUM6cp3E2e4qLuPmQMqGWPfEtbRPY6/Y0k7oE2vcS2v9xGqse/sX9YH8fPz5
	TMTrLngzVfIjiWRgLGcaINd9eRCaT3opfpyOd+bRthsZPrNjokfuCxgShGnB35CFrO3L2DBPSkxSw
	Fhe/4eF8ARNc5pBo7+RVwsajAoOQFe1vywaCqPbhcN47s5BUlVumxagzxeFjk2sVQLxYz+nWB0CsS
	GrqO4bfGVuKoXl7OzZu6YzINu5jyXLC5koVCUDLYj0wK8iuZk8lA2ztuRx+mZr27fqFCQzDsSHEGb
	n8MZZwjBEvYp6fizZrXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SJ1-000qnA-19;
	Tue, 06 Jun 2023 08:44:43 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SIy-000qlX-1D
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 08:44:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-977d0288fd2so374800566b.1
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 01:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686041077; x=1688633077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDg6FhswbLnxmS80mCt2IqXJuf8NCtYRpgYnIYW/CqI=;
        b=D+o10JAiGV/K8Dk8o+sTomnICPqQiKXQqiasLdnFHwrRq8AdmQ2PfydvWTEeDP84N/
         dStB8WQGQgAtmYa8scNzeiqDHoprVOcygCaYiDK3wjFU78QB4eHxEmyNDsCakwGUWDQR
         B6p/fW+n3tOogKlmTpCCJTZb4iQzwuOMP4Qluuma4aIBAm/OkXE9Jru0pAomBhb1ZPXJ
         LJb1uYH90Qw4T14XSm0AGDG0+QJl4b+ZCwjJXmEg4VaxZlg65OPOsGT29y29qv2D0xz5
         3rDYnN2DY4C0kwM//FLiQ7UcJFFThl78c6JoWIZWYUvlZI0+xtbnz20IdvLB5ucl+8GT
         te9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041077; x=1688633077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDg6FhswbLnxmS80mCt2IqXJuf8NCtYRpgYnIYW/CqI=;
        b=OTyUIi0i2mp1RVOnQEMzjSaojOeapR5CidhrOPw3a1naNSM+NFeTvxmunhy+qjEC0S
         agaXAea+o9Qje06F1YpwfegVu+oNnXwXRX8o6idm+Sq+SL00drsw9RnSysAI1VWjwCJd
         LB/gTupYkxF3S6BnvdGD6ADerzG3kvwqeVNxMFoIHPndXCXJ6oDk0eIs3o5HnAJ9v4mX
         xIthGy7skGUYI+UOh/bBdgyCB9yJaAGPE1VQmIEa7O76kMdXQ+Rz6sJaZnhVW3LVioFz
         s0CylXGHJkLgf+mpYjgXmljS37lhT9/y/VKWSUxsAui9Z1xUf+mAXgLfp+k3NqqMMeCz
         MYBA==
X-Gm-Message-State: AC+VfDyi4n2Gj2hByTF2Sz6G3y9n3J3Ec1sD1zDnYRtw6vPHcF87SpIr
	22Xuz+xHx8E/hGWbHaUyox1ciQ==
X-Google-Smtp-Source: ACHHUZ6wAfRnXikBVJbGi1CsiXd+lwR0OYsSoSocIDBbbRBkyIdkfClvyjFYznjWuYv6kxmoRkeiFA==
X-Received: by 2002:a17:907:3ea5:b0:973:9f60:c57e with SMTP id hs37-20020a1709073ea500b009739f60c57emr2012710ejc.2.1686041077566;
        Tue, 06 Jun 2023 01:44:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d4-20020a17090694c400b0096f67b55b0csm5265406ejy.115.2023.06.06.01.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 01:44:37 -0700 (PDT)
Message-ID: <845924ba-d9bf-d0ec-e1f2-f721366f43c0@linaro.org>
Date: Tue, 6 Jun 2023 10:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@lunn.ch"
 <andrew@lunn.ch>, "gregory.clement@bootlin.com"
 <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "conor@kernel.org" <conor@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "enachman@marvell.com" <enachman@marvell.com>,
 Vadym Kochan <vadym.kochan@plvision.eu>
References: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
 <20230531234923.2307013-4-chris.packham@alliedtelesis.co.nz>
 <a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@linaro.org>
 <785368df-1881-e62e-6172-d902cee814a8@alliedtelesis.co.nz>
 <eaf9d7cf-c9f5-a5d5-67af-c43761c3c6cf@linaro.org>
 <4ea0b16e-0cec-00db-c598-e0364a7edef8@alliedtelesis.co.nz>
 <9fc57052-5049-ed50-ca95-cfd1d0420dd9@alliedtelesis.co.nz>
 <20230606094855.1ab005eb@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606094855.1ab005eb@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_014440_423140_F7B981A8 
X-CRM114-Status: GOOD (  20.73  )
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

T24gMDYvMDYvMjAyMyAwOTo0OCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgIGl0IChvdGhlcndpc2UgaXQgaXMgaGFybWxlc3MpLgo+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFnCj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRlcHJlY2F0ZWQ6IHRydWUKPj4+Pj4+PiArCj4+Pj4+Pj4g
K8KgwqDCoCBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UgIAo+Pj4+Pj4gdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzOiBmYWxzZSAgCj4+Pj4+IEl0IHdhcyBoaWRpbmcgYnkgJyJebmFuZEBbMC0zXSQi
OicuIFNob3VsZCBJIG1vdmUgaXQgaGVyZT8gIAo+Pj4+IFlvdSBjYW5ub3QgaGF2ZSBib3RoIGFk
ZGl0aW9uYWxQcm9wcyBhbmQgdW5ldmFsdWF0ZWRQcm9wcyBhdCB0aGUgc2FtZQo+Pj4+IHRpbWUs
IHNvIHdlIGRvIG5vdCB0YWxrIGFib3V0IHNhbWUgdGhpbmcgb3IgdGhpcyB3YXMgbmV2ZXIgd29y
a2luZz8gIAo+Pj4KPj4+IEhtbSwgSSdtIGEgbGl0dGxlIGNvbmZ1c2VkIHRoZW4uIEF0IHZhcmlv
dXMgdGltZXMgSSd2ZSBiZWVuIHRvbGQgdG8gCj4+PiBwdXQgJ2FkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZScgb3IgJ3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UnIAo+Pj4gKGFsdGhvdWdo
IG5ldmVyIGF0IHRoZSBzYW1lIHRpbWUpLiBJJ20gbm90IHN1cmUgd2hlbiB0byB1c2Ugb25lIG9y
IHRoZSAKPj4+IG90aGVyLgo+Pj4KPj4+IEZyb20gd2hhdCBJJ3ZlIGJlZW4gYWJsZSB0byBnbGVh
biAnYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUnIAo+Pj4gaW5kaWNhdGVzIHRoYXQgdGhlIG5v
ZGUgaXMgZXhwZWN0ZWQgdG8gaGF2ZSBjaGlsZCBub2RlcyBkZWZpbmVkIGluIGEgCj4+PiBkaWZm
ZXJlbnQgc2NoZW1hIHNvIEkgd291bGQgaGF2ZSB0aG91Z2h0ICdhZGRpdGlvbmFsUHJvcGVydGll
czogZmFsc2UnIAo+Pj4gd291bGQgYmUgYXBwcm9wcmlhdGUgZm9yIGEgc2NoZW1hIGNvdmVyaW5n
IGEgbGVhZiBub2RlLiAKPj4+ICd1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlJyBzZWVtcyB0
byBlbmFibGUgc3RyaWN0ZXIgY2hlY2tpbmcgd2hpY2ggCj4+PiBtYWtlcyBzZW5zZSB3aGVuIGFs
bCB0aGUgcHJvcGVydGllcyBhcmUgZGVzY3JpYmVkIGluIHRoZSBzY2hlbWEuICAKPj4KPj4gU28g
SSB0aGluayB0aGlzIG1pZ2h0IGJlIHRoZSBwcm9ibGVtLiBJZiBJIGxvb2sgYXQgcWNvbSxuYW5k
Yy55YW1sIG9yIAo+PiBpbmdlbmljLG5hbmQueWFtbCB3aGljaCBib3RoIGhhdmUgYSBwYXJ0aXRp
b25zIHByb3BlcnR5IGluIHRoZWlyIAo+PiBleGFtcGxlLiBOZWl0aGVyIGhhdmUgJ3VuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UnIG9uIHRoZSBuYW5kQC4uLiAKPj4gc3Vibm9kZS4gSWYgSSBh
ZGQgaXQgc3VyZSBlbm91Z2ggSSBzdGFydCBnZXR0aW5nIGNvbXBsYWludHMgYWJvdXQgdGhlIAo+
PiAncGFydGl0aW9ucycgbm9kZSBiZWluZyB1bmV4cGVjdGVkLgo+IAo+IFNvcnJ5IGlmIHRoYXQg
d2FzIHVuY2xlYXIsIEkgdGhpbmsgdGhlIHdob2xlIGxvZ2ljIGFyb3VuZCB0aGUgeWFtbAo+IGZp
bGVzIGlzIHRvIHByb2dyZXNzaXZlbHkgY29uc3RyYWluIHRoZSBkZXNjcmlwdGlvbnMsIHNjaGVt
YSBhZnRlcgo+IHNjaGVtYS4gSU9XLCBpbiB0aGUgbWFydmVsbCBiaW5kaW5nIHlvdSBzaG91bGQg
c2V0Cj4gdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZSBmb3IgdGhlIE5BTkQgY29udHJvbGxl
ci4gV2hhdCBpcyBpbnNpZGUKPiAoTkFORCBjaGlwcywgcGFydGl0aW9uIGNvbnRhaW5lciwgcGFy
dGl0aW9uIHBhcnNlcnMsICJtdGQiIHByb3BlcnRpZXMsCj4gZXRjKSB3aWxsIGJlIGhhbmRsZWQg
Ynkgb3RoZXIgZmlsZXMuIE9mIGNvdXJzZSB5b3UgY2FuIGNvbnN0cmFpbiBhIGJpdAo+IHdoYXQg
Y2FuL2Nhbm5vdCBiZSB1c2VkIGluc2lkZSB0aGVzZSBzdWJub2RlcywgYnV0IEkgdGhpbmsgeW91
IGRvbid0Cj4gbmVlZCB0byBzZXQgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzIGluIHRoZXNlIHN1Ym5v
ZGVzICh0aGUgTkFORCBjaGlwIGluCj4gdGhpcyBjYXNlLCBvciBldmVuIHRoZSBwYXJ0aXRpb25z
KSBiZWNhdXNlIHlvdSBhbHJlYWR5IHJlZmVyZW5jZQo+IG5hbmQtY29udHJvbGxlci55YW1sIHdo
aWNoIHJlZmVyZW5jZXMgbmFuZC1jaGlwLnlhbWwsIG10ZC55YW1sLAo+IHBhcnRpdGlvbnMueWFt
bCwgZXRjLiAqdGhleSogd2lsbCBtYWtlIHRoZSBnZW5lcmljIGNoZWNrcyBhbmQgaG9wZWZ1bGx5
Cj4gYXBwbHkgc3RyaWN0ZXIgY2hlY2tzLCB3aGVuIGRlZW1lZCByZWxldmFudC4KCk5vLCBuZWl0
aGVyIG5hbmQtY29udHJvbGxlci55YW1sIG5vciBuYW5kLWNoaXAueWFtbCBsaW1pdCB0aGUgcHJv
cGVydGllcwppbiB0aGlzIGNvbnRleHQsIHNvIGVhY2ggZGV2aWNlIHNjaGVtYSBtdXN0IGhhdmUg
dW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOgpmYWxzZSwgZm9yIHdoaWNoIEkgYXNrZWQgZmV3IGVtYWls
cyBhZ28uCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
