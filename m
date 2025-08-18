Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A9ECA0EE4
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9nFSp52zLMu78lNC1+cCV80AkhO6ji0JM39NPgtRLY=; b=O/rPIH9rY5bnsw
	CpaFq9o77mPhsxefpGEAwnns/x2BzDTsUIuc7ZT9ag3WtTK2gAfF9RUg3RMEI4wYGJIQxI0btuwb+
	VA0CR+daKg1741NU5A1o5IYE07pYW+FFUIBeQwuSPa5MKrc+bbO2eD/IcnsyKjeh0IO8aA5P/1yvC
	P9tS56N3ixJVVfgeGljwVciAKeyaTiNPztBNLDZY3F/fsGEEIH8aEbkrprCNUBcEnMW1JtxzRFMFN
	AEqrRXLwDud2Xqj2pMkcUMkIAdi6gwOvbV1A9KmfiMDsjRpRIAZzfN/Wfib+NWn7h90EJVSwMloc+
	L9sGjl5n6YhpFHlBUclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo06y-00000007a0o-1oDo;
	Mon, 18 Aug 2025 13:41:20 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwMM-0000000755T-0gfa
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 09:40:59 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afca3e71009so737986166b.0
        for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2025 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755510056; x=1756114856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOJjRWVOPzxNZaP1qKl5T6uQXMq+ZN2NpLXOIkGXeu8=;
        b=JLMSthyj76HLGWjbIvOQiNzmJFZx2Jp7NRIfvPOuL59ry3UfOApcYJOGAwW480UecX
         WMK8uqCpoUwYIw0SXD9WpC8v+P3nE7xX9s9QTEeF8yLGDzWCP0awnIFNbiKh0wwfN6n4
         jhj6EnIO//QkLEdoXaQ0xPEVMiwm+cUj9vphF6QWCG+kY8SKjCgODx+5e/3FodbcnbOV
         nf3FiNtjOtVL3i2/GYmwzJyn0oV7lGVbsbyHmdXRXzi7TNoqgHDgKpQaVP6KEQ5A8jyQ
         CLChUNP+Wf4GzqQTmeqfP36XyCk/3V/fMbxUXHAr+Ni7KFPBt8QKzBXlMKN1WyfgoVgK
         HNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755510056; x=1756114856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOJjRWVOPzxNZaP1qKl5T6uQXMq+ZN2NpLXOIkGXeu8=;
        b=KCc0j+T0aaDy9nWvVi0PqHFtmahk7NVhBQjUSx7ZeZZ+BVb130WA/6FjZcwJ/6l1Z7
         zPPDv8cGFIEPv41wBL1AGTuF14cccpht4NEEbh2ADuYPCnVI+eS1Qzne5HBCLh+7yrW4
         /f4RKlxUf8PDkt7jkDgYsxZWcu6yJ6wKTwNgdRVCvk2j9gzEVYSge+eh0Si6N7rJinJB
         gy9SUiI3zqDr10nYnlM30XrWYUEEgGQ3mJveRiciADavaHlN4YH+apLTgprebJ90R7Vn
         IPfCM6C86FjAh5Whzk0GoFafPaFcBgZr7jqfQHwpmYzpnPBZW1Q6lM2fG4xkm7HQKuym
         Pecw==
X-Forwarded-Encrypted: i=1; AJvYcCW/pZq5ReyLrrnNp4bU2ZmytxOWryD6K9m7qGLZ2Qi9KGN/L9tNPqqoVMbZuwIpBCh/EHUCKIl9oG0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFq7zVOA8dh6j7aTFssUBaGw9WVDehuOTdFVEx3dUavN3/lP8n
	T+ypn4y2RKm0gbF6WQ9FXq+Flw2IVbpjHyE8EkgVm0yjm0b2QwM3QTGIFXv2d6WlKITR8DW31Nn
	71MRxXtL6jIjTJPBDBx0RF3V3argL7tA=
X-Gm-Gg: ASbGncsyPaFGkTa//NgIrKvncS6JyluzZkU40kU11naQmWLl2XUytKkbx39ilBNmMPQ
	cw/dsvNNCXvazHTcNaBGxhKtQz+o0UclHxIztJX96Tv8mdkOCXmT8Ef61FV31Z8cgDF6AxZyVrN
	O9rG3Ye0H9cRha/m6GlWksvmBFElGQf7sj09udCZmA3brUI28QcebQqay0D1NWrvC9czm1c6CUE
	LdMTIbypFLGzukZNA==
