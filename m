Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27151C77B7D
	for <linux-mtd@archiver.kernel.org>; Wed, 10 May 2023 20:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAnjDSB18oEyJ9vnlKo/pkBdcITG9wg/y3EWMOK5pR4=; b=EWfawj1iAa3CNC
	uMs3EqaXzh8k/92v1OKRrj92699KRZSC3OEuRQPMNK+2uK0HcKd+vS+NLbPw4Ng0EXkxvEoxYMsd5
	FpC8wmPag5DYMdwmZKz5wZtoadYLmeYpTAjMM56TH51oZjBiLN1W/38DL7wkeRa5TM/4c6iTC8L7s
	Jt0LjFaMQvp93qzRu/7HNxtoVfPkfJG+cMn9MmxvjYK9g3OLexOYHHy7xi6HmzNPOWr7pmxVb6jyj
	KUUYh+X4EkwiIUNiIQbjT5jEsxZ1qvLY5bniRQhbUawG8HLXXQoYvztst4BkEq6Kf8yg3U/m8U7L1
	DkFJB/aH17lMoNZ98+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqcG-006xKG-2B;
	Wed, 10 May 2023 20:40:52 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqcE-006xJ3-0Q;
	Wed, 10 May 2023 20:40:51 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so72737690a12.0;
        Wed, 10 May 2023 13:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683751248; x=1686343248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pV4V5oKk2KsrJeuxF19Yb1hq3jeecgjI+b5qCvolrQg=;
        b=ibc2BwYghym+fn/vCk9SHDumCZgRCop/7OvgQFQIIvscYFsJxOWzeMw2oQbPEK1pdO
         N4opBD1qp63+VYxYQAa3wN2Q3gzSA35+0vIANyJxqJnqRM5av5f7ZGkugQXciz/bLrbt
         q1NTC5e0D986bEkWKzfTmp4N8JDmw6I3UZMiWJyudJZYtKvaCQr1DOdMfvc55IFdu/nW
         4IFc+xdtUWIW+XNI3efAVtklDCVWnWnA6rpfy2tncXm16rqeohfK0mEOwbusT2FALebh
         oNYcY6vbD6oaNIk5gxmR4701A3MRoDH2Zi8BE6uXaUtqiMlLpOPtH4NZJzNm4odhY/4x
         GcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683751248; x=1686343248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pV4V5oKk2KsrJeuxF19Yb1hq3jeecgjI+b5qCvolrQg=;
        b=lp+yBi3d5P6RqcesEq7r3oxxUiThRdt40F+IO2vZexbY1hOSdcW0KTgpIhvQ53Nswc
         lal29uwbMkkOTG6s2eesN3uiSYbJDCKcll5Xo2z8XSRdxsAbE2wEoZ8JxVckmtc+RoIR
         fw4tFVqkOpeUFE6U7IhuYWlBnrTTo2f1a0Eal1gP+u3zBzD6DN3zpEXvH4SstF7OUYcQ
         nAIG9VHYR0yHV5MDVkGRzcXxQ1l50+ZZuZXL8mOT5HJRHwYN015F/R5BgbUKhJKhoGs1
         Y8b6Sd8jZ1iKh7qFRgyfkYC2Hoc9MqRAVf9Ie9BaNSEP/YD+3o51PmCCSCVeXzBBRjUg
         XiVg==
X-Gm-Message-State: AC+VfDzBwzaVY3v8DYwbLElaH5wbMPl0XK71KLOCReMjFTwq3qVpJvmy
	4JZWvsUsy1bq+XBRxPH7iCDgxUyxoNc8zgSSfs4=
X-Google-Smtp-Source: ACHHUZ7udSj49jfFEMe1doYGyFqE8X2Co61Hu2FHlmXrOHpm/14E6PuXOuzdlOqct8rX7xnSIW+FfGWCAGm2AnSjEP4=
X-Received: by 2002:a17:907:701:b0:94f:236b:9e3a with SMTP id
 xb1-20020a170907070100b0094f236b9e3amr14655639ejb.3.1683751248438; Wed, 10
 May 2023 13:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110835.26115-1-AVKrasnov@sberdevices.ru> <20230510110835.26115-7-AVKrasnov@sberdevices.ru>
In-Reply-To: <20230510110835.26115-7-AVKrasnov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 10 May 2023 22:40:37 +0200
Message-ID: <CAFBinCAbTuNGEG13f71F8vhN3yGce+kkYJ7PHMpZbh8DzSapJg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] mtd: rawnand: meson: rename node for chip select
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	Yixun Lan <yixun.lan@amlogic.com>, oxffffaa@gmail.com, kernel@sberdevices.ru, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_134050_170757_758D5185 
X-CRM114-Status: GOOD (  14.10  )
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

