Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC47D41D71
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 09:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHbUTQkh0JmsyCyi2dR3/CXU1dXZekexhQzayED3QFQ=; b=Z0ddZD+Cnz3sOA
	BdfK+hEOjyOcs8RYsBPM7383LHl+TkTDa92tIcxW+Ma93I8JwMkq+KpuiC4rNn3s8j4jkfC7gt5/e
	pZ774L5HgZjVjDG6DHfe9MnDFGFBHrwQHEQ1KGSdw1GVAQ+lagPLbQAk9zC902GpSiaQtKG3ectxa
	dalB0hAK21tBBFmAgjgF2w4Sw+rktbWggg5F8Ttuk1ebicFKtWtECm48J7OtluTgZ7vx9lMXKirMV
	IadFd6dhY8cQ46gUN6FiA0IqwPuOp1nUXV3FFawvCnxL+ghAb90aK/Hdsxg0Ls3F5ke9qJLJuw3Rk
	v3SZTqdWtc/HjRfqQvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmy3-00000002m8O-3W2R;
	Tue, 12 Nov 2024 09:13:47 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmy0-00000002m6M-2qxi
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 09:13:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04880FF809;
	Tue, 12 Nov 2024 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731402819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ER+7FX/9Nod9Sg27NegOBZNs3ThKfuC8FsDnwd7chh0=;
	b=JXwMu+2zLmBEwJaGScgEpZDGC5L5SS5w6DhO5OXn/6y8de1s7tROrsKtOVa7hdLwXZgOxo
	ILO3TronxMnvpYWCnC1Bg4pLJuP6Gqvb3RFMh8LJ/0h7K9dQ/i0wxKNapvK27dyPZmUSiH
	a/01UKFt+/LbyFTEw9/hibgyD/iDRd9ASygWUFpFDv4+0dJrvwUkN5V63jWenKv1X48kh8
	QXsbZCLnGmqN0pnfgaejBudtYfrouqT4+h7K4Vew3GjYOnOhU6qXYaKoY9kn5T9vE+n0ll
	50ZbwK1Zp2SGNa2IXa/c5aKTTtaio1wZvSIB2V4EO/8pJWtorhl2gq9EzmndYg==
Message-ID: <07cd5d53-ce99-4ada-a7f1-53795eff5c42@bootlin.com>
Date: Tue, 12 Nov 2024 10:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] memory: ti-aemif: Export aemif_set_cs_timings()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
 <20241106085507.76425-3-bastien.curutchet@bootlin.com>
 <87ttcdr2ym.fsf@bootlin.com>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <87ttcdr2ym.fsf@bootlin.com>
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_011345_008278_4B16E8B9 
X-CRM114-Status: GOOD (  13.17  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCk9uIDExLzExLzI0IDg6MjEgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
Cj4gSGVsbG8gQmFzdGllbiwKPiAKPiBPbiAwNi8xMS8yMDI0IGF0IDA5OjU1OjAzICswMSwgQmFz
dGllbiBDdXJ1dGNoZXQgPGJhc3RpZW4uY3VydXRjaGV0QGJvb3RsaW4uY29tPiB3cm90ZToKPiAK
Pj4gRXhwb3J0IHRoZSBhZW1pZl9zZXRfY3NfdGltaW5nKCkgc3ltYm9sIHNvIGl0IGNhbiBiZSB1
c2VkIGJ5IG90aGVyCj4+IGRyaXZlcnMKPj4KPj4gQWRkIGEgc3BpbmxvY2sgdG8gcHJvdGVjdCB0
aGUgQ1MgY29uZmlndXJhdGlvbiByZWdpc3RlciBmcm9tIGNvbmN1cnJlbnQKPj4gYWNjZXNzZXMu
Cj4gCj4gV2hhdCBjb25jdXJyZW50IGFjY2Vzc2VzIGFyZSB5b3UgdHJ5aW5nIHRvIHByb3RlY3Qg
eW91cnNlbGYgYWdhaW5zdD8KPiBJIGZhaWwgdG8gc2VlIHRoZSB1c2UgY2FzZSwgYnV0IFRCSCBJ
IGhhdmVuJ3QgdHJpZWQgaGFyZCBlbm91Z2ggbWF5YmUuCj4gCgpUaGUgcmVnaXN0ZXIgdGhhdCBo
YW5kbGVzIHRoZSBDUyBjb25maWd1cmF0aW9uIGJlbG9uZ3MgdG8gdGhlIEFFTUlGIApjb21wb25l
bnQgYnV0IGl0IHdpbGwgYWxzbyBiZSBhY2Nlc3NlZCBieSB0aGUgQUVNSUYgJ2NoaWxkcmVuJyB3
aXRoIHRoZSAKYWVtaWZfc2V0X2NzX3RpbWluZygpIGZ1bmN0aW9uLiBTbyBmYXIsIGNvbmN1cnJl
bnQgYWNjZXNzZXMgc2hvdWxkbid0IApvY2N1ciBiZWNhdXNlIHRoZSBBRU1JRiBjb25maWd1cmVz
IHRoZSBDUyB0aW1pbmdzIG9ubHkgb25jZSBhbmQgZG9lcyBzbyAKYmVmb3JlIHByb2JpbmcgaXRz
ICdjaGlsZHJlbic7IGJ1dCBJIGRvbid0IGtub3cgaG93IHRoaW5ncyBjYW4gZXZvbHZlIGluIAp0
aGUgZnV0dXJlLgoKPiBBbHNvLCB3aGF0IGp1c3RpZmllcyB0aGUgdXNlIG9mIGEgc3Bpbi1sb2Nr
IGluIHRoaXMgY2FzZT8KPiAKClRCSCwgSSBhbHdheXMgc3RydWdnbGUgdG8gY2hvb3NlIGJldHdl
ZW4gbXV0ZXhlcyBhbmQgc3Bpbi1sb2Nrcy4gSSBjaG9zZSAKc3Bpbi1sb2NrIGJlY2F1c2UgaXQg
b25seSBwcm90ZWN0cyBvbmUgbWVtb3J5LW1hcHBlZCByZWdpc3RlciBzbyBJIHRoaW5rIAppdCBk
b2Vzbid0IHdvcnRoIGdvaW5nIHRvIHNsZWVwIHdoZW4gd2FpdGluZyBmb3IgdGhlIGxvY2suCgoK
QmVzdCByZWdhcmRzLApCYXN0aWVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
