Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FB7EDE990
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+B8SO5lfGqwlfVPScQl0tgaoLvx/DojaFiUtj6qJc2g=; b=swUgABhSwRnKE1
	noNJahPBYAK9SBir6tDcX21Zw8UJyBRq5GxR5Swlbk85VWalppht8qqcgAYz/MgZw5IVsdTF0cohU
	9F/yUN4LwQXCZOR6RaCz95YjVmQW3KD/mMlJ7luJ8HPj9ECsgEe9m82aw3153QhPBxVvTx3Vrk+Dc
	oF7te/MHKT0xQW++70hsNg6ms2E1f7JSi7ra5nBv2PX99IKkbHiJZLqB/YFvMXbLUiKP5HNxMBCGu
	8x18DMpurex6yh6LYSmYXAVMKin6MZJZoHVWfGiIW8GBIsO4tfHc+CV2JIUPyW4vwrM5DBPNpE+8s
	YfYkYCu2Ha62+NbdyTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghob-007ilP-2C;
	Thu, 14 Sep 2023 08:35:09 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghoZ-007ikv-00
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 08:35:08 +0000
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d7e9d849bdfso701206276.3
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 01:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680504; x=1695285304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sl16OfOFb3HtkUKJC91et4gKnDzDImEPUR7e/fEk9N0=;
        b=WYPfFAZxvDSYsnbTIXd/ifxyhDC1TXpT4Ah5aAdmCEPjy/oFTzGXkxi9v/3bQUkFxv
         FeynfWo9HBa78/eH9d75XmvJK0TdVXNj/AbN9+YSxTh7VS+iSYCMyzQ0jfPkj0Ps3Iaz
         oK2YkUPP7QUP1W43r3C/RgPcjWENurLPmeTtP6Ap6WmgjctMFbisD6pNP2YRJcvThPmT
         FDCYnvHiZwEr6KeKbwjrXC6hbcEKfEJDncRD/G+EFteilhT2sWk41NYfrH5Ayykn6x2Z
         JNiW257/9S8VjSF9aj/dTbvnC6Xzk3e7wvT3N0CYM4JDyjiOnEwS+J1KFvyQ9lAj3xi2
         rIsA==
X-Gm-Message-State: AOJu0Ywaf7woPOk0zl30ie2zN2pke2KrHXxVNoCzWk/5NXw/kGIZLlcC
	Nj7UUo1CKT4mnlwhw52VfGcJ2B86pySz/w==
X-Google-Smtp-Source: AGHT+IHN6p8MOYM7ENEkhL/WTZ+s3TjVQNCZkOO9mWVdNeqBlx5s9t+BMS+ZSZdg+WoyStyir5c6jg==
X-Received: by 2002:a25:9c09:0:b0:d74:3b38:ff4f with SMTP id c9-20020a259c09000000b00d743b38ff4fmr4335191ybo.46.1694680504245;
        Thu, 14 Sep 2023 01:35:04 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id r7-20020a25ac47000000b00d217e46d25csm243192ybd.4.2023.09.14.01.35.03
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 01:35:03 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d7e9d849bdfso701192276.3
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 01:35:03 -0700 (PDT)
X-Received: by 2002:a25:810c:0:b0:d7b:9a33:4c69 with SMTP id
 o12-20020a25810c000000b00d7b9a334c69mr4086889ybk.58.1694680503603; Thu, 14
 Sep 2023 01:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
 <TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org>
In-Reply-To: <502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Sep 2023 10:34:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
Message-ID: <CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash type
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, 
	MTD Maling List <linux-mtd@lists.infradead.org>, linux-spi <linux-spi@vger.kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_013507_042704_664006CA 
X-CRM114-Status: GOOD (  24.83  )
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

