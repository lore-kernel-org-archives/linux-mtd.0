Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19053C2BA1A
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 07:45:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF24020704
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 07:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VcIkjaKR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+DsWnfI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF24020704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20mIWdQ3oYxhpaZLBURi/wKMx82HniU2FkGqVIhWrqE=; b=VcIkjaKRfJxzNS
	2SzDOuHhDnzA69mSCmoE2y/ecnO8hN819nysOIkBCqXmtfRPIJ42JUHp6jY/F43KuclSjnAmBVISR
	PLIPIbpVHTyOxlRH5Wlrc2tNkVL2FtRwf8Wd+ukGPUNy46MBvR54+QcZfevxOyiIac5EFWnV3OQ7P
	aPkawBjxo/vAL11/qwC9SRMy6Zfc6k1VzoMMPfz5NuKbZjjsGoQep1zjOKE2Jij14t2gIIgpJXA8B
	qo1TFUEgJpgFAme3J09Rl8LZPyWN2J2WA+5jYSIaBwBwXBPzNqJIegle/0zEi3Vi07xJD8PdLLjAL
	oEhuwffsLgt+3OrNIRmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRt1d-0007f3-OG; Fri, 24 Apr 2020 07:45:29 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRt1W-0007XN-21
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 07:45:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id j1so9564452wrt.1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2020 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SG53LOGVaYSrSbMxtiTrlXAzhLKqp75bh+EmCNg5dN0=;
 b=a+DsWnfI8BxEYpw24cMf1ubciUzpfQylo8DC8e2EEMjIGJAT5XO0tgJRc4zm/7UKFj
 yP+UatvpM1GtMmXPpD5t6YQ4MasDgMtoYBWExtSpG/3qslXrxpKJuKOxPK6aDwnRbbNW
 6yJkklIByWlX/orJ1QKHiLb1RV9hXPUxXRysqlf+BZvjvB7SyZ++FH1taB7SxqUTSMKd
 Mj7oXh41AlY1haAGy3/VSB+UViganSyx20+MVCqJlMMbYhZ1eBZnDu7arB/dsxjdJR9g
 cMWMghusSfqfUS/ZTQ+cVhwDE8raguIokO5x2X3TnwoyGJPxoQ5N3TuXUvUMUuXGQXsL
 2u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SG53LOGVaYSrSbMxtiTrlXAzhLKqp75bh+EmCNg5dN0=;
 b=lLPlNngHoRe9zXsYaSGH3xJL0RekLjABdRDtEhkA0yvmHnfayFfb9bGduucQipAPC1
 uzEpelTVTEPxvc7atRK9Wb6Vl6vxb64Ty7mzJbTS0mn9HVu4umpCR0f+3DA2fvoP2rWV
 FMnVt+YB/I3gq76JNZh615np8/CN4nQu09EAj0JaYnePr28jVKsY9xZNlIVq4yqPJUjx
 gf/E9GU87WkrEaLngvbL78v2MrfJQIYcTsrrxdq1OlVClByzxLg5BXKM8IOGivWGlfRl
 0QWj9dg5NkSG2X2AgkkngGC3Ft6XTP6EYf2mit20BctesWj+dZxDJJ6mDL6R1hcbJyOs
 IM9Q==
X-Gm-Message-State: AGi0PuZMNuKI5q0XfniSCf6toCHjJPKAq6DOC/yfLIgWrh8vVZGYVQ7A
 /sDOf7IuR/GkdXbNAnouL+Q4tA==
X-Google-Smtp-Source: APiQypJQnsAmYnrESuH25hDMC1DnFFclkWGp9gSfFlUxWpilxTxaT5ID13BjavkGNKAVWmlFxdLMmw==
X-Received: by 2002:adf:82f5:: with SMTP id 108mr9200402wrc.43.1587714320260; 
 Fri, 24 Apr 2020 00:45:20 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id o3sm7034174wru.68.2020.04.24.00.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 00:45:18 -0700 (PDT)
