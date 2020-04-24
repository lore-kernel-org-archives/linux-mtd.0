Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847CCC2BA1A
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 10:51:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5828A2084D
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 10:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pH9if9d6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VmBbirVE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5828A2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3ybz9er7yOpNCsAtUEZK5IuBW7B21y81+K2KFIJ8d0=; b=pH9if9d6E8epJD
	3e0drNtzsLzBVy5Cl5tNka4xedVUULHoPO9xzo+yg76bCD4bHn8YQdUXopVA1wKb2cQezRwz+xzFx
	nKwdIp2XfXXNqDu3eMw2FF9oTSk06+HNl7chVl+IB4qxatYQb8aeyGzQA581Z37vDgLBz3GYZ4Hpw
	9tnNPbtQfZyiQ+A808XrsST8cQSGMb436S8UA8gybA40mLc4HqDour/2A6/trspwMtNvUATNsUot6
	A6OsUN8ClrWz6qaNJr1ruL09R8CHDB7hffs1VUL3UTp+DBP1G/mqWyZa3sz3kC7frDIzbSTjaiUPi
	PIDYyCwmNM1lHALFKoqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRvvA-0007Vq-30; Fri, 24 Apr 2020 10:51:00 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRvv7-0007Uy-FN
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 10:50:58 +0000
Received: by mail-wm1-x343.google.com with SMTP id v8so9697132wma.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2020 03:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yf9tP3sNXUsAB/rOddBDtkpZustuUZCD7ZROOWh0ox4=;
 b=VmBbirVEjOgVcz1iLrCDuO5VLXN1951W8re/zO0nzgFYuwEMxoMSE1+bJi8VD1ugrt
 k100zGpG94719MgmRICqnQneLX0yv58hh5Eu4UMybV0Ju088At0DHXnNLHBrNZ3wd4ir
 ZD7sb8FxKGceNRllh8lWxRQJM921TSzHLF/sh9jCuOzooAWoNv9Y8c0eNgG9iXPQJcHo
 UI6hKLFOmog5ICyxUJVBFWjTf1rn4Ep1qEVB2jzkZbhzpnSyDGeM4ygUy/LNdLZriX7H
 9r9BKf31beIDyCBTLhxqlxcPdXdY26KNmj2nRe+DueEx2j8TvXDVpgjU/HC402cddZWP
 tV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yf9tP3sNXUsAB/rOddBDtkpZustuUZCD7ZROOWh0ox4=;
 b=kr2qWXyxr4J7077uWkZsZepFx3jg8zmpAmlC2X3NO9bwXMIdorVkFM/KVF8/IeV60O
 w1VuQ8D9Wfj8/55RpkaOUMAcVyGdwnBnnYDN9D0v74H02Uq0aKlVa0lby4ESE10Z/l/R
 ebrWn/ZDdz8srCZvmIH1csiH4L5aZUtjiPpTIgoUjm6G6/LXKDY6dGbAaw8M02fH0Tr7
 +E0u8O7TfU13mUY7eTahbEAePAm8mfK7y4T8gneuuaXd8jqjeAkuZldblnJqJMfXPpo6
 5Cjj4TUV+gV1wc2FdWXh8WiCHbpL6DQAVxs0Ig0itGG+0GrzY0tEZqAzyaQDMwjQ9M2v
 7ohQ==
X-Gm-Message-State: AGi0PuZzThrevhfZqtJgS8Jev1RaXqfvkL9qFeejwKEEC7LXU3Q2px8e
 oGJSbxKYnTABszckV2TlWKoDJw==
X-Google-Smtp-Source: APiQypIA21ZhRcvVCjZ27PG/4HY/Hpz6nTlXLW+I8YNTy6MMWXH+2KzYqqh4CqqJzSqriZ3BH6X/kw==
X-Received: by 2002:a1c:7d90:: with SMTP id
 y138mr10044348wmc.121.1587725455891; 
 Fri, 24 Apr 2020 03:50:55 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id o18sm7595925wrp.23.2020.04.24.03.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 03:50:55 -0700 (PDT)
Date: Fri, 24 Apr 2020 11:50:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 02/12] mfd: stm32-fmc2: add STM32 FMC2 controller driver
Message-ID: <20200424105053.GC8414@dell>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-3-git-send-email-christophe.kerello@st.com>
 <20200424074517.GN3612@dell>
 <8b625f1c-9ded-c07a-a20e-8cd44c1ca46d@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b625f1c-9ded-c07a-a20e-8cd44c1ca46d@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_035057_523939_AECF780D 
