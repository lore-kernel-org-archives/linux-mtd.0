Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401EBC54FD0
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 14:51:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B592071E
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 14:51:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qXYapsWZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JW615PGB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10B592071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93vq/QkVN36z8jshj2xo2x5fjDdcZAIoqiq7W7Rn7C4=; b=qXYapsWZt0TjST
	99RTbkQf5Aa+zKhE1djlzU0pIlt6JaXXVCqrae7IRjc+WHLPbwajOIedddVOtu3WBiTud6NawfXur
	xoXqxQpCQ8aDKFFMfDZW9SAVwFcN1b01egbZkSZOgkJEZbjpKNTq+jUQ1MGKkSouSkWdpCSCo0NHF
	ozWg3o1wtUMr35H2M5mAzKd/9PrlkpHP7lErh+KU6ENBcfDuYKFiCrj7IT2uHVPXfqN22yuwjuJ74
	+s9ffoi64B2e7zGRhnQO6Phd3gc9WRz8c+7F0w4fBrlsDoPSeuPZcuO22P5m02Yor1LDIoGmDN4L4
	Sp6X0opPzgcrNBmExVOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRzfL-0006Bc-41; Fri, 24 Apr 2020 14:50:55 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRzfH-0006Ah-Qy
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 14:50:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id j1so11207871wrt.1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2020 07:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=arbjr4f533qeCGCUfXjG1AwJZCWsc1TMbgG9gTC3+BU=;
 b=JW615PGBkId3Rrx+sIS/Qtame0NNhCqmt0qNHU2XFbJURWQSEIB98K9+6A9yo9Xwwo
 GVlxwOoYW0tgbXzt1dH6VxJpCED3uo/wSrBJPwF2J/YRLAjxEE5GTY6dC7fmCckxWh18
 L6cZGp86UCIuw9xgcBy16AIkG14OfZu8mpSA9F1G0dBhNx5YzkdvnBcQLGMPHmy8G7/Y
 /Ytol1fBWdvenECw8SxiLzwPHJW0+t+MRQL6dlXTCrd21KdWZS2FdCZrQfrw9ZaOcCRI
 H3DwpwVK+1fO5Dqx2rJrMVgToIQ/tPEUh8g/EiLjowojJ5P1nPY2mjEQDk4l9UgE1wzz
 iCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=arbjr4f533qeCGCUfXjG1AwJZCWsc1TMbgG9gTC3+BU=;
 b=FOvub1POhEG2Fs/mf3GY1S/m9InzYBiPLXeb6TQFCEvAQGrH9d7pMWWoa779lZo3ds
 O61ed5xxBS9ZQ0/8EE6G0vvi+NS7rpB92BuUTQqpFbGmKmouibHfe3q5HwtpgFObN7s8
 /zOWeCEsSFRHeru011yDj8wk5Iei1WajPXa9rlmIL+AhiS8hJk+/kvIR/KkpowkPJD5d
 yMVclNDLEHCzUd0qAoUGqt2KhQfRQwxVXv1ao39GcHFTlXgKdzdNGuoOMJMuFxQWquRU
 R4qAQJBBvTkSvlq7SeFJDooxj+mHeuLRBnCrP6AlxO+RZkx1zPHJSJmBXtvI3z1azFqQ
 wo/Q==
X-Gm-Message-State: AGi0PubgAjYwoH8dKDYX+byRQ1C6w6L9mwt/VcX+cGngzsA9IYYC735i
 YJP51JTnLXeTVJcj90Jcwd2+4w==
X-Google-Smtp-Source: APiQypKNlSzxiPCXIPo6RVz6w6o8W/4DZM0rPEnuXAxixbYMV5Gd4ccyEgRYMSuw8bMnFvOrB6o8/w==
X-Received: by 2002:a5d:5646:: with SMTP id j6mr12203073wrw.207.1587739849924; 
 Fri, 24 Apr 2020 07:50:49 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id q187sm3088378wma.41.2020.04.24.07.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 07:50:49 -0700 (PDT)
