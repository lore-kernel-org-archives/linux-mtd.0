Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA0BC6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 03:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFJH/IpAwUqDF9kFO6Es40VdpHUyYp1KAJPCGmT2jtU=; b=sVpxZtP3lJtzRH
	EPAF8ruPRs0V51jgFxXRZsKhXooF0OhGhzYtHEjIVSRcNcjON3TrZXMl6bOoukzT627apMPc7/aqa
	OUbuNBHRLkjNnEFUHw6v/xQjXLPxMqoFKm+tad9rrMpfTDAPzi2V8xo5IHBosuwAhaF5y2Z+uVksq
	181DzG0yVn51xVEPABSSGZ+Mo3VZLO3HgM00dl8M/YGi75W2PUlpiRoiIm+mdBZh5jbh92zGCotrx
	nuzLNYaPDqgOc8uLt6HBHHxBs2QtYjnsOtn/upapElGtP25GOFj6vCHj4xphcH+ukot69j5B3SPGb
	6LGBerQzTg7hjddGQTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd0q9-000o75-0H;
	Fri, 17 Mar 2023 03:33:13 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd0q4-000o5k-17
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 03:33:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id eg48so15324880edb.13
        for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2023 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679023984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LX3omnfF4kTa6M6LHgMsZiGljB/6kvdoXsQbIxgnm8=;
        b=xhpLWrHGWR4x6z8JuS0Us7EZXStxL8DPbLupCqPPs+80FPiUr7cXVcrGD8Ey28N11o
         lGPSxxp18Y0o8Ih8qwrhvOx3g06e+f+k7+PKA3/5MNPuoeh0/o35Bp6NwaxPqFfpaiH4
         d4Aq24PYwjdrN/m1ZsjuIHDhH+lZugLGdQ7GOx+zAZyqrHU09VwMPh0L6cMeWK09lnay
         2BJTQSFo2BXSenVvaGBV6h6bs4V5i3AX5l0lNtJBvb/MybUDxcZpW5nTfQ0AAbfC9G3p
         b4G6PCIdNNBzh/jVzecIs1YT57RzPP5SS7xAmMXSk+SGP241qQbrr/LzxtPCCacWrIJM
         REOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679023984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LX3omnfF4kTa6M6LHgMsZiGljB/6kvdoXsQbIxgnm8=;
        b=PQI8W+mBDei9deATcodVy5cEe3AUlhs9RdFZ9CH8eItQarWMDiOb1FaAd+zM7DOrx0
         c4xB20aqWwK6Oy1fCuGMTSfU305zuq7FiKJsqDR/2eAYCFCe4Kx/XnH2OfZlid5Fh0K+
         uzmfe6XAFwr30/Qs9WqSkPAMj/w/JkFlJYcvGMK6oTDtMYrBrXS9hfMZD0HBIHV/d5iJ
         3MLt/ThxfDSUTaEfZzUSDH6KNT+Hc7+JqAwwQ+YENHPfYmu7rYv0D/ajEh8wbPezIqxx
         k0epabZRvHN58sFQR8IRhwxicN8b04nLCMuVR6r5OGFIk9eXIOtk2/7ey0fHAysRFTuX
         Hqnw==
X-Gm-Message-State: AO0yUKUES0YCHhLazlva+Az6G18kEv2KUgTlhRf6xdcH8Y8jN8aygG3b
	C2YBzc1KJN1jqjgsaWo5SehGYA==
X-Google-Smtp-Source: AK7set97YgSvoKBcTkkO6Ay0h5rgw/O9oWweM+oVJ3uLuIQfABICvxv46xSJzTUr/D2jYfaxlcb+Hw==
X-Received: by 2002:a17:906:16d6:b0:930:310:abf4 with SMTP id t22-20020a17090616d600b009300310abf4mr6406326ejd.50.1679023984241;
        Thu, 16 Mar 2023 20:33:04 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906c00800b008e1509dde19sm382857ejz.205.2023.03.16.20.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 20:33:03 -0700 (PDT)
