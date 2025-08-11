Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6104CA0EC0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nAtS0IRzT0e18VfZQ2v/9UxzZcB+lqaimi3ZH/ryTQ=; b=DRCLxfM1yP8t1j
	lGwPwHyQT45knM/DkKiW/wa08NBP0j+ClyFZZniLeOXV85mTWVWnkIrwUI8msYD4NUqcNQrTqT4dF
	Vlw8lTtVFHeI6Wfg2naKP71tiHc2uySs7uiN3gb11uXBJoN9cA/Sapp6rmPvl5PSFotlX/0KO/+nM
	xkOhDv1zyo/swbSrpTPt4P5Z1gle1v/LJOrGpwB/waJjhPvgH4E+oSejnBpf7tMYhRPWPqmZ3OuoC
	btX4X/sTHRKrGC8SnzKVdjGYwakTvEG7sXDnpEZ4AMlbbJEurSa/DjygZGLRuXwHU7PmkywK0BEgI
	OOtr+vEXYut8oZaXCa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPD7-00000007EJQ-2q3h;
	Mon, 11 Aug 2025 09:52:57 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulP2h-00000007BXd-0fgB
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 09:42:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6157ed5dc51so6344911a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 02:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754905329; x=1755510129; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eSWrL25UEO0oq4z8A0vCEFN2VBnBSD043hswjtDD+k=;
        b=j/alXqQ12XvoKP7/CduDAmd81anGmGju8bnjJuOWhSROIwm18O6iwG/u1QXh0CpkoR
         YyRvPtxPtNpCqyefewRm/hG8LdL9pfmaX8p6lXbEEqFmgZObZuuDQ3r4puAnKxX847Lt
         09C1sEZeDxZ/b3ZJE77TYLj10NjvwS1lvQvtqMM8IEw/FlSE63m+Gsn3uz4ulgVrcPQU
         vyPDHXGZPXFareOmdd2L0IZj7jL3E7v558PTe/iIhyixIGhKjMSeiCA6pQlFf5nraeRR
         5U/+FBqsreSJVJbGCpIgUSKDsApRH0RW9k1jGFm3wYcSK6gycAblrGSy8WqoLYc+h2VH
         +c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754905329; x=1755510129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eSWrL25UEO0oq4z8A0vCEFN2VBnBSD043hswjtDD+k=;
        b=G7QHuM/Av6A8cvYeq9f3HK2d3AhZ8pQ8yIobuJqv/oYWNZhb8wbPrxygVYHpTkysGq
         vTu7yB+1KvisgoX2YomDfycq07UauQipvZi5fFf1pHs72wZS1/lEAon0Y0A9qQOLWYCD
         X7Vn75D54D8kFnVAoM4VhrtloM/3zpovkuWLxZxLDXu9AwTTlp6/pzZlUQ6FJNmDD2Be
         zqrxpWgj+yoSfDvjmYBjrqm5nPL4EOfRImxw55e9AQBJHV3Ym4gRSBVyb6AyxeXDvmVC
         pFRWMIxbguOqhY16t63OdGPQ1zIDDeNQYpt5d06BeuQC2xFCBkvN/+OO0WkJNaLfKaOs
         bL0A==
X-Forwarded-Encrypted: i=1; AJvYcCUf17LH6Jv/X8JOQKUdnHpbRiJ6h/7fU/iMcvBqG9HA4q6ihkkg0C9vF8L3Od+UWT9KiMmx/psEF0A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMtbAL9S9fGRmEwf6d0L0pgV2N2G3/DI+UZBwPwdb+N7opulK7
	X+7xbNXO0jAncZKXNH8JcazR4WLTentWEZ1lf1f2V+/KKCOPG765L7MMpkJXUa2QVHnWOTzH6xZ
	9JwcYh+4ADekqqkUxfwaZYQOLeoWZXb+ModZEIUaVSA==
X-Gm-Gg: ASbGnctV7mbUodEYEJ84NSGvH5OghU8xJYLu/uOfKGzv+B281MKJkTNMv/MYIwbiFBH
	0GqMkIfOQPBm6wmbtHtzHTRhvygrN7diM5JWPwc7PRILEx/3Gs9v6Gt9v/uaaZc8r6vZIBEje0i
	9qw1sYErrA108VIBBQHi28DGep+XobloSCQEHl3oBtAtad09Cf+fpwohUZ8V2c4GxFV0x4ok7Zk
	lbIhXKAPNgFPP4Uog==
X-Google-Smtp-Source: AGHT+IHcls6RaaffbrNGAViVuQNJYIu7Sso9LCbPDH5dKNFIoT9oDwwGZyVJjZrGCF03Z7k2KxEzSXyzLzzSvKKpCcg=
X-Received: by 2002:a17:907:7e8c:b0:af9:611d:8ce5 with SMTP id
 a640c23a62f3a-af9c6453507mr984161266b.22.1754905329373; Mon, 11 Aug 2025
 02:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <47545b7ed4943a088b27021a0fdbeaf56947e833.1754890670.git.zhoubinbin@loongson.cn>
 <CAAhV-H4h5qZ8gCjoKMKd8wBYG+secmTrHdo+AY1A60rmhKrCoQ@mail.gmail.com>
