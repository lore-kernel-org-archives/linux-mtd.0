Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A954D5C0CD
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Dec 2025 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cfI+r/cRq0L1pjNti+Ct6CuTgB4Ll/NCVlA2G7MrMA=; b=G4cWGic9N1NVse
	LNUUFHEg3JRHfenMOChKmtHXW19gAb1v8brT5tX2cUrjYNxbHKcGDdcbmEuexSUu9mtpdEO5ft1BV
	el0YsOERjfg6KEM0Miq954iN3G3tAvIZIPQpRkWpXok1mOH9Jtp3EkrfxcGW3WpGGw5wotOp8iIuc
	xw/B6mj5uOjcVTR4woq/uojZqFZOBhbTPei1UBh1nOxuk08z7SjeJeK/hK1a56Hz7dCLnhxZ7fg4/
	gBCCzTrey51zo52Aj/U8GQpIsw1vSyXyfphqVU6ImyN4Hzu1XQqXbR6Gr1XSEl9KJBKNNZ1e7hsRO
	eCcpRZBLa09leZe6BCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQBA-00000004uDz-0xAc;
	Tue, 16 Dec 2025 08:13:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQB7-00000004uDZ-2lRN
	for linux-mtd@lists.infradead.org;
	Tue, 16 Dec 2025 08:13:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5445C19D30;
	Tue, 16 Dec 2025 08:12:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C6FB6071C;
	Tue, 16 Dec 2025 08:13:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B01FD11942FC6;
	Tue, 16 Dec 2025 09:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765872782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JS1bp9q60tJiFItdPRAoiXuaPpXIH1pa1HICS/H8bUA=;
	b=raQjYvy53gwIQeiS5Wd+n2/uEO1J/BSlmgAkiDDnXGjbT6Dv/Uafg4DvoJax4X2XSHJVvh
	23d+pUM4UONdYJ44TL7evqyYgc4+7yrEZL1ftIAGjqdWicFI9QfEfCpYCy1AMNmO2trjku
	gCuF77hevou9PUv8B7Nq7V3xcPtrqlkA+MxylYYajGbh7c7Y8DlwumRsPInLESpTL5jmw7
	vtX80/+CHfYkuolMu7JedClVt5bPbpyDSsOW0ED9+XaDjV8kqxfbSe1U8N71d39i9jrtWm
	mNn5v3xwQaOedwT0Zf6N97D+SzPhb1nHRJZ8w+5btFGfRuKJPXonc5v1pOHFZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Khairul Anuar Romli <khairul.anuar.romli@altera.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Eugeniy Paltsev
 <Eugeniy.Paltsev@synopsys.com>,  Vinod Koul <vkoul@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
  dmaengine@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add dma-coherent property
In-Reply-To: <e1aae851-4031-4b5c-a807-7a61ecfe6af1@kernel.org> (Dinh Nguyen's
	message of "Mon, 8 Dec 2025 20:31:58 -0600")
References: <cover.1764717960.git.khairul.anuar.romli@altera.com>
	<e1aae851-4031-4b5c-a807-7a61ecfe6af1@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 16 Dec 2025 09:12:57 +0100
Message-ID: <877bumsv3q.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_001305_861968_FEAB48DE 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

Cj4+IEtoYWlydWwgQW51YXIgUm9tbGkgKDMpOgo+PiAgICBkdC1iaW5kaW5nczogbXRkOiBjZG5z
LGhwLW5mYzogQWRkIGRtYS1jb2hlcmVudCBwcm9wZXJ0eQo+PiAgICBkdC1iaW5kaW5nczogZG1h
OiBzbnBzLGR3LWF4aS1kbWFjOiBhZGQgZG1hLWNvaGVyZW50IHByb3BlcnR5Cj4+ICAgIGFybTY0
OiBkdHM6IHNvY2ZwZ2E6IGFnaWxleDU6IEFkZCBkbWEtY29oZXJlbnQgcHJvcGVydHkKPj4gICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3NucHMsZHctYXhpLWRtYWMueWFt
bCB8IDIgKysKPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NkbnMs
aHAtbmZjLnlhbWwgICAgICB8IDIgKysKPj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3Nv
Y2ZwZ2FfYWdpbGV4NS5kdHNpICAgICAgICAgICAgICB8IDMgKysrCj4+ICAgMyBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKPj4gCj4KPiBBcHBsaWVkIQoKSGF2ZSB5b3UgYXBwbGllZCBh
bGwgMyBwYXRjaGVzPyBJZiB5ZXMsIHdoZXJlPyBJdCBoYXBwZW5lZCBkdXJpbmcgdGhlCm1lcmdl
IHdpbmRvdyBidXQgSSBzZWUgbm90aGluZyBpbiB2Ni4xOS1yYzEuIEkgd2FzIGFib3V0IHRvIHRh
a2UgdGhlIG10ZApiaW5kaW5nIHBhdGNoLCBidXQgaWYgeW91IHRvb2sgaXQgYWxyZWFkeSB0aGF0
J3MgZmluZSwgSSdsbCBtYXJrIHRoaXMKc2VyaWVzIGFzIGFscmVhZHkgYXBwbGllZC4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
