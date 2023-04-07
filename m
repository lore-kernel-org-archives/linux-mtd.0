Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A42FC6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 07:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1hgFt5IoDRozKR+YkXVPL9KdcoY5TV1/z4biSvXnrc=; b=E7HJDgh6ZL+mxP
	UsR25j7MKQsYGgvGtgxMD9XtVv2Wh5sx9Cd99MfbmumFGdbe0lE6IG0wcblu6Cj5p/y/snMn94rtL
	VjeBgV4EDMgMgzFCLqrqrhBHjfQ3VvOU1GK9OWdP9D2uEXt2k59XaQyQdnyfVsHQXeJHHjwycMc5k
	MLnlXFU33C3TE21zQ9GCxk2NxZXjThUj/8fjc3OWXCQafBLMoagkwzm6EB2J8r9SezG2eSODzDkCi
	NB88X87CGLZ3dyIVCf5xrYtxegDs336BgVk6gSEXGJuVbZ9o1wasAeqU3TTuTigc4Ccmnsoa9DA/k
	FoDBq1Z9o1FuXk+iusJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkgL4-009Mvk-2A;
	Fri, 07 Apr 2023 07:16:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkgL1-009Mv2-1K
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 07:16:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so6836841wmb.3
        for <linux-mtd@lists.infradead.org>; Fri, 07 Apr 2023 00:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680851806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJPzTdNzFdaPr6BlrQB+3yd4U8wxB5qohEgaOPDsDoM=;
        b=pF89GaUgpAfQvquLWFkl08TMWh5OhL0h/Im9u0LHtCnFQidElktNTPWSZf153AS2P1
         CAJENYc5AWvIJ9ifl6bCKkrmdr3oSPyuwp/HUwSVf9yfgiy7i9RaHCY+Wq8ETP46ypo+
         xywKhPyKgxTP/0s5fecLUYgExhj3FEmOwOOqIgTwIi6e91PTVK/RBg8BiCMNO7UgayC5
         dZUlE3QWOIytlRT62qi+LhkPBS4gSgFoqpqylUMQun9IsL5fiVCy4UqpGvh7hObxo7iJ
         2rR1nM6y0wg/r+pDmeuyoqUq9Tt30vlEg579DLGdLuWxHQ7YU3/PX9hH0YVUlR6JAZfo
         GaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680851806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJPzTdNzFdaPr6BlrQB+3yd4U8wxB5qohEgaOPDsDoM=;
        b=h8RMyorNz8DbqioeD+AN4SkXhsasD30MBjnd1+Zth5hypeU6/XOV8Ti/EDWmDMo6jo
         WZIS0l6KtOfNs8fjO15eum5UpWI3cc/pViaxCSNEZj97vMMYTcPq+kKAuOgjDGP0yt9W
         iCmX0KR7WHJ/FNASvyzBV8rDwof6YEqKAAE1AaB9SGKg4Hu8JS+Iv1ha+diwQUqnonO5
         DA0+cnwQapfki13JxeUZlerQT2x7XUbttTrqhtiAo3X77oVHYMm3oxuZFeml2a5k1z90
         F5XMTbzid4IySW3FD/xURyCIv8wWvRvNrhpRZMOp/vxiMt4avnN0jOib5Z3ZwK4OXdcM
         e2VQ==
X-Gm-Message-State: AAQBX9chWGAfVu3VpasTsCSOdYL7mwbDBC1uUbfS9yRI5OYrlHQd6cmm
	DQ0pOAM0pTTYiyycbHUmzUf7Xw==
X-Google-Smtp-Source: AKy350axyNtSE7VTvG3Mh8xX4YgCQFQOOZbw/S6z81U89krvupdHrxWG7EFhYaXHuxfS03Ah0K1rIA==
X-Received: by 2002:a05:600c:21d7:b0:3ef:561d:255d with SMTP id x23-20020a05600c21d700b003ef561d255dmr473386wmj.41.1680851805765;
        Fri, 07 Apr 2023 00:16:45 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003ede04deb14sm7550447wmq.48.2023.04.07.00.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 00:16:44 -0700 (PDT)
Message-ID: <8dc85429-5e04-96b6-4e54-85cc823cbe5a@linaro.org>
Date: Fri, 7 Apr 2023 08:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org>
 <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
 <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
 <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_001647_492079_82173C9A 
X-CRM114-Status: GOOD (  19.36  )
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

