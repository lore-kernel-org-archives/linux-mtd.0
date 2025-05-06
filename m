Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE222C3ABBF
	for <linux-mtd@archiver.kernel.org>; Tue,  6 May 2025 13:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+zHfaYm5l4N+5jJjEgk0gOdCHJL0t8CA9wFC54BrnU=; b=TRc1so3+PmYyiU
	jNfoaLiHHLOdXcshLx1/hHhVmQ/PUKQ20pDjpnspXLAWNge+JfJDZKTQfC5+jAbuu+AKZZfR3Fb4X
	SmarqnsRRl/lngqYe1Z2UggogQ+C3WelDZP4IsKNHKsO4hciBOV5IT2UMPEDl9jk4h1fXdUm8nzSC
	5RTkjCLaaOx9PMPVub1A4ECGAXX6n47lViGuIOL3MMP6G4YR3bNVMju9Vyivz2x7QOOWQPgLPl6h8
	dMLpPFH6inKXcTahA/xh29bzpLU5kek/K0st0Sa7xHNfFTcr4K8y+fGN0O7vdqLhay3xQACN1pBLe
	ew6gVXge4WV77zIJh9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIa9-0000000CBID-1RSD;
	Tue, 06 May 2025 13:43:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGHL-0000000BhOB-2iBV
	for linux-mtd@lists.infradead.org;
	Tue, 06 May 2025 11:16:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so51342085e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 06 May 2025 04:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746530162; x=1747134962; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AZCwgOWOOCWTlbTNg+Glm3yWO7Px7uzRJr4qQIo37HE=;
        b=KA8/xlvVzX6RDurAdEcIoNFqmZfWK/U0b/u64SD1X2WIqqogq9vzLzOShIzqANs0CX
         mrJCzJnTkJlQHwmG5LT+fPCBHq9gborRm5/qTQNOq1vNeDu9ErJUIGbqJztjAmcQKCzs
         s1uH9dRHKnI8plPBsggX3lmuKzWGBRsAJU0MP3d2OWYvdnCmfYg1J4n8836+pHkd45bP
         5HVHHPzfxtKNVIiR17Rr0oPFXg2DPu1G+c6DRsC3WzkegJcm/5TYPVh2RYJy5zLEIZGp
         Aj4z0CmuiD6ZWkl02XN7BG9DjrAAv6+J5jgYrYAmFrVLPwf0N2qfuaGTgY0wppMj7nRO
         lfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530162; x=1747134962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZCwgOWOOCWTlbTNg+Glm3yWO7Px7uzRJr4qQIo37HE=;
        b=lLY9h7NGejOgJUvE+miz5PToxNocrAxn4sKw+jLasgc7HpFhakH8++5IKO9NeXeisZ
         A3SpypbdIYCaVotHKncspEkj2TAry03mkxdOAK3SdA9xKDOvXOHHhmY8QLq+OsMzC21S
         6jgNzhBXMf88pRfU2eJ+H8MDIhNhLuBFwAmrTPDab1N7753opIQclFnUyjI3ZLQPAROG
         NoDlwD9K69+eXhrdWXrdyJZXvF+wJmhvyKF19C+yT7aPAywVsJyzlGeVggj8GhRVrecS
         HMlK2hiPHmRXwBjxHuNSN0T2OGp6hJAKmfRjiIHKTkHlrqqDpfK7W//uWswPyHs/XpOo
         M9/g==
X-Forwarded-Encrypted: i=1; AJvYcCUgt+2v5wVMYrmPkvOwuOlIuqC+4gO0NHrg9kANTQ2ACVRermbwHmazkWdpS05hhC74m5jNIahgXqw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnILBxJJTGlaqqUpom43MWuLtBdRiF3uNaUUX5XKkVFv+rhIIg
	SO2tLyGnCXKpAZFh5fJavHS9Sc6UVA9RfwYER1NzmG/fmnvng7wrUqkbrt2ItDkhJ1w2owcZolr
	7
X-Gm-Gg: ASbGncs0Ui+xTsAvdhibrOlaTd34naKRzp2+GCk8lMjqH9WOe9COrPlInYjeID21Nmx
	Y0XFOuMxy2bszOcMwBLWvf2nPhkNOK7J/H6txqc6atwuA8hbay9B7lPh//j3GKlfOkvHxg2SMt9
	txNe6x67EW41nWM70Iuze42hG+t6DIzew+3acDBdy+jGRMQep4Ac7AE+M8jS8OIEZN5JnhhGdzU
	oBy6v3aw694rXgOJs1CzU6HVkcAn58DQVi7cHV68p+7DNnfTtr3bgbV6zeqIeVUX2+IJbPzxGOw
	yKQq1bFpZ6fXu2xDvotcjasbZ9Z0nxdGumcA9h3snbRFNR2TsZoRAmNY
