Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B36CCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIKxx4cmlf3uvuCfME8b6/HdO71eStT+5cv7Z6C9vr0=; b=iV+0/KePxTxcmv
	7KbBNAEQW6jZ8JfKCcX5S0+OLrvA2rrsRvSBuPlpl4alUFA8XuRpSCv/tb7Xp/WFQ69OALzruT/1r
	QlZ1zxHWBIdxjOgN1bGbbWaUbKhq8E0UtK8bDyso82cRJk3hqirgWUo+JA+mquuOqZR9gxG0dBYcD
	8O28mWQU+sKm5MhkrQ8+JGne185jd8JSDYyUQAJ8RRMqxC2V5ZZfzg9VIH6qvZyDwFHyJ0dpuqrIT
	hJ9rXKIDVHXgXfR721kJObVZPmvsmXoKaujw503O2imkyEmd2eC9d5jn53t4RuuEmsfqmRpM3hGjE
	ngiGf4Gu3ynHOUY3VlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBV1h-00000002FQK-0Mxh;
	Wed, 22 Oct 2025 09:21:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBV1d-00000002FPN-3rTP
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 09:20:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DC1804E41268;
	Wed, 22 Oct 2025 09:20:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0D45606DC;
	Wed, 22 Oct 2025 09:20:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1794D102F2431;
	Wed, 22 Oct 2025 11:20:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761124854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eHlP+N8MaWcT1YqqHBfX7bz2ZZfGvtWUZIn+21jD6Gs=;
	b=erNkwFCAkRFjaCf2oyUivOub+gdPX16PZmEEWEZLvuhwpXm6I/Z3WCmtWxue3XYiY8380i
	rAzFBUTDYvUDqzgowQ/DS841hHO6nYltJgJufahq0+5u1e5TskGHD/Y8zUfFFoNcgzfdSi
	9gsG+qjYOzLgcP53U5M1YbGBvZJOs/Fd28fTd/8uPlLQ1j6zaLF6i3nRO6xMRP/ufiIfxQ
	YRdniBbR92fgQ0dnLBLOaaJeWJyocvvfIUefMp/OYFov2NQzQ3QYy1RpopqLq5OPATFKbn
	FPJluRTC+HambRECsW4lb8MOpQnitaTKBF8z9IDTH1WGp17XnXVQFuPJkCONnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
In-Reply-To: <20251020101311.256819-15-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:10 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-15-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 11:20:47 +0200
Message-ID: <878qh3thqo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_022058_090387_7830F3A5 
X-CRM114-Status: GOOD (  10.12  )
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

SGkgUmljaGFyZCwKCk9uIDIwLzEwLzIwMjUgYXQgMTI6MTM6MTAgKzAyLCBSaWNoYXJkIEdlbm91
ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBUaGUgSDYxNiBOQU5EIGNv
bnRyb2xsZXIgaXMgcXVpdGUgZGlmZmVyZW50IGZyb20gdGhlIEExMCBhbmQgQTIzIG9uZXMsCj4g
c29tZSByZWdpc3RlcnMgb2Zmc2V0IGNoYW5nZWQsIGFuZCBzb21lIG5ldyBvbmUgYXJlIGludHJv
ZHVjZWQuCj4gQWxzbywgdGhlIERNQSBoYW5kbGluZyBpcyBkaWZmZXJlbnQgKGl0IHVzZXMgY2hh
aW5lZCBkZXNjcmlwdG9ycykKPgo+IFNvLCBpbnRyb2R1Y2UgYSBuZXcgY29tcGF0aWJsZSB0byBy
ZXByZXNlbnQgdGhpcyB2ZXJzaW9uIG9mIHRoZSBJUC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJpY2hh
cmQgR2Vub3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KPiAtLS0KPiAgLi4uL210ZC9h
bGx3aW5uZXIsc3VuNGktYTEwLW5hbmQueWFtbCAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysr
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
ClBsZWFzZSBtb3ZlIHRoZSBiaW5kaW5nIHBhdGNoIGZpcnN0IGluIHlvdXIgc2VyaWVzIChiaW5k
aW5nIHRoZW4gZHJpdmVyCmNoYW5nZXMgYWxpZ25lZCB3aXRoIHRoZSBpbnRyb2R1Y2VkIGJpbmRp
bmcgYW5kIHRoZW4gRFQgY2hhbmdlcyB1c2luZwppdCkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
