Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD37C3DA6E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Dec 2023 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESnjjHg4hnqCKKdtq0gIr2SJl/Tfm2w2mcqPVAoFDh8=; b=bXSYfagfETkToi
	qn5Z7c8mhXFOP/3+XFhXQg3yV8uZc8F+JTmPNVOAuHy6dhSqSVIPphtvL+8vZG60s44xTAsRz7rLt
	32gifXupEWbKO71IVzaOkEn1Gq0Z8iOpDGfWzIXrsi3fMpDrJ5sAHNR552TtbA2mZf5YcfMyawztm
	9XDedlyjL9Ge6tRG/zy7+sY/WgMqcICguc6hoogFTZP1yAxaA2XphW5Ea3z7Y1Ec1G5yNsaetf/Kd
	Vx2Poky8WgTZK6C4BoBm1t+hC/4ZmRoVpxueUZCv8xUtrWc6fmn1aCCD5N3A3RWRAcTw8EMLCsZ4V
	NOXXOBqGhXAHyxS2DnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkjj-00Auls-2Z;
	Mon, 25 Dec 2023 13:11:15 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkjf-00Auke-15
	for linux-mtd@lists.infradead.org;
	Mon, 25 Dec 2023 13:11:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a2345aaeb05so404318966b.0
        for <linux-mtd@lists.infradead.org>; Mon, 25 Dec 2023 05:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703509865; x=1704114665; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQ5rgkTHAk2Vr08CVnngse/JyY3GvcfBzWebdC668C0=;
        b=cc6HorbeqGUgk06sOKNXAbt5CyR9ud17g1pC8ZNLUwJFuAXnfkDaXRJEPHv/13Ge8Q
         TIFofK4TEOzqJMjoyg9Sl3OZlzkKQlf4/Nvwi9xsl4hMVSkS6aktqDpEZxoUpof+aTYc
         ByvpzOqTTSPoVU62OoC42eLb070/djEEhe6qcfKA/gT8VsthADNXbCvlH3wGnzlkogmg
         O6iqFc4JE5ehdlrf06t9OHmPiDvXEpfVQ25BlN6kh8eMEQlvqN/U03a6zbZaFR/hnHxF
         lbA4/JJBeewJV4RCkXA/sT+KrW3rAJiO3oxsLDO35PvRmUwuDFTM/SzBjWN3/hmj4LfE
         UUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703509865; x=1704114665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQ5rgkTHAk2Vr08CVnngse/JyY3GvcfBzWebdC668C0=;
        b=dEGgURhgxrkbkZ6FAs/wdNX1AVc+8OzUZMFqzCzYMXvRKegG2bZBn/c60h5t31VUQ+
         kEqCtmnUYxbH1LBBzFj/bcNoVC+fDeFVfviGCII1r0P5hfno77lidwiwlQZJo7jK7gZD
         J07vK0dRN4iNnAn8s/N/GjjIsivfYJzzvurcF9PQdRM9DIdMnwC6MFO7HvaFxCctKMNr
         tUNnZJqWV20OyreGOBAYvXjZx8GvtUSOZpmkvlnlxgZZCmGJbu3rDWr269QxTiUHQMia
         ivaF/kW3f56OgOhEckpv9KBSOfNLFFsn9bLT9rTniCy99vI1Xp9DFKqg5yRRKffgOD2k
         Amfg==
X-Gm-Message-State: AOJu0YxVaGz2sXSOZDnZc6NzyL5WJoY0dr44NyHfyCxs7Z/7CBgE7Nps
	whCs0z4SIf1hjdjuDF6IQ3b79pmgmhxLog==
X-Google-Smtp-Source: AGHT+IFlU6xAPMSLoVJLV2HE4RMVRyCgArIlB2P03XDeZwT/+LGRvcowrnEWg0K7gvJYIuCY7pxmSg==
X-Received: by 2002:a17:906:95:b0:a26:cdb4:d308 with SMTP id 21-20020a170906009500b00a26cdb4d308mr1027088ejc.68.1703509864998;
        Mon, 25 Dec 2023 05:11:04 -0800 (PST)
