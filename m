Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD2C44500
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2026 06:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0Kh4F1DPSPuEHj8qzNT/TDwhGWU3ZJJXhq+n0ESAFM=; b=rNowk4pQHpY8jJ
	IFRqcd4uKN4kTBaMD+E7Q4oj41Q5wmcpDlW3YvRXZEJp95+6rqlBL29M44lIV/QS/gK7muQaOg7oV
	bsJDgfOabtDs4s/KFZlyPB+Od7POtQij6FDOKdGx6ShDDit55gvlYIdcwOwOsYU8/q2xieEAbg+z4
	1ibjiqZp9QROs9uzMuW3IdD7DWB5evaSQUo+Ux7nZWzPVpa35LFEes+MLo9P/PGW96EzYjjAucIZW
	D+Nky5msrzS6ZUg56GMlTL3IOwkaRiyOgZ3CheEaazTev+ml42dn3lHIDQEiDhme/EkLbBz7n4PPl
	DDRyzhM/KkNBRlIWgeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzLA-0000000EDQb-1PQe;
	Tue, 07 Jul 2026 06:31:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzL5-0000000EDPr-1vym
	for linux-mtd@lists.infradead.org;
	Tue, 07 Jul 2026 06:31:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 24CB04E40CC6;
	Tue,  7 Jul 2026 06:31:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB227601A3;
	Tue,  7 Jul 2026 06:31:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 194B511BC07A4;
	Tue,  7 Jul 2026 08:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783405881; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yjK+MgNVUSfwz13f78upz7ONpUxHIMfFE1ju5M2QNYM=;
	b=czWmUPtbmR23diM2cnPh2/18t5+ILy9oG37sriIJzI4QxsMJyX9JXukEophqNNei0q2oJq
	1kObrXzJ8LIg6SZSju2tsOPI0JL8izPaitQVm6rEw2JyaBCoUc2gOYJ/AkgIOsRgmkaaZc
	UUwsMicirwnvMRbJNp3H2Rr+gmH2adapoBl3pn16i5wPpJfcRxuZY3R3afvCI5nDm2jfIm
	TdXOTvCYSOdHpPzcEJOs3aY43uZBjP036/fB2HD6odYC/erEqSgPONHyljdBqZ9+eWJ8uy
	VdIwyVdspXTVraprOLKY40pUJoOplWh0TNOVLmvdpr9AJsmSfp5QXZudBoEizw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,  Stephan Gerhold
 <stephan.gerhold@linaro.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