SGkgS3J6eXN6dG9mLAoKQ0MgUm9iLCBNaXF1ZWwKCk9uIFRodSwgU2VwIDE0LCAyMDIzIGF0IDEw
OjA44oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPiB3cm90ZToKPiBPbiAzMC8wOC8yMDIzIDE3OjE4LCBCaWp1IERhcyB3cm90ZToKPiA+Pj4g
ICAgICAgICAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhycGMtPnJlZ21hcCwgUlBDSUZfQ01O
Q1IsIEBAIC03NzQsNgo+ID4+PiArNzc2LDEyIEBAIHN0YXRpYyBpbnQgcnBjaWZfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+Pj4gICAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gPj4+ICAgICAgICAgfQo+ID4+Pgo+ID4+PiArICAgICAgIGlmIChycGMtPmluZm8tPnR5
cGUgPT0gUlBDSUZfUlpfRzJMICYmCj4gPj4KPiA+PiBXb3VsZG4ndCB0aGlzIGFwcGx5IHRvIG5v
bi1SWi9HMkwgc3lzdGVtcywgdG9vPwo+ID4KPiA+IEl0IGFwcGxpZXMsIGlmIHRoZSBkZXZpY2Ug
dXNlcyB0aGUgZmxhc2hbMV0gb3IgWzJdIGFuZCBpdCBuZWVkcwo+ID4gNC1iaXQgdHggc3VwcG9y
dC4KPiA+Cj4gPiBbMV0gRmlndXJlIDIwOiBRVUFEIElOUFVUL09VVFBVVCBGQVNUIFJFQUQg4oCT
IEVCaC9FQ2gKPiA+IGh0dHBzOi8vbWVkaWEtd3d3Lm1pY3Jvbi5jb20vLS9tZWRpYS9jbGllbnQv
Z2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9kYXRhLXNoZWV0L25vci1mbGFzaC9zZXJpYWwtbm9y
L210MjVxL2RpZS1yZXYtYS9tdDI1cV9xbGtzX3VfNTEyX2FiYV8wLnBkZj9yZXY9M2U1YjJhNTc0
ZjdiNDc5MGI2ZTU4ZGFjZjRjODg5YjIKPiA+Cj4gPiBbMl0gc2VjdGlvbiA4LjE0Cj4gPgo+ID4g
aHR0cHM6Ly93d3cucmVuZXNhcy5jb20vZXUvZW4vZG9jdW1lbnQvZHN0L2F0MjVxbDEyOGEtZGF0
YXNoZWV0P3I9MTYwODU4Ngo+Cj4gR2VlcnQsCj4KPiBEb2VzIGl0IGFuc3dlciB5b3VyIGNvbW1l
bnQgb3IgZG8geW91IGV4cGVjdCBoZXJlIHNvbWUgY2hhbmdlcz8KCldlbGwsIG5vdyBpdCBoYXMg
YmVlbiBjb25maXJtZWQgdGhpcyBhcHBsaWVzIHRvIG5vbi1SWi9HMkwgc3lzdGVtcywgdG9vLAp0
aGUgY2hlY2sgZm9yIFJQQ0lGX1JaX0cyTCBzaG91bGQgcHJvYmFibHkgYmUgcmVtb3ZlZC4gIElu
IHVwc3RyZWFtLApvbmx5IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybHssY30tc21h
cmMtc29tLmR0c2kgaGF2ZSBkZXZpY2VzCnRoYXQgYXJlIGNvbXBhdGlibGUgd2l0aCAibWljcm9u
LG10MjVxdTUxMmEiLCBidXQgb2J2aW91c2x5IHRoZXkgY2FuCmFwcGVhciBlbHNld2hlcmUsIHRv
by4KCk5vdywgdGhlIHByZXNlbmNlIG9mIHRoYXQgY29tcGF0aWJsZSB2YWx1ZSBpbiByemcybHss
Y30tc21hcmMtc29tLmR0c2kKY3VycmVudGx5IGNhdXNlcyBhIGR0YnNfY2hlY2sgd2FybmluZywg
YXMgaXQgaXMgbm90IGRvY3VtZW50ZWQuCkhvd2V2ZXIsIHRoZXJlIGhhcyBiZWVuIHNvbWUgcHVz
aGJhY2sgYWdhaW5zdCBhZGRpbmcgbW9yZSBjb21wYXRpYmxlCnZhbHVlcywgY2ZyLiBteSBwYXRj
aCB0byBhZGQgbXQyNXF1NTEyYVsxXSwgYW5kIE1pcXVlbCdzIGNvbW1pdCBbMl0uCkJ1dCB0aGUg
aXNzdWUgQmlqdSBpcyBzZWVpbmcgcHJvdmVzIHRoZXJlIGlzIGEgbmVlZCB0byBhZGQgdGhlc2Uu
CgpJbiBhZGRpdGlvbiwgSSBoYWQgaG9wZWQgdG8gZ2F0aGVyIHNvbWUgZmVlZGJhY2sgb3IgZ3Vp
ZGFuY2UgZnJvbSB0aGUKaHlwZXJidXMgYW5kL29yIHNwaSBwZW9wbGUsIGFzIGlzc3VlcyB3LnIu
dC4gcGluIHN0YXRlcyB3aWxsIGV2ZW50dWFsbHkKcG9wIHVwIG9uIG90aGVyIHN5c3RlbXMsIHRv
bywgYW5kIHRodXMgbWF5IG5lZWQgaGFuZGxpbmcgaW4gdGhlIGNvcmUsCmluc3RlYWQgb2YgaW4g
ZWFjaCBpbmRpdmlkdWFsIGRldmljZSBkcml2ZXIuICBCdXQgb2YgY291cnNlIHRoYXQgY2FuCmJl
IGRvbmUgbGF0ZXIsIHdoZW4gdGhlIG5lZWQgYXJpc2VzLgoKVGhhbmtzIQoKWzFdICJbUEFUQ0hd
IGR0LWJpbmRpbmdzOiBtdGQ6IGplZGVjLHNwaS1ub3I6IERvY3VtZW50IHN1cHBvcnQgZm9yCm1v
cmUgTVQyNVFVIHBhcnRzIgogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzM2MzE4NjA3
OWI0MjY5ODkxMDczZjYyMGUzZTIzNTNjZjdkMjU1OWEuMTY2OTk4ODIzOC5naXQuZ2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmUKWzJdIDRiMGNiNGU3YWIyZjc3N2MgKCJkdC1iaW5kaW5nczogbXRkOiBz
cGktbm9yOiBjbGFyaWZ5IHRoZSBuZWVkIGZvcgpzcGktbm9yIGNvbXBhdGlibGVzIikuCgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
