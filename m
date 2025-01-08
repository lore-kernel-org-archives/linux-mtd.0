Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A53E77188
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2025 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkIrT8/M1+C/E9D8HIMRQ3ztbrkNmZfENmsyntVGj6I=; b=oTGB76swrLO8tO
	3778SNmppjCvYz0AQiT58rWWs+IlOGZChcT56dDI19NwTMXMu1PtoSWi9/kMNlWEndnI0rUhar3JK
	GsgoZkI9AaCxfYqxqF796yUc56+qdlqhVAXJwfAVFcUbRtmT29S3YI06hujNOex13fd/LFp8wKAfI
	Vot9U5n80WRGUfFRAWZ4XSHT1qQgYgMtEppgkm3vxlQcKXlDiCxux/LhD8Y4IhrI1pVVO++j7ZpYC
	U1D977wEDSPgFu4TkXmV1ue4JGFIGGIcqttwH4HEZEVj0FEjnCgTYDw334clU9GWoHznMK/Br6U5M
	v2zMsKVsIotEJZsbKb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVahF-00000009VnX-1Ryn;
	Wed, 08 Jan 2025 18:22:25 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVahC-00000009VkT-3sQv
	for linux-mtd@lists.infradead.org;
	Wed, 08 Jan 2025 18:22:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10D61FF803;
	Wed,  8 Jan 2025 18:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736360538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=le5QEQ/DFOh99eUQD33pyz6znp5cwLwQiHbsdo17X5I=;
	b=lxueUb95vRHVLa8UhdsU167Ql++vzNsQgUX6VMWpZlP+WjCQYI4o+XnsQ6585x8Y7mDNFK
	Ci5n7pxELsL/b/QkNjz2A8Q//mXYH9kXOsvxYdKJBGWIvJQsxxNRpMLioHWgOwGk8YDAQL
	5i90ci0oMw+Oo0wp4+4qBmYCtysZ0/8jct9+NN4Gc6yjf+M5DXSHowNJgGPWLVvTjr1t+9
	QwyAlzBkookPn9Ia2FXpqptTxAmzEebx8zFB0H9sdJiKJPP0zGzI84jkYhHof7vRggrLra
	WMcl0CiE2CrlDx197UTFLJQRi4JYBTru1ABJsqNAkTT0z8WpdeE+R3JGWtoVjw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <mafs0zfkk7pfm.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	24 Dec 2024 21:15:41 +0000")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	<mafs0zfkk7pfm.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 08 Jan 2025 19:22:16 +0100
Message-ID: <87frltf9nr.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_102223_241916_DC4C23B3 
X-CRM114-Status: GOOD (  11.52  )
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

SGVsbG8gUHJhdHl1c2gsCgo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX290cF9vcHMg
d2luYm9uZF9ub3Jfb3RwX29wcyA9IHsKPj4gIAkucmVhZCA9IHNwaV9ub3Jfb3RwX3JlYWRfc2Vj
ciwKPj4gIAkud3JpdGUgPSBzcGlfbm9yX290cF93cml0ZV9zZWNyLAo+PiBAQCAtMzM0LDYgKzQx
Myw5IEBAIHN0YXRpYyBpbnQgd2luYm9uZF9ub3JfbGF0ZV9pbml0KHN0cnVjdCBzcGlfbm9yICpu
b3IpCj4+ICB7Cj4+ICAJc3RydWN0IHNwaV9ub3JfZmxhc2hfcGFyYW1ldGVyICpwYXJhbXMgPSBu
b3ItPnBhcmFtczsKPj4gIAo+PiArCWlmIChwYXJhbXMtPm5fZGljZSA+IDEpCj4+ICsJCXBhcmFt
cy0+cmVhZHkgPSB3aW5ib25kX211bHRpX2RpZV9yZWFkeTsKPj4gKwo+Cj4gSXMgdGhpcyB0cnVl
IGZvciBhbGwgbXVsdGktZGllIFdpbmJvbmQgZmxhc2hlcywgYW5kIGdvaW5nIHRvIGhvbGQgdHJ1
ZQo+IGZvciBmdXR1cmUgb25lcz8gSWYgbm90LCBJIHN1cHBvc2UgdGhpcyBzaG91bGQgZ28gaW4g
dGhlIGZsYXNoLXNwZWNpZmljCj4gZml4dXAgaG9vay4gRG8gaXQgaW4gZWl0aGVyIHRoZSBmbGFz
aC1zcGVjaWZpYyBsYXRlX2luaXQgaG9vaywgb3IgaW4gdGhlCj4gcG9zdF9zZmRwIGhvb2ssIEkg
aGF2ZSBubyBzdHJvbmcgb3BpbmlvbnMuCgpTbywgYWZ0ZXIgdGFsa2luZyB0byBXaW5ib25kLCBp
dCBhcHBlYXJzIHRoYXQgd2UgY2FuIHJlZHVjZSB0aGUgc2NvcGUgb2YKdGhpcyBmaXh1cCB0byB0
aGUgZm9sbG93aW5nIHBhcnRzIHdoaWNoIGFyZSBpbXBhY3RlZDoKLSBXMjVRMHsxLDJ9SlYKLSBX
MjVIMHsxLDJ9SlYKLSBXMjVRMHsxLDJ9TlcKLSBXMzVUMHsxLDJ9TlcKRnV0dXJlIGNoaXBzIGJl
aW5nIGZpeGVkIGluIGhhcmR3YXJlLgoKSSdsbCBwcm9iYWJseSB1c2UgdGhlIHBvc3Rfc2ZkcCBm
bGFzaC1zcGVjaWZpYyBob29rIGFzIHlvdSBzdWdnZXN0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
