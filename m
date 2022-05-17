Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0F2C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 May 2022 16:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=meXu0UpYMqBKUv811mZ7ncOk5674auFOG7ghbCTICyI=; b=z49bGqL/OmmQy3
	DUggpYW80UW3k9DA+uyOyCeAzYJUflCoVWuaql1eQthwf/oduK4jxc88ZmufJwwodieWzb271kimp
	y+7eI2ujN0UIn9ClBFtQ7uEAc4s8ttYW52FTOrm7BEUdmz8G0GrHjhQxaeHINjaQkegneqVLNTmmV
	qaw/OqJLpXQs0vNtqz7tNFSRPDRuePd6eNx5dkwp5wpBVmpOZEq9tAkvJAOeHkuJFxEDyv7IK5Jik
	7ZldODvcsI7kHmCoaykl+1sBXRIEeO3JH7jjmgCMm5DEQLM602dZ0g8NmwlrtBWGqu1KddhcqxThU
	Co8Bn2U2Zv5VDq1o+7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr0E7-00EsSL-ER; Tue, 17 May 2022 16:39:15 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr0E4-00EsQz-Pb
 for linux-mtd@lists.infradead.org; Tue, 17 May 2022 16:39:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D4C7520007;
 Tue, 17 May 2022 16:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652805546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJtYRAFDXyv5D+rHulqoB18CgiwzQYEhSBBo7r1UZLw=;
 b=PqMnphmKa+Oeky287RYM6Gq9ilrPz5qh6vlWGabmt0SxoEEMfRyJy6QaOyf/QenK1DHyuL
 QmOqnHWpZqIVA1obxIcKlkrO81q9Qh636+wv7kshjVm2jfxIMtAhW/ZFiDmp44tLGMeEee
 oEtkBtthnoNsPWdK+Upl0Kl5GbvHbXuB5ak+TBPYYCJh17n9F4ytJd9u1hdq+h6sK6idXH
 mX09Xz3HaojL85ZSnh2qDTWk1Cz1c4M3zF3AGPru+9foDCbsrGwG4O6bJb2mXr7zh/Kv1u
 cGkg7siIRlvwMEDEApgDBZUiChPcJvWIMUWuY5nOXiICKcD4ixk0pfxSYw6H+Q==
Date: Tue, 17 May 2022 18:39:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Karim
 <Karimdplay@gmail.com>, M <x1@disroot.org>
Subject: Re: [PATCH v5 0/3] Add support for Sercomm partitions
Message-ID: <20220517183903.2b34819c@xps-13>
In-Reply-To: <20220516184217.4e2957fc@xps-13>
References: <20220516151228.885222-1-csharper2005@gmail.com>
 <20220516184217.4e2957fc@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_093913_004730_40E4A1E5 
