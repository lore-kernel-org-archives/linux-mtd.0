Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D6BC7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98ZDq03bsVsM7G0eGfqCKCJTeVZF6aLLikYxvPEZP4g=; b=N/PzTUGwvxoLJ8
	6HbMAGlzxqx9exnD0gsr6XvN1OTks/92wWPqEDH2XHV87K/ji4jDSzFpdPfZLBKQLAPLMdZgionWj
	zkKHxin09thRg9ne9Vo3e4AigAn2442XgiaXx1RLHAvZkOW/j3t4Hy03mqI1HfVzpxERychxp5yjV
	3EITUEcUhEsqwqJ9zStYq1PCz3dpAO6VqFCDfmWBg/DlTmkpoLiGQHSNFlA95M+eJFvKvKOaJSPf6
	M4N+DIOCFFKkd5I2BwFOEAo6icX3kO3UeqInw+c3kVabjSLne6Xap5LicDhHQbmy6rtwZNvZxlpvl
	GHbu60N9TtZpphH2w/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6U7R-001HTF-0O;
	Tue, 06 Jun 2023 10:40:53 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6U7N-001HPX-2C
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 10:40:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-974f4897d87so634227966b.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686048047; x=1688640047;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLj774D+pz6YB3btZ/z2RD1vhvv9nZxLfJinEPA2x5A=;
        b=hP+B6dClgEY2Qbo3BxxHoolPl488Dk1P3+SkvYr9cN+giOYMeF/zUD6ZhUh/kt3R+S
         bXreUkYm0xrr1Ap2pmeeNBLYwwplyQ6MT6YVZFqMzSuCgmmQ6OIcnBsvhgUie0AcR9ti
         MWN2bfGRoQX2TINwDhPtmOpCOvU3AcaBWiq4yOzV2Vvs53JMuAC3t3vox5iLXDj9/Dua
         64YjbSwjbrfArANmaKVqTOPb+FKqU3DlhSLLX4vYoJVVJvx32Wkvj4j2SwK0fuqug82M
         aSPKLni2klECNNnM3MTppAoY/5Q/2qVnnwIRocgbzjCXYDyG22RSLY+HIgGLsVZC14M9
         ws3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686048047; x=1688640047;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLj774D+pz6YB3btZ/z2RD1vhvv9nZxLfJinEPA2x5A=;
        b=Xom7sgt6li2WU7GmolH8knDNETuFeK7eoO9kfXHXJDNiSn9rwLFe8hnPT0+5eVbO8f
         nxOzmmCb0rqqlKpia/QpEc3yxWlnUFIrKGljTQFKWqqhi664ed21qk8zDoQOmbcvpq5y
         gkaZ+60Gu9cIn1Z9oLkzMd9EIS76YELbwWWhdzS+PX2BVh7v7iUP9prOJmN/aSy3gcsq
         ruiFxKsD5elLjEwE1zOe/zQtTpaqIPiv6KduUYKxv+ptf0XYbi++/mAft52q1242lXMt
         PVhXm1hrSstuIEKRaqidzg2sH/7qbHeC6m5KjQmjl3TxGMxHIXoSxNPSRzlcTXENzN6W
         II8w==
X-Gm-Message-State: AC+VfDzL/C9jZp1yKu4gWPW5ZnUaaJWqPei5gMkZSOGhSD1R7k8e+ucZ
	YntC7UYTQ1kKAX0rmD/bMWPhYA==
X-Google-Smtp-Source: ACHHUZ7C1r42ySwDtx7lw0ifHfagwC8YL/zV9fl+XnaVQwq9v2QbktwuXbmkZ3A92llvOeCemuSEvw==
X-Received: by 2002:a17:907:3f24:b0:974:1c99:7d3 with SMTP id hq36-20020a1709073f2400b009741c9907d3mr2303998ejc.25.1686048047487;
        Tue, 06 Jun 2023 03:40:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gr24-20020a170906e2d800b0096f5b48fe43sm5431043ejb.47.2023.06.06.03.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:40:47 -0700 (PDT)
Message-ID: <d0b2cdc5-12fd-9a19-b38c-0653b4147c2b@linaro.org>
Date: Tue, 6 Jun 2023 12:40:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
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
 <845924ba-d9bf-d0ec-e1f2-f721366f43c0@linaro.org>
 <20230606122812.411b223a@xps-13>
 <e0d14527-8147-5e8b-6a43-ee043e0d0f8b@linaro.org>
