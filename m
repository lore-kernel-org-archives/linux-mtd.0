Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CEAC46CA2
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 22:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC4TIyfQeFoh9qClh0tA5y2KRLogiuPJjTFqom1n9Bo=; b=HOSYARfL1plxqF
	uzwfb+TmwKhWEQMgdb60JKTrYXAnl3bcrON2zYOGmArSOY8wzDO/lpKHRmig//BgSrp2qIUb84kLQ
	6wgzu0+JAe5gZCSwuvruvKzVQLss+y8bYaNX68rsEcKrkH8S2tT7GYJTyTkp239HyRGz/K+NwJ2Ej
	vzux43XIfxfaLEiFW+Kl1pLuPSEour+Nsy2tDroEHfQUJw3m7Y+ijXZe7d8V4zuoovWQ6K//EH8jK
	l3yaE5zVJa3F3ibM3Zyvf1YxpO6XKHmDdEHvhwLSVYyh9WAitRVweLT+F0wW0yr2jkJNurhxG/TQK
	1zGKE55JmtG3ngANGTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLh4-00CCEl-0B;
	Mon, 18 Dec 2023 22:02:34 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLgy-00CCE5-1N;
	Mon, 18 Dec 2023 22:02:30 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a233a60f8feso258689166b.0;
        Mon, 18 Dec 2023 14:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702936946; x=1703541746; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j78u/AxbFW/PvB7ob0xH35r+RLxqVn7NFYykJEfCNm4=;
        b=F3PWZVc8aQW4/MmDXi052yqfr4wwwhem5qcs2IOduPOc+X3gibXIZdWPS1qy/CYZ79
         YLyOkZoi7evWEYTGG31fZ9ZpvLTd0Kpkw4NasM4dArhvpnazBEFRIPEtovq4LuFOkR3n
         GwlNyCfbuKXxz1C7r//SP8iljtoqB+M25/n/jq9EFDl5aqpb4EJx9YvmKPKKwx9wPv/A
         Gtfrj5E2M0lkn95BzfM/fMJ2Rg/Cm1oggwXV0BxCAJvbxQMvr3VmyzWoBmJbYIkngi3G
         vB7nsrzPK3S9l0NGe6yCNf3Vbn1t9XuXKhltcpSjY2qP9bTbxEhlRfouUVfY+m8GzfnD
         7x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702936946; x=1703541746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j78u/AxbFW/PvB7ob0xH35r+RLxqVn7NFYykJEfCNm4=;
        b=o+isZ3JUY0/sOT9cxbhOwf6lMhfaN/XyJlHm86gbwRr4Fe/cGODXdV/6Zs7j0n65F9
         WnfcgtMqxwOEICTwHSXo+Bx3DGiGOz0fTrsPDbek/4V2Uvm6ng5ZuITvjuekTexcU6KN
         JryNTSwsXqkZrc/DY193NSR2KUpUUqiyyKNRJXtadZqgflh21XgUp4DQdxDjM25KrAao
         ++PsopRHfLCPNhC/6f82MdD5X7IWoqKp5bHP7WtUIwBWxLQutN+LtVs5FA6a1xy8hRTx
         kpTHzW2hdrtyua0LD5UbR2j1Idd3lpLrA0Xr/rsxb9ZUkr6VeECbzx+a9SUcj9GAGccX
         yXHw==
X-Gm-Message-State: AOJu0YxnCw7WnI25hb0FuqHuQtZ64GLBEk1PWQDu/zcoozfWWFB2TOqM
	eWP09m8zaBuSkOs0aqeFvvs=
X-Google-Smtp-Source: AGHT+IEPZqXlfacA0u2n1vljM6X29jA54J6/WAEvQI9gh7KtlZMgF3FICfR713o6WiYGui2vKNrWNQ==
X-Received: by 2002:a17:906:7386:b0:a14:b151:72e6 with SMTP id f6-20020a170906738600b00a14b15172e6mr7515981ejl.21.1702936945048;
        Mon, 18 Dec 2023 14:02:25 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id tg10-20020a1709078dca00b00a178b965899sm14647993ejc.100.2023.12.18.14.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 14:02:24 -0800 (PST)
Message-ID: <1b4feb5d-f03c-44b3-9474-901534db5eb7@gmail.com>
Date: Mon, 18 Dec 2023 23:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] dt-bindings: nvmem: u-boot, env: add any-name MAC
 cells compatible
To: Simon Glass <sjg@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231214153620.23998-1-zajec5@gmail.com>
 <CAPnjgZ31AAauR876W1RmU4JPzKUD8XAMCZrJDumE+Dr4miqABQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <CAPnjgZ31AAauR876W1RmU4JPzKUD8XAMCZrJDumE+Dr4miqABQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_140228_491714_DB63A3C5 
