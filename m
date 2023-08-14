Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBABC04FE0
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Aug 2023 19:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RELtoHph7A5LdXXk7A/mAFxxC4fLg8kMfqUKGqTqGZs=; b=h+ccgmNWPAn90O
	FGduj1ZldpxNnY1pYbaxbOiDXLBck+HckDnG8npgVlAp6/6O+51xdcEZB2faVyBH/6jKBu5MEdldj
	n1I+qdMKaefeeAtbexbTYMjIuymb2D1pKMgX4uopsTG/08d5jiIeMh2dKzML8Lf+d5kOR8406lwyp
	cU65Yjw7tXrbhPSdyJ2FgbjAr7+gqljuZwaYBDB1C8scDWKseFDaZl24X1+UFTwVRnTLuDo8/VRis
	nlr3OTG6u6mV1kbESyUBmgbiqVFMx0gsOnXQRdkPhMIvYfNXXgGr8iwU/AIRMYO3CPllNhY6l6Y4G
	3z4/JdTSWfrigsJjCzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVcoD-000AM7-2x;
	Mon, 14 Aug 2023 19:00:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVcoB-000AKs-0M
	for linux-mtd@lists.infradead.org;
	Mon, 14 Aug 2023 19:00:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bb7b8390e8so29627405ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 14 Aug 2023 12:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692039654; x=1692644454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gKTJbYyHwGU/Pavfa3Pni61Jgqd+CWSu3/z3hiS2FZk=;
        b=HLQl75aDvj2mEnVYovaIHU/OOGwgRtjHAT3BetsxMzFRe6RXIWRmCMYKUVj2Mu9Mdl
         d2IbKwWkNjw3pocpmU1XmO6+RmPLRa68vlKwfk2y/ciQk/k7dfiSIL9qbC/wkf2pj4+W
         d/ah7C/qdg5kc7tdACd3HKs8HaDGCfk13BTHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692039654; x=1692644454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKTJbYyHwGU/Pavfa3Pni61Jgqd+CWSu3/z3hiS2FZk=;
        b=MRRVM37v84pfkxwXOxv2xdyJvtLUNRHjsf/phGUR3yoXMO67Zkh2TlSPfvzM31ffo+
         0rL8g6TZygrmsuX66expFajbUdQrdFjeeoViWAVRzeju8NrhKPoF2I+w37NTulVdvhEU
         Jkt5EemFmXIw7iNpqdYsBc4/NiCSCjCY7KGfpr/6ofkoXXACv2vEKidOkLd/WX1kmCZe
         r+eycteADsbQ2Br6c0xyHDA8trae6DXB45qBrjc1IR8Oc3WLhOR4IceFKf7kga4sG7ov
         z07ED8mk06ELRGHyM0YIBIimrraF/4AYuChKrKiHDv92EZr9CXJGdW7clQoJgHNWs2FI
         s+7w==
X-Gm-Message-State: AOJu0YwSONQgdsrvl0bV7zExDI8bcoW/fpqYsekpd5moWmVV9VMKUDLd
	TPrr0N5KmftBZZ9IT+EJw1EFOA==
X-Google-Smtp-Source: AGHT+IFdxlyUb3opfqP0LZm8yaMzbRYT5aUM9s1n5GnCFd9QkjKQiIIeuTRrDisx8zwdDnVwz0WSPw==
X-Received: by 2002:a17:902:968f:b0:1bc:4f64:e2fc with SMTP id n15-20020a170902968f00b001bc4f64e2fcmr8552937plp.27.1692039654159;
        Mon, 14 Aug 2023 12:00:54 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u18-20020a170903125200b001b53953f306sm9813816plh.178.2023.08.14.12.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 12:00:52 -0700 (PDT)
Date: Mon, 14 Aug 2023 12:00:51 -0700
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.5-rc3
Message-ID: <202308141159.9E4C2332@keescook>
References: <CAHk-=wi4Yau-3Bsv2rXYmtXMTLaj3=Wyf4cdM6d89czFvkVsRQ@mail.gmail.com>
 <20230724122626.1701631-1-geert@linux-m68k.org>
 <88f83d73-781d-bdc-126-aa629cb368c@linux-m68k.org>
 <202307281551.D894AA39@keescook>
 <CAMuHMdXRiacSxqDzYmakWAQB99kYvY0Bi9zALP9ZnC9Xs_xO5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXRiacSxqDzYmakWAQB99kYvY0Bi9zALP9ZnC9Xs_xO5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_120055_171248_4FFAB446 
