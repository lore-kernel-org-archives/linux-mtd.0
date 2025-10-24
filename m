Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93BACCD1AB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 09:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4gKeiuTbtPJj9/BHeuPmISVmOG/oULLP79T5GcXqjc=; b=uzA2SAUkVWhQNH
	WPFLr7uQz9JKh74abhuD56q6mkwLDKJUeOTL2+ShPSOWP/abb8ZVdbrLDfHGQ6zZAFkTde2kEinGF
	sSL+dPKzkrM8APCboYpBLxAlYVFJjS7WXNy+o80FKfn6hwwAMDD80BF93qy5oJVS/nWQlQoxd34E3
	WDhL27m3QC6dIM1KKmzsMmtArmQ0EketKJPe7ssN4IFKkXFuzzmuylIW5u6P4lb1ZqdbpBUKt1r1/
	LyzqXjnw5xnSsw272+XH/S8ghWDJhaXL8sQuEyBtUgTuaCHn5F3bHtHekaH4tCLBWByUDhxHuX/pu
	eZQi52uM7f1ODIzAkc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDnM-00000008pK1-3VSY;
	Fri, 24 Oct 2025 09:09:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDnJ-00000008pFa-3XYH
	for linux-mtd@lists.infradead.org;
	Fri, 24 Oct 2025 09:09:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C234B4E412D0;
	Fri, 24 Oct 2025 09:09:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96E7B60703;
	Fri, 24 Oct 2025 09:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 876B8102F2465;
	Fri, 24 Oct 2025 11:08:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761296945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tAbjKjhcDfGtn2/zGatVn9Yy3ReIVrMyjwO7fZd2L1s=;
	b=ggefOGsgpiVYyF0A3GE6TACY+UYwP2pgRZuAOmS8vR4gYC0oJOS70Lt46N5pEU86oQOzsw
	zxshp2tqPIobCsAoLCPJfm7PDjpY19gXfPrtq0zS33GwSX/LM/6uoAKMTH0tYrZfkFVyZQ
	nY2RQw3SxggVF9teOpRRtGVLP5evJ4UkjhqR6E/1E1sqVYw5A2xojF1Tu7ZW5kLXQsuVzF
	exs2+bOMNrk3HAEwDEazo40qEFbyaXQicieeCuWJzzO4NeN0VeCiSGJCWgF0iU+aAnu93K
	YJsetl3/TxCCaUdeycGVB/cCbWMzCowcUwhc574+swKaMU/mav9s09Qk0Pvd1A==
Message-ID: <a231f2a4-1cc4-4e40-8560-f0cb72b21f1a@bootlin.com>
Date: Fri, 24 Oct 2025 11:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-15-richard.genoud@bootlin.com>
 <878qh3thqo.fsf@bootlin.com>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <878qh3thqo.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_020910_025874_B931BDDB 
X-CRM114-Status: GOOD (  12.17  )
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

TGUgMjIvMTAvMjAyNSDDoCAxMToyMCwgTWlxdWVsIFJheW5hbCBhIMOpY3JpdMKgOgo+IEhpIFJp
Y2hhcmQsCj4gCj4gT24gMjAvMTAvMjAyNSBhdCAxMjoxMzoxMCArMDIsIFJpY2hhcmQgR2Vub3Vk
IDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4gd3JvdGU6Cj4gCj4+IFRoZSBINjE2IE5BTkQg
Y29udHJvbGxlciBpcyBxdWl0ZSBkaWZmZXJlbnQgZnJvbSB0aGUgQTEwIGFuZCBBMjMgb25lcywK
Pj4gc29tZSByZWdpc3RlcnMgb2Zmc2V0IGNoYW5nZWQsIGFuZCBzb21lIG5ldyBvbmUgYXJlIGlu
dHJvZHVjZWQuCj4+IEFsc28sIHRoZSBETUEgaGFuZGxpbmcgaXMgZGlmZmVyZW50IChpdCB1c2Vz
IGNoYWluZWQgZGVzY3JpcHRvcnMpCj4+Cj4+IFNvLCBpbnRyb2R1Y2UgYSBuZXcgY29tcGF0aWJs
ZSB0byByZXByZXNlbnQgdGhpcyB2ZXJzaW9uIG9mIHRoZSBJUC4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogUmljaGFyZCBHZW5vdWQgPHJpY2hhcmQuZ2Vub3VkQGJvb3RsaW4uY29tPgo+PiAtLS0KPj4g
ICAuLi4vbXRkL2FsbHdpbm5lcixzdW40aS1hMTAtbmFuZC55YW1sICAgICAgICAgfCA0MSArKysr
KysrKysrKysrKysrKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gUGxlYXNlIG1vdmUgdGhlIGJpbmRpbmcgcGF0Y2ggZmlyc3QgaW4g
eW91ciBzZXJpZXMgKGJpbmRpbmcgdGhlbiBkcml2ZXIKPiBjaGFuZ2VzIGFsaWduZWQgd2l0aCB0
aGUgaW50cm9kdWNlZCBiaW5kaW5nIGFuZCB0aGVuIERUIGNoYW5nZXMgdXNpbmcKPiBpdCkuClll
cywgc29ycnksIGl0IHRvb2sgdGltZSBidXQgbm93IEkgZ290IGl0IDopCgo+IAo+IFRoYW5rcywK
PiBNaXF1w6hsCj4gCgpUaGFua3MhCgotLSAKUmljaGFyZCBHZW5vdWQsIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
