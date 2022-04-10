Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E8DC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Apr 2022 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gh4iLX/OZWDCJ/j/kh/9IkzWaXRo6a4QteN63XMoY7k=; b=nmPAguE5o735LI
	MbKCCX9/G6U1Lr/o7hI7uptQD6S+1Io/nuXO2BVIQQcfmqNVuX/iTuvRR0CkyaxF3mMc6/wMrOHxp
	vFv3N0OdhiEcGk7mse2Cr68FUbQrmyES0YxaNm8ZXzF9XGSff4Sk/oD9hLApVaPN+HLNt16USSyjR
	qFqReopiyOwDDOLBQ4i1Tyhv/rDPgJXNchKaCtg62xsvq4OmqYdzLXDkvnm41HGu6haDcIxpKCbqz
	4OkkvH5/gDHcloAg6nM5NI4wMqk/K73B99fdUGG4PJwhCs33GrNNBG4O+U/0eybPe2mSZGjqKpl7d
	Jz7x+42CtQHRCNSESnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndSm0-004TSk-MO; Sun, 10 Apr 2022 08:18:16 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndSlv-004TRJ-Ax
 for linux-mtd@lists.infradead.org; Sun, 10 Apr 2022 08:18:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id g20so14688711edw.6
 for <linux-mtd@lists.infradead.org>; Sun, 10 Apr 2022 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OOscUjkmUIhgRzXyPdDTYNrAB2N5CAonkcdxEozYleA=;
 b=PXYWs7Gm8xzntcJmAfclsmxb08EgjzzqwqkrnO7Sj1S9HCXXjTwo3WSxINKzT2qk3q
 E1OTdRtUPCWso7pT1lTrvbb9VM7TSqkFHrcxkuvs+IRchWJwRaCkt7kPtAFwz8ubKuv8
 LawYbyCpNPYa7y81B592lM4Rm0T7F3bCdqp0uIsJyOMzxiSFZ9NHlDlgdeNFY/899d4T
 +qFfSBGeYDW+4DTC5+Ey0ry1AXFT3nZu//HoqXO0hdUtD/4cT3YEFq6qQt6BWVqt1Kr8
 Ia6+t9mTrZPj2347vmV/Qy2EphnJyKk9wzAMVrPvDi6i2Zzh/bPZ2jG/lYWW831VWI3i
 uo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OOscUjkmUIhgRzXyPdDTYNrAB2N5CAonkcdxEozYleA=;
 b=aDvMzLMfdCVZlz9ccD2LAbk4YVbdUi65SmtJdu+/T4LuufweN25FedJT8rwGB61Rfk
 Rn53BuqJpI7DLqYpBVUNg3RzNuboDT2C6s2QVxpNj3D+7kfvZDd6nVsiU0POUKGlgkih
 MROTyyIx1kWRyo+i2epWLEJwvO2PbEl/87CtUUbAJYG1bBzEECS9SwPkHFOjKVt9RqWm
 Gy/OHkihLktrMNCnRbQn0jsfgZ54SFMyKscKoXAVN8glsKJ33ZqdTWT9TC/g1SLD8B6Y
 Rb/vdrxrx5HRorhFEKl13zoQ4l7uSGpIL2x7YPb6gX1iDeRpV/Qwy/0GVMGB0W9SAfVl
 QiAQ==
X-Gm-Message-State: AOAM531aMlng/SKACesZJilSNPMn8elDut8sKS8HWobuIiIkIOYMuqLw
 ekvI89flhnUBASYFWKsPJACGMw==
X-Google-Smtp-Source: ABdhPJyVcZ6hRp09mS9Z2u4w3HRyzlPJiv4rtZbZATSV70c+hXqWqM3As9jQbyUgIKctjg4XYV5gCA==
X-Received: by 2002:a05:6402:42c6:b0:41c:defd:24d1 with SMTP id
 i6-20020a05640242c600b0041cdefd24d1mr28141892edc.326.1649578686025; 
 Sun, 10 Apr 2022 01:18:06 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 s2-20020a1709066c8200b006e4e1b1f875sm9955032ejr.199.2022.04.10.01.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 01:18:05 -0700 (PDT)
Message-ID: <db70e53b-7484-43bf-e9c8-b6a2dce1fbb5@linaro.org>
Date: Sun, 10 Apr 2022 10:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for
 Sercomm parser