X-CRM114-Status: GOOD (  21.49  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIE1vbiwgMTYgTWF5IDIw
MjIgMTg6NDI6MTcgKzAyMDA6Cgo+IEhpIE1pa2hhaWwsCj4gCj4gY3NoYXJwZXIyMDA1QGdtYWls
LmNvbSB3cm90ZSBvbiBNb24sIDE2IE1heSAyMDIyIDE1OjEyOjI4ICswMDAwOgo+IAo+ID4gVGhp
cyBwYXRjaCBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIFNlcmNvbW0gbXRkIHBhcnRpdGlvbiB0YWJs
ZSBwYXJzZXIuIEl0J3MKPiA+IHVzZWQgaW4gc29tZSBCZWVsaW5lLCBOZXRnZWFyIGFuZCBTZXJj
b21tIHJvdXRlcnMuIFRoZSBTZXJjb21tIHBhcnRpdGlvbgo+ID4gbWFwIHRhYmxlIGNvbnRhaW5z
IHJlYWwgcGFydGl0aW9uIG9mZnNldHMsIHdoaWNoIG1heSBkaWZmZXIgZnJvbSBkZXZpY2UgdG8K
PiA+IGRldmljZSBkZXBlbmRpbmcgb24gdGhlIG51bWJlciBhbmQgbG9jYXRpb24gb2YgYmFkIGJs
b2NrcyBvbiBOQU5ELiAgCj4gCj4gU2VyaWVzIGFwcGxpZWQgaW4gcGxhY2Ugb2YgdGhlIHByZXZp
b3VzIHZlcnNpb24gb24gbXRkL25leHQuCgpBY3R1YWxseSB3ZSBoYXZlIGEgbmV3IHJvYm90IHdh
cm5pbmcsIHNvIEkndmUgZHJvcHBlZCBwYXRjaCAzLzMgYW5kIGtlcHQKdGhlIGJpbmRpbmdzIGZv
ciB0aGlzIHJlbGVhc2UuCgpUaGFua3MsCk1pcXXDqGwKPiAKPiA+IAo+ID4gQ2hhbmdlcyBzaW5j
ZToKPiA+IHY0Ogo+ID4gIC0gQWRkIEFja2VkLWJ5IHRvIHRoZSBmaXJzdCBwYXRjaAo+ID4gCj4g
PiB2MzoKPiA+ICAtIEZpeCBjb21taXQgbWVzc2FnZSBvZiB0aGUgZmlyc3QgcGF0Y2gKPiA+ICAt
IEFkZCBSZXZpZXdlZC1ieSB0byB0aGUgc2Vjb25kIHBhdGNoCj4gPiAKPiA+IHYyOgo+ID4gIC0g
Rml4IG1pc3Rha2VzIGluIGR0LWJpbmRpbmcKPiA+ICAtIEFkZCBwYXRjaCBmb3IgbmV3IHZlbmRv
ciBwcmVmaXgKPiA+ICAtIEFkZCB2ZW5kb3IgcHJlZml4IHRvIHNjcGFydC1pZCBwcm9wZXJ0eQo+
ID4gCj4gPiB2MToKPiA+ICAtIEFkZCBkdC1iaW5kaW5nIGluIGEgc2VwYXJhdGUgcGF0Y2gKPiA+
ICAtIFJlbW92ZSByZWR1bmRhbnQgYnJhY2VzIGFuZCBsb2dpY2FsIE5PVCBvcGVyYXRvcgo+ID4g
IC0gRGVmaW5lIHByX2ZtdAo+ID4gIC0gUmVwbGFjZSBrY2FsbG9jIGJ5IGt6YWxsb2MKPiA+ICAt
IFVzZSBvZl9nZXRfY2hpbGRfY291bnQoKSBhbmQgYWxsb2MgYmlnIGVub3VnaCBhcnJheSBiZWZv
cmUgdGhlCj4gPiAgICBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKCkKPiA+IAo+ID4gTWlraGFpbCBa
aGlsa2luICgzKToKPiA+ICAgZHQtYmluZGluZ3M6IEFkZCBTZXJjb21tIChTdXpob3UpIENvcnBv
cmF0aW9uIHZlbmRvciBwcmVmaXgKPiA+ICAgZHQtYmluZGluZ3M6IG10ZDogcGFydGl0aW9uczog
RXh0ZW5kIGZpeGVkLXBhcnRpdGlvbnMgYmluZGluZwo+ID4gICBtdGQ6IHBhcnNlcnM6IGFkZCBz
dXBwb3J0IGZvciBTZXJjb21tIHBhcnRpdGlvbnMKPiA+IAo+ID4gIC4uLi9tdGQvcGFydGl0aW9u
cy9maXhlZC1wYXJ0aXRpb25zLnlhbWwgICAgICB8ICA1NSArKystCj4gPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgIHwgICAyICsKPiA+ICBkcml2ZXJzL210
ZC9wYXJzZXJzL0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAgIDkgKwo+ID4gIGRyaXZlcnMv
bXRkL3BhcnNlcnMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gPiAgZHJpdmVy
cy9tdGQvcGFyc2Vycy9zY3BhcnQuYyAgICAgICAgICAgICAgICAgIHwgMjQwICsrKysrKysrKysr
KysrKysrKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMzA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL3BhcnNlcnMvc2NwYXJ0
LmMKPiA+ICAgCj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
