Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D797C61DBD
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 12:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ludQch2GdBgzEc03EDobW31fAtRRjNTWyt//1i11r5E=; b=JFkQa6MVtvD9NS
	EuUZtrU0vhIS8AA8bWMRyOo6Pl81av5q49Gh1Y8xZS89fpW34ODzAp1Clb9eku0XV6Z4XQoDwh7RB
	o/gM3eHAAtCxzXGaIPlTQVMtb2QYEP0JfdmWw40go7xlojCU1yMYlMqYG25ZcUODHxNioItL6CI22
	6IqitokgI4KCXdIXSIpYkrJ8vt41J3xQG4UP/I5vt3Ix30PsT/gs0BXbJcHZbPc0UMYSDiqudjr42
	iJVBVBtvdhnWOwRX0ygu924zc9JfguicC39kadqA9mk9aPQM6dvq1BA4WbJk2QZqdU6UP+dYguPjk
	Jb7Y9oMqjO7RX6qzUGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyq2w-00000000k3h-3iLa;
	Tue, 25 Aug 2026 12:14:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyq2u-00000000k3B-2Jbf
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 12:14:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D039B4E412F2;
	Tue, 25 Aug 2026 12:14:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1CC8604C4;
	Tue, 25 Aug 2026 12:14:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6F1C11C792A0;
	Tue, 25 Aug 2026 14:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787660059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7Qo5wLWIEWTr/6C+cPa6RtgusYfrnHlrypu6Z2ulQDE=;
	b=VzLWycSvnwVGhYKriL14aDoBiQcJVY3Ha9I1o15T5EhZRM0TNRq9BAIRKhrUZNZhFW8Fda
	UJ4QrqGXplewV56VdqdUOiVwRpal6tPjXfoh7SXifTy1HWcHGSviBiB2I+roOHgTLBClt+
	UbUtjaxL4ZTsmhKW1U+GZMYNFr3ujazqfMT7t6Rv/U71wvr5BidhqoVfi0LiV/szGwfIz8
	7JaINxZfKGYN/nc1AUZAvfqEpBgt6ii98aCX0V93oOjfPeaiiVHWh/Dlhs5iPXnZgi0BFd
	M4sGACutrG4f8yZu1cbLX337chXVmgQFS4Ig3MbdFhLGcJQckdv9GeKoH38tpQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v7 16/18] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
In-Reply-To: <0a18a8b8-2e93-4375-a2ae-3e7316cbaab8@ti.com> (Santhosh Kumar
	K.'s message of "Tue, 18 Aug 2026 23:43:31 +0530")
References: <20260811183313.1550425-1-s-k6@ti.com>
	<20260811183313.1550425-17-s-k6@ti.com> <87bjb6l8nr.fsf@bootlin.com>
	<0a18a8b8-2e93-4375-a2ae-3e7316cbaab8@ti.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 14:14:07 +0200
Message-ID: <875x0yiei8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_051428_731782_634AB339 
X-CRM114-Status: UNSURE (   8.73  )
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

Cj4+PiArCQlpZiAoIXJldCAmJiBzcGluYW5kLT5tYXhfcmVhZF9vcC5tYXhfZnJlcSkgewo+Pj4g
KwkJCWlmIChpZmFjZSA9PSBPRFRSKQo+Pj4gKwkJCQlzcGluYW5kLT5vZHRyX29wX3RlbXBsYXRl
cy5yZWFkX2NhY2hlID0gYmVzdDsKPj4+ICsJCQllbHNlCj4+PiArCQkJCXNwaW5hbmQtPnNzZHJf
b3BfdGVtcGxhdGVzLnJlYWRfY2FjaGUgPSBiZXN0Owo+Pj4gKwkJCXNwaW5hbmQtPmNvbnRfcmVh
ZF9wb3NzaWJsZSA9IGZhbHNlOwo+PiBXaHkgZG8geW91IGRpc2FibGUgY29udGludW91cyByZWFk
cz8gSSBrbm93IGl0IGlzIG5vdCB0aGUgc2FtZSBhcyB0aGUKPj4gcmVhZCB0ZW1wbGF0ZSwgYnV0
IGl0IG9ubHkgZGlmZmVycyBieSBhIGZldyBkdW1teSBjeWNsZXMsIHNvIGV2ZXJ5dGhpbmcKPj4g
c2hvdWxkIHdvcmsgYXMgZXhwZWN0ZWQuIEkgYmVsaWV2ZSB3aXRob3V0IGNvbXBsZXhpZnlpbmcg
bXVjaCB0aGUgbG9naWMKPj4gd2Ugc2hvdWxkIGJlIGFibGUgdG8gc3VwcG9ydCBpdC4KPgo+IFll
YWgsIHJpZ2h0ISBObyBuZWVkIHRvIGRpc2FibGUgY29udGludW91cyByZWFkIGFzIHRoZSBvbmx5
IGRpZmZlcmVuY2UKPiBpcyB0aGUgZHVtbXkgY3ljbGUgY291bnQsIG15IGJhZCEKPgo+IEkndmUg
dXBkYXRlZCB0aGUgbG9naWMgdG8gcmUtcGFpciBjb250X3JlYWRfY2FjaGUgd2l0aCB0aGUgc2Vs
ZWN0ZWQKPiByZWFkX2NhY2hlIHZhcmlhbnQgYmFzZWQgb24gdGhlIHByb3RvY29sIHNoYXBlLCB3
aGlsZSBpZ25vcmluZyBkdW1teQo+IGN5Y2xlcy4gVGhpcyBrZWVwcyBjb250aW51b3VzIHJlYWQg
ZW5hYmxlZCB3aXRob3V0IGFueSB1bm5lY2Vzc2FyeQo+IGNvbXBsZXhpdHkuIEknbGwgaW5jbHVk
ZSB0aGlzIGluIHY4LgoKRXhjZWxsZW50LCB0aGFua3MhCgpNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
