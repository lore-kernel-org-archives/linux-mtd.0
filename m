Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C00C3ABAC
	for <linux-mtd@archiver.kernel.org>; Tue,  6 May 2025 11:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyd6rXryXfIgD/4KM4NAHyLz0KSLdThnjM3rk0NKSx4=; b=Gxj5VMAgWzMgl8
	RXoRCuTP9LeJXa/kOHZGwun4LPG9gr4JBws8KdrlP8sfHqs/h4dqWgsHRbNaQqg0/whXUaXFSEwhb
	yffUDhW4ygjtMwnKl/x1RzNEowRmp7K3cjVjGFnW1hdzRj/DxdjvGgSf133s4RLOVxi+F6aqwYUqk
	rDF2RgYgN/CO07E2nPPTKXADLQ4A/Kn58NGHLePUUVFZQTcuna915D1PzXEZlrbIz7R7S9+vS6Iwd
	GxaPAtLt62esTUrfdYVF8z0FYHGPmd4LZy1ckQNH/7Tr8a7lc+Pgsj5u6WHtoo36cqQCF+ORkHcvl
	JGxmgXqC+jezrpD8SDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCG5N-0000000Belj-26s4;
	Tue, 06 May 2025 11:03:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEfT-0000000BOEw-2g0Y
	for linux-mtd@lists.infradead.org;
	Tue, 06 May 2025 09:32:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso23602225e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 May 2025 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746523970; x=1747128770; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nGT9uv0lzPx3oU6XAhFYncy4NYk5F/6MJ4HISb7Jycc=;
        b=S5IIGxjN4YdocL0TrXcrVxIacFANXuCv31PXazaZGLuYJgJ4FF3j3hFdsplUNe/Ziy
         HzUOditivZ0pdlIEHNKOa1VgQP3SVSWjP8lJ0pnZQwJB1U6NbyYVI8/xv+U3E/zgp0AG
         M/oop1HeY4mcPfv9tK9nfIolXAhQD7h0KBQFaslKvBzv0YCTDszINyRCn6vAigKgnYFH
         YMpjPA8SjNJmIfYTmCzpHEJ57yebfoGSJdUJ3ZfmyXVKepge1P/NcMMKIG0Cd4pNTKe/
         DlePmqT/vocQJDGVSvNzjbNtiUFdHoYR5+UFhViBdtEOwWJj3FyHWebLiejgVw0d1PNV
         yGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523970; x=1747128770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGT9uv0lzPx3oU6XAhFYncy4NYk5F/6MJ4HISb7Jycc=;
        b=ltkmz7QZAa6HACXzvmta7l3p0+z26rQapDPfYni4rqCMgveM/CBfvDyf659SFGvVor
         qbCs1nDJJrKYZ+6CGZI6cgWBM0clNJXNi/lmg9n1g350Z0pDZlQo1gAIN3kgRmmTD/Za
         CoMOxCy10vXun0DXsY/DkBGGjdfxSGDdXt0D12KiyyOuWvMpDSfvpUM/6r3wusOBOI7x
         LY0E/y1P1QMXtIYcb6rotePfFSNvnZzRzBHY/TuItiLxOBmaEejKL9o4KTWPO78WqN2N
         gKZ/elqAtTw+GwRlpE7Xfr5g4oLJaZ6CsMtV0C8pDHrOwlmpsDhjIBp3iBOV9cSD85za
         O5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQuD3lJU75pIpRssc537fre63sbggcNROohTf2tke5sr4/kZN5PLe8SMG+fR9QpoScBsYEb+kAyA4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3OlSwA1q2yK/c9iHY7B6nHY5xse3hpJIpih/UFT27AH0vkUp2
	3gqEMcRzGtpkYq0c5Zg52iDJ34rSvl+XtUCcqT3iUp8gmy735CZu6wQnsdx/gZ4=
X-Gm-Gg: ASbGnctsgJm33yVv0ANibnQT5okQ7jie6j0zCn01O8O0rQS/run6KU60wan8zAmx/CD
	cN1u7riQntZMqXDt4vHLCCGtPdvBR4ja1qVKBMwOtqRUXEGSOFxHn/3MyTQd10CEef+2hWNdYKH
	G/n2NhUO59ETe9XgUxTCEjMk1Sq2fq++rddzLusyU2ukLhj/fkLlqKDKQO5iE2ZtgZiQSHpH++E
	tQfajRlY+1NpIsPTLqAJvFlAeuzunmCtkJWgW/lAJ2FOCUrfM7yq54y9hS7XjnzkaZGBRumvIwO
	MyRlrbi7CPavlkZJA+IV2j1DZj0mVGnXGvygVCawKC0O77ZC2qCaWB2M
X-Google-Smtp-Source: AGHT+IHdLZzgnxP5h0abh3m/L4WAmBk1ccvvnKktbTa4WSRN5LJxHjEx/OsPWCml+VS+d3iYSSIb6Q==
X-Received: by 2002:a05:600c:8218:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-441bbec1835mr128722905e9.8.1746523970073;
        Tue, 06 May 2025 02:32:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b89ee171sm161598935e9.17.2025.05.06.02.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:32:49 -0700 (PDT)
