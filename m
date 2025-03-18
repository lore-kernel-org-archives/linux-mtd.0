Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05638C28B28
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuH36l89hThcH/e7TJQTAJsDexgA+1ELH69IWFZktjo=; b=yEIXedNkXM15K0
	/wkR43B2d5+wcsAlsph0OtdraX05sbiiNLSvCD3ZrVWig0YeMYOhFSv/GN5tY8h9agcMsXIfbm3FJ
	pSJeErTOl63EsZOrbzwqa4p9KSiyKRV0lFl2NSTdk+NWcG+2ISvH5Uq3eysbu1O2aY+p9ACLw5Uww
	kWXuo9RZqXFeiGEpPPWDYR1LN257sb9jIHEhM8Yx87muHr5DrXEVn7G2bFkrVNOr8nMQ0xLjuqX0P
	lUSnhtWgCCOdhZyYH1pAM5waNBMhzVb+YBRf7aBTpo+W6e8eEFuy8W835n5uWQEr+aROYx6grigMx
	xHTyztEEvEErKxq+Ajyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUID-00000005WqC-2gYH;
	Tue, 18 Mar 2025 10:35:29 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUFQ-00000005WJ4-0SDt
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 10:32:37 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d450ac4910so138705ab.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 03:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742293954; x=1742898754; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/0XDSB1vld5cUtxsFXUAzOtrX9mHriAbs+ANUXBrrQ=;
        b=Z8D2+6rlBCQj1mPfhkl8kMZljxb9lZkipTNFUS3bkp4UODipBUDf2ph9KIyA/laZok
         TT/m7XJJSYeV0dJSRZIlUBVf+TTgUZiM6Ye8inUagWpw5BsY+AlD68o0MPjkYRH5StGU
         fz3c99VhSKxviFfRmHDilD8FxCmEq3JnvR018HPVnCpxyGrXL9R/uyqQPzW/p611oO8C
         cqPY7MxFxTTd1RCDKmx2KAJkgS3xD7h9gHFHssTslFJame1pXTCpyJ9cOGGft5z8vvNz
         w2QuZcBNYu/KUWjmprVe2jnEvWoxtVL1GuX++CNZtkun/zP1i2vtuToIXDUDAAoP8xec
         3C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293954; x=1742898754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/0XDSB1vld5cUtxsFXUAzOtrX9mHriAbs+ANUXBrrQ=;
        b=m2H7wBOKsdumMwMAJEJjaEJUyvXoQapBbF7aPk5sS450wT3/ln7/REv47Qkj743C17
         DvAvnOxCxd/jAbYmLiUalGmuVcT/lEnDpVGhs3xUciP+Okjm4BsPeTaDMLSNaR9qef2T
         Md9PykXRdwcNDvfxfxuBfBSjpLjaJvPsM8nRuWUoY23fmM7bg2PfpuOPfUWH0vjIXTdo
         MMPj3ER7ChNfforTQmwBtF5RIZwOLsuqzXdwIBS2MHtwlcVYFkp5xpHQlX2kAGe3JLwj
         AeO+RrCy+Dl2T4dMjbwNFvoDASZZ6mK/q3MpFeUPKsDccnuSN0yXare75MvupG1aa+Kc
         JB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHm+jajEOQAtlmPhXGy4msHeS98X8d286enlAHZEbKgw0ccTuc43TYXh0XKHWbhfJo13fJA8fh1Lc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Thkhfg3igap1HFcT3RFWTS6vFpzx41RudaBo9rCxbX2v3KVr
	mNexFDhAkuyZPowvIY5fBBbwvymm1iGqfioD7Buk9YQuowAHZAE/uwLT6GnJVcJEoCq8wtQ2khJ
	qUOAypG5klNLLgT1mvl5ako0adZSIq/KA9D2XRCZdsAalzGsuKu/eNWkW+w==