Message-ID: <188fdeb0-7b75-9042-c70e-ba3898ba5729@linaro.org>
Date: Fri, 17 Mar 2023 03:33:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/9] mtd: spi-nor: Introduce the concept of bank
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>,
 Jaime Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221215081241.407098-1-miquel.raynal@bootlin.com>
 <20221215081241.407098-3-miquel.raynal@bootlin.com>
 <9e5f4a2b-b232-880f-e1dd-37e23e4a98b6@linaro.org>
 <20230201123252.2d6bf221@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230201123252.2d6bf221@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_203308_385138_0EA86EA9 
X-CRM114-Status: GOOD (  32.20  )
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

CgpPbiAyLzEvMjMgMTE6MzIsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgVHVkb3IsCj4gCj4g
SmFpbWUsIGEgZmV3IHF1ZXN0aW9ucyBmb3IgeW91IGJlbG93Lgo+IAo+IHR1ZG9yLmFtYmFydXNA
bGluYXJvLm9yZyB3cm90ZSBvbiBUaHUsIDE5IEphbiAyMDIzIDE2OjM0OjI4ICswMDAwOgo+IAo+
PiBIaSwgTWlxdWVsLAo+Pgo+PiBPbiAxMi8xNS8yMiAwODoxMiwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPj4+IFNQSS1OT1IgY2hpcHMgYXJlIG1hZGUgb2YgcGFnZXMsIHdoaWNoIGdhdGhlcmVkIGlu
IHNtYWxsIGdyb3VwcyBtYWtlICAKPj4KPj4gbml0OiBzL1NQSS1OT1IvIFNQSSBOT1IKPiAKPiBO
b3RlZC4KPiAKPj4KPj4+IChlcmFzZSkgc2VjdG9ycy4gU2VjdG9ycywgZ2F0aGVyZWQgdG9nZXRo
ZXIsIG1ha2UgYmFua3MgaW5zaWRlIHRoZQo+Pj4gY2hpcC4gU28gZmFyIHRoZXJlIHdhcyBvbmx5
IG9uZSBiYW5rIHBlciBkZXZpY2Ugc3VwcG9ydGVkLCBidXQgd2UgYXJlCj4+PiBhYm91dCB0byBp
bnRyb2R1Y2Ugc3VwcG9ydCBmb3IgbmV3IGNoaXBzIGZlYXR1cmluZyBzZXZlcmFsIGJhbmtzICh1
cCB0bwo+Pj4gNCBzbyBmYXIpIHdoZXJlIGRpZmZlcmVudCBvcGVyYXRpb25zIG1heSBoYXBwZW4g
aW4gcGFyYWxsZWwuCj4+Pgo+Pj4gTGV0J3MgYWxsb3cgZGVzY3JpYmluZyB0aGVzZSBhZGRpdGlv
bmFsIGJhbmsgcGFyYW1ldGVycy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IFByYXR5dXNoIFlh
ZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPgo+Pj4gLS0tCj4+PiAgIGRyaXZlcnMvbXRkL3NwaS1u
b3IvY29yZS5jIHwgIDMgKystCj4+PiAgIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oIHwgMTYg
KysrKysrKysrKystLS0tLQo+Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4+IGluZGV4IGYyYzY0MDA2Zjhk
Ny4uMzhhNTdhYWM2NzU0IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMKPj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+PiBAQCAtMjUzOSw3ICsy
NTM5LDggQEAgc3RhdGljIHZvaWQgc3BpX25vcl9pbml0X2RlZmF1bHRfcGFyYW1zKHN0cnVjdCBz
cGlfbm9yICpub3IpICAKPj4+ICAgPiAgIAkvKiBTZXQgU1BJIE5PUiBzaXplcy4gKi8gIAo+Pj4g
ICAJcGFyYW1zLT53cml0ZXNpemUgPSAxOwo+Pj4gLQlwYXJhbXMtPnNpemUgPSAodTY0KWluZm8t
PnNlY3Rvcl9zaXplICogaW5mby0+bl9zZWN0b3JzOwo+Pj4gKwlwYXJhbXMtPmJhbmtfc2l6ZSA9
ICh1NjQpaW5mby0+c2VjdG9yX3NpemUgKiBpbmZvLT5uX3NlY3RvcnM7Cj4+PiArCXBhcmFtcy0+
c2l6ZSA9IHBhcmFtcy0+YmFua19zaXplICogaW5mby0+bl9iYW5rczsgIAo+Pgo+PiBJcyB0aGUg
ZGF0YXNoZWV0IGZvciB0aGVzZSBjaGlwcyBwdWJsaWM/IEkgc2VlIEpFU0QyMTYgc2F5cyBub3Ro
aW5nCj4+IGFib3V0IGZsYXNoIGJhbmtzLgo+IAo+IEphaW1lLCBkbyB5b3UgaGF2ZSBhIHB1Ymxp
YyBkYXRhc2hlZXQgZm9yIHRoZSBNWDI1VVc1MTI0NUcgPwo+IAo+PiBJJ20gd29uZGVyaW5nIHdo
ZXRoZXIgd2Ugc2hvdWxkIGtlZXAgdGhlIG5fc2VjdG9ycyBhcyB0aGUgdG90YWwgbnVtYmVyIG9m
IHNlY3RvcnMgcGVyIGZsYXNoIG9yIG5vdC4KPiAKPiBUaGlzIGlzIGluZGVlZCBhIGdvb2QgcG9p
bnQgYW5kIEkgZGlkIHRoaW5rIGFib3V0IGl0IHdoZW4gSSB3cm90ZSB0aGUKPiBpbml0aWFsIHN1
cHBvcnQuIEZvciBtZSBpdCBsb29rcyBsaWtlIHRoZSBiYW5rcyBhcmUgb25seSByZWxldmFudCBm
b3IKPiB0aGUgUldXIHB1cnBvc2UgKGZvciBub3cpIHNvIEkgZGVjaWRlZCBJIHdvdWxkIGtlZXAg
dGhlIGNoYW5nZXMgbWluaW1hbAo+IGFuZCBub3QgbWVzcyB3aXRoIHRoZSBleGlzdGluZyB2YXJp
YWJsZXMgZnVydGhlci4gU28gSSBqdXN0IGFkZGVkIGEKPiAiYmFuayIgbWVtYmVyLCBhbmQgaWYg
eW91IHdhbnQgdGhlIG51bWJlciBvZiBzZWN0b3JzIHBlciBiYW5rLCB5b3UgY2FuCj4gZGl2aWRl
IG5zZWN0b3JzIGJ5IHRoZSBudW1iZXIgb2YgYmFua3MuIEFub3RoZXIgYXBwcm9hY2ggbWlnaHQg
YmUsIGFzCj4geW91IGFzaywgdG8gY291bnQgdGhlIG51bWJlciBvZiBzZWN0b3JzIGJhc2VkIG9u
IHRoZSBudW1iZXIgb2Ygc2VjdG9ycwo+IHBlciBiYW5rIGFuZCB0aGUgbnVtYmVyIG9mIGJhbmtz
LiBXZSBjYW4gbW92ZSB0byB0aGlzIGFwcHJvYWNoIGxhdGVyIEkKPiBiZWxpZXZlLCBpZiBldmVy
IHVzZWZ1bC4KPiAKPj4gRG9lcyB0aGlzIGZsYXNoIHR5cGUgc3VwcG9ydCBTb2Z0d2FyZSBCbG9j
awo+PiBQcm90ZWN0aW9uPyBIb3cgZG8gdGhleSBjb3VudCB0aGUgc2VjdG9ycyBvbiBCbG9jayBQ
cm90ZWN0aW9uLCBwZXIgZmxhc2gKPj4gb3IgcGVyIGJhbms/Cj4gCj4gWWVzIGl0IHN1cHBvcnRz
IGJsb2NrIHByb3RlY3Rpb24sIEFGQUlDUyBpdCBpcyBhIHBlci1zZWN0b3IKPiBjb25maWd1cmF0
aW9uLCB3aGljaCBkb2VzIG5vdCBjYXJlIGFib3V0IGJhbmtzIGF0IGFsbC4gSXQgbG9va3MgbGlr
ZQo+IHlvdSBjYW4gcHJvdGVjdCAyXm4gc2VjdG9ycyAoY2FsbGVkICJibG9ja3MiIGluIHRoZSBk
YXRhc2hlZXQpIGZyb20gdGhlCj4gc3RhcnQgb3IgZnJvbSB0aGUgZW5kIG9mIHRoZSBkZXZpY2Uu
Cgp0aGVuIHlvdSBzaG91bGRuJ3QgY2hhbmdlIHRoZSBuX3NlY3RvcnMgbWVhbmluZywgYW5kIGtl
ZXAgaXQgcGVyIGZsYXNoLAphbmQgbm90IHBlciBiYW5rLiBPdGhlcndpc2UgeW91IGJyZWFrIHRo
ZSBibG9jayBwcm90ZWN0aW9uIHN1cHBvcnQgZm9yCnRoZXNlIGZsYXNoZXMuIElmIHlvdSByZWFs
bHkgbmVlZCB0aGUgbnVtYmVyIG9mIHNlY3RvcnMgcGVyIGJhbmssIHlvdQpjYW4gZGl2aWRlIG5f
c2VjdG9ycyAocGVyIGZsYXNoKSBieSBuYmFua3MsIGNhbid0IHlvdT8gU28gYmFua19zaXplCnNo
b3VsZCBsb29rIGxpa2UgKG5fc2VjdG9ycyAvIG5iYW5rcykgKiBzZWN0b3Jfc2l6ZS4KCj4gCj4g
SmFpbWUsIGRvIHlvdSBjb25maXJtPwo+IAo+Pj4gICAJcGFyYW1zLT5wYWdlX3NpemUgPSBpbmZv
LT5wYWdlX3NpemU7ICAKPj4+ICAgPiAgIAlpZiAoIShpbmZvLT5mbGFncyAmIFNQSV9OT1JfTk9f
RlIpKSB7ICAKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaCBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oCj4+PiBpbmRleCBkYzc0YzdiZTNlMjguLjhhMDY3ZDU2
Yzk5NSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oCj4+PiArKysg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaAo+Pj4gQEAgLTMzNiw3ICszMzYsOCBAQCBzdHJ1
Y3Qgc3BpX25vcl9vdHAgewo+Pj4gICAgKiBieSB0aGUgc3BpX25vcl9maXh1cHMgaG9va3MsIG9y
IGR5bmFtaWNhbGx5IHdoZW4gcGFyc2luZyB0aGUgSkVTRDIxNgo+Pj4gICAgKiBTZXJpYWwgRmxh
c2ggRGlzY292ZXJhYmxlIFBhcmFtZXRlcnMgKFNGRFApIHRhYmxlcy4KPj4+ICAgICoKPj4+IC0g
KiBAc2l6ZToJCXRoZSBmbGFzaCBtZW1vcnkgZGVuc2l0eSBpbiBieXRlcy4KPj4+ICsgKiBAYmFu
a19zaXplOgkJdGhlIGZsYXNoIG1lbW9yeSBiYW5rIGRlbnNpdHkgaW4gYnl0ZXMuCj4+PiArICog
QHNpemU6CQl0aGUgdG90YWwgZmxhc2ggbWVtb3J5IGRlbnNpdHkgaW4gYnl0ZXMuCj4+PiAgICAq
IEB3cml0ZXNpemUJCU1pbmltYWwgd3JpdGFibGUgZmxhc2ggdW5pdCBzaXplLiBEZWZhdWx0cyB0
byAxLiBTZXQgdG8KPj4+ICAgICoJCQlFQ0MgdW5pdCBzaXplIGZvciBFQ0MtZWQgZmxhc2hlcy4K
Pj4+ICAgICogQHBhZ2Vfc2l6ZToJCXRoZSBwYWdlIHNpemUgb2YgdGhlIFNQSSBOT1IgZmxhc2gg
bWVtb3J5Lgo+Pj4gQEAgLTM3NCw2ICszNzUsNyBAQCBzdHJ1Y3Qgc3BpX25vcl9vdHAgewo+Pj4g
ICAgKiBAbG9ja2luZ19vcHM6CVNQSSBOT1IgbG9ja2luZyBtZXRob2RzLgo+Pj4gICAgKi8KPj4+
ICAgc3RydWN0IHNwaV9ub3JfZmxhc2hfcGFyYW1ldGVyIHsKPj4+ICsJdTY0CQkJCWJhbmtfc2l6
ZTsKPj4+ICAgCXU2NAkJCQlzaXplOwo+Pj4gICAJdTMyCQkJCXdyaXRlc2l6ZTsKPj4+ICAgCXUz
MgkJCQlwYWdlX3NpemU7Cj4+PiBAQCAtNDM0LDcgKzQzNiw4IEBAIHN0cnVjdCBzcGlfbm9yX2Zp
eHVwcyB7Cj4+PiAgICAqIEBpZF9sZW46ICAgICAgICAgdGhlIG51bWJlciBvZiBieXRlcyBvZiBJ
RC4KPj4+ICAgICogQHNlY3Rvcl9zaXplOiAgICB0aGUgc2l6ZSBsaXN0ZWQgaGVyZSBpcyB3aGF0
IHdvcmtzIHdpdGggU1BJTk9SX09QX1NFLCB3aGljaAo+Pj4gICAgKiAgICAgICAgICAgICAgICAg
IGlzbid0IG5lY2Vzc2FyaWx5IGNhbGxlZCBhICJzZWN0b3IiIGJ5IHRoZSB2ZW5kb3IuCj4+PiAt
ICogQG5fc2VjdG9yczogICAgICB0aGUgbnVtYmVyIG9mIHNlY3RvcnMuCj4+PiArICogQG5fc2Vj
dG9yczogICAgICB0aGUgbnVtYmVyIG9mIHNlY3RvcnMgcGVyIGJhbmsuCj4+PiArICogQG5fYmFu
a3M6ICAgICAgICB0aGUgbnVtYmVyIG9mIGJhbmtzLgo+Pj4gICAgKiBAcGFnZV9zaXplOiAgICAg
IHRoZSBmbGFzaCdzIHBhZ2Ugc2l6ZS4KPj4+ICAgICogQGFkZHJfbmJ5dGVzOiAgICBudW1iZXIg
b2YgYWRkcmVzcyBieXRlcyB0byBzZW5kLgo+Pj4gICAgKgo+Pj4gQEAgLTQ5Myw2ICs0OTYsNyBA
QCBzdHJ1Y3QgZmxhc2hfaW5mbyB7Cj4+PiAgIAl1OCBpZF9sZW47Cj4+PiAgIAl1bnNpZ25lZCBz
ZWN0b3Jfc2l6ZTsKPj4+ICAgCXUxNiBuX3NlY3RvcnM7Cj4+PiArCXUxNiBuX2JhbmtzOwo+Pj4g
ICAJdTE2IHBhZ2Vfc2l6ZTsgIAo+Pgo+PiBXZSBjYW4gdHJ5IHU4IG5iYW5rcyBmb3Igbm93LiBB
bmQgd2Ugd291bGQgZGVmaW5lIGl0IGhlcmUsIHRvIGF2b2lkCj4+IHN0cnVjdCBwYWRkaW5nLgo+
IAo+IE9rLgo+IAo+Pj4gICAJdTggYWRkcl9uYnl0ZXM7ICAKPj4+ICAgPiBAQCAtNTM4LDIzICs1
NDIsMjUgQEAgc3RydWN0IGZsYXNoX2luZm8geyAgCj4+PiAgIAkuaWQgPSB7IFNQSV9OT1JfSURf
M0lURU1TKF9qZWRlY19pZCksIFNQSV9OT1JfSURfM0lURU1TKF9leHRfaWQpIH0sIFwKPj4+ICAg
CS5pZF9sZW4gPSA2ICAKPj4+ICAgPiAtI2RlZmluZSBTUElfTk9SX0dFT01FVFJZKF9zZWN0b3Jf
c2l6ZSwgX25fc2VjdG9ycykJCQlcICAKPj4+ICsjZGVmaW5lIFNQSV9OT1JfR0VPTUVUUlkoX3Nl
Y3Rvcl9zaXplLCBfbl9zZWN0b3JzLCBfbl9iYW5rcykJCVwKPj4+ICAgCS5zZWN0b3Jfc2l6ZSA9
IChfc2VjdG9yX3NpemUpLAkJCQkJXAo+Pj4gICAJLm5fc2VjdG9ycyA9IChfbl9zZWN0b3JzKSwJ
CQkJCVwKPj4+ICsJLm5fYmFua3MgPSAoX25fYmFua3MpLAkJCQkJCVwKPj4+ICAgCS5wYWdlX3Np
emUgPSAyNTYgIAo+Pj4gICA+ICAgLyogVXNlZCB3aGVuIHRoZSAiX2V4dF9pZCIgaXMgdHdvIGJ5
dGVzIGF0IG1vc3QgKi8gIAo+Pj4gICAjZGVmaW5lIElORk8oX2plZGVjX2lkLCBfZXh0X2lkLCBf
c2VjdG9yX3NpemUsIF9uX3NlY3RvcnMpCQlcCj4+PiAgIAlTUElfTk9SX0lEKChfamVkZWNfaWQp
LCAoX2V4dF9pZCkpLAkJCQlcCj4+PiAtCVNQSV9OT1JfR0VPTUVUUlkoKF9zZWN0b3Jfc2l6ZSks
IChfbl9zZWN0b3JzKSksCj4+PiArCVNQSV9OT1JfR0VPTUVUUlkoKF9zZWN0b3Jfc2l6ZSksIChf
bl9zZWN0b3JzKSwgMSksICAKPj4+ICAgPiAgICNkZWZpbmUgSU5GTzYoX2plZGVjX2lkLCBfZXh0
X2lkLCBfc2VjdG9yX3NpemUsIF9uX3NlY3RvcnMpCQlcICAKPj4+ICAgCVNQSV9OT1JfSUQ2KChf
amVkZWNfaWQpLCAoX2V4dF9pZCkpLAkJCQlcCj4+PiAtCVNQSV9OT1JfR0VPTUVUUlkoKF9zZWN0
b3Jfc2l6ZSksIChfbl9zZWN0b3JzKSksCj4+PiArCVNQSV9OT1JfR0VPTUVUUlkoKF9zZWN0b3Jf
c2l6ZSksIChfbl9zZWN0b3JzKSwgMSksICAKPj4+ICAgPiAgICNkZWZpbmUgQ0FUMjVfSU5GTyhf
c2VjdG9yX3NpemUsIF9uX3NlY3RvcnMsIF9wYWdlX3NpemUsIF9hZGRyX25ieXRlcykJXCAgCj4+
PiAgIAkJLnNlY3Rvcl9zaXplID0gKF9zZWN0b3Jfc2l6ZSksCQkJCVwKPj4+ICAgCQkubl9zZWN0
b3JzID0gKF9uX3NlY3RvcnMpLAkJCQlcCj4+PiArCQkubl9iYW5rcyA9IDEsCQkJCQkJXAo+Pj4g
ICAJCS5wYWdlX3NpemUgPSAoX3BhZ2Vfc2l6ZSksCQkJCVwKPj4+ICAgCQkuYWRkcl9uYnl0ZXMg
PSAoX2FkZHJfbmJ5dGVzKSwJCQkJXAo+Pj4gICAJCS5mbGFncyA9IFNQSV9OT1JfTk9fRVJBU0Ug
fCBTUElfTk9SX05PX0ZSLAkJXCAgCj4+Cj4+IHlvdSBuZWVkIHRvIHVwZGF0ZSBTM0FOX0lORk8g
YXMgd2VsbC4KPiAKPiBDb21wbGV0ZWx5IG1pc3NlZCB0aGF0IG9uZSwgdGhhbmtzIQo+IAo+IENo
ZWVycywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