In-Reply-To: <CAAhV-H4h5qZ8gCjoKMKd8wBYG+secmTrHdo+AY1A60rmhKrCoQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 11 Aug 2025 17:41:57 +0800
X-Gm-Features: Ac12FXxSxL_Lbj0YwFkPpje-NBjXsW-_dk1EgJ-IA4j8KD4zAgb88m_iR6tF7Vo
Message-ID: <CAMpQs4JgvCCxgNhmQ7XPHZ9HHohFW69vO7D6mpbBb3Q16u78ag@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] mtd: rawnand: loongson: Rename loongson1 to loongson
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_024211_203150_F60A9CF8 
X-CRM114-Status: GOOD (  27.78  )
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

SGkgSHVhY2FpOgoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKT24gTW9uLCBBdWcgMTEsIDIwMjUg
YXQgMjozNuKAr1BNIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Cj4gSGksIEJpbmJpbiwKPgo+IE9uIE1vbiwgQXVnIDExLCAyMDI1IGF0IDI6MDLigK9QTSBCaW5i
aW4gWmhvdSA8emhvdWJpbmJpbkBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4gPgo+ID4gVGhlIHNlY29u
ZCBzdGVwIGluIHByZXBhcmluZyB0byBhZGQgTG9vbmdzb24tMksgc3VwcG9ydCBpcyB0byBjaGFu
Z2UgdGhlCj4gPiBuYW1lcyBvZiB0aGUgZHJpdmVyIGZpbGVzIGFuZCBLY29uZmlnIG9wdGlvbnMg
ZnJvbSBMb29uZ3NvbjEtc3BlY2lmaWMgdG8KPiA+IExvb25nc29uLWdlbmVyaWMuCj4gSXMgaXQg
cG9zc2libGUgdG8gbWVyZ2UgdGhlIGZpcnN0IHR3byBwYXRjaGVzPyBJZiBub3QsIGl0IGlzIGJl
dHRlciB0bwo+IHVzZSBsb29uZ3NvbjEgcmF0aGVyIHRoYW4gbG9vbmdzb24gaW4gdGhlIHN1Ympl
Y3QgbGluZSBvZiB0aGlzIHBhdGNoLgoKQXQgZmlyc3QsIEkgdGhvdWdodCB0aGF0IHNlcGFyYXRp
bmcgdGhlIHJlbmFtaW5nIG9mIGZpbGUgcHJlZml4ZXMgZnJvbQp0aGUgcmVuYW1pbmcgb2YgZmls
ZSBuYW1lcyB3b3VsZCBtYWtlIHRoZSBjaGFuZ2VzIGNsZWFyZXIuIEFub3RoZXIKcG9pbnQgaXMg
d2hldGhlciByZW5hbWluZyBLY29uZmlnIGl0ZW1zIHdvdWxkIGJlIGNvbnNpZGVyZWQgQVBJCmJy
ZWFraW5nLCBldmVuIHRob3VnaCBubyBvbmUgaXMgY3VycmVudGx5IHJlZmVyZW5jaW5nIHRoZW0/
CgpPZiBjb3Vyc2UsIGlmIGFueW9uZSB0aGlua3MgdGhhdCBzZXBhcmF0aW5nIHRoZW0gaXMgdW5u
ZWNlc3NhcnksIEkKd2lsbCBtZXJnZSB0aGVtIGluIHRoZSBuZXh0IHZlcnNpb24uCj4KPiBIdWFj
YWkKPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJpbmJpbiBaaG91IDx6aG91YmluYmluQGxvb25n
c29uLmNuPgo+ID4gLS0tCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrKy0tLQo+ID4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMiArLQo+ID4gIC4uLm9uZ3NvbjEtbmFuZC1jb250cm9sbGVyLmMgPT4gbG9vbmdzb24tbmFu
ZC1jb250cm9sbGVyLmN9IHwgMAo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+ID4gIHJlbmFtZSBkcml2ZXJzL210ZC9uYW5kL3Jhdy97bG9vbmdz
b24xLW5hbmQtY29udHJvbGxlci5jID0+IGxvb25nc29uLW5hbmQtY29udHJvbGxlci5jfSAoMTAw
JSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+ID4gaW5k
ZXggNGJhYzRlYTIxYjY0Li5jYzUwMjU4MmM5ZjEgMTAwNjQ0Cj4gPiAtLS0gYS9NQUlOVEFJTkVS
Uwo+ID4gKysrIGIvTUFJTlRBSU5FUlMKPiA+IEBAIC0xNjcyMiw3ICsxNjcyMiw3IEBAIEY6ICAg
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzLyovbG9vbmdzb24sbHMxKi55YW1s
Cj4gPiAgRjogICAgIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9tYWNoLWxvb25nc29uMzIvCj4gPiAg
RjogICAgIGFyY2gvbWlwcy9sb29uZ3NvbjMyLwo+ID4gIEY6ICAgICBkcml2ZXJzLyovKmxvb25n
c29uMSoKPiA+IC1GOiAgICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24xLW5hbmQtY29u
dHJvbGxlci5jCj4gPiArRjogICAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29uLW5hbmQt
Y29udHJvbGxlci5jCj4gPiAgRjogICAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLWxvb25nc29uMS5jCj4gPiAgRjogICAgIHNvdW5kL3NvYy9sb29uZ3Nvbi9sb29u
Z3NvbjFfYWM5Ny5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tj
b25maWcgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPiBpbmRleCA0Yjk5ZDljNDIy
YzMuLmQ5ZTNmMTM2NjZhYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tj
b25maWcKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcKPiA+IEBAIC00NjIs
MTIgKzQ2MiwxMiBAQCBjb25maWcgTVREX05BTkRfTlVWT1RPTl9NQTM1Cj4gPiAgICAgICAgICAg
RW5hYmxlcyBzdXBwb3J0IGZvciB0aGUgTkFORCBjb250cm9sbGVyIGZvdW5kIG9uCj4gPiAgICAg
ICAgICAgdGhlIE51dm90b24gTUEzNSBzZXJpZXMgU29Dcy4KPiA+Cj4gPiAtY29uZmlnIE1URF9O
QU5EX0xPT05HU09OMQo+ID4gLSAgICAgICB0cmlzdGF0ZSAiTG9vbmdzb24xIE5BTkQgY29udHJv
bGxlciIKPiA+ICtjb25maWcgTVREX05BTkRfTE9PTkdTT04KPiA+ICsgICAgICAgdHJpc3RhdGUg
Ikxvb25nc29uIE5BTkQgY29udHJvbGxlciIKPiA+ICAgICAgICAgZGVwZW5kcyBvbiBMT09OR1NP
TjFfQVBCX0RNQSB8fCBDT01QSUxFX1RFU1QKPiA+ICAgICAgICAgc2VsZWN0IFJFR01BUF9NTUlP
Cj4gPiAgICAgICAgIGhlbHAKPiA+IC0gICAgICAgICBFbmFibGVzIHN1cHBvcnQgZm9yIE5BTkQg
Y29udHJvbGxlciBvbiBMb29uZ3NvbjEgU29Dcy4KPiA+ICsgICAgICAgICBFbmFibGVzIHN1cHBv
cnQgZm9yIE5BTkQgY29udHJvbGxlciBvbiBMb29uZ3NvbiBmYW1pbHkgY2hpcHMuCj4gPgo+ID4g
IGNvbW1lbnQgIk1pc2MiCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L01ha2VmaWxlIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUKPiA+IGluZGV4IDcxMWQw
NDNhZDRmOC4uYzE4MmI5NzAzYTllIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvTWFrZWZpbGUKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxlCj4gPiBA
QCAtNTksNyArNTksNyBAQCBvYmotJChDT05GSUdfTVREX05BTkRfUk9DS0NISVApICAgICAgICAg
ICAgICAgKz0gcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLm8KPiA+ICBvYmotJChDT05GSUdfTVRE
X05BTkRfUEwzNVgpICAgICAgICAgICArPSBwbDM1eC1uYW5kLWNvbnRyb2xsZXIubwo+ID4gIG9i
ai0kKENPTkZJR19NVERfTkFORF9SRU5FU0FTKSAgICAgICAgICs9IHJlbmVzYXMtbmFuZC1jb250
cm9sbGVyLm8KPiA+ICBvYmotJChDT05GSUdfTVREX05BTkRfTlVWT1RPTl9NQTM1KSAgICArPSBu
dXZvdG9uLW1hMzVkMS1uYW5kLWNvbnRyb2xsZXIubwo+ID4gLW9iai0kKENPTkZJR19NVERfTkFO
RF9MT09OR1NPTjEpICAgICAgICs9IGxvb25nc29uMS1uYW5kLWNvbnRyb2xsZXIubwo+ID4gK29i
ai0kKENPTkZJR19NVERfTkFORF9MT09OR1NPTikgICAgICAgICAgICAgICAgKz0gbG9vbmdzb24t
bmFuZC1jb250cm9sbGVyLm8KPiA+Cj4gPiAgbmFuZC1vYmpzIDo9IG5hbmRfYmFzZS5vIG5hbmRf
bGVnYWN5Lm8gbmFuZF9iYnQubyBuYW5kX3RpbWluZ3MubyBuYW5kX2lkcy5vCj4gPiAgbmFuZC1v
YmpzICs9IG5hbmRfb25maS5vCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdz
b24tbmFuZC1jb250cm9sbGVyLmMKPiA+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+ID4gcmVuYW1l
IGZyb20gZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jCj4g
PiByZW5hbWUgdG8gZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9sbGVy
LmMKPiA+IC0tCj4gPiAyLjQ3LjMKPiA+Cj4gPgoKLS0KVGhhbmtzLgpCaW5iaW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