X-Gm-Gg: ASbGnct5jPka6GtOuzrALAXlstT/xnp7ZJpl8kKIYoc5lwLZQim9QxVT5tiPtxRsiYp
	19t85MUFK3Oe6hC9AH/QBPC9Qh7y5+IkEqdNNcopRPgluwqrI14efZTcv91ipOxHhyxSjLYhgM4
	EYEa7sGhXIb3L+xTxE1seDNavZOE4cwNU4vE4uXb3tB113ylLZ28+9zxc=
X-Google-Smtp-Source: AGHT+IHP+a2pA9w8C/gg7jD1p61petdMjrcurDDNP2YU9EJK/gdyOq8j+Pl9PL8xSCm2IXOP61bNRt55YIBl/tb8zQY=
X-Received: by 2002:a05:6e02:a:b0:3d2:afa0:9ee9 with SMTP id
 e9e14a558f8ab-3d57f0b7dd6mr2003895ab.7.1742293954173; Tue, 18 Mar 2025
 03:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250317182047.2060036-1-czapiga@google.com> <4be8afd5-65a9-4cfa-89b5-42caea3a9f93@linaro.org>
In-Reply-To: <4be8afd5-65a9-4cfa-89b5-42caea3a9f93@linaro.org>
From: "Jakub \"Kuba\" Czapiga" <czapiga@google.com>
Date: Tue, 18 Mar 2025 11:31:58 +0100
X-Gm-Features: AQ5f1JoRlAxWJkOjOQ9rqrZ1147ioWBczbnF4Th0_2s0QUnncrTMv7_k1ksyQ20
Message-ID: <CABkukdrc59rViGg9DmJU3AVZ537310xkNKhuTwjyRwpKAEuWbA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: add lock flags for GD25Q128/256
 and GD25LQ128D
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_033236_165471_3A01C4A4 
X-CRM114-Status: GOOD (  18.65  )
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