Date: Fri, 24 Apr 2020 08:45:17 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 02/12] mfd: stm32-fmc2: add STM32 FMC2 controller driver
Message-ID: <20200424074517.GN3612@dell>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-3-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586966256-29548-3-git-send-email-christophe.kerello@st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_004522_650865_3C0E6FEE 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxNSBBcHIgMjAyMCwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdyb3RlOgoKPiBUaGUgZHJp
dmVyIGFkZHMgdGhlIHN1cHBvcnQgZm9yIHRoZSBTVE1pY3JvZWxlY3Ryb25pY3MgRk1DMiBjb250
cm9sbGVyCj4gZm91bmQgb24gU1RNMzJNUCBTT0NzLgo+IAo+IFRoZSBGTUMyIGZ1bmN0aW9uYWwg
YmxvY2sgbWFrZXMgdGhlIGludGVyZmFjZSB3aXRoOiBzeW5jaHJvbm91cyBhbmQKPiBhc3luY2hy
b25vdXMgc3RhdGljIG1lbW9yaWVzIChzdWNoIGFzIFBTTk9SLCBQU1JBTSBvciBvdGhlcgo+IG1l
bW9yeS1tYXBwZWQgcGVyaXBoZXJhbHMpIGFuZCBOQU5EIGZsYXNoIG1lbW9yaWVzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNv
bT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIHJlbW92ZSBvcHMgZnJvbSBzdG0zMl9mbWMy
IHN0cnVjdHVyZQo+ICAtIGFkZCAyIEFQSXMgdG8gbWFuYWdlIEZNQzIgZW5hYmxlL2Rpc2FibGUK
PiAgLSBhZGQgMiBBUElzIHRvIG1hbmFnZSBGTUMyIE5XQUlUIHNoYXJlZCBzaWduYWwKPiAKPiAg
ZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgICAgIHwgIDEyICsrKwo+ICBkcml2ZXJzL21mZC9N
YWtlZmlsZSAgICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL21mZC9zdG0zMi1mbWMyLmMgICAg
ICAgfCAxMzYgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9z
dG0zMi1mbWMyLmggfCAyMjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAzNzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9tZmQvc3RtMzItZm1jMi5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2xpbnV4L21mZC9zdG0zMi1mbWMyLmgKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQv
S2NvbmZpZyBiL2RyaXZlcnMvbWZkL0tjb25maWcKPiBpbmRleCAyYjIwMzI5Li41MjYwNTgyIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL0tjb25maWcKPiArKysgYi9kcml2ZXJzL21mZC9LY29u
ZmlnCj4gQEAgLTE5MjIsNiArMTkyMiwxOCBAQCBjb25maWcgTUZEX1JPSE1fQkQ3MTgyOAo+ICAJ
ICBBbHNvIGluY2x1ZGVkIGlzIGEgQ291bG9tYiBjb3VudGVyLCBhIHJlYWwtdGltZSBjbG9jayAo
UlRDKSwgYW5kCj4gIAkgIGEgMzIuNzY4IGtIeiBjbG9jayBnYXRlLgo+ICAKPiArY29uZmlnIE1G
RF9TVE0zMl9GTUMyCj4gKwl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgRk1DMiBjb250cm9sbGVycyBv
biBTVE0zMk1QIFNvQ3MiCj4gKwlkZXBlbmRzIG9uIE1BQ0hfU1RNMzJNUDE1NyB8fCBDT01QSUxF
X1RFU1QKPiArCXNlbGVjdCBNRkRfQ09SRQo+ICsJc2VsZWN0IFJFR01BUAo+ICsJc2VsZWN0IFJF
R01BUF9NTUlPCj4gKwloZWxwCj4gKwkgIFNlbGVjdCB0aGlzIG9wdGlvbiB0byBlbmFibGUgU1RN
MzIgRk1DMiBkcml2ZXIgdXNlZCBmb3IgRk1DMiBFeHRlcm5hbAo+ICsJICBCdXMgSW50ZXJmYWNl
IGNvbnRyb2xsZXIgYW5kIEZNQzIgTkFORCBmbGFzaCBjb250cm9sbGVyLiBUaGlzIGRyaXZlcgo+
ICsJICBwcm92aWRlcyBjb3JlIHN1cHBvcnQgZm9yIHRoZSBTVE0zMiBGTUMyIGNvbnRyb2xsZXJz
LCBpbiBvcmRlciB0byB1c2UKPiArCSAgdGhlIGFjdHVhbCBmdW5jdGlvbmFsaXR5IG9mIHRoZSBk
ZXZpY2Ugb3RoZXIgZHJpdmVycyBtdXN0IGJlIGVuYWJsZWQuCgpOb3Qgc3VyZSBob3cgbWFueSB0
aW1lcyBJIGhhdmUgdG8gc2F5IHRoaXMgYmVmb3JlIHBlb3BsZSBzdG9wCmF0dGVtcHRpbmcgdG8g
cGFzcyB0aGVzZSBraW5kcyBvZiByZWxhdGlvbnNoaXBzIG9mZiBhcyBNRkRzOgoKQSBtZW1vcnkg
ZGV2aWNlIGFuZCBpdHMgYnVzIGlzIG5vdCBhbiBNRkQuICBJbiBhIHNpbWlsYXIgdmFpbiB0byB0
aGUKdGhvdXNhbmRzIG9mIFVTQiwgSTJDLCBTUEksIFBDSSBhbmQgdGhlIGxpa2UgZGV2aWNlcyB0
aGF0IGFyZW4ndCBNRkRzCmVpdGhlci4KClBsZWFzZSBmaW5kIGFub3RoZXIgd2F5IHRvIGFzc29j
aWF0ZSB5b3VyIGRldmljZSB3aXRoIGl0cyBidXMuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
CkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
