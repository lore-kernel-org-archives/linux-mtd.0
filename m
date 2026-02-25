Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1A9FD3765
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNUSWfNuapnbYAFbXnoGVfg33SYJId66TUa1XITCb0Y=; b=ubUT3/ayd32jOI
	kDs+pw0TbssN5ua+3vL8l4nu2gBr3m5npBO1PSkiifOdCbQLON5Z4DQD3ghBvcnohhZSVm21SeUkz
	zFbasC/cbHvy+BJSZr8zYmORbVrTinRwsr3E9OELTtexpdG5MkUH+9csGAmxRjY+L0iuD2M8Vj+Rg
	l01NUpZWdzODkr63cfTna21hc2mYp3Qi4M067w1y8yn0ZQhPl+MJuW4DxjP2zMIum3PNirRxc7FyN
	D09ANsGNGFgOTmFqek3bfYGWPEOTC7HNK9Pr45J4qgpvzYm8lJkiroVvvws96vMXjYchki3KpZoAA
	1wqFvs6XEAidsSrPawWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGWl-00000004FeE-3VEy;
	Wed, 25 Feb 2026 15:10:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGWj-00000004Fd1-25pU
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 15:10:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 08C061A1327;
	Wed, 25 Feb 2026 15:10:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D11745FDE6;
	Wed, 25 Feb 2026 15:10:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B10F810369260;
	Wed, 25 Feb 2026 16:10:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772032210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=abfclbdjF5WVXITB+Yrq9jHQN0qzkliulV2pAeXAr7Q=;
	b=gRb8kFwdoAU8UVR6yl74DQYGjOhzTN6wxRh13sRRXjZJD+plUjOy7OyoFAeul6x0QmK6iU
	E8k54Bflwx1iw1ofUkh3X3MMxLtGRRLQ/RuduJzjEv0RaaP4PHbr9NKfsrXHCeJvPnRPqD
	j1XnnZfaRSZ6L5evp9iXTuDV3zVdbYnMUZqg94AnRXzkIICZWC+e6iPgdv+zVSpH8JIGI4
	/5qByxrWToVdV0jsELz00fvIgIFkpxp4Fo5mmq3XervlHs1f39aGvWrZOQJxnrrIugM0hd
	Wh+cJncl9zzDdSwa+XNIbyLRukJ8rAc72DdBbzR7cYkvVfS9pOABTqUJTx/U9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Mikhail Kshevetskiy
 <mikhail.kshevetskiy@iopsys.eu>,  Pablo Martin-Gomez
 <pmartin-gomez@freebox.fr>,  Tianling Shen <cnsztl@gmail.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: spinand: Add randomizer
 enable/disable properties
In-Reply-To: <20260225015705.1113199-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 25 Feb 2026 09:57:03 +0800")
References: <20260225015705.1113199-1-linchengming884@gmail.com>
	<20260225015705.1113199-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 25 Feb 2026 16:10:08 +0100
Message-ID: <87ldggq2pb.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_071013_670760_5519EF37 
X-CRM114-Status: GOOD (  16.19  )
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

