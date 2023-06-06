Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AD8C7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZE5m6sqw1y6Nw09WgeXO9LLAZA1aJXDXJc5gfYm3kk=; b=kB30qLpSdua4Kb
	GlxtnM0nIMNX4SI4srhNvpDoaVKpOSBRx+JXQTOLxVFjr6RpZbi3DaSP3vSB4EzSJJ5IXneo1REpl
	u5H0d9zuNaqE8oZ5SVo80bCbME06mRZzMZSLTu++k7V+rVDGeRpubqqyQV01NESfYYfXGtFQ5mZDF
	QIOxdhfD0RF9MDM1S1boEdcGiJ+3RXWwurZU7mRWlO30uQe1fWK5zd1hMcXJXxpEXC8C1EkL6BKlR
	CX/8pxDSG61A20YO6fa4DVewqgupWwoiFBB+13DMo3kjaRvE+VSMJU03vP60PCYJnqIKSnVnj/gUa
	zosyIRELJ/K1vpnG76mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6U4P-001FPB-1P;
	Tue, 06 Jun 2023 10:37:45 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6U4L-001FLL-1j
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 10:37:43 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5147e8972a1so8963019a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686047859; x=1688639859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QpFJU/IqFR4e+DTduLLpRyhdstc+HgSzigyth1/+/Co=;
        b=Ck/7CWY5+neMVyfUxgW8MYTH/zWqy/Yu7zovm2HHe7oYFPZj6YSxWtOQSKEwxIE/34
         XGw9zpunLOYPQSe9WRiv222R4bEzRt0SSPSAZsdXdFFE4DcakFjJRKeHxorkTNVs/539
         M6GxyivK2L88pUKJ9VQvc+0fsWGlSp5yMoHphFhd7skVWU9tCEJ3a3dFcxbqbTyO6Gyo
         h6C4zO8b3ERxOcZUtQ31hEYgnKB7kTG3KD6kB9S4do1VPdKqd1n2ZfGU4zkpMfLWHpgq
         ZqYObGe7D8sVV8RfMleKxtAcCvwuRhirGrT9Yv7t7QluwMEr1zf+8vAkJGBcC35hswBI
         VPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686047859; x=1688639859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpFJU/IqFR4e+DTduLLpRyhdstc+HgSzigyth1/+/Co=;
        b=G4UzBRtxJKZUqxqjS6giJwVTVpwolOUnK2zu6gdeYFmPVwdTswNwRz+m+dZOebGi5m
         o8lnPZUfJhVbOrfwcO0kC4J7qJFRskhBnN+8AYIJ/OGfeB9lvXCgEsSgjei4Q6GjkyzF
         AeCK47Yg9tZ+y5Mmi+fId+lsesvIMRd2gifDqrlf/AjYahE80WNU0KTlbCrpVLviEjXq
         JqumI3+n7VpLpAFfcm56QUXvJuSGlU2eS8omrN7geEVRXcWNnNjBuf4t15PZz+mdo8Fz
         f/8zEnuEid8+OfNuxfPzbrg6C5Itw01HfpJvZX7C06sUqaV665HxdjoDOMyzQwd/CuJK
         Ltew==
X-Gm-Message-State: AC+VfDwNESen897HFjuEikMwCgzU4ros6jgM1DOtkKykBZgpKU7VDe1x
	QBWs5nm3KdkoeoyJI005kucocQ==
X-Google-Smtp-Source: ACHHUZ7KnV3/A9DLydmlg/VE9hatPc63P79rhG5BvWGL9kzRkq0H7TADwkeZqK2QNk9a2ZBNhPubqQ==
X-Received: by 2002:a17:907:2d0b:b0:974:62d7:1467 with SMTP id gs11-20020a1709072d0b00b0097462d71467mr1985000ejc.5.1686047859225;
        Tue, 06 Jun 2023 03:37:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090668da00b00947ed087a2csm5365258ejr.154.2023.06.06.03.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:37:38 -0700 (PDT)
Message-ID: <e0d14527-8147-5e8b-6a43-ee043e0d0f8b@linaro.org>
Date: Tue, 6 Jun 2023 12:37:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606122812.411b223a@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_033741_627471_541ECF9F 
X-CRM114-Status: GOOD (  31.17  )
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