In-Reply-To: <e0d14527-8147-5e8b-6a43-ee043e0d0f8b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_034049_719861_93A76F27 
X-CRM114-Status: GOOD (  26.32  )
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

T24gMDYvMDYvMjAyMyAxMjozNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAwNi8w
Ni8yMDIzIDEyOjI4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSBLcnp5c3p0b2YsCj4+Cj4+
IGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZyB3cm90ZSBvbiBUdWUsIDYgSnVuIDIwMjMg
MTA6NDQ6MzQgKzAyMDA6Cj4+Cj4+PiBPbiAwNi8wNi8yMDIzIDA5OjQ4LCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgaXQgKG90aGVyd2lzZSBpdCBp
cyBoYXJtbGVzcykuCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGVw
cmVjYXRlZDogdHJ1ZQo+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+PiArwqDCoMKgIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZSAgICAKPj4+Pj4+Pj4+IHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UgICAgCj4+Pj4+Pj4+IEl0IHdhcyBoaWRpbmcgYnkgJyJebmFuZEBbMC0zXSQiOicuIFNob3Vs
ZCBJIG1vdmUgaXQgaGVyZT8gICAgCj4+Pj4+Pj4gWW91IGNhbm5vdCBoYXZlIGJvdGggYWRkaXRp
b25hbFByb3BzIGFuZCB1bmV2YWx1YXRlZFByb3BzIGF0IHRoZSBzYW1lCj4+Pj4+Pj4gdGltZSwg
c28gd2UgZG8gbm90IHRhbGsgYWJvdXQgc2FtZSB0aGluZyBvciB0aGlzIHdhcyBuZXZlciB3b3Jr
aW5nPyAgICAKPj4+Pj4+Cj4+Pj4+PiBIbW0sIEknbSBhIGxpdHRsZSBjb25mdXNlZCB0aGVuLiBB
dCB2YXJpb3VzIHRpbWVzIEkndmUgYmVlbiB0b2xkIHRvIAo+Pj4+Pj4gcHV0ICdhZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UnIG9yICd1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlJyAKPj4+
Pj4+IChhbHRob3VnaCBuZXZlciBhdCB0aGUgc2FtZSB0aW1lKS4gSSdtIG5vdCBzdXJlIHdoZW4g
dG8gdXNlIG9uZSBvciB0aGUgCj4+Pj4+PiBvdGhlci4KPj4+Pj4+Cj4+Pj4+PiBGcm9tIHdoYXQg
SSd2ZSBiZWVuIGFibGUgdG8gZ2xlYW4gJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlJyAKPj4+
Pj4+IGluZGljYXRlcyB0aGF0IHRoZSBub2RlIGlzIGV4cGVjdGVkIHRvIGhhdmUgY2hpbGQgbm9k
ZXMgZGVmaW5lZCBpbiBhIAo+Pj4+Pj4gZGlmZmVyZW50IHNjaGVtYSBzbyBJIHdvdWxkIGhhdmUg
dGhvdWdodCAnYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlJyAKPj4+Pj4+IHdvdWxkIGJlIGFw
cHJvcHJpYXRlIGZvciBhIHNjaGVtYSBjb3ZlcmluZyBhIGxlYWYgbm9kZS4gCj4+Pj4+PiAndW5l
dmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZScgc2VlbXMgdG8gZW5hYmxlIHN0cmljdGVyIGNoZWNr
aW5nIHdoaWNoIAo+Pj4+Pj4gbWFrZXMgc2Vuc2Ugd2hlbiBhbGwgdGhlIHByb3BlcnRpZXMgYXJl
IGRlc2NyaWJlZCBpbiB0aGUgc2NoZW1hLiAgICAKPj4+Pj4KPj4+Pj4gU28gSSB0aGluayB0aGlz
IG1pZ2h0IGJlIHRoZSBwcm9ibGVtLiBJZiBJIGxvb2sgYXQgcWNvbSxuYW5kYy55YW1sIG9yIAo+
Pj4+PiBpbmdlbmljLG5hbmQueWFtbCB3aGljaCBib3RoIGhhdmUgYSBwYXJ0aXRpb25zIHByb3Bl
cnR5IGluIHRoZWlyIAo+Pj4+PiBleGFtcGxlLiBOZWl0aGVyIGhhdmUgJ3VuZXZhbHVhdGVkUHJv
cGVydGllczogZmFsc2UnIG9uIHRoZSBuYW5kQC4uLiAKPj4+Pj4gc3Vibm9kZS4gSWYgSSBhZGQg
aXQgc3VyZSBlbm91Z2ggSSBzdGFydCBnZXR0aW5nIGNvbXBsYWludHMgYWJvdXQgdGhlIAo+Pj4+
PiAncGFydGl0aW9ucycgbm9kZSBiZWluZyB1bmV4cGVjdGVkLiAgCj4+Pj4KPj4+PiBTb3JyeSBp
ZiB0aGF0IHdhcyB1bmNsZWFyLCBJIHRoaW5rIHRoZSB3aG9sZSBsb2dpYyBhcm91bmQgdGhlIHlh
bWwKPj4+PiBmaWxlcyBpcyB0byBwcm9ncmVzc2l2ZWx5IGNvbnN0cmFpbiB0aGUgZGVzY3JpcHRp
b25zLCBzY2hlbWEgYWZ0ZXIKPj4+PiBzY2hlbWEuIElPVywgaW4gdGhlIG1hcnZlbGwgYmluZGlu
ZyB5b3Ugc2hvdWxkIHNldAo+Pj4+IHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UgZm9yIHRo
ZSBOQU5EIGNvbnRyb2xsZXIuIFdoYXQgaXMgaW5zaWRlCj4+Pj4gKE5BTkQgY2hpcHMsIHBhcnRp
dGlvbiBjb250YWluZXIsIHBhcnRpdGlvbiBwYXJzZXJzLCAibXRkIiBwcm9wZXJ0aWVzLAo+Pj4+
IGV0Yykgd2lsbCBiZSBoYW5kbGVkIGJ5IG90aGVyIGZpbGVzLiBPZiBjb3Vyc2UgeW91IGNhbiBj
b25zdHJhaW4gYSBiaXQKPj4+PiB3aGF0IGNhbi9jYW5ub3QgYmUgdXNlZCBpbnNpZGUgdGhlc2Ug
c3Vibm9kZXMsIGJ1dCBJIHRoaW5rIHlvdSBkb24ndAo+Pj4+IG5lZWQgdG8gc2V0IHVuZXZhbHVh
dGVkUHJvcGVydGllcyBpbiB0aGVzZSBzdWJub2RlcyAodGhlIE5BTkQgY2hpcCBpbgo+Pj4+IHRo
aXMgY2FzZSwgb3IgZXZlbiB0aGUgcGFydGl0aW9ucykgYmVjYXVzZSB5b3UgYWxyZWFkeSByZWZl
cmVuY2UKPj4+PiBuYW5kLWNvbnRyb2xsZXIueWFtbCB3aGljaCByZWZlcmVuY2VzIG5hbmQtY2hp
cC55YW1sLCBtdGQueWFtbCwKPj4+PiBwYXJ0aXRpb25zLnlhbWwsIGV0Yy4gKnRoZXkqIHdpbGwg
bWFrZSB0aGUgZ2VuZXJpYyBjaGVja3MgYW5kIGhvcGVmdWxseQo+Pj4+IGFwcGx5IHN0cmljdGVy
IGNoZWNrcywgd2hlbiBkZWVtZWQgcmVsZXZhbnQuICAKPj4+Cj4+PiBObywgbmVpdGhlciBuYW5k
LWNvbnRyb2xsZXIueWFtbCBub3IgbmFuZC1jaGlwLnlhbWwgbGltaXQgdGhlIHByb3BlcnRpZXMK
Pj4+IGluIHRoaXMgY29udGV4dCwgc28gZWFjaCBkZXZpY2Ugc2NoZW1hIG11c3QgaGF2ZSB1bmV2
YWx1YXRlZFByb3BlcnRpZXM6Cj4+PiBmYWxzZSwgZm9yIHdoaWNoIEkgYXNrZWQgZmV3IGVtYWls
cyBhZ28uCj4+Cj4+IFRoZSBjb250cm9sbGVyIGRlc2NyaXB0aW9uIHNoYWxsIGJlIGd1YXJkZWQg
YnkgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOgo+PiBmYWxzZSwgd2UgYWdyZWUuIERvIHlvdSBtZWFu
IHRoZSBuYW5kIGNoaXAgZGVzY3JpcHRpb24gaW4gZWFjaCBuYW5kCj4+IGNvbnRyb2xsZXIgYmlu
ZGluZyBzaG91bGQgYWxzbyBpbmNsdWRlIGl0IGF0IGl0cyBvd24gbGV2ZWw/IEJlY2F1c2UKPj4g
dGhhdCBpcyBub3Qgd2hhdCB3ZSBlbmZvcmNlZCBzbyBmYXIgSUlSQy4gSSBhbSB0b3RhbGx5IGZp
bmUgZG9pbmcgc28KPj4gc3RhcnRpbmcgZnJvbSBub3cgb24gaWYgdGhpcyBpcyBhIG5ldyByZXF1
aXJlbWVudCAod2hpY2ggbWFrZXMgc2Vuc2UpLgo+Pgo+PiBJZiB5ZXMsIHRoZW4gaXQgbWVhbnMg
d2Ugd291bGQgbmVlZCB0byBsaXN0ICphbGwqIHRoZSBuYW5kCj4+IGNoaXAgcHJvcGVydGllcyBp
biBlYWNoIHNjaGVtYSwgd2hpY2ggY2xlYXJseSBpbnZvbHZlcyBhIGxvdCBvZgo+PiBkdXBsaWNh
dGlvbiBhcyB5b3Ugd291bGQgbmVlZCB0byBkZWZpbmUgYWxsIHR5cGVzIG9mIHBhcnRpdGlvbnMs
Cj4+IHBhcnRpdGlvbiBwYXJzZXJzLCBnZW5lcmljIHByb3BlcnRpZXMsIGV0YyBpbiBvcmRlciBm
b3IgdGhlIGV4YW1wbGVzIHRvCj4+IHBhc3MgYWxsIHRoZSBjaGVja3MuIE9ubHkgdGhlIHByb3Bl
cnRpZXMgbGlrZSBwaW5jdHJsLSogd291bGQgbm90IG5lZWQKPj4gdG8gYmUgbGlzdGVkIEkgZ3Vl
c3MuCj4gCj4gWWVzLCB0aGlzIGlzIHdoYXQgc2hvdWxkIGJlIGRvbmUuIEVhY2ggbm9kZSBzaG91
bGQgaGF2ZSBlaXRoZXIKCkVoLCBubywgSSByZXNwb25kZWQgaW4gd3JvbmcgcGFydCBvZiBtZXNz
YWdlLiBNeSB5ZXMgd2FzIGZvcjoKCiIgRG8geW91IG1lYW4gdGhlIG5hbmQgY2hpcCBkZXNjcmlw
dGlvbiBpbiBlYWNoIG5hbmQKY29udHJvbGxlciBiaW5kaW5nIHNob3VsZCBhbHNvIGluY2x1ZGUg
aXQgYXQgaXRzIG93biBsZXZlbD8iCgpOb3cgZm9yIGFjdHVhbCBwYXJhZ3JhcGg6CgoiSWYgeWVz
LCB0aGVuIGl0IG1lYW5zIHdlIHdvdWxkIG5lZWQgdG8gbGlzdCAqYWxsKiB0aGUgbmFuZCBjaGlw
CnByb3BlcnRpZXMgaW4gZWFjaCBzY2hlbWEsIgoKTm8sIHdoeT8gSSBkb24ndCB1bmRlcnN0YW5k
LiBVc2UgdGhlIHNhbWUgcGF0dGVybiBhcyBhbGwgb3RoZXIgYmluZGluZ3MsCnRoaXMgaXMgbm90
IHNwZWNpYWwuIEFic29sdXRlbHkgYWxsIGhhdmUgdGhlIHNhbWUgYmVoYXZpb3IsIGUuZy4KbWVu
dGlvbmVkIGxlZHMuIFlvdSBmaW5pc2ggd2l0aCB1bmV2YWx1YXRlZFByb3BzIGFuZCB5b3UncmUg
ZG9uZSwgd2hpY2gKaXMgd2hhdCBJIHdyb3RlIGhlcmUgbG9uZywgbG9uZyB0aW1lIGFnby4KCkJl
c3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