SGVsbG8gQ2hlbmcgTWluZywKCk9uIDI1LzAyLzIwMjYgYXQgMDk6NTc6MDMgKzA4LCBDaGVuZyBN
aW5nIExpbiA8bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZyb206IENoZW5n
IE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4KPiBBZGQgIm5hbmQtcmFuZG9t
aXplci1lbmFibGUiIGFuZCAibmFuZC1yYW5kb21pemVyLWRpc2FibGUiIGJvb2xlYW4KPiBwcm9w
ZXJ0aWVzLgo+Cj4gVGhlc2UgcHJvcGVydGllcyBhbGxvdyBlbmFibGluZyBvciBkaXNhYmxpbmcg
dGhlIHJhbmRvbWl6ZXIgZmVhdHVyZQo+IHZpYSB0aGUgZGV2aWNlIHRyZWUuCj4KPiBBY2NvcmRp
bmcgdG8gSkVERUMgc3RhbmRhcmQgSkVTRDIyLUExMTdFLCBubyBzaW5nbGUgZGF0YSBwYXR0ZXJu
Cj4gcmVwcmVzZW50cyBhIHVuaXZlcnNhbCB3b3JzdC1jYXNlIGZvciBhbGwgTkFORCBmbGFzaCBm
YWlsdXJlIG1lY2hhbmlzbXMuCj4gRGlmZmVyZW50IHBhdHRlcm5zLCBzdWNoIGFzIGZ1bGx5IHBy
b2dyYW1tZWQsIGNoZWNrZXJib2FyZCwgb3IgbW9zdGx5Cj4gZXJhc2VkLCBjYW4gZGlzcHJvcG9y
dGlvbmF0ZWx5IHN0cmVzcyBzcGVjaWZpYyBjZWxscyAoZS5nLiwgcHJvZ3JhbW1lZCwKPiBlcmFz
ZWQsIG9yIHRob3NlIGluZmx1ZW5jZWQgYnkgYWRqYWNlbnQgc3RhdGVzKS4KPgo+IEdpdmVuIHRo
YXQgbm8gZml4ZWQgcGF0dGVybiBjYW4gY292ZXIgYWxsIHNjZW5hcmlvcywgdGhlIHVzZSBvZiBh
Cj4gcmFuZG9taXplZCBkYXRhIHBhdHRlcm4gaXMgYSBwcmFjdGljYWwgYW5kIGVmZmVjdGl2ZSBt
aXRpZ2F0aW9uIHN0cmF0ZWd5Lgo+IE91ciBoYXJkd2FyZSBpbXBsZW1lbnRzIGEgcmFuZG9taXpl
ciBmZWF0dXJlIHRoYXQgc2NyYW1ibGVzIHVzZXIgZGF0YQo+IGJlZm9yZSBpdCBpcyB3cml0dGVu
IHRvIHRoZSBmbGFzaCBhbmQgcmVzdG9yZXMgdGhlIG9yaWdpbmFsIGRhdGEgdXBvbiByZWFkLgo+
Cj4gVGhpcyBlbnN1cmVzIHRoZSBkYXRhIHN0b3JlZCBvbiB0aGUgbWVkaWEgaXMgbW9yZSBldmVu
bHkgZGlzdHJpYnV0ZWQsCj4gdGh1cyByZWR1Y2luZyBwYXR0ZXJuLWRlcGVuZGVudCBkZWdyYWRh
dGlvbi4gVGhpcyBpcyBlc3BlY2lhbGx5IGNydWNpYWwKPiBmb3IgcHJldmVudGluZyBlcnJvcnMg
Y2F1c2VkIGJ5IHVuYmFsYW5jZWQgZGF0YSAoZS5nLiwgYWxsIHplcm9zIG9yCj4gYWxsIG9uZXMp
IGluIGJsb2NrcyB3aXRoIGhpZ2ggcHJvZ3JhbS9lcmFzZSAoUC9FKSBjeWNsZSBjb3VudHMuCj4g
VWx0aW1hdGVseSwgdGhlIHJhbmRvbWl6ZXIgaW1wcm92ZXMgdGhlIGxvbmctdGVybSByZWxpYWJp
bGl0eSBhbmQKPiBlbmR1cmFuY2Ugb2YgdGhlIGZsYXNoIGRldmljZS4KPgo+IFBsZWFzZSByZWZl
ciB0byB0aGUgZm9sbG93aW5nIGxpbmsgZm9yIHJhbmRvbWl6ZXIgZmVhdHVyZToKPiBMaW5rOgo+
IGh0dHBzOi8vd3d3Lm14aWMuY29tLnR3L0xpc3RzL0FwcGxpY2F0aW9uTm90ZS9BdHRhY2htZW50
cy8yMTUxL0FOMTA1MVYxLVRoZSUyMEludHJvZHVjdGlvbiUyMG9mJTIwUmFuZG9taXplciUyMEZl
YXR1cmUlMjBvbiUyME1YMzB4RnhHMjhBRF9NWDM1eEZ4RzI0QUQuCgpUaGlzIGxpbmsgYnJpbmdz
IG1lIHRvIGEgIldlIGhhdmUgbW92ZWQgdG8gb3VyIG5ldyBob21lIiBwYWdlLgoKQW55aG93LCB0
aGlzIExpbmsgZG9lcyBub3QgbWFrZSBtdWNoIHNlbnNlIGluIHRoZSBiaW5kaW5nLiBJZiB0aGlz
IGlzIGEKdmVyeSBnZW5lcmljIEFOLCB3aHkgbm90LCBidXQgbWF5YmUgSSdkIG1vdmUgaXQgdG8g
dGhlIFNQSSBOQU5EIHBhdGNoZXMsCmFzIHRoZSBuYW1lIGltcGxpZXMgdGhhdCBpdCBpcyBhIGJp
dCBzcGVjaWZpYyB0byBNYWNyb25peCBjaGlwcy4KCj4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgTWlu
ZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KCk90aGVyd2lzZSBib3RoIHRoZSBiaW5k
aW5nIGFuZCBjb2RlIGxvb2sgb2sgZnJvbSBteSBQb1YuIFNvIGJlc2lkZXMgdGhlCkxpbmsgdGhh
dCBtdXN0IGJlIG1vdmVkIGFuZCBmaXhlZCwgSSdsbCB3YWl0IGZvciBiaW5kaW5nIGFwcHJvdmFs
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