In-Reply-To: <47bd85c0-f015-4c43-b616-c249596d7537@kernel.org> (Krzysztof
	Kozlowski's message of "Mon, 6 Jul 2026 18:18:15 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
	<akult0UUSSwKQ8F5@linaro.org> <875x2smf39.fsf@bootlin.com>
	<akus-hN7-yf4Y6XU@linaro.org>
	<v4wc36d5slcbq6vsubrpzdoz6x7iq2t2xxlg7onak7fq3bcpjz@kxoqbvi734pp>
	<87y0foji2a.fsf@bootlin.com>
	<spaihty2s3zfj7jsv63ex7elf3bwz3bbak5ubageusatdgiodd@qh5gfhhh5ppo>
	<47bd85c0-f015-4c43-b616-c249596d7537@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 07 Jul 2026 08:31:15 +0200
Message-ID: <8733xvjop8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_233127_660986_23E7959E 
X-CRM114-Status: GOOD (  16.77  )
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

T24gMDYvMDcvMjAyNiBhdCAxODoxODoxNSArMDIsIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIDA2LzA3LzIwMjYgMTg6MDAsIE1hbml2YW5uYW4gU2Fk
aGFzaXZhbSB3cm90ZToKPj4gT24gTW9uLCBKdWwgMDYsIDIwMjYgYXQgMDQ6NDI6MjFQTSArMDIw
MCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gCj4+Pj4gYW5kIGlmIHRoZSBkcml2ZXIgcXVlcmll
cyB0aGUgZnJlcXVlbmN5IG9mCj4+Pj4gUlBNX1NNRF9RUElDX0NMSywgaXQgd291bGQganVzdCBy
ZXR1cm4gdGhlIHNhbWUgZnJlcXVlbmN5LiBUaGlzIGlzIHdoZXJlIHRoZQo+Pj4+IGR1bW15IGNs
b2NrIGNvbWVzIGhhbmR5IGFzIGl0IGF0bGVhc3QgcHJvdmlkZXMgYSB2YWxpZCBjbG9jayBmcmVx
dWVuY3kgdG8gdGhlCj4+Pj4gZHJpdmVyLiBCdXQgSSdtIG5vdCBhZHZvY2F0aW5nIGZvciBpdHMg
dXNhZ2UgaGVyZSBhbnltb3JlLgo+Pj4+Cj4+Pj4gSGVuY2UgSU1PLCBhc3NpZ25pbmcgdGhlIHNh
bWUgUlBNX1NNRF9RUElDX0NMSyB0byBhbGwgMyBjbG9ja3MgaXMgbm90IHRoZSByaWdodAo+Pj4+
IGFwcHJvYWNoIGFuZCB3ZSBzaG91bGQgYmUgYXNzaWduaW5nIGEgc2luZ2xlIFJQTV9TTURfUVBJ
Q19DTEsgdG8KPj4+PiAnY29yZScgY2xrLgo+Pj4KPj4+IFlvdSBzYWlkIHVzaW5nIHRocmVlIHRp
bWVzIHRoZSBzYW1lIGNsb2NrIHdvdWxkIGJlIHdyb25nIGJlY2F1c2Ugd2UKPj4+IHdvdWxkIGdl
dCB0aHJlZSB0aW1lcyB0aGUgc2FtZSByYXRlIHdoZXJlYXMgaW4gcHJhY3RpY2UgaXQncyB3cm9u
Zy4gVGhpcwo+Pj4gbWVhbnMgdGhlIE9TIGhhcyBhY2Nlc3MgdG8gdGhlc2UgY2xvY2tzIHNvbWVo
b3csCj4+IAo+PiBObywgdGhlcmUgaXMgbm8gd2F5IHRoZSBPUyBjYW4gYWNjZXNzIHRoZXNlIDMg
Y2xvY2tzIGluZGl2aWR1YWxseSBvbiB0aGUgUlBNaAo+PiBlbmFibGVkIHBsYXRmb3Jtcy4gQnV0
IHRoZSBPUyBpbmRlZWQgaGFzIGFjY2VzcyB0byB0aGVzZSAzIGNsb2NrcyBvbiBub24tUlBNaAo+
PiBwbGF0Zm9ybXMgbGlrZSB0aGUgb2xkZXIgSVBRIG9uZXMuCj4KPiBJIHRoaW5rIFJQTWggaXMg
YSBiaXQgZGlmZmVyZW50IGNhc2UgdGhhbiByZWNlbnRseSBkaXNjdXNzZWQgU0NNSQo+IGZpcm13
YXJlIGxheWVyLCBhbHRob3VnaCBtYXliZSB0aGUgdHJ1ZSBkaWZmZXJlbmNlIGlzIGlycmVsZXZh
bnQgLQo+IHdob2V2ZXIgaW1wbGVtZW50cyB0aGUgY2xvY2sgaGFuZGxpbmcsIGl0IGlzIG5vdCBM
aW51eC4gQW55d2F5LCBpbiBjYXNlCj4gb2YgU0NNSSB0aGlzIGlzIHRoZSBzYW1lIGRpZSBoYXZp
bmcgZWl0aGVyIGZpcm13YXJlIG9yIE9TIGNvbnRyb2xsaW5nCj4gY2xvY2tzLgo+Cj4gSGVyZSB0
aGUgU29DcyAoSVBPIG9uZXMgd2l0aG91dCBSUE1oIGFuZCB0aGlzIG9uZSB3aXRoIFJQTWgpIGFy
ZSBkaWZmZXJlbnQuCj4KPiBJZiB0aGlzIHdhcyBzb21lIGJ1cyBkZXZpY2UgKEkyQywgU1BJIGV0
YyksIHRoZW4gSSB3b3VsZCBhcmd1ZSB0aGF0IHRoZQo+IGRldmljZSBwaW5zIG1hdHRlci4KPgo+
IEhvd2V2ZXIgdGhpcyBpcyBpbnRlcm5hbCBwYXJ0IG9mIHRoZSBTb0MsIHNvIHdoaWxlIGl0IHN0
aWxsIGhhcyBzb21lCj4gd2lyaW5ncywgdGhleSBhcmUgaGVhdmlseSBoaWRkZW4gb3IgYWJzdHJh
Y3RlZCwgdGh1cyBJIGFtIGZpbmUgd2l0aAo+IGFwcHJvYWNoIHRoYXQgY2xvY2tzIHJlcHJlc2Vu
dCB0aGUgY2xvY2sgaW50ZXJmYWNlcyBhdmFpbGFibGUgdG8gdGhlIE9TLAo+IG5vdCB0aGUgcGh5
c2ljYWwgd2lyZXMgaW5zaWRlIFNvQy4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoaXMgZmVl
ZGJhY2suIEkgdW5kZXJzdGFuZCB0aGUgcmF0aW9uYWxlLCBhbmQKd2lsbCBrZWVwIHRoYXQgaW4g
bWluZCBmb3IgZnV0dXJlIHJldmlld3MuCgpCZXN0IHJlZ2FyZHMsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
