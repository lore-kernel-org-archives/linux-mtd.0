Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF69AC87FCC
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Jul 2025 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6WFKBpNRvGx2KaKZOiULLy5PM12o5G4Vx1qOFWAY5A=; b=xT8L+oNzJGEZjs
	z5+rVS60+gt1gKn2HgSSsarYROk2oZKSmAeAuK0J4sKvC925k7mc5jc+issSERNXMX6eH9ha6Y6J9
	rqbWobCeqVrGgRFeoDZYZAV6//Zae704dATrwXG+S52nF2lXIWuaxg8wMQFKzd2YHTGBc5qVUsSqC
	kLdoy7aBOMwsJB7B6dG27LqMfKPgM4Gqgl8hJeO4S9qyjEzkLpB/qemMFEaE4LplKKsfbf0ja8GVe
	yhA3wo9p85ejuk9gvLJcLXuON5nn+/b0ICf1x19oMwt6QiRIoCtGkDuQS6dEroebjVPe3q5eqpNiK
	tqfQn99olL+TZicOK17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug7wq-0000000DCLT-05Sr;
	Sun, 27 Jul 2025 20:26:20 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug7wl-0000000DCKt-345r
	for linux-mtd@lists.infradead.org;
	Sun, 27 Jul 2025 20:26:16 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bqtRN5Gk2z9scL;
	Sun, 27 Jul 2025 22:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753647968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVqjetrkruUe9JYviGggH7WtL8pQ7Lddsrbp4Xeri80=;
	b=mbkFk88cUhr8yUpYFnvFyHoRMZwVzFl7ZmlDyWPraJYGpRvaDwc310f/sX/24Gyp2/2T1K
	Z3J8qZ0YgL91XVVsLcec0GWBFln/NwksWx1K9rhAM85867/E/6uyCl2imuu1pKuDNcxvT0
	gy9kGsjY1KF6WFjZ4dRk8y0cmft6S8B1ez6i0w48Ru2HGpj0ABLi3YXij8CV6dyq3W1uIb
	OZ4nR2+uYcRYjSrvY9FGvcSgEIsYt17zEnwZp4XGFQQWrKT1LOFJgq1N2yvVl6GoRPfKiL
	sEBPDLqkIiMoBXcnkyM/Y+zAKTZibEsliGIi0jepWUYS08tvDN8MxQeRIh7YZw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=uxwoLRAM;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <0d0cd3cb-61e5-4ec6-958b-ec48b82429bf@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753647966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVqjetrkruUe9JYviGggH7WtL8pQ7Lddsrbp4Xeri80=;
	b=uxwoLRAMja5/+qIvB5BOrKRros6quYAHEzVx7j14Flhg+xyTOnSP4gDMGAJqhuRUNsczy4
	8n4DfZ+CC2S0RAvKhwZ8GGlqpbFwqkAZurzSp5mI5af95pjWXps1BpQr6NXSdQT1Oxjb4y
	F6cUgzixSf993iszkCTPn9wtqcJswE4WZuFm0SJauDBSX4OvK7AyExdq20PiWMyKZpBPOI
	RY13MtNgTgIoLqCX+AOJzPbHygdV6tM2B5/e8Vz/Nx89iKLQd02+u4jrEuOleMm7+uLYl+
	wW+vQi7h/IrfX8eoDe80EQMm4QiOuoisfQeDBWqZcqsU+PTklWMZugnYfwVqaQ==
Date: Sun, 27 Jul 2025 22:26:04 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
To: Michael Walle <mwalle@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
 <9eabfe619554cbdd493086dcffef8f44@kernel.org>
 <62383ff7-0a14-4f15-818b-f5e5c56332c5@mailbox.org>
 <DBJ86H8MDFNX.2Y6T55E0NH63R@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DBJ86H8MDFNX.2Y6T55E0NH63R@kernel.org>
X-MBO-RS-ID: c7f887b48f46c31999d
X-MBO-RS-META: enizhpo9cnkw6gcodok8afkhzh1januq
X-Rspamd-Queue-Id: 4bqtRN5Gk2z9scL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_132615_955632_7B4A8FF2 
X-CRM114-Status: GOOD (  15.45  )
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