X-Google-Smtp-Source: AGHT+IEb/FzHjC2BdixzCZvpPpVp5jderqE1DM9mJQuUaUitas1wO3yPRwuVgog0ub9hO25i19Te4w==
X-Received: by 2002:a05:600c:4ec6:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-441c48dc0a1mr103108985e9.16.1746530162207;
        Tue, 06 May 2025 04:16:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a286b9sm164637705e9.28.2025.05.06.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:16:01 -0700 (PDT)
Date: Tue, 6 May 2025 14:15:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBnvbYaE-tud_o0x@stanley.mountain>
References: <aBSEwag_ducqOwy7@stanley.mountain>
 <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
 <aBnXPYLSNJASR51f@stanley.mountain>
 <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_041603_692794_02354A7E 
X-CRM114-Status: GOOD (  33.98  )
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

T24gVHVlLCBNYXkgMDYsIDIwMjUgYXQgMDY6MDE6MTVQTSArMDgwMCwgS2VndWFuZyBaaGFuZyB3
cm90ZToKPiBPbiBUdWUsIE1heSA2LCAyMDI1IGF0IDU6MzLigK9QTSBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWF5IDA2LCAy
MDI1IGF0IDA1OjE2OjAzUE0gKzA4MDAsIEtlZ3VhbmcgWmhhbmcgd3JvdGU6Cj4gPiA+IE9uIEZy
aSwgTWF5IDIsIDIwMjUgYXQgNDozOeKAr1BNIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
bGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGUgImRlc2MiIHZhcmlhYmxlIGlz
IE5VTEwgYW5kIFBUUl9FUlIoTlVMTCkgaXMgemVyby9zdWNjZXNzLiAgUmV0dXJuCj4gPiA+ID4g
YSBuZWdhdGl2ZSBlcnJvciBjb2RlIGluc3RlYWQuCj4gPiA+ID4KPiA+ID4gPiBGaXhlczogZDJk
MTBlZGUwNGIxICgibXRkOiByYXduYW5kOiBBZGQgTG9vbmdzb24tMSBOQU5EIENvbnRyb2xsZXIg
RHJpdmVyIikKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQGxpbmFyby5vcmc+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gSXQncyBoYXJkIHRvIGtub3cgd2hh
dCB0aGUgcGF0Y2ggcHJlZml4IHNob3VsZCBiZSBoZXJlLiAgSWRlYWxseSB3aGVuIHdlCj4gPiA+
ID4gYWRkIGEgbmV3IGRyaXZlciB3ZSB3b3VsZCB1c2UgdGhlIHBhdGNoIHByZWZpeCBmb3IgdGhl
IGRyaXZlci4KPiA+ID4gPgo+ID4gPiA+IFRpcmVkOiBzdWJzeXN0ZW06IEFkZCBkcml2ZXIgWFhY
Cj4gPiA+ID4gV2lyZWQ6IHN1YnN5c3RlbTogWFhYOiBBZGQgZHJpdmVyIGZvciBYWFgKPiA+ID4g
Pgo+ID4gPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9sb29uZ3NvbjEtbmFuZC1jb250cm9sbGVy
LmMgfCAyICstCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2xvb25nc29uMS1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25n
c29uMS1uYW5kLWNvbnRyb2xsZXIuYwo+ID4gPiA+IGluZGV4IDZhMzY5YjFjN2Q4Ni4uODc1NGJi
NGY4YjU2IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29u
MS1uYW5kLWNvbnRyb2xsZXIuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xv
b25nc29uMS1uYW5kLWNvbnRyb2xsZXIuYwo+ID4gPiA+IEBAIC0zNzEsNyArMzcxLDcgQEAgc3Rh
dGljIGludCBsczF4X25hbmRfZG1hX3RyYW5zZmVyKHN0cnVjdCBsczF4X25hbmRfaG9zdCAqaG9z
dCwgc3RydWN0IGxzMXhfbmFuZF8KPiA+ID4gPiAgICAgICAgIGRlc2MgPSBkbWFlbmdpbmVfcHJl
cF9zbGF2ZV9zaW5nbGUoY2hhbiwgZG1hX2FkZHIsIG9wLT5sZW4sIHhmZXJfZGlyLCBETUFfUFJF
UF9JTlRFUlJVUFQpOwo+ID4gPiA+ICAgICAgICAgaWYgKCFkZXNjKSB7Cj4gPiA+ID4gICAgICAg
ICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHByZXBhcmUgRE1BIGRlc2NyaXB0b3Jc
biIpOwo+ID4gPiA+IC0gICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGRlc2MpOwo+ID4gPiA+
ICsgICAgICAgICAgICAgICByZXQgPSAtRU5PTUVNOwo+ID4gPgo+ID4gPiBUaGFuayB5b3UgZm9y
IGZpeGluZyB0aGlzIGlzc3VlLgo+ID4gPiBIb3dldmVyLCBJIGJlbGlldmUgLUVJTyBpcyBtb3Jl
IGFwcHJvcHJpYXRlIHRoYW4gLUVOT01FTSwgc2luY2UKPiA+ID4gZG1hZW5naW5lX3ByZXBfc2xh
dmVfc2luZ2xlKCkgY2FuIHJldHVybiBlcnJvcnMgb3RoZXIgdGhhbiAtRU5PTUVNLgo+ID4gPgo+
ID4KPiA+IEl0J3Mgbm90IGFuIEkvTyBlcnJvciBzbyAtRUlPIGlzbid0IGNvcnJlY3QuCj4gPgo+
ID4gVGhlcmUgYXJlIGEgYnVuY2ggb2YgcmVhc29ucyBpdCBjb3VsZCBmYWlsIGJ1dCBtb3N0IGxp
a2VseQo+ID4gZG1hX3Bvb2xfYWxsb2MoKSBmYWlsZWQuICBJIHRoaW5rIC1FTk9NRU0gaXMgY29y
cmVjdC4KPiA+Cj4gCj4gSGF2ZSB5b3UgcmV2aWV3ZWQgdGhlIGltcGxlbWVudGF0aW9uIG9mIGxz
MXhfZG1hX3ByZXBfc2xhdmVfc2coKT8KClRoZSBsczF4X2RtYV9wcmVwX3NsYXZlX3NnKCkgaGFz
IGJhc2ljYWxseSB0d28gZXJyb3IgY2FzZXMsIGJ1Z2d5IGRyaXZlcnMKYW5kIGFsbG9jYXRpb24g
ZXJyb3JzLiAgU29tZW9uZSBjb3VsZCBhcmd1ZSB0aGF0IGlmIHBlb3BsZSBwYXNzIGludmFsaWQK
ZGF0YSB0aGVuIHRoZSBjb3JyZWN0IHJldHVybiBpcyAtRUlOVkFMIGJ1dCBpbiB0aGVzZSBjYXNl
cyBpdCdzIGEgYnVnZ3kKZHJpdmVyIGFuZCB3ZSBmaXggYnVncywgd2UgZG9uJ3Qgd29yayBhcm91
bmQgdGhlbS4gIFNvIHRoZSBjb3JyZWN0CnJldHVybiBpcyAtRU5PTUVNLgoKPiBFcnJvcnMgaW4g
dGhpcyBmdW5jdGlvbiBjYW4gYmUgY2F1c2VkIG5vdCBvbmx5IGJ5IC1FTk9NRU0sIGJ1dCBhbHNv
IGJ5IC1FSU5WQUwuCj4gTW9yZW92ZXIsIGluIG1vc3QgY2FzZXMsIHRoZSBlcnJvciBoYW5kbGlu
ZyBsb2dpYyBmb3IKPiBkbWFlbmdpbmVfcHJlcF9zbGF2ZV9zaW5nbGUoKSByZXR1cm5zIC1FSU8g
d2hlbiB0aGUgZnVuY3Rpb24gcmV0dXJucwo+IE5VTEwuCgpUaGVyZSBhcmUgc29tZSB0aGF0IHJl
dHVybiAtRUlPIGJ1dCBoYXJkbHkgdGhlIG1ham9yaXR5LiAgT3RoZXIgcGxhY2VzCnJldHVybiAt
RU5PTUVNIG9yIC1FSU5WQUwuICBJdCdzIG5vdCB3b3J0aCBnb2luZyBiYWNrIGFuZCBmaXhpbmcg
YWxsIG9mCnRoZXNlIGJ1dCByZWFsbHkgLUVOT01FTSBpcyB0aGUgY29ycmVjdCByZXR1cm4uCgpy
ZWdhcmRzLApkYW4gY2FycGVudGVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