X-CRM114-Status: GOOD (  19.57  )
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

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMDY6MjA6NTlQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIEtlZXMsCj4gCj4gT24gU2F0LCBKdWwgMjksIDIwMjMgYXQgMTI6NTfi
gK9BTSBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPiBPbiBNb24s
IEp1bCAyNCwgMjAyMyBhdCAwMjo0MzowMlBNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6Cj4gPiA+IE9uIE1vbiwgMjQgSnVsIDIwMjMsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToK
PiA+ID4gPiBKRllJLCB3aGVuIGNvbXBhcmluZyB2Ni41LXJjM1sxXSB0byB2Ni41LXJjMlszXSwg
dGhlIHN1bW1hcmllcyBhcmU6Cj4gPiA+ID4gIC0gYnVpbGQgZXJyb3JzOiArNS8tMAo+ID4gPgo+
ID4gPiAgICsgL2tpc3NrYi9zcmMvaW5jbHVkZS9saW51eC9mb3J0aWZ5LXN0cmluZy5oOiBlcnJv
cjogY2FsbCB0byAnX193cml0ZV9vdmVyZmxvd19maWVsZCcgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1
dGUgd2FybmluZzogZGV0ZWN0ZWQgd3JpdGUgYmV5b25kIHNpemUgb2YgZmllbGQgKDFzdCBwYXJh
bWV0ZXIpOyBtYXliZSB1c2Ugc3RydWN0X2dyb3VwKCk/IFstV2Vycm9yPWF0dHJpYnV0ZS13YXJu
aW5nXTogID0+IDU4MzoyNSwgNDkzOjI1Cj4gPiA+Cj4gPiA+IG1pcHMtZ2NjMTMvbWlwcy1hbGxt
b2Rjb25maWcKPiA+ID4KPiA+ID4gRnVsbCBjb250ZXh0Ogo+ID4gPgo+ID4gPiAgICAgSW4gZnVu
Y3Rpb24gJ2ZvcnRpZnlfbWVtc2V0X2NoaycsCj4gPiA+ICAgICAgIGlubGluZWQgZnJvbSAnbWVt
c2V0X2lvJyBhdCAva2lzc2tiL3NyYy9hcmNoL21pcHMvaW5jbHVkZS9hc20vaW8uaDo0ODY6MiwK
PiA+ID4gICAgICAgaW5saW5lZCBmcm9tICdidWlsZF9hdXRoX2ZyYW1lJyBhdCAva2lzc2tiL3Ny
Yy9kcml2ZXJzL25ldC93aXJlbGVzcy9sZWdhY3kvcmF5X2NzLmM6MjY5NzoyOgo+ID4gPiAgICAg
L2tpc3NrYi9zcmMvaW5jbHVkZS9saW51eC9mb3J0aWZ5LXN0cmluZy5oOjQ5MzoyNTogZXJyb3I6
IGNhbGwgdG8gJ19fd3JpdGVfb3ZlcmZsb3dfZmllbGQnIGRlY2xhcmVkIHdpdGggYXR0cmlidXRl
IHdhcm5pbmc6IGRldGVjdGVkIHdyaXRlIGJleW9uZCBzaXplIG9mIGZpZWxkICgxc3QgcGFyYW1l
dGVyKTsgbWF5YmUgdXNlIHN0cnVjdF9ncm91cCgpPyBbLVdlcnJvcj1hdHRyaWJ1dGUtd2Fybmlu
Z10KPiA+ID4gICAgICAgNDkzIHwgICAgICAgICAgICAgICAgICAgICAgICAgX193cml0ZV9vdmVy
Zmxvd19maWVsZChwX3NpemVfZmllbGQsIHNpemUpOwo+ID4gPiAgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4gPiA+ICAgICBJbiBmdW5jdGlvbiAnZm9ydGlmeV9tZW1jcHlfY2hrJywKPiA+ID4gICAgICAg
aW5saW5lZCBmcm9tICdtZW1jcHlfdG9pbycgYXQgL2tpc3NrYi9zcmMvYXJjaC9taXBzL2luY2x1
ZGUvYXNtL2lvLmg6NDk0OjIsCj4gPiA+ICAgICAgIGlubGluZWQgZnJvbSAndHJhbnNsYXRlX2Zy
YW1lJyBhdCAva2lzc2tiL3NyYy9kcml2ZXJzL25ldC93aXJlbGVzcy9sZWdhY3kvcmF5X2NzLmM6
OTU1OjMsCj4gPiA+ICAgICAgIGlubGluZWQgZnJvbSAncmF5X2h3X3htaXQuY29uc3Rwcm9wJyBh
dCAva2lzc2tiL3NyYy9kcml2ZXJzL25ldC93aXJlbGVzcy9sZWdhY3kvcmF5X2NzLmM6OTEyOjEy
Ogo+ID4gPiAgICAgL2tpc3NrYi9zcmMvaW5jbHVkZS9saW51eC9mb3J0aWZ5LXN0cmluZy5oOjU4
MzoyNTogZXJyb3I6IGNhbGwgdG8gJ19fd3JpdGVfb3ZlcmZsb3dfZmllbGQnIGRlY2xhcmVkIHdp
dGggYXR0cmlidXRlIHdhcm5pbmc6IGRldGVjdGVkIHdyaXRlIGJleW9uZCBzaXplIG9mIGZpZWxk
ICgxc3QgcGFyYW1ldGVyKTsgbWF5YmUgdXNlIHN0cnVjdF9ncm91cCgpPyBbLVdlcnJvcj1hdHRy
aWJ1dGUtd2FybmluZ10KPiA+ID4gICAgICAgNTgzIHwgICAgICAgICAgICAgICAgICAgICAgICAg
X193cml0ZV9vdmVyZmxvd19maWVsZChwX3NpemVfZmllbGQsIHNpemUpOwo+ID4gPiAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+Cj4gPiA+Cj4gPiA+IFNpbmdsZS1lbGVtZW50IGZsZXhpYmxlIGFycmF5IGFi
dXNlIGluIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2xlZ2FjeS9yYXljdGwuaDp0eF9tc2cudmFyCj4g
Pgo+ID4gXl5eXgo+ID4gaXMgdGhpcyBsaW5lIGZyb20geW91IG9yIGlzIHRoZXJlIGEgdG9vbCBv
dXRwdXR0aW5nIHRoaXM/IEJlY2F1c2UsIHllcywKPiAKPiBJdCBpcyBhIGxpbmUgZnJvbSBtZS4K
PiAKPiAoc2hvdWxkIEkgdGFrZSBpdCBhcyBhIGNvbXBsaW1lbnQgdGhhdCBJIHN0YXJ0IHNvdW5k
aW5nIGxpa2UgYSB0b29sPyA7LSkKCkhlaC4gSXQgd2FzIHNvIGRlY2xhcmF0b3J5LiA6KSBJIHRo
aW5rIEkgd2FzIGhvcGluZyB0aGVyZSB3YXMgc29tZQphbmFseXplciB0aGF0IGNvdWxkIHNhdmUg
dXMgdGhlIHBhaW4gb2YgbWFudWFsbHkgZXhhbWluaW5nIHRoZXNlCndhcm5pbmdzLgoKPiAKPiA+
IHZlcnkgdHJ1ZToKPiA+Cj4gPiBzdHJ1Y3QgdHhfbXNnIHsKPiA+ICAgICBzdHJ1Y3QgdGliX3N0
cnVjdHVyZSB0aWI7Cj4gPiAgICAgc3RydWN0IHBoeV9oZWFkZXIgcGh5Owo+ID4gICAgIHN0cnVj
dCBtYWNfaGVhZGVyIG1hYzsKPiA+ICAgICBVQ0hBUiAgdmFyWzFdOwo+ID4gfTsKPiA+Cj4gPiBJ
J2xsIHNlbmQgYSBwYXRjaC4KPiAKPiBUaGFua3MsIEkgbm90aWNlZCB5b3UgdG9vayBjYXJlIHdo
aWxlIEkgd2FzIGVuam95aW5nIHN1bW1lciBob2xpZGF5cyA7LSkKCkF3ZXNvbWUhIFRoYW5rcyBm
b3IgdGhlIHJlcG9ydC4gOikKCi0tIApLZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