T24gNy8yMy8yNSA4OjM2IEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IE9uIFR1ZSBKdWwgMjIs
IDIwMjUgYXQgNDoyOCBQTSBDRVNULCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gNy8yMi8yNSAx
MDo0MyBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEhpIE1hcmVrLAo+Pgo+PiBIaSwKPj4K
Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYwo+Pj4+ICsrKyBiL2RyaXZl
cnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4+Pj4gQEAgLTM0Myw2ICszNDMsMTAgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvCj4+Pj4gd2luYm9uZF9ub3JfcGFydHNbXSA9IHsKPj4+
PiAgwqDCoMKgwqDCoMKgwqDCoCAuaWQgPSBTTk9SX0lEKDB4ZWYsIDB4ODAsIDB4MjApLAo+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgIC5uYW1lID0gIncyNXE1MTJud20iLAo+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgIC5vdHAgPSBTTk9SX09UUCgyNTYsIDMsIDB4MTAwMCwgMHgxMDAwKSwKPj4+PiArwqDC
oMKgIH0sIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgLyogVzc3UTUxTlcgKi8KPj4+PiArwqDCoMKg
wqDCoMKgwqAgLmlkID0gU05PUl9JRCgweGVmLCAweDhhLCAweDFhKSwKPj4+PiArwqDCoMKgwqDC
oMKgwqAgLm90cCA9IFNOT1JfT1RQKDI1NiwgMywgMHgxMDAwLCAweDEwMDApLAo+Pj4KPj4+IERp
ZCB5b3UgYWxzbyB0ZXN0IHRoZSBPVFAgcmVhZCBhbmQgd3JpdGU/IEknZCBndWVzcyBzbywgYmVj
YXVzZSBvdGhlcndpc2UKPj4+IHlvdSB3b3VsZG4ndCBuZWVkIHRoYXQgZW50cnkgYXQgYWxsLCBy
aWdodD8gT3IgaXMgaXQgYmVjYXVzZSBvZiB0aGUKPj4+IHdpbmJvbmRfbm9yX2xhdGVfaW5pdCgp
IHdoaWNoIHdpbGwgYmUgY2FsbGVkIGFzIGEgbWFudWZhY3R1cmVyIGZpeHVwPwo+Pj4gSW4gdGhh
dCBjYXNlIHdlIGNvdWxkIGRvIHRoZSBzYW1lIGFzIGluIGNvbW1pdCBhZmUxZWExMzQ0YmIgKCJt
dGQ6IHNwaS1ub3I6Cj4+PiBhZGQgc3VwcG9ydCBmb3IgTWFjcm9uaXggT2N0YWwgZmxhc2giKS4K
Pj4KPj4gSSBoYXZlIGxpbWl0ZWQgc3VwcGx5IG9mIHRoZXNlIGRldmljZXMsIHNvIE9UUCBpcyB1
bnRlc3RlZC4gVGhlIGZsYXNoCj4+IGRvZXMgaGF2ZSBPVFAgcmVnaXN0ZXJzLCB0aGF0J3Mgd2h5
IHRoZSAub3RwIGVudHJ5IGlzIHRoZXJlLiBXaHkgc2hvdWxkCj4+IEkgcmVtb3ZlIGl0IGlmIHRo
ZSBPVFAgcmVnaXN0ZXJzIGFyZSBpbiB0aGUgY2hpcCA/Cj4gCj4gV2Ugb25seSBhZGQgdGVzdGVk
IGZlYXR1cmVzLiBJJ20ganVzdCB0aGUgbWVzc2VuZ2VyIGhlcmUgOm8uIEFueXdheSwKPiBPVFAg
aXMgbm90IHJlYWxseSBvbmUtdGltZS1wcm9ncmFtbWFibGUgaGVyZSwgeW91IGNhbiB3cml0ZSBh
bmQKPiBlcmFzZSBpdCBhZ2FpbiBhcyBsb25nIGFzIHlvdSBkb24ndCBsb2NrIGl0LCBpZiB0aGF0
IHdhcyB5b3VyCj4gY29uY2Vybi4KClNvIGhvdyBkbyBJIHRlc3QgdGhlIE9UUCB3aXRob3V0IGxv
Y2tpbmcgaXQgPwoKLS0gCkJlc3QgcmVnYXJkcywKTWFyZWsgVmFzdXQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
