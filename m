Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C38AC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 17:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzQAgRw4I8HC7bi0sMUQOyrRtDpPzk4ky4Ql70jyoog=; b=brYoFcX6vSHIu0
	8rWiuhGO2muiJHf7CsrTZI4dzkrbZZI9+ZRCVjEfmlQyggb9WUmCaFyqAEKq/CyoSfVZPAYiypaTf
	hpgK5cHuui3PypQ2CZloRLvyo44903X7q+M0/1SN4jde7g7dZKBUEckjQp4ctEEF0WdtwGP99CC+R
	kjMnjeD2yPiAUngmMvBr0dxnMucDsueH8xbBQTnbEouwprItS6xJRhAIY0J3MJTQaGe81xL2JkFhk
	5tTAtdkvXeRf37sZxfVF8ca0ocwj7vAqoFQIX8m0I+dDt7lt+qjR4iuTqmAEkl/MxdBhgYEFLCgUu
	lsc7KMBNDAn/RjB/zSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpUO-000vG6-0e;
	Thu, 14 Dec 2023 17:27:12 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpUJ-000vDh-2U
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 17:27:10 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-58e256505f7so4930545eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 09:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574825; x=1703179625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvlPaOvWZi6YT4dBhvJqrCk9Wves4WI6vEv3aL4+FYg=;
        b=oyrjH1cO/RVVzMNIg0MhBkABmrW73wqJUxQnQhXjqzH1FhqWAGbeS3q1toRVIiJadC
         N+w8EZ7QfVKKbbqMvtQzoVBeSxvFPjBtYtLh9pMBYY3qu0brKd4qZFC/p/4RwDdn0SfT
         xUJ75mf6KgU/emLv4cTdw2wF/6xPr6B/xuWvDFPGil83kw7gEe+qgxRMtrduHOU4yyZg
         00JdLd9JzD0//Sg/3bRKHnISbSdwYzick1XoVzWMIUtaMeeQpKZZU1+//ghk6AXb54WI
         ARK8oFujewqRa54L8d9+PCJcvlUvLp3eZg8pqcTEv+rkx6dPAu7y3jeSFuspJkTI3RNP
         vslQ==
X-Gm-Message-State: AOJu0YzBdv8lyGvet20d8OeB+WRQeo0l0bejyKimfUeguH83vw2revIk
	7NFbooeix9UWTwIlV6HjdhAWtnrunA==
X-Google-Smtp-Source: AGHT+IHE3yB7iPFgi1CEIf18XQ6wLVZQxOJa4peKJpfxlxe4KfiUfxamVgaQaN9eMO+YHnRGmAJgUg==
X-Received: by 2002:a05:6820:162c:b0:590:6f86:f3c6 with SMTP id bb44-20020a056820162c00b005906f86f3c6mr8302579oob.12.1702574825070;
        Thu, 14 Dec 2023 09:27:05 -0800 (PST)
Received: from herring.priv ([2607:fb91:e6c7:a40:1c2d:b875:912d:c28])
        by smtp.gmail.com with ESMTPSA id q12-20020a056820028c00b0058d52d0ef2dsm3456842ood.38.2023.12.14.09.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:27:04 -0800 (PST)
Received: (nullmailer pid 622570 invoked by uid 1000);
	Thu, 14 Dec 2023 17:27:02 -0000
Date: Thu, 14 Dec 2023 11:27:02 -0600
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman
 compatible
Message-ID: <20231214172702.GA617226-robh@kernel.org>
References: <20231116172859.393744-1-sjg@chromium.org>
 <20231208150042.GA1278773-robh@kernel.org>
 <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
 <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
 <CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_092707_808323_C50420E5 
X-CRM114-Status: GOOD (  36.47  )
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