X-Google-Smtp-Source: AGHT+IHp0UmWW2UaLhVJaYIR0yqe8Dam+rKGh2pWLy+njoco3WlqsBW5kQ+Ttg039INaMvj9jU9P+8OKwR3mwdhpHhs=
X-Received: by 2002:a17:907:72d2:b0:af9:3f53:ed1d with SMTP id
 a640c23a62f3a-afcdb273236mr1142406066b.16.1755510055999; Mon, 18 Aug 2025
 02:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <47545b7ed4943a088b27021a0fdbeaf56947e833.1754890670.git.zhoubinbin@loongson.cn>
 <CAAhV-H4h5qZ8gCjoKMKd8wBYG+secmTrHdo+AY1A60rmhKrCoQ@mail.gmail.com>
 <CAMpQs4JgvCCxgNhmQ7XPHZ9HHohFW69vO7D6mpbBb3Q16u78ag@mail.gmail.com> <CAJhJPsU+dVmnBnHgnNDL0Zro_KYN12c7+pw=720ju-w7veegMQ@mail.gmail.com>
In-Reply-To: <CAJhJPsU+dVmnBnHgnNDL0Zro_KYN12c7+pw=720ju-w7veegMQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 18 Aug 2025 17:40:43 +0800
X-Gm-Features: Ac12FXw16I7aogqr-1UaRJJv6IlheqoNzx6yaN68YbS9d6fLFkQRWBbtKitkvQ8
Message-ID: <CAMpQs4+smqstrmcReOYXtyJvgTdu=Yit8_Kq3kMdM=rM6ENKag@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] mtd: rawnand: loongson: Rename loongson1 to loongson
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_024058_206181_EB743B3F 
X-CRM114-Status: GOOD (  33.95  )
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