SGksIEdlZXJ0LAoKT24gNC8zLzIzIDE3OjI5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4g
T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgNDowMeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+PiBPbiBNb24sIE1hciAyMCwgMjAyMyBhdCA3OjU3
4oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4+
PiBPbiBNb24sIE1hciAyMCwgMjAyMyBhdCA2OjA04oCvUE0gVHVkb3IgQW1iYXJ1cyA8dHVkb3Iu
YW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKPj4+PiBWaWduZXNoIHVzZWQgdG8gcmV2aWV3IENG
SSBjb2RlLCBtYXliZSBoZSBjYW4gaW50ZXJ2ZW5lLiBJJ3ZlIG5ldmVyCj4+Pj4gd29ya2VkIHdp
dGggQ0ZJLCBidXQgSSBjYW4gdHJ5IHRvIGhlbHAuIEknbGwgbmVlZCBtb3JlIGRlYnVnIGRhdGEg
dGhvdWdoLgo+Pj4+Cj4+Pj4gT24gMy8yMC8yMyAxNjo0MywgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOgo+Pj4+PiBBZGQgYSBkZXZpY2Ugbm9kZSBmb3IgdGhlIFNwYW5zaW9uIFMyOUdMNTEyTiBO
T1IgRkxBU0ggb24gdGhlIE1hcnplbgo+Pj4+PiBkZXZlbG9wbWVudCBib2FyZC4KPj4+Pj4KPj4+
Pj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4KPj4+Pj4gLS0tCj4+Pj4+IEFsdGhvdWdoIHRoZSBTMjlHTDUxMk4gaXMgYSBDRkkgRkxB
U0gsIHVzaW5nICJjZmktZmxhc2giIGluc3RlYWQgb2YKPj4+Pj4gIm10ZC1yb20iIGRvZXMgbm90
IHdvcms6Cj4+Pj4+ICAgMS4gUHJvYmluZyBmYWlscyB3aXRoICJwaHlzbWFwLWZsYXNoIDAuZmxh
c2g6IG1hcF9wcm9iZSBmYWlsZWQiLAo+Pj4+Cj4+Pj4gSSB3b3VsZCBmaXJzdCB0cnkgdG8gdW5k
ZXJzdGFuZCB3aHkgdGhlIHByb2JlIGZhaWxzLgo+IAo+PiBJIHN1ZGRlbmx5IHJlbWVtYmVyZWQg
SSBoYXZlIGEgZGlmZmVyZW50IGJvYXJkIChBUEU2LUVWTSksIHdoZXJlCj4+IHRoZSBDRkktRkxB
U0ggc3RvcHBlZCB3b3JraW5nIGFmdGVyIGFkZGluZyBzdXBwb3J0IGZvciBzZWNvbmRhcnkKPj4g
Q1BVcy4gSSBhbHdheXMgdGhvdWdodCB0aGF0IHdhcyBhIGhhcmR3YXJlIHF1aXJrLi4uCj4+Cj4+
IFR1cm5zIG91dCB0aGUgQ0ZJLUZMQVNIIG9uIE1hcnplbiAocXVhZCBDb3J0ZXgtQTkpIGlzIGRl
dGVjdGVkIHdoZW4KPj4gYm9vdGluZyB3aXRoICJub3NtcCI6Cj4gCj4+IE15IGZpcnN0IGd1ZXNz
IHdhcyB0aGF0IHRoZSBwcm9iaW5nIHByb2Nlc3MgaXMgbWlncmF0ZWQgdG8gYSBkaWZmZXJlbnQK
Pj4gQ1BVIGNvcmUgZHVyaW5nIHByb2JpbmcsIGJ1dCBwcmludGluZyBzbXBfcHJvY2Vzc29yX2lk
KCkgZGlkbid0Cj4+IGNvbmZpcm0gdGhhdDsgaXQncyBqdXN0IHJ1bm5pbmcgb24gYSBkaWZmZXJl
bnQgQ1BVIGNvcmUgdGhhbiBDUFUwLgo+PiBXcmFwcGluZyB0aGUgYm9keSBvZiBjZmlfcXJ5X21v
ZGVfb24oKSBpbnNpZGUgYSBnZXRfY3B1KCkvcHV0X2NwdSgpCj4+IHBhaXIgdG8gcHJldmVudCBt
aWdyYXRpb24gYWxzbyBkaWRuJ3QgZml4IGl0Lgo+Pgo+PiBJcyBDRkktRkxBU0gga25vd24tYnJv
a2VuIG9uIFNNUD8KPiAKPiBBZnRlciBhY3RpdmVseSBsb29raW5nIGZvciBtb3JlIGJvYXJkcyB3
aXRoIENGSSBGTEFTSGVzLCBhbmQgZmluZGluZyBvbmUKPiBtb3JlIGJvYXJkIHdoZXJlIEZMQVNI
IHByb2JpbmcgZmFpbHMgb24gU01QLCBJIGR1ZyBkZWVwZXIuCj4gVHVybnMgb3V0IHRoZXkgYWxs
IGhhdmUgaW4gY29tbW9uIHRoYXQgKGEpIHRoZSBDRkkgRkxBU0ggaXMgbG9jYXRlZCBhdAo+IHBo
eXNpY2FsIGFkZHJlc3MgemVybywgYW5kIChiKSB0aGUgc2Vjb25kYXJ5IENQVSBicmluZ3VwIGNv
ZGUgcmVsaWVzCj4gb24gbWFwcGluZyAoYnkgc3BlY2lhbCBoYXJkd2FyZSkgdGhlIHJlZ2lvbiBh
dCBhZGRyZXNzIHplcm8gdG8gdGhlCj4gQ1BVIGJvb3QgY29kZS4uLgo+IAo+IEhlbmNlIGZpeGlu
ZyB0aGlzIGludm9sdmVzIG1ha2luZyBzdXJlIHRoYXQgYWNjZXNzaW5nIEZMQVNIIGFuZCBicmlu
Z2luZwo+IENQVSBjb3JlcyBvbmxpbmUgZG8gbm90IGhhcHBlbiBjb25jdXJyZW50bHkuLi4KPiAK
CldvdWxkIGRlZmVycmluZyBwcm9iZSBmb3IgQ0ZJIHdvcms/Cgp0YQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