T24gMDYvMDYvMjAyMyAxMjoyOCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBLcnp5c3p0b2Ys
Cj4gCj4ga3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFR1ZSwgNiBKdW4g
MjAyMyAxMDo0NDozNCArMDIwMDoKPiAKPj4gT24gMDYvMDYvMjAyMyAwOTo0OCwgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgaXQgKG90aGVyd2lzZSBp
dCBpcyBoYXJtbGVzcykuCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZwo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRl
cHJlY2F0ZWQ6IHRydWUKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICvCoMKgwqAgYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlICAgIAo+Pj4+Pj4+PiB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNl
ICAgIAo+Pj4+Pj4+IEl0IHdhcyBoaWRpbmcgYnkgJyJebmFuZEBbMC0zXSQiOicuIFNob3VsZCBJ
IG1vdmUgaXQgaGVyZT8gICAgCj4+Pj4+PiBZb3UgY2Fubm90IGhhdmUgYm90aCBhZGRpdGlvbmFs
UHJvcHMgYW5kIHVuZXZhbHVhdGVkUHJvcHMgYXQgdGhlIHNhbWUKPj4+Pj4+IHRpbWUsIHNvIHdl
IGRvIG5vdCB0YWxrIGFib3V0IHNhbWUgdGhpbmcgb3IgdGhpcyB3YXMgbmV2ZXIgd29ya2luZz8g
ICAgCj4+Pj4+Cj4+Pj4+IEhtbSwgSSdtIGEgbGl0dGxlIGNvbmZ1c2VkIHRoZW4uIEF0IHZhcmlv
dXMgdGltZXMgSSd2ZSBiZWVuIHRvbGQgdG8gCj4+Pj4+IHB1dCAnYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlJyBvciAndW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZScgCj4+Pj4+IChhbHRo
b3VnaCBuZXZlciBhdCB0aGUgc2FtZSB0aW1lKS4gSSdtIG5vdCBzdXJlIHdoZW4gdG8gdXNlIG9u
ZSBvciB0aGUgCj4+Pj4+IG90aGVyLgo+Pj4+Pgo+Pj4+PiBGcm9tIHdoYXQgSSd2ZSBiZWVuIGFi
bGUgdG8gZ2xlYW4gJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlJyAKPj4+Pj4gaW5kaWNhdGVz
IHRoYXQgdGhlIG5vZGUgaXMgZXhwZWN0ZWQgdG8gaGF2ZSBjaGlsZCBub2RlcyBkZWZpbmVkIGlu
IGEgCj4+Pj4+IGRpZmZlcmVudCBzY2hlbWEgc28gSSB3b3VsZCBoYXZlIHRob3VnaHQgJ2FkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZScgCj4+Pj4+IHdvdWxkIGJlIGFwcHJvcHJpYXRlIGZvciBh
IHNjaGVtYSBjb3ZlcmluZyBhIGxlYWYgbm9kZS4gCj4+Pj4+ICd1bmV2YWx1YXRlZFByb3BlcnRp
ZXM6IGZhbHNlJyBzZWVtcyB0byBlbmFibGUgc3RyaWN0ZXIgY2hlY2tpbmcgd2hpY2ggCj4+Pj4+
IG1ha2VzIHNlbnNlIHdoZW4gYWxsIHRoZSBwcm9wZXJ0aWVzIGFyZSBkZXNjcmliZWQgaW4gdGhl
IHNjaGVtYS4gICAgCj4+Pj4KPj4+PiBTbyBJIHRoaW5rIHRoaXMgbWlnaHQgYmUgdGhlIHByb2Js
ZW0uIElmIEkgbG9vayBhdCBxY29tLG5hbmRjLnlhbWwgb3IgCj4+Pj4gaW5nZW5pYyxuYW5kLnlh
bWwgd2hpY2ggYm90aCBoYXZlIGEgcGFydGl0aW9ucyBwcm9wZXJ0eSBpbiB0aGVpciAKPj4+PiBl
eGFtcGxlLiBOZWl0aGVyIGhhdmUgJ3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UnIG9uIHRo
ZSBuYW5kQC4uLiAKPj4+PiBzdWJub2RlLiBJZiBJIGFkZCBpdCBzdXJlIGVub3VnaCBJIHN0YXJ0
IGdldHRpbmcgY29tcGxhaW50cyBhYm91dCB0aGUgCj4+Pj4gJ3BhcnRpdGlvbnMnIG5vZGUgYmVp
bmcgdW5leHBlY3RlZC4gIAo+Pj4KPj4+IFNvcnJ5IGlmIHRoYXQgd2FzIHVuY2xlYXIsIEkgdGhp
bmsgdGhlIHdob2xlIGxvZ2ljIGFyb3VuZCB0aGUgeWFtbAo+Pj4gZmlsZXMgaXMgdG8gcHJvZ3Jl
c3NpdmVseSBjb25zdHJhaW4gdGhlIGRlc2NyaXB0aW9ucywgc2NoZW1hIGFmdGVyCj4+PiBzY2hl
bWEuIElPVywgaW4gdGhlIG1hcnZlbGwgYmluZGluZyB5b3Ugc2hvdWxkIHNldAo+Pj4gdW5ldmFs
dWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZSBmb3IgdGhlIE5BTkQgY29udHJvbGxlci4gV2hhdCBpcyBp
bnNpZGUKPj4+IChOQU5EIGNoaXBzLCBwYXJ0aXRpb24gY29udGFpbmVyLCBwYXJ0aXRpb24gcGFy
c2VycywgIm10ZCIgcHJvcGVydGllcywKPj4+IGV0Yykgd2lsbCBiZSBoYW5kbGVkIGJ5IG90aGVy
IGZpbGVzLiBPZiBjb3Vyc2UgeW91IGNhbiBjb25zdHJhaW4gYSBiaXQKPj4+IHdoYXQgY2FuL2Nh
bm5vdCBiZSB1c2VkIGluc2lkZSB0aGVzZSBzdWJub2RlcywgYnV0IEkgdGhpbmsgeW91IGRvbid0
Cj4+PiBuZWVkIHRvIHNldCB1bmV2YWx1YXRlZFByb3BlcnRpZXMgaW4gdGhlc2Ugc3Vibm9kZXMg
KHRoZSBOQU5EIGNoaXAgaW4KPj4+IHRoaXMgY2FzZSwgb3IgZXZlbiB0aGUgcGFydGl0aW9ucykg
YmVjYXVzZSB5b3UgYWxyZWFkeSByZWZlcmVuY2UKPj4+IG5hbmQtY29udHJvbGxlci55YW1sIHdo
aWNoIHJlZmVyZW5jZXMgbmFuZC1jaGlwLnlhbWwsIG10ZC55YW1sLAo+Pj4gcGFydGl0aW9ucy55
YW1sLCBldGMuICp0aGV5KiB3aWxsIG1ha2UgdGhlIGdlbmVyaWMgY2hlY2tzIGFuZCBob3BlZnVs
bHkKPj4+IGFwcGx5IHN0cmljdGVyIGNoZWNrcywgd2hlbiBkZWVtZWQgcmVsZXZhbnQuICAKPj4K
Pj4gTm8sIG5laXRoZXIgbmFuZC1jb250cm9sbGVyLnlhbWwgbm9yIG5hbmQtY2hpcC55YW1sIGxp
bWl0IHRoZSBwcm9wZXJ0aWVzCj4+IGluIHRoaXMgY29udGV4dCwgc28gZWFjaCBkZXZpY2Ugc2No
ZW1hIG11c3QgaGF2ZSB1bmV2YWx1YXRlZFByb3BlcnRpZXM6Cj4+IGZhbHNlLCBmb3Igd2hpY2gg
SSBhc2tlZCBmZXcgZW1haWxzIGFnby4KPiAKPiBUaGUgY29udHJvbGxlciBkZXNjcmlwdGlvbiBz
aGFsbCBiZSBndWFyZGVkIGJ5IHVuZXZhbHVhdGVkUHJvcGVydGllczoKPiBmYWxzZSwgd2UgYWdy
ZWUuIERvIHlvdSBtZWFuIHRoZSBuYW5kIGNoaXAgZGVzY3JpcHRpb24gaW4gZWFjaCBuYW5kCj4g
Y29udHJvbGxlciBiaW5kaW5nIHNob3VsZCBhbHNvIGluY2x1ZGUgaXQgYXQgaXRzIG93biBsZXZl
bD8gQmVjYXVzZQo+IHRoYXQgaXMgbm90IHdoYXQgd2UgZW5mb3JjZWQgc28gZmFyIElJUkMuIEkg
YW0gdG90YWxseSBmaW5lIGRvaW5nIHNvCj4gc3RhcnRpbmcgZnJvbSBub3cgb24gaWYgdGhpcyBp
cyBhIG5ldyByZXF1aXJlbWVudCAod2hpY2ggbWFrZXMgc2Vuc2UpLgo+IAo+IElmIHllcywgdGhl
biBpdCBtZWFucyB3ZSB3b3VsZCBuZWVkIHRvIGxpc3QgKmFsbCogdGhlIG5hbmQKPiBjaGlwIHBy
b3BlcnRpZXMgaW4gZWFjaCBzY2hlbWEsIHdoaWNoIGNsZWFybHkgaW52b2x2ZXMgYSBsb3Qgb2YK
PiBkdXBsaWNhdGlvbiBhcyB5b3Ugd291bGQgbmVlZCB0byBkZWZpbmUgYWxsIHR5cGVzIG9mIHBh
cnRpdGlvbnMsCj4gcGFydGl0aW9uIHBhcnNlcnMsIGdlbmVyaWMgcHJvcGVydGllcywgZXRjIGlu
IG9yZGVyIGZvciB0aGUgZXhhbXBsZXMgdG8KPiBwYXNzIGFsbCB0aGUgY2hlY2tzLiBPbmx5IHRo
ZSBwcm9wZXJ0aWVzIGxpa2UgcGluY3RybC0qIHdvdWxkIG5vdCBuZWVkCj4gdG8gYmUgbGlzdGVk
IEkgZ3Vlc3MuCgpZZXMsIHRoaXMgaXMgd2hhdCBzaG91bGQgYmUgZG9uZS4gRWFjaCBub2RlIHNo
b3VsZCBoYXZlIGVpdGhlcgphZGRpdGlvbmFsIG9yIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UuIEl0IG1pZ2h0IGNvbWUgZnJvbQpyZWZlcmVuY2VkIHNjaGVtYSBvciBmcm9tIGZpbmFsIChk
ZXZpY2UpIHNjaGVtYSksIGJ1dCBpdCBsb29rcyBoZXJlIGl0CmlzIG1pc3NpbmcuIEl0J3MgZXhh
Y3RseSB0aGUgc2FtZSBpbiBhbGwgYmluZGluZ3MuIFlvdSB3aWxsIGZpbmQgcGxlbnR5Cm9mIGV4
YW1wbGVzLCBlLmcuIGluZGl2aWR1YWwgbGVkcyBjaGlsZHJlbiBhbmQgY29tbW9uLnlhbWwuCgoK
PiAKPiBBcyBDaHJpcyB3YXMgaGF2aW5nIGlzc3VlcyBjb21wYXJpbmcgaGlzIHdvcmsgd2l0aCB0
aGUgaW5nZW5pYyBhbmQgcWNvbQo+IHlhbWwgZmlsZXMsIEkgZ2F2ZSB5b3VyIGlucHV0IGEgdHJ5
IGFuZCBob3BlZnVsbHkgImZpeGVkIiB0aGVzZQo+IGJpbmRpbmdzLgoKQm90aCBhcmUgd3Jvbmcg
aW4gdGhpcyBtYXR0ZXIuIFlvdSBjYW4gZWFzaWx5IHRlc3QgaXQuIFBhdGNoIGxpa2U6CgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbmdlbmljLG5h
bmQueWFtbApiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5nZW5pYyxu
YW5kLnlhbWwKaW5kZXggYTdiZGI1ZDM2NzVjLi45NjhjNDJmNmI1YTIgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5nZW5pYyxuYW5kLnlhbWwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbmdlbmljLG5hbmQueWFt
bApAQCAtOTcsNiArOTcsOCBAQCBleGFtcGxlczoKICAgICAgICAgICAgICAgICBuYW5kLWVjYy1t
b2RlID0gImh3IjsKICAgICAgICAgICAgICAgICBuYW5kLW9uLWZsYXNoLWJidDsKCisgICAgICAg
ICAgICAgICAgZmFrZS1zdHVmZjsKKwogICAgICAgICAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7CiAgICAgICAgICAgICAgICAgcGluY3RybC0wID0gPCZwaW5zX25lbWNfY3MxPjsK
CnNob3VsZCB0cmlnZ2VyIHdhcm5pbmcgYXMgdGhpcyBpcyBjbGVhcmx5IGZha2Utc3R1ZmYuIE5v
IHdhcm5pbmcgdGhvdWdoLi4uCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