SGVsbG8gQXJzZW5peSwKCk9uIFdlZCwgTWF5IDEwLCAyMDIzIGF0IDE6MTPigK9QTSBBcnNlbml5
IEtyYXNub3YKPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4KPiBUaGlzIHJlbmFt
ZXMgbm9kZSB3aXRoIHZhbHVlcyBmb3IgY2hpcCBzZWxlY3QgZnJvbSAicmVnIiB0byAiY3MiLiBJ
dCBpcwo+IG5lZWRlZCBiZWNhdXNlIHdoZW4gT1RQIGFjY2VzcyBpcyBlbmFibGVkIG9uIHRoZSBh
dHRhY2hlZCBzdG9yYWdlLCBNVEQKPiBzdWJzeXN0ZW0gcmVnaXN0ZXJzIHRoaXMgc3RvcmFnZSBp
biB0aGUgTlZNRU0gc3Vic3lzdGVtLiBOVk1FTSBpbiB0dXJuCj4gdHJpZXMgdG8gdXNlICJyZWci
IG5vZGUgaW4gaXRzIG93biBtYW5uZXIsIHN1cHBvc2VzIHRoYXQgaXQgaGFzIGFub3RoZXIKPiBs
YXlvdXQuIEFsbCBvZiB0aGlzIGxlYWRzIHRvIGRldmljZSBpbml0aWFsaXphdGlvbiBmYWlsdXJl
LgpJbiBnZW5lcmFsOiBpZiB3ZSBjaGFuZ2UgdGhlIGRldmljZS10cmVlIGludGVyZmFjZSAoaW4g
dGhpcyBjYXNlOgpyZXBsYWNpbmcgYSAicmVnIiB3aXRoIGEgImNzIiBwcm9wZXJ0eSkgdGhlIGR0
LWJpbmRpbmdzIGhhdmUgdG8gYmUKdXBkYXRlZCBhcyB3ZWxsLgpEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sIGFuZApEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sIHNob3cKdGhh
dCB0aGUgY2hpcCBzZWxlY3Qgb2YgYSBOQU5EIGNoaXAgaXMgc3BlY2lmaWVkIHdpdGggYSAicmVn
Igpwcm9wZXJ0eS4KQWxzbyB0aGUgY29kZSBoYXMgdG8gYmUgYmFja3dhcmRzIGNvbXBhdGlibGUg
d2l0aCBvbGQgLmR0YnMuCgo+IEV4YW1wbGU6Cj4KPiBbLi4uXSBudm1lbSBtdGQwLXVzZXItb3Rw
OiBudm1lbTogaW52YWxpZCByZWcgb24gL3NvYy9idXNAZmZlMDAwMDAvLi4uCj4gWy4uLl0gbXRk
IG10ZDA6IEZhaWxlZCB0byByZWdpc3RlciBPVFAgTlZNRU0gZGV2aWNlCj4gWy4uLl0gbWVzb24t
bmFuZCBmZmUwNzgwMC5uZmM6IGZhaWxlZCB0byByZWdpc3RlciBNVEQgZGV2aWNlOiAtMjIKPiBb
Li4uXSBtZXNvbi1uYW5kIGZmZTA3ODAwLm5mYzogZmFpbGVkIHRvIGluaXQgTkFORCBjaGlwcwo+
IFsuLi5dIG1lc29uLW5hbmQ6IHByb2JlIG9mIGZmZTA3ODAwLm5mYyBmYWlsZWQgd2l0aCBlcnJv
ciAtMjIKVGhpcyBpcyBvZGQgLSBjYW4geW91IHBsZWFzZSBzaGFyZSB5b3VyIGRlZmluaXRpb24g
b2YgdGhlICZuZmMgbm9kZT8KCiZuZmMgewogICAgICBuYW5kX2NoaXAwOiBuYW5kQDAgewogICAg
ICAgIHJlZyA9IDwwPjsKICAgICAgfTsKfTsKClRoaXMgc2hvdWxkIHJlc3VsdCBpbiBuYW5kX3Nl
dF9mbGFzaF9ub2RlKCkgYmVpbmcgY2FsbGVkIHdpdGgKJm5hbmRfY2hpcDAgKGlmIGl0J3MgY2Fs
bGVkIHdpdGggJm5mYyB0aGVuIHNvbWV0aGluZyBpcyBidWdneSBpbiBvdXIKZHJpdmVyKS4KSWYg
dGhlcmUncyBubyBjaGlsZCBub2RlcyB3aXRoaW4gJm5hbmRfY2hpcDAgdGhlbiB3aHkgd291bGQg
dGhlCk1URC10by1OVk1FTSBjb2RlIHRoaW5rIHRoYXQgaXQgaGFzIHRvIHBhcnNlIHNvbWV0aGlu
Zz8KSWYgeW91IGRvIGhhdmUgY2hpbGQgbm9kZXMgYW5kIHRob3NlIGFyZSBwYXJ0aXRpb25zLCB0
aGVuIG1ha2Ugc3VyZQp0aGF0IHRoZSBzdHJ1Y3R1cmUgaXMgY29ycmVjdCAoc2VlIHRoZSBleHRy
YSAicGFydGl0aW9ucyIgbm9kZSBpbnNpZGUKd2hpY2ggYWxsIHBhcnRpdGlvbnMgYXJlIG5lc3Rl
ZCk6CiZuYW5kX2NoaXAwIHsKICAgIHBhcnRpdGlvbnMgewogICAgICAgIGNvbXBhdGlibGUgPSAi
Zml4ZWQtcGFydGl0aW9ucyI7CiAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAgICAgICAg
I3NpemUtY2VsbHMgPSA8MT47CgogICAgICAgIHBhcnRpdGlvbkAwIHsKICAgICAgICAgICAgbGFi
ZWwgPSAidS1ib290IjsKICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMCAweDQwMDA+OwogICAg
ICAgICAgICByZWFkLW9ubHk7CiAgICAgICAgfTsKICAgIH07Cn07CgoKQmVzdCByZWdhcmRzLCwK
TWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