X-CRM114-Status: GOOD (  23.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Christophe Kerello <christophe.kerello@st.com>, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyNCBBcHIgMjAyMCwgTWFyZWsgVmFzdXQgd3JvdGU6Cgo+IE9uIDQvMjQvMjAgOTo0
NSBBTSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gV2VkLCAxNSBBcHIgMjAyMCwgQ2hyaXN0b3Bo
ZSBLZXJlbGxvIHdyb3RlOgo+ID4gCj4gPj4gVGhlIGRyaXZlciBhZGRzIHRoZSBzdXBwb3J0IGZv
ciB0aGUgU1RNaWNyb2VsZWN0cm9uaWNzIEZNQzIgY29udHJvbGxlcgo+ID4+IGZvdW5kIG9uIFNU
TTMyTVAgU09Dcy4KPiA+Pgo+ID4+IFRoZSBGTUMyIGZ1bmN0aW9uYWwgYmxvY2sgbWFrZXMgdGhl
IGludGVyZmFjZSB3aXRoOiBzeW5jaHJvbm91cyBhbmQKPiA+PiBhc3luY2hyb25vdXMgc3RhdGlj
IG1lbW9yaWVzIChzdWNoIGFzIFBTTk9SLCBQU1JBTSBvciBvdGhlcgo+ID4+IG1lbW9yeS1tYXBw
ZWQgcGVyaXBoZXJhbHMpIGFuZCBOQU5EIGZsYXNoIG1lbW9yaWVzLgo+ID4+Cj4gPj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+
ID4+IC0tLQo+ID4+IENoYW5nZXMgaW4gdjI6Cj4gPj4gIC0gcmVtb3ZlIG9wcyBmcm9tIHN0bTMy
X2ZtYzIgc3RydWN0dXJlCj4gPj4gIC0gYWRkIDIgQVBJcyB0byBtYW5hZ2UgRk1DMiBlbmFibGUv
ZGlzYWJsZQo+ID4+ICAtIGFkZCAyIEFQSXMgdG8gbWFuYWdlIEZNQzIgTldBSVQgc2hhcmVkIHNp
Z25hbAo+ID4+Cj4gPj4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgICAgICB8ICAxMiArKysK
PiA+PiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiA+PiAgZHJpdmVy
cy9tZmQvc3RtMzItZm1jMi5jICAgICAgIHwgMTM2ICsrKysrKysrKysrKysrKysrKysrKysrKysK
PiA+PiAgaW5jbHVkZS9saW51eC9tZmQvc3RtMzItZm1jMi5oIHwgMjI1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPj4gIDQgZmlsZXMgY2hhbmdlZCwgMzc0IGlu
c2VydGlvbnMoKykKPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL3N0bTMyLWZt
YzIuYwo+ID4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvc3RtMzItZm1j
Mi5oCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBiL2RyaXZlcnMv
bWZkL0tjb25maWcKPiA+PiBpbmRleCAyYjIwMzI5Li41MjYwNTgyIDEwMDY0NAo+ID4+IC0tLSBh
L2RyaXZlcnMvbWZkL0tjb25maWcKPiA+PiArKysgYi9kcml2ZXJzL21mZC9LY29uZmlnCj4gPj4g
QEAgLTE5MjIsNiArMTkyMiwxOCBAQCBjb25maWcgTUZEX1JPSE1fQkQ3MTgyOAo+ID4+ICAJICBB
bHNvIGluY2x1ZGVkIGlzIGEgQ291bG9tYiBjb3VudGVyLCBhIHJlYWwtdGltZSBjbG9jayAoUlRD
KSwgYW5kCj4gPj4gIAkgIGEgMzIuNzY4IGtIeiBjbG9jayBnYXRlLgo+ID4+ICAKPiA+PiArY29u
ZmlnIE1GRF9TVE0zMl9GTUMyCj4gPj4gKwl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgRk1DMiBjb250
cm9sbGVycyBvbiBTVE0zMk1QIFNvQ3MiCj4gPj4gKwlkZXBlbmRzIG9uIE1BQ0hfU1RNMzJNUDE1
NyB8fCBDT01QSUxFX1RFU1QKPiA+PiArCXNlbGVjdCBNRkRfQ09SRQo+ID4+ICsJc2VsZWN0IFJF
R01BUAo+ID4+ICsJc2VsZWN0IFJFR01BUF9NTUlPCj4gPj4gKwloZWxwCj4gPj4gKwkgIFNlbGVj
dCB0aGlzIG9wdGlvbiB0byBlbmFibGUgU1RNMzIgRk1DMiBkcml2ZXIgdXNlZCBmb3IgRk1DMiBF
eHRlcm5hbAo+ID4+ICsJICBCdXMgSW50ZXJmYWNlIGNvbnRyb2xsZXIgYW5kIEZNQzIgTkFORCBm
bGFzaCBjb250cm9sbGVyLiBUaGlzIGRyaXZlcgo+ID4+ICsJICBwcm92aWRlcyBjb3JlIHN1cHBv
cnQgZm9yIHRoZSBTVE0zMiBGTUMyIGNvbnRyb2xsZXJzLCBpbiBvcmRlciB0byB1c2UKPiA+PiAr
CSAgdGhlIGFjdHVhbCBmdW5jdGlvbmFsaXR5IG9mIHRoZSBkZXZpY2Ugb3RoZXIgZHJpdmVycyBt
dXN0IGJlIGVuYWJsZWQuCj4gPiAKPiA+IE5vdCBzdXJlIGhvdyBtYW55IHRpbWVzIEkgaGF2ZSB0
byBzYXkgdGhpcyBiZWZvcmUgcGVvcGxlIHN0b3AKPiA+IGF0dGVtcHRpbmcgdG8gcGFzcyB0aGVz
ZSBraW5kcyBvZiByZWxhdGlvbnNoaXBzIG9mZiBhcyBNRkRzOgo+ID4gCj4gPiBBIG1lbW9yeSBk
ZXZpY2UgYW5kIGl0cyBidXMgaXMgbm90IGFuIE1GRC4gIEluIGEgc2ltaWxhciB2YWluIHRvIHRo
ZQo+ID4gdGhvdXNhbmRzIG9mIFVTQiwgSTJDLCBTUEksIFBDSSBhbmQgdGhlIGxpa2UgZGV2aWNl
cyB0aGF0IGFyZW4ndCBNRkRzCj4gPiBlaXRoZXIuCj4gPiAKPiA+IFBsZWFzZSBmaW5kIGFub3Ro
ZXIgd2F5IHRvIGFzc29jaWF0ZSB5b3VyIGRldmljZSB3aXRoIGl0cyBidXMuCj4gCj4gVGhpcyBG
TUMyIGlzIGhvd2V2ZXIgYW4gSVAgd2hpY2ggY2FuIGVpdGhlciBvcGVyYXRlIGV4dGVybmFsIGRl
dmljZXMKPiAobGlrZSBldGhlcm5ldCBjaGlwIG9uIHRoaXMgcGFyYWxsZWwgYnVzKSBvciBleHRl
cm5hbCBmbGFzaGVzIChsaWtlIE5PUgo+IGFuZCBOQU5EIGNoaXBzKS4KCkknbSBzdXJlIHRoYXQg
aXQgKmNhbiouICBBbHRob3VnaCB0aGF0J3Mgbm90IGl0cyBtYWluIHB1cnBvc2UuICBUaGUKY2x1
ZSBpcyBpbiB0aGUgbm9tZW5jbGF0dXJlICgiRmxleGlibGUgKk1lbW9yeSogQ29udHJvbGxlciIp
LiAgTm9yIGlzCml0IGhvdyB0aGUgZGV2aWNlIGlzIGJlaW5nIHVzZWQgaW4gdGhpcyBzdWJtaXNz
aW9uOgoKICAiVGhlIEZNQzIgZnVuY3Rpb25hbCBibG9jayBtYWtlcyB0aGUgaW50ZXJmYWNlIHdp
dGg6IHN5bmNocm9ub3VzIGFuZAogICBhc3luY2hyb25vdXMgc3RhdGljIG1lbW9yaWVzIChzdWNo
IGFzIFBTTk9SLCBQU1JBTSBvciBvdGhlcgogICBtZW1vcnktbWFwcGVkIHBlcmlwaGVyYWxzKSBh
bmQgTkFORCBmbGFzaCBtZW1vcmllcy4iCgpBcyBJIG1lbnRpb25lZCwgdGhpcyBpcyBqdXN0IGFu
b3RoZXIgbWVtb3J5IGRldmljZSBhbmQgaXRzIGJ1cy4KCj4gQ2FuIHlvdSBwcm92aWRlIGEgc3Vn
Z2VzdGlvbiBob3cgdGhpcyBzaG91bGQgYmUgaGFuZGxlZCwgaWYgbm90IGFzIE1GRD8KPiBJdCBz
ZWVtcyB0byBtZSwgdGhhdCB0aGlzIGlzIGEgTXVsdGktRnVuY3Rpb24gRGV2aWNlIC4KClNpbXBs
eSBtb3ZlIGl0IGludG8gdGhlIE1URCBvciBNZW1vcnkgc3Vic3lzdGVtcyBhbmQgc2V0IHVwIHRo
ZQpkZXBlbmRlbmNpZXMgdmlhIEtjb25maWcuCgo+IElmIHRoaXMgZGlzY3Vzc2lvbiBpcyBhIHJl
Y3VycmluZyB0b3BpYywgaXMgdGhlcmUgc29tZSBkb2N1bWVudGF0aW9uCj4gd2hpY2ggZXhwbGFp
bnMgaG93IHN1Y2ggZGV2aWNlcyBzaG91bGQgYmUgaGFuZGxlZCA/CgpOb3QgdGhhdCBJJ20gYXdh
cmUgb2YuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmlj
YWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MK
Rm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