Content-Language: en-US
To: Mikhail Zhilkin <csharper2005@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
 <8d0d8b27-35ff-3693-cf80-897b80c26b4e@linaro.org>
 <57bebf2f-af4c-b2d9-10e5-19e5104946fb@gmail.com>
 <29cfa017-bbaf-3aba-fe1d-06771957dbaa@linaro.org>
 <1b391399-984b-7a63-3265-62ef09caec39@gmail.com>
 <bd533827-b575-caad-c230-af060851b231@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bd533827-b575-caad-c230-af060851b231@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_011811_418310_F70C6E78 
X-CRM114-Status: GOOD (  21.22  )
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

T24gMDkvMDQvMjAyMiAyMDoxNywgTWlraGFpbCBaaGlsa2luIHdyb3RlOgo+IAo+IE9uIDQvOS8y
MDIyIDk6MDQgUE0sIE1pa2hhaWwgWmhpbGtpbiB3cm90ZToKPj4+Pj4+ICtyZXF1aXJlZDoKPj4+
Pj4+ICsgIC0gY29tcGF0aWJsZQo+Pj4+PiBNaXNzaW5nIHJlZy4KPj4+PiByZWcgaXNuJ3QgcmVx
dWlyZWQuIFBhcnNlciBjYW4gcmVhZCBwYXJ0aXRpb24gb2Zmc2V0cyBhbmQgc2l6ZXMgZnJvbQo+
Pj4+IFNDIFBBUlQgTUFQIHRhYmxlLiBPciBkbyB5b3UgbWVhbiBzb21ldGhpbmcgZWxzZT/CoCBB
bGwgaXMgb2sKPj4+PiB3aXRob3V0IHJlZyBkZWZpbml0aW9uIGluICJFeGFtcGxlIiAoZXhjZXB0
IHRoZSB3YXJucyB0aGF0IHJlZyBwcm9wZXJ0eQo+Pj4+IGlzIG1pc3NpbmcpLgo+Pj4gcmVnIG1p
Z2h0IG5vdCBiZSByZXF1aXJlZCBmb3IgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBidXQgaXQgaXMg
cmVxdWlyZWQKPj4+IGJ5IGRldmljZXRyZWUgZm9yIGV2ZXJ5IG5vZGUgd2l0aCB1bml0IGFkZHJl
c3MuIERvIHlvdSBleHBlY3QgaGVyZSBub2Rlcwo+Pj4gd2l0aG91dCB1bml0IGFkZHJlc3Nlcz8K
Pj4gT25seSAicGFydGl0aW9ucyIgbm9kZSBoYXMgbm8gdW5pdCBhZGRyZXNzLiBBbGwgc3Vibm9k
ZXPCoCBoYXZlIHVuaXQKPj4gYWRkcmVzc2VzIGFuZCB0aGVyZWZvcmUgaGF2ZSB0byBoYXZlIHJl
ZyBwcm9wZXJ0eS4gSSd2ZSBqdXN0IHJlYWxpemVkCj4+IHRoYXQgImZpeGVkLXBhcnRpdGlvbnMu
eWFtbCIgaXMgYWxtb3N0IG15IGNhc2UuIEl0IGxvb2tzIGxpa2UgSSBjYW4KPj4gY29weSduJ3Bh
c3RlwqAgInJlcXVpcmVkIiBhbmQgIipwcm9wZXJ0aWVzIi4KPj4gRG8geW91IG1pbmQgaWYgSSBk
b24ndCByZWludmVudCB0aGUgd2hlZWwgYW5kIHJldXNlIHRoaXMgZ29vZAo+PiBwcmFjdGljZT8K
Pj4KPj4gSGVyZSdzIHdoYXQgSSBnb3QgKG5vIGFueSB3YXJuaW5ncyBhcHBlYXJzKToKPiAKPiAK
PiBJJ20gc29ycnksIEtyenlzenRvZiAmIEFsbC4gSGVyZSBpcyB0aGUgZmluYWwgb25lLgoKSSBh
bSBzb3JyeSwgYnV0IHlvdSBjaGFuZ2VkIG5vdyBhIGxvdCBpbiB0aGUgYmluZGluZ3MgYW5kIGl0
IGxvb2tzCmVudGlyZWx5IGRpZmZlcmVudC4gVGhpbmdzIHByZXZpb3VzbHkgYmVpbmcgY29ycmVj
dCBub3cgYXJlIHdyb25nLCBzbwpyYXRoZXIgc3RhcnQgZnJvbSB5b3VyIG9sZCBiaW5kaW5ncy4u
LgoKPiAKPiAtLS0KPiDCoC4uLi9tdGQvcGFydGl0aW9ucy9zZXJjb21tLHNjLXBhcnRpdGlvbnMu
eWFtbCB8IDc4ICsrKysrKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNl
cnRpb25zKCspCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQKPiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvc2VyY29tbSxzYy1wYXJ0aXRpb25zLnlhbWwKPiAK
PiBkaWZmIC0tZ2l0Cj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvc2VyY29tbSxzYy1wYXJ0aXRpb25zLnlhbWwKPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9zZXJjb21tLHNjLXBhcnRpdGlvbnMueWFt
bAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zMzE3MmYwYmU5
MmEKPiAtLS0gL2Rldi9udWxsCj4gKysrCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbnMvc2VyY29tbSxzYy1wYXJ0aXRpb25zLnlhbWwKPiBAQCAtMCww
ICsxLDc4IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6Cj4gaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvc2VyY29tbSxzYy1wYXJ0aXRpb25zLnlhbWwj
Cj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iwo+ICsKPiArdGl0bGU6IFNlcmNvbW0gUGFydGl0aW9ucwo+ICsKPiArZGVzY3JpcHRpb246IHwK
PiArwqAgU2VyY29tbSBpcyBvbmUgb2YgaGFyZHdhcmUgbWFudWZhY3R1cmVycyBwcm92aWRpbmcg
U29DcyB1c2VkIGluIGhvbWUKPiByb3V0ZXJzLgo+ICvCoCBUaGUgU2VyY29tbSBwYXJ0aXRpb24g
bWFwIHRhYmxlIGNvbnRhaW5zIGluZm9ybWF0aW9uIGFib3V0IG5vbi1zdGFuZGFyZAo+ICvCoCBw
YXJ0aXRpb24gb2Zmc2V0cyBhbmQgc2l6ZXMgKGRlcGVuZGluZyBvbiB0aGUgYmFkIGJsb2NrcyBw
cmVzZW5jZSBhbmQKPiB0aGVpcgo+ICvCoCBsb2NhdGlvbnMpLiBQYXJ0aXRpb24gbWFwIGlzIHVz
ZWQgYnkgbWFueSBTZXJjb21tLWJhc2VkIFJhbGluawo+IGRldmljZXMgKGUuZy4KPiArwqAgQmVl
bGluZSwgTmV0Z2VhcikuCj4gKwo+ICvCoCBUaGUgcGFydGl0aW9uIHRhYmxlIHNob3VsZCBiZSBh
IG5vZGUgbmFtZWQgInBhcnRpdGlvbnMiLiBQYXJ0aXRpb25zCj4gYXJlIHRoZW4KPiArwqAgZGVm
aW5lZCBhcyBzdWJub2Rlcy4KPiArCj4gK21haW50YWluZXJzOgo+ICvCoCAtIE1pa2hhaWwgWmhp
bGtpbiA8Y3NoYXJwZXIyMDA1QGdtYWlsLmNvbT4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gK8KgIGNv
bXBhdGlibGU6Cj4gK8KgwqDCoCBjb25zdDogc2VyY29tbSxzYy1wYXJ0aXRpb25zCj4gKwo+ICvC
oCAiI2FkZHJlc3MtY2VsbHMiOiB0cnVlCj4gKwo+ICvCoCAiI3NpemUtY2VsbHMiOiB0cnVlCj4g
Kwo+ICtwYXR0ZXJuUHJvcGVydGllczoKPiArwqAgIkBbMC05YS1mXSskIjoKPiArwqDCoMKgICRy
ZWY6ICJwYXJ0aXRpb24ueWFtbCMiCj4gKwo+ICtyZXF1aXJlZDoKPiArwqAgLSBjb21wYXRpYmxl
Cj4gK8KgIC0gIiNhZGRyZXNzLWNlbGxzIgo+ICvCoCAtICIjc2l6ZS1jZWxscyIKClN0aWxsIG1p
c3NpbmcgcmVnLgoKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCgpUaGlzIGlzIHdy
b25nLCB3aHkgaXQgYmVjYW1lIHRydWU/CgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