T24gVHVlLCBNYXIgMTgsIDIwMjUgYXQgODowOeKAr0FNIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFt
YmFydXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gMTcuMDMuMjAyNSAyMDoyMCwgSmFr
dWIgQ3phcGlnYSB3cm90ZToKPiA+IFNldCBhcHByb3ByaWF0ZSBGTEFTSCBsb2NrIGZlYXR1cmUg
ZmxhZ3MuCj4gPiBTZXQgdG9wLWJvdHRvbSBwcm90ZWN0aW9uIGNvbmZpZ3VyYXRpb24gYml0IGZs
YWdzLgo+ID4KPiA+IE1vZGlmaWVkIGNoaXBzOgo+ID4gLSBHRDI1UTEyOCAoK2xvY2ssICt0YikK
PiA+IC0gR0QyNVEyNTYgKCtsb2NrKQo+ID4gLSBHRDI1UTI1NkQsIEdEMjVRMjU2RSAoK3RiKQo+
ID4gLSBHRDI1TFExMjhEICgrbG9jaywgK3RiKQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpha3Vi
IEN6YXBpZ2EgPGN6YXBpZ2FAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL3Nw
aS1ub3IvZ2lnYWRldmljZS5jIHwgOSArKysrKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9zcGktbm9yL2dpZ2FkZXZpY2UuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmlj
ZS5jCj4gPiBpbmRleCBlZjFlZGQwYWRkNzAuLjhlZWM2NTU3YjAzNiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmljZS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2dpZ2FkZXZpY2UuYwo+ID4gQEAgLTE2LDYgKzE2LDcgQEAgZ2QyNXEyNTZfcG9zdF9i
ZnB0KHN0cnVjdCBzcGlfbm9yICpub3IsCj4gPiAgICAgICAvKgo+ID4gICAgICAgICogR0QyNVEy
NTZDIHN1cHBvcnRzIHRoZSBmaXJzdCB2ZXJzaW9uIG9mIEpFU0QyMTYgd2hpY2ggZG9lcyBub3Qg
ZGVmaW5lCj4gPiAgICAgICAgKiB0aGUgUXVhZCBFbmFibGUgbWV0aG9kcy4gT3ZlcndyaXRlIHRo
ZSBkZWZhdWx0IFF1YWQgRW5hYmxlIG1ldGhvZC4KPiA+ICsgICAgICAqIE90aGVyd2lzZSBzZXQg
VEIgdG8gU1IoNikuCj4gPiAgICAgICAgKgo+ID4gICAgICAgICogR0QyNVEyNTYgR0VORVJBVElP
TiB8IFNGRFAgTUFKT1IgVkVSU0lPTiB8IFNGRFAgTUlOT1IgVkVSU0lPTgo+ID4gICAgICAgICog
ICAgICBHRDI1UTI1NkMgICAgICB8IFNGRFBfSkVTRDIxNl9NQUpPUiB8IFNGRFBfSkVTRDIxNl9N
SU5PUgo+ID4gQEAgLTI1LDYgKzI2LDggQEAgZ2QyNXEyNTZfcG9zdF9iZnB0KHN0cnVjdCBzcGlf
bm9yICpub3IsCj4gPiAgICAgICBpZiAoYmZwdF9oZWFkZXItPm1ham9yID09IFNGRFBfSkVTRDIx
Nl9NQUpPUiAmJgo+ID4gICAgICAgICAgIGJmcHRfaGVhZGVyLT5taW5vciA9PSBTRkRQX0pFU0Qy
MTZfTUlOT1IpCj4gPiAgICAgICAgICAgICAgIG5vci0+cGFyYW1zLT5xdWFkX2VuYWJsZSA9IHNw
aV9ub3Jfc3IxX2JpdDZfcXVhZF9lbmFibGU7Cj4gPiArICAgICBlbHNlCj4gPiArICAgICAgICAg
ICAgIG5vci0+ZmxhZ3MgfD0gU05PUl9GX0hBU19TUl9UQiB8IFNOT1JfRl9IQVNfU1JfVEJfQklU
NjsKPgo+IHdoeSBkbyB5b3UgdGllIGxvY2tpbmcgYnkgU0ZEUCBhYnNlbmNlPwoKR0QyNVEyNTZD
IGhhcyBhIGRpZmZlcmVudCBTdGF0dXMgUmVnaXN0ZXJzIGxheW91dCBjb21wYXJlZCB0byBHRDI1
UTI1NkQvRToKR0QyNVEyNTZDIGhhcyBRRSAoUXVhZCBFbmFibGUpIGJpdCBvbiBTUjEoNikvUzYu
IEdEMjVRMjU2RC9FIGhhcyBpdCBvbgpTUjIoMSkvUzkuCkdEMjVRMjU2QyBoYXMgVEIgKFRvcC1C
b3R0b20pIG9uIFNSMigzKS9TMTEuIEdEMjVRMjU2RC9FIGhhcyBpdCBvbiBTUjEoNikvUzYuClRo
ZSBkZWZhdWx0IFRCIHZhbHVlIGlzIHplcm8sIHNvICJ0b3AiLCB3aGljaCBpcyBhbHNvIHRoZSBk
ZWZhdWx0CnJvdXRlIGluIHRoZSBzd3AuYyBpZiBUQiBpcyBub3QgcHJlc2VudC4gTW9yZW92ZXIg
Y3VycmVudCBBUEkgYW5kCmltcGxlbWVudGF0aW9uIGRvIG5vdCBhbGxvdyB0byBjb25maWd1cmUg
VEIgaW4gcGxhY2Ugb3RoZXIgdGhhbgpTUjEoNSkvUzUgb3IgU1IxKDYpL1M2LiBJIGZpZ3VyZWQg
dGhhdCBpdCdzIGJldHRlciB0byBsZWF2ZSBUQiB1bnNldApmb3IgdGhlIG9sZGVyIGNoaXAgdmFy
aWFudCBhbmQgYWxsb3cgdGhlIGRyaXZlciB0byBvbmx5IGFjY2VzcyBCUC9Mb2NrCmJpdHMgaW4g
dGhpcyBjYXNlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