X-CRM114-Status: GOOD (  12.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTQuMTIuMjAyMyAyMjoyNywgU2ltb24gR2xhc3Mgd3JvdGU6Cj4gT24gVGh1LCAxNCBEZWMg
MjAyMyBhdCAwODozNiwgUmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21haWwuY29tPiB3cm90ZToK
Pj4KPj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pgo+PiBTbyBm
YXIgd2UgaGFkIGEgcHJvcGVydHkgZm9yICJldGhhZGRyIiBOVk1FTSBjZWxsIGNvbnRhaW5pbmcg
YmFzZQo+PiBFdGhlcm5ldCBNQUMgYWRkcmVzcy4gVGhlIHByb2JsZW0gaXMgdmVuZG9ycyBvZnRl
biBwaWNrIG5vbi1zdGFuZGFyZAo+PiBuYW1lcyBmb3Igc3RvcmluZyBNQUMocykgKG90aGVyIHRo
YW4gImV0aGFkZHIiKS4gQSBmZXcgbmFtZXMgd2VyZQo+PiBub3RpY2VkIG92ZXIgeWVhcnM6Cj4+
IDEuICJ3YW5hZGRyIiAoRWRpbWF4LCBFTEVDT00sIEVuR2VuaXVzLCBJLU8gREFUQSwgU2l0ZWNv
bSkKPj4gMi4gImV0MW1hY2FkZHIiIChBU1VTKQo+PiAzLiAiZXRoMWFkZHIiIChCdWZmYWxvKQo+
PiA0LiAiYXRoYWRkciIgKEVuR2VuaXVzKQo+PiA1LiAiYmFzZU1BQyIgKE5ldGdlYXIpCj4+IDYu
ICJtYWMiIChOZXRnZWFyKQo+PiA3LiAibWFjX2FkZHIiIChNb3hhKQo+PiBhbmQgbW9yZSAoIkhX
X0xBTl9NQUMiLCAiSFdfV0FOX01BQyIsICJJTklDX01BQ19BRERSIiwgIkxBTl9NQUNfQUREUiIs
Cj4+ICJSQURJT0FERFIwIiwgIlJBRElPQUREUjEiLCAiV0FOX01BQ19BRERSIiwgImxhbjFfbWFj
X2FkZHIiLCAid2FubWFjIiwKPj4gIndtYWMxIiwgIndtYWMyIikuCj4+Cj4+IEl0IGRvZXNuJ3Qg
bWFrZSBzZW5zZSB0byBhZGQgcHJvcGVydHkgZm9yIGV2ZXJ5IHBvc3NpYmxlIE1BQyBjZWxsIG5h
bWUuCj4+IEluc3RlYWQgYWxsb3cgc3BlY2lmeWluZyBjZWxscyB3aXRoICJtYWMiIGNvbXBhdGli
bGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5w
bD4KPj4gLS0tCj4+IExpc3Qgb2YgZGV2aWNlcyBhbmQgdGhlaXIgVS1Cb290IE1BQyB2YXJpYWJs
ZXM6Cj4+IGFscGhhbmV0d29ya3MsYXNsNTYwMjYpIHdhbm1hYwo+PiBhc3VzLHJ0LWFjNjVwKSBl
dDFtYWNhZGRyCj4+IGFzdXMscnQtYWM4NXApIGV0MW1hY2FkZHIKPj4gYmVsa2luLGY5azExMDl2
MSkgSFdfV0FOX01BQyArIEhXX0xBTl9NQUMKPj4gYnVmZmFsbyxsczIyMGRlKSBldGgxYWRkcgo+
PiBidWZmYWxvLGxzNDIxZGUpIGV0aDFhZGRyCj4+IGNoZWNrcG9pbnQsbC01MCkgbGFuMV9tYWNf
YWRkcgo+PiBkb3ZhZG8sdGlueS1hYykgSU5JQ19NQUNfQUREUgo+PiBkb3ZhZG8sdGlueS1hYykg
TEFOX01BQ19BRERSICsgV0FOX01BQ19BRERSCj4+IGVkaW1heCxyYTIxcykgd2FuYWRkcgo+PiBl
ZGltYXgscmcyMXMpIHdhbmFkZHIKPj4gZWxlY29tLHdyYy0yNTMzZ2hiay1pKSB3YW5hZGRyCj4+
IGVsZWNvbSx3cmMtMjUzM2doYmsyLXQpIHdhbmFkZHIKPj4gZW5nZW5pdXMsZWNiMTIwMCkgYXRo
YWRkcgo+PiBlbmdlbml1cyxlY2IxNzUwKSBhdGhhZGRyCj4+IGVuZ2VuaXVzLGVwZzUwMDApIHdh
bmFkZHIKPj4gZW5nZW5pdXMsZXBnNjAwKSB3YW5hZGRyCj4+IGVuZ2VuaXVzLGVzcjEyMDApIHdh
bmFkZHIKPj4gZW5nZW5pdXMsZXNyMTc1MCkgd2FuYWRkcgo+PiBlbmdlbml1cyxlc3I2MDApIHdh
bmFkZHIKPj4gZW5nZW5pdXMsZXNyNjAwaCkgd2FuYWRkcgo+PiBlbmdlbml1cyxlc3I5MDApIHdh
bmFkZHIKPj4gZW50ZXJhc3lzLHdzLWFwMzcwNWkpIFJBRElPQUREUjAgKyBSQURJT0FERFIxCj4+
IGlvZGF0YSx3bi1hYzExNjdkZ3IpIHdhbmFkZHIKPj4gaW9kYXRhLHduLWFjMTE2N2dyKSB3YW5h
ZGRyCj4+IGlvZGF0YSx3bi1hYzE2MDBkZ3IpIHdhbmFkZHIKPj4gaW9kYXRhLHduLWFjMTYwMGRn
cjIpIHdhbmFkZHIKPj4gaW9kYXRhLHduLWFjNzMzZ3IzKSB3YW5hZGRyCj4+IGlvZGF0YSx3bi1h
ZzMwMGRncikgd2FuYWRkcgo+PiBpb2RhdGEsd25wcjI2MDBnKSB3YW5hZGRyCj4+IG1veGEsYXdr
LTExMzdjKSBtYWNfYWRkcgo+PiBuZXRnZWFyLHdheDIyMCkgbWFjCj4+IG5ldGdlYXIsd25kYXA2
MjApIGJhc2VNQUMKPj4gbmV0Z2Vhcix3bmRhcDY2MCkgYmFzZU1BQwo+PiBvY2VkbyxwYW5kYSkg
d21hYzEgKyB3bWFjMgo+PiBzaXRlY29tLHdsci03MTAwKSB3YW5hZGRyCj4+IHNpdGVjb20sd2xy
LTgxMDApIHdhbmFkZHIKPj4KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJv
b3QsZW52LnlhbWwgfCAzMyArKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDMzIGluc2VydGlvbnMoKykKPj4KPiAKPiBBcmUgdGhlc2UgdXBzdHJlYW0gVS1Cb290cywgb3Ig
anVzdCB2ZW5kb3IgZm9ya3M/CgpJIGd1ZXNzIG1vc3Qgb2YgdGhvc2UgZGV2aWNlcyBkb24ndCBo
YXZlIHVwc3RyZWFtIFUtQm9vdCBzdXBwb3J0LiBQbGVhc2UKbm90ZSB0aGF0IHdoaWxlIHVwc3Ry
ZWFtaW5nIHZlbmRvcnMgY2hhbmdlcyB3b3VsZCBiZSBncmVhdCBpbiBtb3N0IGNhc2VzCml0IGRv
ZXNuJ3QgaGFwcGVuLiBNb3N0IHZlbmRvcnMgc2FkbHkgZG9uJ3QgY2FyZSBhbmQgbW9zdCBlbmQg
dXNlcnMKZG9uJ3QgaGF2ZSBlbm91Z2ggdGltZSBmb3IgdGhhdC4gSW4gcHJhY3RpY2Ugd2Ugb2Z0
ZW4gc3RpY2sgd2l0aCB2ZW5kb3IKcHJvdmlkZWQgYm9vdGxvYWRlciB0byBmbGFzaCBhbmQgYm9v
dCBzZWxmIGJ1aWxkIExpbnV4IHN5c3RlbSAobGlrZQpPcGVuV3J0KS4KCkknbSBub3Qgc3VyZSBp
Zi9ob3cgZG9lcyBpdCBoZWxwIHdpdGggdGhpcyBQQVRDSCBidXQgcGxlYXNlIG5vdGUgdGhhdAp1
cHN0cmVhbSBVLUJvb3QgY29kZSBhbHNvIHN1cHBvcnRzIGZldyBleHRyYSB2YXJpYWJsZXMuCgpU
aGVyZSBpcyBnZW5lcmljIGV0aF9lbnZfZ2V0X2VuZXRhZGRyX2J5X2luZGV4KCkgdGhhdCBzdXBw
b3J0cyB2YXJpYWJsZXMKbGlrZSAiPCVzPjwlZD5hZGRyIiBhbmQgIjwlcz5hZGRyIi4gUmlnaHQg
bm93IGl0J3MgdXNlZCBvbmx5IGZvcgoiZXRoPCVkPmFkZHIiIGFuZCAiZXRoYWRkciIgc28gdGhh
dCBtb3N0bHkgbGltaXRzIHVzIHRvICJldGhhZGRyIiwKImV0aDFhZGRyIiwgImV0aDJhZGRyIiBh
bmQgImV0aDNhZGRyIi4KCiBGcm9tIHNvbWUgcmFyZSBjYXNlczogdGhlcmUgYXJlIGFsc28gInVz
Ym5ldF9kZXZhZGRyIiBhbmQgIndvbHBhc3N3b3JkIi4KClNvIGdpdmVuIHRoYXQgVS1Cb290IG9m
aWNpYWxseSBzdXBwb3J0cyBhdCBsZWFzdCA2IGVudiB2YXJpYWJsZXMgZm9yCk1BQyBhbmQgdGhl
cmUgYXJlIG1hbnkgdXNlZCB3aXRoIGN1c3RvbSBVLUJvb3RzIGFuZCBmaXJtd2FyZXMgdGhpcwpi
aW5kaW5nIHdvdWxkIGhlbHAgYSBsb3QuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