Date: Tue, 6 May 2025 12:32:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBnXPYLSNJASR51f@stanley.mountain>
References: <aBSEwag_ducqOwy7@stanley.mountain>
 <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_023251_677092_BB772A48 
X-CRM114-Status: GOOD (  26.48  )
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

T24gVHVlLCBNYXkgMDYsIDIwMjUgYXQgMDU6MTY6MDNQTSArMDgwMCwgS2VndWFuZyBaaGFuZyB3
cm90ZToKPiBPbiBGcmksIE1heSAyLCAyMDI1IGF0IDQ6MznigK9QTSBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSAiZGVzYyIgdmFyaWFi
bGUgaXMgTlVMTCBhbmQgUFRSX0VSUihOVUxMKSBpcyB6ZXJvL3N1Y2Nlc3MuICBSZXR1cm4KPiA+
IGEgbmVnYXRpdmUgZXJyb3IgY29kZSBpbnN0ZWFkLgo+ID4KPiA+IEZpeGVzOiBkMmQxMGVkZTA0
YjEgKCJtdGQ6IHJhd25hbmQ6IEFkZCBMb29uZ3Nvbi0xIE5BTkQgQ29udHJvbGxlciBEcml2ZXIi
KQo+ID4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8u
b3JnPgo+ID4gLS0tCj4gPiBJdCdzIGhhcmQgdG8ga25vdyB3aGF0IHRoZSBwYXRjaCBwcmVmaXgg
c2hvdWxkIGJlIGhlcmUuICBJZGVhbGx5IHdoZW4gd2UKPiA+IGFkZCBhIG5ldyBkcml2ZXIgd2Ug
d291bGQgdXNlIHRoZSBwYXRjaCBwcmVmaXggZm9yIHRoZSBkcml2ZXIuCj4gPgo+ID4gVGlyZWQ6
IHN1YnN5c3RlbTogQWRkIGRyaXZlciBYWFgKPiA+IFdpcmVkOiBzdWJzeXN0ZW06IFhYWDogQWRk
IGRyaXZlciBmb3IgWFhYCj4gPgo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29uMS1u
YW5kLWNvbnRyb2xsZXIuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9v
bmdzb24xLW5hbmQtY29udHJvbGxlci5jCj4gPiBpbmRleCA2YTM2OWIxYzdkODYuLjg3NTRiYjRm
OGI1NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29uMS1uYW5k
LWNvbnRyb2xsZXIuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24xLW5h
bmQtY29udHJvbGxlci5jCj4gPiBAQCAtMzcxLDcgKzM3MSw3IEBAIHN0YXRpYyBpbnQgbHMxeF9u
YW5kX2RtYV90cmFuc2ZlcihzdHJ1Y3QgbHMxeF9uYW5kX2hvc3QgKmhvc3QsIHN0cnVjdCBsczF4
X25hbmRfCj4gPiAgICAgICAgIGRlc2MgPSBkbWFlbmdpbmVfcHJlcF9zbGF2ZV9zaW5nbGUoY2hh
biwgZG1hX2FkZHIsIG9wLT5sZW4sIHhmZXJfZGlyLCBETUFfUFJFUF9JTlRFUlJVUFQpOwo+ID4g
ICAgICAgICBpZiAoIWRlc2MpIHsKPiA+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBwcmVwYXJlIERNQSBkZXNjcmlwdG9yXG4iKTsKPiA+IC0gICAgICAgICAgICAgICBy
ZXQgPSBQVFJfRVJSKGRlc2MpOwo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07Cj4g
Cj4gVGhhbmsgeW91IGZvciBmaXhpbmcgdGhpcyBpc3N1ZS4KPiBIb3dldmVyLCBJIGJlbGlldmUg
LUVJTyBpcyBtb3JlIGFwcHJvcHJpYXRlIHRoYW4gLUVOT01FTSwgc2luY2UKPiBkbWFlbmdpbmVf
cHJlcF9zbGF2ZV9zaW5nbGUoKSBjYW4gcmV0dXJuIGVycm9ycyBvdGhlciB0aGFuIC1FTk9NRU0u
Cj4gCgpJdCdzIG5vdCBhbiBJL08gZXJyb3Igc28gLUVJTyBpc24ndCBjb3JyZWN0LgoKVGhlcmUg
YXJlIGEgYnVuY2ggb2YgcmVhc29ucyBpdCBjb3VsZCBmYWlsIGJ1dCBtb3N0IGxpa2VseQpkbWFf
cG9vbF9hbGxvYygpIGZhaWxlZC4gIEkgdGhpbmsgLUVOT01FTSBpcyBjb3JyZWN0LgoKcmVnYXJk
cywKZGFuIGNhcnBlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