Date: Fri, 24 Apr 2020 15:50:47 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 02/12] mfd: stm32-fmc2: add STM32 FMC2 controller driver
Message-ID: <20200424145047.GE8414@dell>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-3-git-send-email-christophe.kerello@st.com>
 <20200424074517.GN3612@dell>
 <8b625f1c-9ded-c07a-a20e-8cd44c1ca46d@denx.de>
 <20200424105053.GC8414@dell>
 <e5e6c279-28d0-f423-aa6d-5c7aca563352@denx.de>
 <268ea231-eb4a-6144-c632-1bc8e9f21582@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <268ea231-eb4a-6144-c632-1bc8e9f21582@st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_075051_901500_B9C67B49 
X-CRM114-Status: GOOD (  37.79  )
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
Cc: Marek Vasut <marex@denx.de>, mark.rutland@arm.com, vigneshr@ti.com,
 devicetree@vger.kernel.org, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyNCBBcHIgMjAyMCwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdyb3RlOgoKPiAKPiAKPiBP
biA0LzI0LzIwIDE6MDYgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+ID4gT24gNC8yNC8yMCAxMjo1
MCBQTSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiBPbiBGcmksIDI0IEFwciAyMDIwLCBNYXJlayBW
YXN1dCB3cm90ZToKPiA+ID4gCj4gPiA+ID4gT24gNC8yNC8yMCA5OjQ1IEFNLCBMZWUgSm9uZXMg
d3JvdGU6Cj4gPiA+ID4gPiBPbiBXZWQsIDE1IEFwciAyMDIwLCBDaHJpc3RvcGhlIEtlcmVsbG8g
d3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhlIGRyaXZlciBhZGRzIHRoZSBzdXBwb3J0
IGZvciB0aGUgU1RNaWNyb2VsZWN0cm9uaWNzIEZNQzIgY29udHJvbGxlcgo+ID4gPiA+ID4gPiBm
b3VuZCBvbiBTVE0zMk1QIFNPQ3MuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGUgRk1DMiBm
dW5jdGlvbmFsIGJsb2NrIG1ha2VzIHRoZSBpbnRlcmZhY2Ugd2l0aDogc3luY2hyb25vdXMgYW5k
Cj4gPiA+ID4gPiA+IGFzeW5jaHJvbm91cyBzdGF0aWMgbWVtb3JpZXMgKHN1Y2ggYXMgUFNOT1Is
IFBTUkFNIG9yIG90aGVyCj4gPiA+ID4gPiA+IG1lbW9yeS1tYXBwZWQgcGVyaXBoZXJhbHMpIGFu
ZCBOQU5EIGZsYXNoIG1lbW9yaWVzLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+ID4g
PiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+ID4gICAtIHJl
bW92ZSBvcHMgZnJvbSBzdG0zMl9mbWMyIHN0cnVjdHVyZQo+ID4gPiA+ID4gPiAgIC0gYWRkIDIg
QVBJcyB0byBtYW5hZ2UgRk1DMiBlbmFibGUvZGlzYWJsZQo+ID4gPiA+ID4gPiAgIC0gYWRkIDIg
QVBJcyB0byBtYW5hZ2UgRk1DMiBOV0FJVCBzaGFyZWQgc2lnbmFsCj4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiAgIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgICAgICB8ICAxMiArKysKPiA+ID4g
PiA+ID4gICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgICAgfCAgIDEgKwo+ID4gPiA+ID4g
PiAgIGRyaXZlcnMvbWZkL3N0bTMyLWZtYzIuYyAgICAgICB8IDEzNiArKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiA+ID4gPiA+ICAgaW5jbHVkZS9saW51eC9tZmQvc3RtMzItZm1jMi5oIHwg
MjI1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiA+
ICAgNCBmaWxlcyBjaGFuZ2VkLCAzNzQgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC9zdG0zMi1mbWMyLmMKPiA+ID4gPiA+ID4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvc3RtMzItZm1jMi5oCj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBiL2RyaXZlcnMv
bWZkL0tjb25maWcKPiA+ID4gPiA+ID4gaW5kZXggMmIyMDMyOS4uNTI2MDU4MiAxMDA2NDQKPiA+
ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9tZmQvS2NvbmZpZwo+ID4gPiA+ID4gPiArKysgYi9kcml2
ZXJzL21mZC9LY29uZmlnCj4gPiA+ID4gPiA+IEBAIC0xOTIyLDYgKzE5MjIsMTggQEAgY29uZmln
IE1GRF9ST0hNX0JENzE4MjgKPiA+ID4gPiA+ID4gICAJICBBbHNvIGluY2x1ZGVkIGlzIGEgQ291
bG9tYiBjb3VudGVyLCBhIHJlYWwtdGltZSBjbG9jayAoUlRDKSwgYW5kCj4gPiA+ID4gPiA+ICAg
CSAgYSAzMi43Njgga0h6IGNsb2NrIGdhdGUuCj4gPiA+ID4gPiA+ICtjb25maWcgTUZEX1NUTTMy
X0ZNQzIKPiA+ID4gPiA+ID4gKwl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgRk1DMiBjb250cm9sbGVy
cyBvbiBTVE0zMk1QIFNvQ3MiCj4gPiA+ID4gPiA+ICsJZGVwZW5kcyBvbiBNQUNIX1NUTTMyTVAx
NTcgfHwgQ09NUElMRV9URVNUCj4gPiA+ID4gPiA+ICsJc2VsZWN0IE1GRF9DT1JFCj4gPiA+ID4g
PiA+ICsJc2VsZWN0IFJFR01BUAo+ID4gPiA+ID4gPiArCXNlbGVjdCBSRUdNQVBfTU1JTwo+ID4g
PiA+ID4gPiArCWhlbHAKPiA+ID4gPiA+ID4gKwkgIFNlbGVjdCB0aGlzIG9wdGlvbiB0byBlbmFi
bGUgU1RNMzIgRk1DMiBkcml2ZXIgdXNlZCBmb3IgRk1DMiBFeHRlcm5hbAo+ID4gPiA+ID4gPiAr
CSAgQnVzIEludGVyZmFjZSBjb250cm9sbGVyIGFuZCBGTUMyIE5BTkQgZmxhc2ggY29udHJvbGxl
ci4gVGhpcyBkcml2ZXIKPiA+ID4gPiA+ID4gKwkgIHByb3ZpZGVzIGNvcmUgc3VwcG9ydCBmb3Ig
dGhlIFNUTTMyIEZNQzIgY29udHJvbGxlcnMsIGluIG9yZGVyIHRvIHVzZQo+ID4gPiA+ID4gPiAr
CSAgdGhlIGFjdHVhbCBmdW5jdGlvbmFsaXR5IG9mIHRoZSBkZXZpY2Ugb3RoZXIgZHJpdmVycyBt
dXN0IGJlIGVuYWJsZWQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE5vdCBzdXJlIGhvdyBtYW55IHRp
bWVzIEkgaGF2ZSB0byBzYXkgdGhpcyBiZWZvcmUgcGVvcGxlIHN0b3AKPiA+ID4gPiA+IGF0dGVt
cHRpbmcgdG8gcGFzcyB0aGVzZSBraW5kcyBvZiByZWxhdGlvbnNoaXBzIG9mZiBhcyBNRkRzOgo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBBIG1lbW9yeSBkZXZpY2UgYW5kIGl0cyBidXMgaXMgbm90IGFu
IE1GRC4gIEluIGEgc2ltaWxhciB2YWluIHRvIHRoZQo+ID4gPiA+ID4gdGhvdXNhbmRzIG9mIFVT
QiwgSTJDLCBTUEksIFBDSSBhbmQgdGhlIGxpa2UgZGV2aWNlcyB0aGF0IGFyZW4ndCBNRkRzCj4g
PiA+ID4gPiBlaXRoZXIuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFBsZWFzZSBmaW5kIGFub3RoZXIg
d2F5IHRvIGFzc29jaWF0ZSB5b3VyIGRldmljZSB3aXRoIGl0cyBidXMuCj4gPiA+ID4gCj4gPiA+
ID4gVGhpcyBGTUMyIGlzIGhvd2V2ZXIgYW4gSVAgd2hpY2ggY2FuIGVpdGhlciBvcGVyYXRlIGV4
dGVybmFsIGRldmljZXMKPiA+ID4gPiAobGlrZSBldGhlcm5ldCBjaGlwIG9uIHRoaXMgcGFyYWxs
ZWwgYnVzKSBvciBleHRlcm5hbCBmbGFzaGVzIChsaWtlIE5PUgo+ID4gPiA+IGFuZCBOQU5EIGNo
aXBzKS4KPiA+ID4gCj4gPiA+IEknbSBzdXJlIHRoYXQgaXQgKmNhbiouICBBbHRob3VnaCB0aGF0
J3Mgbm90IGl0cyBtYWluIHB1cnBvc2UuCj4gPiAKPiA+IEkgdXNlIGl0IHRvIG9wZXJhdGUgS1Na
ODg1MS0xNk1MTCBldGhlcm5ldCBjaGlwLCB3aGljaCBoYXMgYXN5bmMgYnVzCj4gPiBpbnRlcmZh
Y2UuIExpbnV4IGp1c3QgZGlkbid0IGhhdmUgc3VwcG9ydCBmb3IgdGhhdCBtb2RlIG9mIG9wZXJh
dGlvbgo+ID4gdGh1cyBmYXIgYW5kIHRoZSBGTUMgd2FzIHVzZWQgdG8gb3BlcmF0ZSBOQU5EcyBh
bmQgTk9ScyBvbmx5LiBUaGlzCj4gPiBzZXJpZXMsIG9yIHJhdGhlciwgdGhlIGZpcnN0IHRocmVl
IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFkZCBzdXBwb3J0Cj4gPiBmb3Igb3BlcmF0aW5nIG90
aGVyIGJ1cyBkZXZpY2VzLCBsaWtlIHRoaXMgZXRoZXJuZXQgY29udHJvbGxlci4KPiA+IAo+ID4g
PiBUaGUKPiA+ID4gY2x1ZSBpcyBpbiB0aGUgbm9tZW5jbGF0dXJlICgiRmxleGlibGUgKk1lbW9y
eSogQ29udHJvbGxlciIpLiAgTm9yIGlzCj4gPiA+IGl0IGhvdyB0aGUgZGV2aWNlIGlzIGJlaW5n
IHVzZWQgaW4gdGhpcyBzdWJtaXNzaW9uOgo+ID4gPiAKPiA+ID4gICAgIlRoZSBGTUMyIGZ1bmN0
aW9uYWwgYmxvY2sgbWFrZXMgdGhlIGludGVyZmFjZSB3aXRoOiBzeW5jaHJvbm91cyBhbmQKPiA+
ID4gICAgIGFzeW5jaHJvbm91cyBzdGF0aWMgbWVtb3JpZXMgKHN1Y2ggYXMgUFNOT1IsIFBTUkFN
IG9yIG90aGVyCj4gPiA+ICAgICBtZW1vcnktbWFwcGVkIHBlcmlwaGVyYWxzKSBhbmQgTkFORCBm
bGFzaCBtZW1vcmllcy4iCj4gPiA+IAo+ID4gPiBBcyBJIG1lbnRpb25lZCwgdGhpcyBpcyBqdXN0
IGFub3RoZXIgbWVtb3J5IGRldmljZSBhbmQgaXRzIGJ1cy4KPiA+IAo+ID4gSSBkb24ndCB0aGlu
ayBpdCdzIF9qdXN0XyBhIG1lbW9yeSBjb250cm9sbGVyLCBpdCdzIG1vcmUgdW5pdmVyc2FsIHRo
YW4KPiA+IHRoYXQsIHNlZSBhYm92ZS4gTm90ZSB0aGF0IFNSQU0gaW50ZXJmYWNlIGJhc2ljYWxs
eSBib2lscyBkb3duIHRvCj4gPiBhbnl0aGluZyB3aGljaCBoYXMgZXh0ZXJuYWwgcGFyYWxsZWwg
YnVzLCBlLmcuIERhdmljb20gRE05MDAwLCB0aGF0Cj4gPiBLU1o4ODUxLTE2TUxMIGV0Yy4KPiA+
IAo+ID4gPiA+IENhbiB5b3UgcHJvdmlkZSBhIHN1Z2dlc3Rpb24gaG93IHRoaXMgc2hvdWxkIGJl
IGhhbmRsZWQsIGlmIG5vdCBhcyBNRkQ/Cj4gPiA+ID4gSXQgc2VlbXMgdG8gbWUsIHRoYXQgdGhp
cyBpcyBhIE11bHRpLUZ1bmN0aW9uIERldmljZSAuCj4gPiA+IAo+ID4gPiBTaW1wbHkgbW92ZSBp
dCBpbnRvIHRoZSBNVEQgb3IgTWVtb3J5IHN1YnN5c3RlbXMgYW5kIHNldCB1cCB0aGUKPiA+ID4g
ZGVwZW5kZW5jaWVzIHZpYSBLY29uZmlnLgo+ID4gPiAKPiA+ID4gPiBJZiB0aGlzIGRpc2N1c3Np
b24gaXMgYSByZWN1cnJpbmcgdG9waWMsIGlzIHRoZXJlIHNvbWUgZG9jdW1lbnRhdGlvbgo+ID4g
PiA+IHdoaWNoIGV4cGxhaW5zIGhvdyBzdWNoIGRldmljZXMgc2hvdWxkIGJlIGhhbmRsZWQgPwo+
ID4gPiAKPiA+ID4gTm90IHRoYXQgSSdtIGF3YXJlIG9mLgo+ID4gCj4gPiBJIHNlZS4KPiA+IAo+
IAo+IEhpIExlZSwgTWFyZWssCj4gCj4gSSB3aWxsIG1vdmUgdGhpcyBzb3VyY2UgY29kZSBpbiB0
aGUgRk1DMiBidXMgZHJpdmVyLiBJIHRoaW5rIHRoYXQgSSBzaG91bGQKPiBiZSBhYmxlIHRvIG1h
bmFnZSB0aGUgMiBjb250cm9sbGVycyB3aXRoIDIgZHJpdmVycyAodGhlIEZNQzIgYnVzIGRyaXZl
ciBhbmQKPiB0aGUgRk1DMiByYXcgTkFORCBkcml2ZXIpLiBJIHdpbGwgaGF2ZSB0byBtb2RpZnkg
c29tZSBwYXJ0IG9mIHRoZSBwcm9wb3NlZAo+IGJpbmRpbmdzLCBhbmQgc29tZSB1cGRhdGVzIHdp
bGwgaGF2ZSB0byBiZSBkb25lIGluIHRoZSBGTUMyIGJ1cyBkcml2ZXIuIEFsbAo+IHRoZXNlIG1v
ZGlmaWNhdGlvbnMgd2lsbCBiZSBwYXJ0IG9mIFYzLgoKVGhhdCBzb3VuZHMgbGlrZSBhIHZlcnkg
cmVhc29uYWJsZSBzb2x1dGlvbi4KCkZyb20gYSBwdXJpc3QncyBQb1YsIHRoZSBiaW5kaW5ncyBz
aG91bGQgbm90IGNoYW5nZS4gIEFzIHRoZXkgc2hvdWxkCmRlc2NyaWJlIHRoZSBoYXJkd2FyZSwg
cmF0aGVyIHRoYW4gdGhlIGltcGxlbWVudGF0aW9uLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pav
XQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRl
ciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