Received: from [192.168.0.22] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id jt4-20020a170906dfc400b00a2369d8ca07sm4829683ejc.203.2023.12.25.05.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Dec 2023 05:11:04 -0800 (PST)
Message-ID: <7e2f36fa-c201-4c8b-a485-077f65a9a0e1@linaro.org>
Date: Mon, 25 Dec 2023 14:11:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] dt-bindings: nvmem: u-boot, env: add any-name MAC
 cells compatible
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Simon Glass <sjg@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231214153620.23998-1-zajec5@gmail.com>
 <CAPnjgZ31AAauR876W1RmU4JPzKUD8XAMCZrJDumE+Dr4miqABQ@mail.gmail.com>
 <1b4feb5d-f03c-44b3-9474-901534db5eb7@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1b4feb5d-f03c-44b3-9474-901534db5eb7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_051111_379426_AD8045D4 
X-CRM114-Status: GOOD (  16.26  )
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

T24gMTgvMTIvMjAyMyAyMzowMiwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE9uIDE0LjEyLjIw
MjMgMjI6MjcsIFNpbW9uIEdsYXNzIHdyb3RlOgo+PiBPbiBUaHUsIDE0IERlYyAyMDIzIGF0IDA4
OjM2LCBSYWZhxYIgTWnFgmVja2kgPHphamVjNUBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+IEZy
b206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4+Cj4+PiBTbyBmYXIgd2Ug
aGFkIGEgcHJvcGVydHkgZm9yICJldGhhZGRyIiBOVk1FTSBjZWxsIGNvbnRhaW5pbmcgYmFzZQo+
Pj4gRXRoZXJuZXQgTUFDIGFkZHJlc3MuIFRoZSBwcm9ibGVtIGlzIHZlbmRvcnMgb2Z0ZW4gcGlj
ayBub24tc3RhbmRhcmQKPj4+IG5hbWVzIGZvciBzdG9yaW5nIE1BQyhzKSAob3RoZXIgdGhhbiAi
ZXRoYWRkciIpLiBBIGZldyBuYW1lcyB3ZXJlCj4+PiBub3RpY2VkIG92ZXIgeWVhcnM6Cj4+PiAx
LiAid2FuYWRkciIgKEVkaW1heCwgRUxFQ09NLCBFbkdlbml1cywgSS1PIERBVEEsIFNpdGVjb20p
Cj4+PiAyLiAiZXQxbWFjYWRkciIgKEFTVVMpCj4+PiAzLiAiZXRoMWFkZHIiIChCdWZmYWxvKQo+
Pj4gNC4gImF0aGFkZHIiIChFbkdlbml1cykKPj4+IDUuICJiYXNlTUFDIiAoTmV0Z2VhcikKPj4+
IDYuICJtYWMiIChOZXRnZWFyKQo+Pj4gNy4gIm1hY19hZGRyIiAoTW94YSkKPj4+IGFuZCBtb3Jl
ICgiSFdfTEFOX01BQyIsICJIV19XQU5fTUFDIiwgIklOSUNfTUFDX0FERFIiLCAiTEFOX01BQ19B
RERSIiwKPj4+ICJSQURJT0FERFIwIiwgIlJBRElPQUREUjEiLCAiV0FOX01BQ19BRERSIiwgImxh
bjFfbWFjX2FkZHIiLCAid2FubWFjIiwKPj4+ICJ3bWFjMSIsICJ3bWFjMiIpLgo+Pj4KPj4+IEl0
IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBhZGQgcHJvcGVydHkgZm9yIGV2ZXJ5IHBvc3NpYmxlIE1B
QyBjZWxsIG5hbWUuCj4+PiBJbnN0ZWFkIGFsbG93IHNwZWNpZnlpbmcgY2VsbHMgd2l0aCAibWFj
IiBjb21wYXRpYmxlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFm
YWxAbWlsZWNraS5wbD4KPj4+IC0tLQo+Pj4gTGlzdCBvZiBkZXZpY2VzIGFuZCB0aGVpciBVLUJv
b3QgTUFDIHZhcmlhYmxlczoKPj4+IGFscGhhbmV0d29ya3MsYXNsNTYwMjYpIHdhbm1hYwo+Pj4g
YXN1cyxydC1hYzY1cCkgZXQxbWFjYWRkcgo+Pj4gYXN1cyxydC1hYzg1cCkgZXQxbWFjYWRkcgo+
Pj4gYmVsa2luLGY5azExMDl2MSkgSFdfV0FOX01BQyArIEhXX0xBTl9NQUMKPj4+IGJ1ZmZhbG8s
bHMyMjBkZSkgZXRoMWFkZHIKPj4+IGJ1ZmZhbG8sbHM0MjFkZSkgZXRoMWFkZHIKPj4+IGNoZWNr
cG9pbnQsbC01MCkgbGFuMV9tYWNfYWRkcgo+Pj4gZG92YWRvLHRpbnktYWMpIElOSUNfTUFDX0FE
RFIKPj4+IGRvdmFkbyx0aW55LWFjKSBMQU5fTUFDX0FERFIgKyBXQU5fTUFDX0FERFIKPj4+IGVk
aW1heCxyYTIxcykgd2FuYWRkcgo+Pj4gZWRpbWF4LHJnMjFzKSB3YW5hZGRyCj4+PiBlbGVjb20s
d3JjLTI1MzNnaGJrLWkpIHdhbmFkZHIKPj4+IGVsZWNvbSx3cmMtMjUzM2doYmsyLXQpIHdhbmFk
ZHIKPj4+IGVuZ2VuaXVzLGVjYjEyMDApIGF0aGFkZHIKPj4+IGVuZ2VuaXVzLGVjYjE3NTApIGF0
aGFkZHIKPj4+IGVuZ2VuaXVzLGVwZzUwMDApIHdhbmFkZHIKPj4+IGVuZ2VuaXVzLGVwZzYwMCkg
d2FuYWRkcgo+Pj4gZW5nZW5pdXMsZXNyMTIwMCkgd2FuYWRkcgo+Pj4gZW5nZW5pdXMsZXNyMTc1
MCkgd2FuYWRkcgo+Pj4gZW5nZW5pdXMsZXNyNjAwKSB3YW5hZGRyCj4+PiBlbmdlbml1cyxlc3I2
MDBoKSB3YW5hZGRyCj4+PiBlbmdlbml1cyxlc3I5MDApIHdhbmFkZHIKPj4+IGVudGVyYXN5cyx3
cy1hcDM3MDVpKSBSQURJT0FERFIwICsgUkFESU9BRERSMQo+Pj4gaW9kYXRhLHduLWFjMTE2N2Rn
cikgd2FuYWRkcgo+Pj4gaW9kYXRhLHduLWFjMTE2N2dyKSB3YW5hZGRyCj4+PiBpb2RhdGEsd24t
YWMxNjAwZGdyKSB3YW5hZGRyCj4+PiBpb2RhdGEsd24tYWMxNjAwZGdyMikgd2FuYWRkcgo+Pj4g
aW9kYXRhLHduLWFjNzMzZ3IzKSB3YW5hZGRyCj4+PiBpb2RhdGEsd24tYWczMDBkZ3IpIHdhbmFk
ZHIKPj4+IGlvZGF0YSx3bnByMjYwMGcpIHdhbmFkZHIKPj4+IG1veGEsYXdrLTExMzdjKSBtYWNf
YWRkcgo+Pj4gbmV0Z2Vhcix3YXgyMjApIG1hYwo+Pj4gbmV0Z2Vhcix3bmRhcDYyMCkgYmFzZU1B
Qwo+Pj4gbmV0Z2Vhcix3bmRhcDY2MCkgYmFzZU1BQwo+Pj4gb2NlZG8scGFuZGEpIHdtYWMxICsg
d21hYzIKPj4+IHNpdGVjb20sd2xyLTcxMDApIHdhbmFkZHIKPj4+IHNpdGVjb20sd2xyLTgxMDAp
IHdhbmFkZHIKPj4+Cj4+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxl
bnYueWFtbCB8IDMzICsrKysrKysrKysrKysrKysrKysKPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMz
IGluc2VydGlvbnMoKykKPj4+Cj4+Cj4+IEFyZSB0aGVzZSB1cHN0cmVhbSBVLUJvb3RzLCBvciBq
dXN0IHZlbmRvciBmb3Jrcz8KPiAKPiBJIGd1ZXNzIG1vc3Qgb2YgdGhvc2UgZGV2aWNlcyBkb24n
dCBoYXZlIHVwc3RyZWFtIFUtQm9vdCBzdXBwb3J0LiBQbGVhc2UKCldlIGRvIG5vdCBkb2N1bWVu
dCBwcm9wZXJ0aWVzIHVzZWQgaW4gYWxsIHBvc3NpYmxlIHByb2plY3RzLCBsaWtlIHZlbmRvcgpm
b3Jrcy4gT25seSB1cHN0cmVhbSBVLUJvb3QgbWF0dGVycy4KCj4gbm90ZSB0aGF0IHdoaWxlIHVw
c3RyZWFtaW5nIHZlbmRvcnMgY2hhbmdlcyB3b3VsZCBiZSBncmVhdCBpbiBtb3N0IGNhc2VzCj4g
aXQgZG9lc24ndCBoYXBwZW4uIE1vc3QgdmVuZG9ycyBzYWRseSBkb24ndCBjYXJlIGFuZCBtb3N0
IGVuZCB1c2Vycwo+IGRvbid0IGhhdmUgZW5vdWdoIHRpbWUgZm9yIHRoYXQuIEluIHByYWN0aWNl
IHdlIG9mdGVuIHN0aWNrIHdpdGggdmVuZG9yCj4gcHJvdmlkZWQgYm9vdGxvYWRlciB0byBmbGFz
aCBhbmQgYm9vdCBzZWxmIGJ1aWxkIExpbnV4IHN5c3RlbSAobGlrZQo+IE9wZW5XcnQpLgo+IAo+
IEknbSBub3Qgc3VyZSBpZi9ob3cgZG9lcyBpdCBoZWxwIHdpdGggdGhpcyBQQVRDSCBidXQgcGxl
YXNlIG5vdGUgdGhhdAo+IHVwc3RyZWFtIFUtQm9vdCBjb2RlIGFsc28gc3VwcG9ydHMgZmV3IGV4
dHJhIHZhcmlhYmxlcy4KPiAKPiBUaGVyZSBpcyBnZW5lcmljIGV0aF9lbnZfZ2V0X2VuZXRhZGRy
X2J5X2luZGV4KCkgdGhhdCBzdXBwb3J0cyB2YXJpYWJsZXMKPiBsaWtlICI8JXM+PCVkPmFkZHIi
IGFuZCAiPCVzPmFkZHIiLiBSaWdodCBub3cgaXQncyB1c2VkIG9ubHkgZm9yCj4gImV0aDwlZD5h
ZGRyIiBhbmQgImV0aGFkZHIiIHNvIHRoYXQgbW9zdGx5IGxpbWl0cyB1cyB0byAiZXRoYWRkciIs
Cj4gImV0aDFhZGRyIiwgImV0aDJhZGRyIiBhbmQgImV0aDNhZGRyIi4KPiAKPiAgRnJvbSBzb21l
IHJhcmUgY2FzZXM6IHRoZXJlIGFyZSBhbHNvICJ1c2JuZXRfZGV2YWRkciIgYW5kICJ3b2xwYXNz
d29yZCIuCj4gCj4gU28gZ2l2ZW4gdGhhdCBVLUJvb3Qgb2ZpY2lhbGx5IHN1cHBvcnRzIGF0IGxl
YXN0IDYgZW52IHZhcmlhYmxlcyBmb3IKPiBNQUMgYW5kIHRoZXJlIGFyZSBtYW55IHVzZWQgd2l0
aCBjdXN0b20gVS1Cb290cyBhbmQgZmlybXdhcmVzIHRoaXMKPiBiaW5kaW5nIHdvdWxkIGhlbHAg
YSBsb3QuCgpQbGVhc2UgbGltaXQgdGhpcyB0byB1cHN0cmVhbSBVLUJvb3QuIERyb3AgYWxsIGN1
c3RvbSBhbmQgZmlybXdhcmUgb25lcy4KClRoZW4sIGp1c3QgZml4IHVwc3RyZWFtIFUtQm9vdCB0
byBoYXZlIG9ubHkgb25lIHByb3BlcnR5Li4uCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
