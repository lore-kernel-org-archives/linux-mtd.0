Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE733C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Feb 2022 07:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ne6wLurLAmlUWPR7w6Fn7tg9vOdRfUxp4nbc9w10D9s=; b=M46XdXdBvb7P8W
	gmVbaU3byEcVhRZvcQqTB15MtbL9a2IYHfmj/kIL4NuEkuY+B6Brh7lrK1bROJRNMEsZPB3JvwHPd
	l7/Eo9Jh9MjhsSWz/N8kptH+cGb9Z7JjAzlmg1NrL2/r4xPJmSI4qdHdDIns4x0hIOMJU7WAGRJKW
	5QAehxOmWmFC+52OHlUZHdluNYz4iLyw6bx78CdPmXIX6u58keyVN/RyWFMsHihLrVMF/bRzgOPa7
	+IjAAB8j6XeOz9WJ0hdWoKhVgLADLAeLug3Cw1WpX1csTAQ+PPb8MaCgqme55z5yS/nvxjblmsddm
	WZ/M9rCfaVLWCZkZfb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKEcp-005peg-ST; Wed, 16 Feb 2022 07:21:19 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKEcm-005pdb-Vm; Wed, 16 Feb 2022 07:21:18 +0000
Received: by mail-qt1-x82a.google.com with SMTP id b5so1270379qtq.11;
 Tue, 15 Feb 2022 23:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pOcJAEz2qU41PX9tifsFjG0wojUZW1SvJzugMZiYuC0=;
 b=nqq/1QEdzD/5W/nv2zTp9XXZj9GEXhlgKtfxNAWzCJpuPUnCuJDSykqaLEkUu73Eee
 bpXiXJ2uphU0Cix+zo+9i2ba1WtVKzy4o7JqsKHE9ClIbqu0kFBMDG+Q5jLFF5yisf+P
 DgWLheZ+6e0nB1COWgkhri2ulmv9D5ph51brU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pOcJAEz2qU41PX9tifsFjG0wojUZW1SvJzugMZiYuC0=;
 b=DFgGJZssrfC915DWA8CfNVLi3ATJCB7PiO3kaZ9OOPY3Sqe358lGYpkeLx9I7aRxJN
 O5pQx5+bVeRU4M27wfVyPoDzHdatkPXwyDzaESHx+4n6f5VN42W/URWjxm2gfGeWlpFX
 l7rgTkcl0mIAQMPGfo08eBAzrRoam19XL1L1IG4xJuH5nutD72jQNDNWDqjJVf3eW8kI
 BQ2PQ6927DSTTozzpfzIfVkqj4+6wPM/Jr11y4WNz7rkbSFEoogIs+w/+AtS+bZuyLwA
 /Fxl8KH8n2GURb944vTcYcBP0ec++igywOmw4Z72fJLh11wqcUl4kV+BIASgdH+tHFAQ
 qFEw==
X-Gm-Message-State: AOAM533S7+1+QHR6Rwcu5CVCIdvhshMpsPqIj/5hzY6Fmz8luz89bBLv
 WSaFigivadBSlmupe6Itxv5BLLLxl0ICDyptLpo=
X-Google-Smtp-Source: ABdhPJzW11flgp0zEGjBDsbZmQaNh3HD4dBznYiqY29J473H7ttZH/tN26OSjf6pOvHePn5DcqbqrSr9Ss1Ny09UdS4=
X-Received: by 2002:ac8:5b91:0:b0:2db:acb7:2412 with SMTP id
 a17-20020ac85b91000000b002dbacb72412mr1055351qta.475.1644996075867; Tue, 15
 Feb 2022 23:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Feb 2022 07:21:04 +0000
Message-ID: <CACPK8Xe5_opc8W-00DZF1URcb2-OYSU6acjJg+c+aAoDxGBboA@mail.gmail.com>
Subject: Re: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-spi@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, 
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_232117_166525_9558A9C8 
X-CRM114-Status: GOOD (  37.83  )
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