SGkgS2VndWFuZzoKClRoYW5rcyBmb3IgeW91ciByZXBseS4KCk9uIE1vbiwgQXVnIDE4LCAyMDI1
IGF0IDM6MDXigK9QTSBLZWd1YW5nIFpoYW5nIDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4KPiBPbiBNb24sIEF1ZyAxMSwgMjAyNSBhdCA1OjQy4oCvUE0gQmluYmluIFpob3UgPHpo
b3ViYi5hYXJvbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEh1YWNhaToKPiA+Cj4gPiBU
aGFua3MgZm9yIHlvdXIgcmVwbHkuCj4gPgo+ID4gT24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgMjoz
NuKAr1BNIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+
ID4gPiBIaSwgQmluYmluLAo+ID4gPgo+ID4gPiBPbiBNb24sIEF1ZyAxMSwgMjAyNSBhdCAyOjAy
4oCvUE0gQmluYmluIFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+IHdyb3RlOgo+ID4gPiA+
Cj4gPiA+ID4gVGhlIHNlY29uZCBzdGVwIGluIHByZXBhcmluZyB0byBhZGQgTG9vbmdzb24tMksg
c3VwcG9ydCBpcyB0byBjaGFuZ2UgdGhlCj4gPiA+ID4gbmFtZXMgb2YgdGhlIGRyaXZlciBmaWxl
cyBhbmQgS2NvbmZpZyBvcHRpb25zIGZyb20gTG9vbmdzb24xLXNwZWNpZmljIHRvCj4gPiA+ID4g
TG9vbmdzb24tZ2VuZXJpYy4KPiA+ID4gSXMgaXQgcG9zc2libGUgdG8gbWVyZ2UgdGhlIGZpcnN0
IHR3byBwYXRjaGVzPyBJZiBub3QsIGl0IGlzIGJldHRlciB0bwo+ID4gPiB1c2UgbG9vbmdzb24x
IHJhdGhlciB0aGFuIGxvb25nc29uIGluIHRoZSBzdWJqZWN0IGxpbmUgb2YgdGhpcyBwYXRjaC4K
PiA+Cj4gPiBBdCBmaXJzdCwgSSB0aG91Z2h0IHRoYXQgc2VwYXJhdGluZyB0aGUgcmVuYW1pbmcg
b2YgZmlsZSBwcmVmaXhlcyBmcm9tCj4gPiB0aGUgcmVuYW1pbmcgb2YgZmlsZSBuYW1lcyB3b3Vs
ZCBtYWtlIHRoZSBjaGFuZ2VzIGNsZWFyZXIuIEFub3RoZXIKPiA+IHBvaW50IGlzIHdoZXRoZXIg
cmVuYW1pbmcgS2NvbmZpZyBpdGVtcyB3b3VsZCBiZSBjb25zaWRlcmVkIEFQSQo+ID4gYnJlYWtp
bmcsIGV2ZW4gdGhvdWdoIG5vIG9uZSBpcyBjdXJyZW50bHkgcmVmZXJlbmNpbmcgdGhlbT8KPiA+
Cj4gPiBPZiBjb3Vyc2UsIGlmIGFueW9uZSB0aGlua3MgdGhhdCBzZXBhcmF0aW5nIHRoZW0gaXMg
dW5uZWNlc3NhcnksIEkKPiA+IHdpbGwgbWVyZ2UgdGhlbSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+
Cj4gSXTigJlzIHJlYXNvbmFibGUgdG8gbWVyZ2UgdGhlIGZpcnN0IHR3byBwYXRjaGVzLgo+IEkg
YWdyZWUuCgpPSy4gSSB3aWxsIGRvIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCj4KPiA+ID4KPiA+
ID4gSHVhY2FpCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaW5iaW4gWmhv
dSA8emhvdWJpbmJpbkBsb29uZ3Nvbi5jbj4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICst
Cj4gPiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgNiArKystLS0KPiA+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiA+ID4gIC4uLm9u
Z3NvbjEtbmFuZC1jb250cm9sbGVyLmMgPT4gbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmN9IHwg
MAo+ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPiA+ID4gPiAgcmVuYW1lIGRyaXZlcnMvbXRkL25hbmQvcmF3L3tsb29uZ3NvbjEtbmFuZC1j
b250cm9sbGVyLmMgPT4gbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmN9ICgxMDAlKQo+ID4gPiA+
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiA+ID4gPiBp
bmRleCA0YmFjNGVhMjFiNjQuLmNjNTAyNTgyYzlmMSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9NQUlO
VEFJTkVSUwo+ID4gPiA+ICsrKyBiL01BSU5UQUlORVJTCj4gPiA+ID4gQEAgLTE2NzIyLDcgKzE2
NzIyLDcgQEAgRjogICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvKi9sb29u
Z3NvbixsczEqLnlhbWwKPiA+ID4gPiAgRjogICAgIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9tYWNo
LWxvb25nc29uMzIvCj4gPiA+ID4gIEY6ICAgICBhcmNoL21pcHMvbG9vbmdzb24zMi8KPiA+ID4g
PiAgRjogICAgIGRyaXZlcnMvKi8qbG9vbmdzb24xKgo+ID4gPiA+IC1GOiAgICAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jCj4gPiA+ID4gK0Y6ICAgICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9sb29uZ3Nvbi1uYW5kLWNvbnRyb2xsZXIuYwo+ID4gPiA+ICBG
OiAgICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24x
LmMKPiA+ID4gPiAgRjogICAgIHNvdW5kL3NvYy9sb29uZ3Nvbi9sb29uZ3NvbjFfYWM5Ny5jCj4g
PiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcKPiA+ID4gPiBpbmRleCA0Yjk5ZDljNDIyYzMu
LmQ5ZTNmMTM2NjZhYyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9L
Y29uZmlnCj4gPiA+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+ID4gPiA+
IEBAIC00NjIsMTIgKzQ2MiwxMiBAQCBjb25maWcgTVREX05BTkRfTlVWT1RPTl9NQTM1Cj4gPiA+
ID4gICAgICAgICAgIEVuYWJsZXMgc3VwcG9ydCBmb3IgdGhlIE5BTkQgY29udHJvbGxlciBmb3Vu
ZCBvbgo+ID4gPiA+ICAgICAgICAgICB0aGUgTnV2b3RvbiBNQTM1IHNlcmllcyBTb0NzLgo+ID4g
PiA+Cj4gPiA+ID4gLWNvbmZpZyBNVERfTkFORF9MT09OR1NPTjEKPiA+ID4gPiAtICAgICAgIHRy
aXN0YXRlICJMb29uZ3NvbjEgTkFORCBjb250cm9sbGVyIgo+ID4gPiA+ICtjb25maWcgTVREX05B
TkRfTE9PTkdTT04KPiA+ID4gPiArICAgICAgIHRyaXN0YXRlICJMb29uZ3NvbiBOQU5EIGNvbnRy
b2xsZXIiCj4gPiA+ID4gICAgICAgICBkZXBlbmRzIG9uIExPT05HU09OMV9BUEJfRE1BIHx8IENP
TVBJTEVfVEVTVAo+ID4gPiA+ICAgICAgICAgc2VsZWN0IFJFR01BUF9NTUlPCj4gPiA+ID4gICAg
ICAgICBoZWxwCj4gPiA+ID4gLSAgICAgICAgIEVuYWJsZXMgc3VwcG9ydCBmb3IgTkFORCBjb250
cm9sbGVyIG9uIExvb25nc29uMSBTb0NzLgo+ID4gPiA+ICsgICAgICAgICBFbmFibGVzIHN1cHBv
cnQgZm9yIE5BTkQgY29udHJvbGxlciBvbiBMb29uZ3NvbiBmYW1pbHkgY2hpcHMuCj4gPiA+ID4K
PiA+ID4gPiAgY29tbWVudCAiTWlzYyIKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmlsZSBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxl
Cj4gPiA+ID4gaW5kZXggNzExZDA0M2FkNGY4Li5jMTgyYjk3MDNhOWUgMTAwNjQ0Cj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUKPiA+ID4gPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9NYWtlZmlsZQo+ID4gPiA+IEBAIC01OSw3ICs1OSw3IEBAIG9iai0kKENP
TkZJR19NVERfTkFORF9ST0NLQ0hJUCkgICAgICAgICAgICAgICArPSByb2NrY2hpcC1uYW5kLWNv
bnRyb2xsZXIubwo+ID4gPiA+ICBvYmotJChDT05GSUdfTVREX05BTkRfUEwzNVgpICAgICAgICAg
ICArPSBwbDM1eC1uYW5kLWNvbnRyb2xsZXIubwo+ID4gPiA+ICBvYmotJChDT05GSUdfTVREX05B
TkRfUkVORVNBUykgICAgICAgICArPSByZW5lc2FzLW5hbmQtY29udHJvbGxlci5vCj4gPiA+ID4g
IG9iai0kKENPTkZJR19NVERfTkFORF9OVVZPVE9OX01BMzUpICAgICs9IG51dm90b24tbWEzNWQx
LW5hbmQtY29udHJvbGxlci5vCj4gPiA+ID4gLW9iai0kKENPTkZJR19NVERfTkFORF9MT09OR1NP
TjEpICAgICAgICs9IGxvb25nc29uMS1uYW5kLWNvbnRyb2xsZXIubwo+ID4gPiA+ICtvYmotJChD
T05GSUdfTVREX05BTkRfTE9PTkdTT04pICAgICAgICAgICAgICAgICs9IGxvb25nc29uLW5hbmQt
Y29udHJvbGxlci5vCj4gPiA+ID4KPiA+ID4gPiAgbmFuZC1vYmpzIDo9IG5hbmRfYmFzZS5vIG5h
bmRfbGVnYWN5Lm8gbmFuZF9iYnQubyBuYW5kX3RpbWluZ3MubyBuYW5kX2lkcy5vCj4gPiA+ID4g
IG5hbmQtb2JqcyArPSBuYW5kX29uZmkubwo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9sb29uZ3NvbjEtbmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9sb29uZ3Nvbi1uYW5kLWNvbnRyb2xsZXIuYwo+ID4gPiA+IHNpbWlsYXJpdHkgaW5kZXgg
MTAwJQo+ID4gPiA+IHJlbmFtZSBmcm9tIGRyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29uMS1u
YW5kLWNvbnRyb2xsZXIuYwo+ID4gPiA+IHJlbmFtZSB0byBkcml2ZXJzL210ZC9uYW5kL3Jhdy9s
b29uZ3Nvbi1uYW5kLWNvbnRyb2xsZXIuYwo+ID4gPiA+IC0tCj4gPiA+ID4gMi40Ny4zCj4gPiA+
ID4KPiA+ID4gPgo+ID4KPiA+IC0tCj4gPiBUaGFua3MuCj4gPiBCaW5iaW4KPgo+Cj4KPiAtLQo+
IEJlc3QgcmVnYXJkcywKPgo+IEtlZ3VhbmcgWmhhbmcKCgotLSAKVGhhbmtzLgpCaW5iaW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