T24gRnJpLCBEZWMgMDgsIDIwMjMgYXQgMDM6NTg6MTBQTSAtMDcwMCwgU2ltb24gR2xhc3Mgd3Jv
dGU6Cj4gSGkgUm9iLAo+IAo+IE9uIEZyaSwgOCBEZWMgMjAyMyBhdCAxNDo1NiwgUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBEZWMgOCwgMjAyMyBh
dCAxMTo0N+KAr0FNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gSGkgUm9iLAo+ID4gPgo+ID4gPiBPbiBGcmksIDggRGVjIDIwMjMgYXQgMDg6MDAsIFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1
LCBOb3YgMTYsIDIwMjMgYXQgMTA6Mjg6NTBBTSAtMDcwMCwgU2ltb24gR2xhc3Mgd3JvdGU6Cj4g
PiA+ID4gPiBBZGQgYSBjb21wYXRpYmxlIHN0cmluZyBmb3IgYmlubWFuLCBzbyB3ZSBjYW4gZXh0
ZW5kIGZpeGVkLXBhcnRpdGlvbnMKPiA+ID4gPiA+IGluIHZhcmlvdXMgd2F5cy4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4K
PiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4KPiA+ID4gPiA+IChubyBjaGFuZ2VzIHNpbmNlIHY1KQo+
ID4gPiA+ID4KPiA+ID4gPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiA+ID4gPiAtIEFkZCAjYWRkcmVz
cy9zaXplLWNlbGxzIGFuZCBwYXJ0ZXJuUHJvcGVydGllcwo+ID4gPiA+ID4gLSBEcm9wICRyZWYg
dG8gZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4gPiAtIERyb3AgJ3NlbGVjdDogZmFsc2Un
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gPiA+IC0gQ2hhbmdlIHN1
YmplY3QgbGluZQo+ID4gPiA+ID4KPiA+ID4gPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiA+ID4gPiAt
IERyb3AgZml4ZWQtcGFydGl0aW9uIGFkZGl0aW9uYWwgY29tcGF0aWJsZSBzdHJpbmcKPiA+ID4g
PiA+IC0gRHJvcCBmaXhlZC1wYXJ0aXRpb25zIGZyb20gdGhlIGV4YW1wbGUKPiA+ID4gPiA+IC0g
TWVudGlvbiB1c2Ugb2YgY29tcGF0aWJsZSBpbnN0ZWFkIG9mIGxhYmVsCj4gPiA+ID4gPgo+ID4g
PiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+IC0gRHJvcCBtZW50aW9uIG9mICdlbmhhbmNl
ZCBmZWF0dXJlcycgaW4gZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4gPiAtIE1lbnRpb24g
QmlubWFuIGlucHV0IGFuZCBvdXRwdXQgcHJvcGVydGllcwo+ID4gPiA+ID4gLSBVc2UgcGxhaW4g
cGFydGl0aW9uQHh4eCBmb3IgdGhlIG5vZGUgbmFtZQo+ID4gPiA+ID4KPiA+ID4gPiA+ICAuLi4v
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwgICAgICAgfCA2OCArKysrKysrKysr
KysrKysrKysrCj4gPiA+ID4gPiAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlv
bnMueWFtbCAgIHwgIDEgKwo+ID4gPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA1ICsrCj4gPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA3NCBp
bnNlcnRpb25zKCspCj4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbAo+ID4gPiA+ID4K
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwKPiA+ID4gPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjMyOTIxNzU1MGE5OAo+ID4gPiA+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi55YW1sCj4gPiA+ID4gPiBAQCAtMCwwICsx
LDY4IEBACj4gPiA+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1Ig
QlNELTItQ2xhdXNlKQo+ID4gPiA+ID4gKyMgQ29weXJpZ2h0IDIwMjMgR29vZ2xlIExMQwo+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gKyVZQU1MIDEuMgo+ID4gPiA+ID4gKy0tLQo+ID4gPiA+ID4gKyRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlh
bWwjCj4gPiA+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArdGl0bGU6IEJpbm1hbiBmaXJtd2Fy
ZSBsYXlvdXQKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gPiA+ICsg
IC0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
ZGVzY3JpcHRpb246IHwKPiA+ID4gPiA+ICsgIFRoZSBiaW5tYW4gbm9kZSBwcm92aWRlcyBhIGxh
eW91dCBmb3IgZmlybXdhcmUsIHVzZWQgd2hlbiBwYWNrYWdpbmcgZmlybXdhcmUKPiA+ID4gPiA+
ICsgIGZyb20gbXVsdGlwbGUgcHJvamVjdHMuIEl0IGlzIGJhc2VkIG9uIGZpeGVkLXBhcnRpdGlv
bnMsIHdpdGggc29tZQo+ID4gPiA+ID4gKyAgZXh0ZW5zaW9ucywgYnV0IHVzZXMgJ2NvbXBhdGli
bGUnIHRvIGluZGljYXRlIHRoZSBjb250ZW50cyBvZiB0aGUgbm9kZSwgdG8KPiA+ID4gPiA+ICsg
IGF2b2lkIHBlcnR1cmJpbmcgb3IgY29uZnVzaW5nIGV4aXN0aW5nIGluc3RhbGxhdGlvbnMgd2hp
Y2ggdXNlICdsYWJlbCcgZm9yIGEKPiA+ID4gPiA+ICsgIHBhcnRpY3VsYXIgcHVycG9zZS4KPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ICsgIEJpbm1hbiBzdXBwb3J0cyBwcm9wZXJ0aWVzIHVzZWQgYXMg
aW5wdXRzIHRvIHRoZSBmaXJtd2FyZS1wYWNrYWdpbmcgcHJvY2VzcywKPiA+ID4gPiA+ICsgIHN1
Y2ggYXMgdGhvc2Ugd2hpY2ggY29udHJvbCBhbGlnbm1lbnQgb2YgcGFydGl0aW9ucy4gVGhpcyBi
aW5kaW5nIGFkZHJlc3Nlcwo+ID4gPiA+ID4gKyAgdGhlc2UgJ2lucHV0JyBwcm9wZXJ0aWVzLiBG
b3IgZXhhbXBsZSwgaXQgaXMgY29tbW9uIGZvciB0aGUgJ3JlZycgcHJvcGVydHkKPiA+ID4gPiA+
ICsgIChhbiAnb3V0cHV0JyBwcm9wZXJ0eSkgdG8gYmUgc2V0IGJ5IEJpbm1hbiwgYmFzZWQgb24g
dGhlIGFsaWdubWVudCByZXF1ZXN0ZWQKPiA+ID4gPiA+ICsgIGluIHRoZSBpbnB1dC4KPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ICsgIE9uY2UgcHJvY2Vzc2luZyBpcyBjb21wbGV0ZSwgaW5wdXQgcHJv
cGVydGllcyBoYXZlIG1vc3RseSBzZXJ2ZWQgdGhlaXIKPiA+ID4gPiA+ICsgIHB1cnBvc2UsIGF0
IGxlYXN0IHVudGlsIHRoZSBmaXJtd2FyZSBpcyByZXBhY2tlZCBsYXRlciwgZS5nLiBkdWUgdG8g
YQo+ID4gPiA+ID4gKyAgZmlybXdhcmUgdXBkYXRlLiBUaGUgJ2ZpeGVkLXBhcnRpdGlvbnMnIGJp
bmRpbmcgc2hvdWxkIHByb3ZpZGUgZW5vdWdoCj4gPiA+ID4gPiArICBpbmZvcm1hdGlvbiB0byBy
ZWFkIHRoZSBmaXJtd2FyZSBhdCBydW50aW1lLCBpbmNsdWRpbmcgZGVjb21wcmVzc2lvbiBpZgo+
ID4gPiA+ID4gKyAgbmVlZGVkLgo+ID4gPiA+Cj4gPiA+ID4gSG93IGlzIHRoaXMgZ29pbmcgdG8g
d29yayBleGFjdGx5PyBiaW5tYW4gcmVhZHMgdGhlc2Ugbm9kZXMgYW5kIHRoZW4KPiA+ID4gPiB3
cml0ZXMgb3V0ICdmaXhlZC1wYXJ0aXRpb25zJyBub2Rlcy4gQnV0IHRoZW4geW91J3ZlIGxvc3Qg
dGhlIGJpbm1hbgo+ID4gPiA+IHNwZWNpZmMgcGFydHMgbmVlZGVkIGZvciByZXBhY2tpbmcuCj4g
PiA+Cj4gPiA+IE5vLCB0aGV5IGFyZSB0aGUgc2FtZSBub2RlLiBJIGRvIHdhbnQgdGhlIGV4dHJh
IGluZm9ybWF0aW9uIHRvIHN0aWNrCj4gPiA+IGFyb3VuZC4gU28gbG9uZyBhcyBpdCBpcyBjb21w
YXRpYmxlIHdpdGggZml4ZWQtcGFydGl0aW9uIGFzIHdlbGwsIHRoaXMKPiA+ID4gc2hvdWxkIHdv
cmsgT0suCj4gPgo+ID4gSG93IGNhbiBpdCBiZSBib3RoPyBUaGUgcGFydGl0aW9ucyBub2RlIGNv
bXBhdGlibGUgY2FuIGJlIGVpdGhlcgo+ID4gJ2ZpeGVkLXBhcnRpdGlvbnMnIG9yICdiaW5tYW4n
Lgo+IAo+IENhbiB3ZSBub3QgYWxsb3cgaXQgdG8gYmUgYm90aD8gSSBoYXZlIHRyaWVkIHRvIGFk
anVzdCB0aGluZ3MgaW4KPiByZXNwb25zZSB0byBmZWVkYmFjayBidXQgcGVyaGFwcyB0aGUgZmVl
ZGJhY2sgd2FzIGxlYWRpbmcgbWUgZG93biB0aGUKPiB3cm9uZyBwYXRoPwoKU3VyZSwgYnV0IHRo
ZW4gdGhlIHNjaGVtYSBoYXMgdG8gYW5kIHRoYXQgbWVhbnMgZXh0ZW5kaW5nIApmaXhlZC1wYXJ0
aXRpb25zLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