T24gTW9uLCAxNCBGZWIgMjAyMiBhdCAwOTo0MiwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IFRoaXMgc2VyaWVzIGFkZHMgYSBuZXcgU1BJIGRyaXZl
ciB1c2luZyB0aGUgc3BpLW1lbSBpbnRlcmZhY2UgZm9yIHRoZQo+IEFzcGVlZCBzdGF0aWMgbWVt
b3J5IGNvbnRyb2xsZXJzIG9mIHRoZSBBU1QyNjAwLCBBU1QyNTAwIGFuZCBBU1QyNDAwCj4gU29D
cy4KPgo+ICAqIEFTVDI2MDAgRmlybXdhcmUgU1BJIE1lbW9yeSBDb250cm9sbGVyIChGTUMpCj4g
ICogQVNUMjYwMCBTUEkgRmxhc2ggQ29udHJvbGxlciAoU1BJMSBhbmQgU1BJMikKPiAgKiBBU1Qy
NTAwIEZpcm13YXJlIFNQSSBNZW1vcnkgQ29udHJvbGxlciAoRk1DKQo+ICAqIEFTVDI1MDAgU1BJ
IEZsYXNoIENvbnRyb2xsZXIgKFNQSTEgYW5kIFNQSTIpCj4gICogQVNUMjQwMCBOZXcgU3RhdGlj
IE1lbW9yeSBDb250cm9sbGVyIChhbHNvIHJlZmVycmVkIGFzIEZNQykKPiAgKiBBU1QyNDAwIFNQ
SSBGbGFzaCBDb250cm9sbGVyIChTUEkpCj4KPiBJdCBpcyBiYXNlZCBvbiB0aGUgY3VycmVudCBP
cGVuQk1DIGtlcm5lbCBkcml2ZXIgWzFdLCB1c2luZyBkaXJlY3RseQo+IHRoZSBNVEQgU1BJLU5P
UiBpbnRlcmZhY2UgYW5kIG9uIGEgcGF0Y2hzZXQgWzJdIHByZXZpb3VzbHkgcHJvcG9zZWQKPiBh
ZGRpbmcgc3VwcG9ydCBmb3IgdGhlIEFTVDI2MDAgb25seS4gVGhpcyBkcml2ZXIgdGFrZXMgYSBz
bGlnaHRseQo+IGRpZmZlcmVudCBhcHByb2FjaCB0byBjb3ZlciBhbGwgNiBjb250cm9sbGVycy4K
Pgo+IEl0IGRvZXMgbm90IG1ha2UgdXNlIG9mIHRoZSBjb250cm9sbGVyIHJlZ2lzdGVyIGRpc2Fi
bGluZyBBZGRyZXNzIGFuZAo+IERhdGEgYnl0ZSBsYW5lcyBiZWNhdXNlIGlzIG5vdCBhdmFpbGFi
bGUgb24gdGhlIEFTVDI0MDAgU29DLiBXZSBjb3VsZAo+IGludHJvZHVjZSBhIHNwZWNpZmljIGhh
bmRsZXIgZm9yIG5ldyBmZWF0dXJlcyBhdmFpbGFibGUgb24gcmVjZW50IFNvQ3MKPiBpZiBuZWVk
ZWQuIEFzIHRoZXJlIGlzIG5vdCBtdWNoIGRpZmZlcmVuY2Ugb24gcGVyZm9ybWFuY2UsIHRoZSBk
cml2ZXIKPiBjaG9vc2VzIHRoZSBjb21tb24gZGVub21pbmF0b3I6ICJVc2VyIG1vZGUiIHdoaWNo
IGhhcyBiZWVuIGhlYXZpbHkKPiB0ZXN0ZWQgaW4gWzFdLiAiVXNlciBtb2RlIiBpcyBhbHNvIHVz
ZWQgYXMgYSBmYWxsIGJhY2sgbWV0aG9kIHdoZW4KPiBmbGFzaCBkZXZpY2UgbWFwcGluZyB3aW5k
b3cgaXMgdG9vIHNtYWxsLgo+Cj4gUHJvYmxlbXMgdG8gYWRkcmVzcyB3aXRoIHNwaS1tZW0gd2Vy
ZSB0aGUgY29uZmlndXJhdGlvbiBvZiB0aGUgbWFwcGluZwo+IHdpbmRvd3MgYW5kIHRoZSBjYWxp
YnJhdGlvbiBvZiB0aGUgcmVhZCB0aW1pbmdzLiBUaGUgZHJpdmVyIGhhbmRsZXMKPiB0aGVtIGlu
IHRoZSBkaXJlY3QgbWFwcGluZyBoYW5kbGVyIHdoZW4gc29tZSBrbm93bGVkZ2Ugb24gdGhlIHNp
emUgb2YKPiB0aGUgZmxhc2ggZGV2aWNlIGlzIGtub3cuIEl0IGlzIG5vdCBwZXJmZWN0IGJ1dCBu
b3QgaW5jb3JyZWN0IGVpdGhlci4KPiBUaGUgYWxnb3JpdGhtIGlzIG9uZSBmcm9tIFsxXSBiZWNh
dXNlIGl0IGRvZXNuJ3QgcmVxdWlyZSB0aGUgRE1BCj4gcmVnaXN0ZXJzIHdoaWNoIGFyZSBub3Qg
YXZhaWxhYmxlIG9uIGFsbCBjb250cm9sbGVycy4KPgo+IERpcmVjdCBtYXBwaW5nIGZvciB3cml0
ZXMgaXMgbm90IHN1cHBvcnRlZCAoeWV0KS4gSSBoYXZlIHNlZW4gc29tZQo+IGNvcnJ1cHRpb24g
d2l0aCB3cml0ZXMgYW5kIEkgcHJlZmVycmVkIHRvIHVzZSB0aGUgc2FmZXIgYW5kIHByb3Zlbgo+
IG1ldGhvZCBvZiB0aGUgaW5pdGlhbCBkcml2ZXIgWzFdLiBXZSBjYW4gaW1wcm92ZSB0aGF0IGxh
dGVyLgo+Cj4gVGhlIGRyaXZlciBzdXBwb3J0cyBRdWFkIFNQSSBSWCB0cmFuc2ZlcnMgb24gdGhl
IEFTVDI2MDAgU29DIGJ1dCBpdAo+IGRpZG4ndCBoYXZlIHRoZSBleHBlY3RlZCByZXN1bHRzLiBU
aGVyZWZvcmUgaXQgaXMgbm90IGFjdGl2YXRlZCB5ZXQuCj4gVGhpcyBuZWVkcyBtb3JlIHRlc3Rz
Lgo+Cj4gVGhlIHNlcmllcyBkb2VzIG5vdCByZW1vdmUgdGhlIGN1cnJlbnQgQXNwZWVkIFNNQyBk
cml2ZXIgYnV0IHByZXBhcmVzCj4gZ3JvdW5kIGZvciBpdHMgcmVtb3ZhbCBieSBjaGFuZ2luZyBp
dHMgQ09ORklHIG9wdGlvbi4gVGhpcyBsYXN0IHN0ZXAKPiBjYW4gYmUgYWRkcmVzc2VkIGFzIGEg
Zm9sbG93dXAgd2hlbiB0aGUgbmV3IGRyaXZlciB1c2luZyB0aGUgc3BpLW1lbQo+IGludGVyZmFj
ZSBoYXMgYmVlbiBzdWZmaWNpZW50bHkgZXhwb3NlZC4KPgo+IFRlc3RlZCBvbjoKPgo+ICAqIE9w
ZW5QT1dFUiBQYWxtZXR0byAoQVNUMjQwMCkKPiAgKiBFdmFsdWF0aW9uIGJvYXJkIChBU1QyNTAw
KQo+ICAqIE9wZW5QT1dFUiBXaXRoZXJzcG9vbiAoQVNUMjUwMCkKPiAgKiBFdmFsdWF0aW9uIGJv
YXJkIChBU1QyNjAwIEEwKQo+ICAqIFJhaW5pZXIgYm9hcmQgKEFTVDI2MDApCgpMb29rcyBncmVh
dCEgVGhhbmtzIGZvciBkb2luZyB0aGlzIHdvcmsgQ8OpZHJpYy4KCkkgcmV2aWV3ZWQgYWxsIG9m
IHRoZSBwYXRjaGVzLiBUaGUgZGV2aWNlIHRyZWUgYW5kIGRlZmNvbmZpZyBvbmVzLAp3aGljaCB3
ZSB3aWxsIHNlbmQgdmlhIG15IGFzcGVlZCB0cmVlLCBhcmUgZ29vZCB0byBnby4KClRoZSBvdGhl
cnMgbG9vayBnb29kIHRvbywgdG8gdGhlIGJlc3Qgb2YgbXkga25vd2xlZGdlLgoKSSdsbCBkbyBz
b21lIG1vcmUgdGVzdGluZyBvZiB5b3VyIHYyIHdoZW4geW91IHNlbmQgaXQgb3V0LgoKQ2hlZXJz
LAoKSm9lbAoKPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9saW51eC9ibG9iL2Rl
di01LjE1L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvYXNwZWVkLXNtYy5jCj4gWzJd
IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1hc3BlZWQvbGlzdC8/
c2VyaWVzPTIxMjM5NAo+Cj4gVGhhbmtzLAo+Cj4gQy4KPgo+IEPDqWRyaWMgTGUgR29hdGVyICgx
MCk6Cj4gICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogUmVuYW1lIEtjb25maWcgb3B0aW9uCj4gICBk
dC1iaW5kaW5nczogc3BpOiBBZGQgQXNwZWVkIFNNQyBjb250cm9sbGVycyBkZXZpY2UgdHJlZSBi
aW5kaW5nCj4gICBzcGk6IHNwaS1tZW06IEFkZCBkcml2ZXIgZm9yIEFzcGVlZCBTTUMgY29udHJv
bGxlcnMKPiAgIHNwaTogYXNwZWVkOiBBZGQgc3VwcG9ydCBmb3IgZGlyZWN0IG1hcHBpbmcKPiAg
IHNwaTogYXNwZWVkOiBBZGp1c3QgZGlyZWN0IG1hcHBpbmcgdG8gZGV2aWNlIHNpemUKPiAgIHNw
aTogYXNwZWVkOiBXb3JrYXJvdW5kIEFTVDI1MDAgbGltaXRhdGlvbnMKPiAgIHNwaTogYXNwZWVk
OiBBZGQgc3VwcG9ydCBmb3IgdGhlIEFTVDI0MDAgU1BJIGNvbnRyb2xsZXIKPiAgIHNwaTogYXNw
ZWVkOiBDYWxpYnJhdGUgcmVhZCB0aW1pbmdzCj4gICBBUk06IGR0czogYXNwZWVkOiBFbmFibGUg
RHVhbCBTUEkgUlggdHJhbnNmZXJzCj4gICBzcGk6IGFzcGVlZDogQWN0aXZhdGUgbmV3IHNwaS1t
ZW0gZHJpdmVyCj4KPiAgZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyAgICAgICAgICAgICAg
ICAgIHwgMTI0MSArKysrKysrKysrKysrKysrKwo+ICAuLi4vYmluZGluZ3Mvc3BpL2FzcGVlZCxh
c3QyNjAwLWZtYy55YW1sICAgICAgfCAgIDkyICsrCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC1nNC5kdHNpICAgICAgICAgICAgICB8ICAgIDYgKwo+ICBhcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtZzUuZHRzaSAgICAgICAgICAgICAgfCAgICA3ICsKPiAgYXJjaC9hcm0vYm9vdC9kdHMvYXNw
ZWVkLWc2LmR0c2kgICAgICAgICAgICAgIHwgICAgOCArCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29udHJvbGxlcnMvS2NvbmZpZyAgICAgICB8ICAgIDQgKy0KPiAgZHJpdmVycy9tdGQvc3BpLW5v
ci9jb250cm9sbGVycy9NYWtlZmlsZSAgICAgIHwgICAgMiArLQo+ICBkcml2ZXJzL3NwaS9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDExICsKPiAgZHJpdmVycy9zcGkvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4gIDkgZmlsZXMgY2hhbmdl
ZCwgMTM2OSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFt
bAo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
