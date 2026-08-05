Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C46C55ABA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtcX+znmijxDCf0OXcP+hROdqhRAKIRhPQ4Z62BPcNw=; b=r01877yBDmPouE
	NDNmYYHecUxLmZs1YzaunQmexXZVUBGHdBnfWJwDNiA7fXi9+lyPhCYLmrOavslSbw1TSX6uTwtUj
	WKw8bgJDToHGbMkeFV6Dwg3h1PqPYtEwuikp8xOMZePaf35Idu9CrkmEkXcM2qCGe9VG5z629ARPF
	qPJbhbBiiJKBTuxxVptZof7w2UfRo4ovSjiQtAXXM8W3rw0wJawa0o38xYh2nIwQCqgLs7BV9rK/h
	30ENGGOAwz9nZeICd2ESwUW5toiZyWnxZoNMKonJV6LWCpzVJnxTXjL0rybvH+TKW23EqVT5Lg53V
	QS+QlLPerEkyU5zcqatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcF9-000000042dD-0W69;
	Wed, 05 Aug 2026 14:05:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcF4-000000042cT-2Lak;
	Wed, 05 Aug 2026 14:05:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C09AE1A143D;
	Wed,  5 Aug 2026 14:05:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 933BF602AB;
	Wed,  5 Aug 2026 14:05:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F3A711C34B9D;
	Wed,  5 Aug 2026 16:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785938699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8QHlmUCfRMDCYm4XCbQfPD+NoA9p8cr7Dg0SwC6Cnx0=;
	b=XGJPsma+bnubqu0Y6npEobey93rSQjtfyKimTrfqnFkKWCI2D55QBPmGtJlUEIf7u79HA3
	wXEsV9K45d5Uqe5XaUZHhHHNz1icvH6uAqIRawZ22GeMVzoYNLvhHIwmrQzy7AN3Ewmjex
	24WPVMllDLyiQs93uqmL+okucUPonNeWIaNSusxLbf5hwcKeVjO1Qd24zzUyzVwbu0r96l
	AS5FOYEOmR/kEGmCqXy5ZiSar8yxCtv75Qr8ZJDHbePj2MRZyttApLe/mzveURS7plHeb3
	YsCDBAqds8pkCOAyO7J7a9lIvORf0x1UZtwfeJl+oEF5B+b97QDpGK5eskUHJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Steam Lin" <STLin2@winbond.com>,  "Hsin-Yi
 Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] mtd: spi-nor: Refactor Read Status/Write Status
 support
In-Reply-To: <87mrv2exwp.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 04
	Aug 2026 16:57:26 +0200")
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com>
	<DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org> <87mrv2exwp.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 05 Aug 2026 16:04:52 +0200
Message-ID: <87y0ekek8r.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_070510_832406_8C79F9F0 
X-CRM114-Status: GOOD (  10.04  )
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

SGVsbG8gTWljaGFlbCwKCj4+PiAraW50IHNwaV9ub3JfcmVhZF9zcnMoc3RydWN0IHNwaV9ub3Ig
Km5vciwgdTggKnNyMSwgdTggKnNyMikKPj4KPj4gbml0cGljaywgaSB0aGluayB0aGlzIGlzIGEg
d2VpcmQgbmFtZS4gQnV0IG1heWJlIGl0J3MganVzdCBtZS4KPj4KPj4gV2hhdCBpZiB3ZSdkIGp1
c3QgbWFrZSB0aGUgb25lIHN0YXR1cyByZWdpc3RlciBhcyB1MzI/IEkgbWVhbiBpbiB0aGUKPj4g
d2luYm9uZCBkYXRhc2hlZXQgaXQncyBjYWxsZWQgUzctUzAgYW5kIFMxNS1TOC4gVGhhdCB3YXkg
d2UgYWxzbwo+PiBkb24ndCBuZWVkIGEgdHdvIGJ5dGUgcWVfbWFzay4gVG8gb3B0aW1pemUgdGhl
IHN0YW5kYXJkIHVzZWNhc2UgdG8KPj4gcG9sbCB0aGUgV0lQIGJpdCwgd2UgY291bGQgYWRkIGEg
Ynl0ZSBtYXNrLgoKSSBleHBlcmltZW50ZWQgYSBiaXQgdGhlIHUzMiBzdGF0dXMgcmVnaXN0ZXIs
IEkgZG9uJ3QgdGhpbmsgaXQgaXMgYSBnb29kCmlkZWEuCgpNeSB0YXJnZXQgb2YgaW1wcm92aW5n
IHRoZSByZWFkYWJpbGl0eSBpcyBjb21wbGV0ZWx5IGRlZmVhdGVkIGJ5IHRoZQpmYWN0IHRoYXQ6
Ci0gYWxsIHRoZSBjYWxsZXJzIG5lZWQgdG8gYWRkIGV4dHJhIG1hdGhzIHRvIGV4cGxhaW4gd2hh
dCBTUgogIHRoZXkgd2FudAotIGVuZGlhbm5lc3Mgc2hhbGwgYmUgaGFuZGxlZCwgcGVvcGxlIGFs
d2F5cyBnZXQgaXQgd3JvbmcgKGluY2x1ZGluZwogIG1lKSwgc28gd2h5IGJvdGhlciBpZiBhbiBh
cnJheSBqdXN0IG1ha2VzIHRoZSB3aG9sZSB0aGluZyBzaW1wbGVyPwotIDE2LWJpdCBhY2Nlc3Nl
cyBnZXQgbW9yZSBjb252b2x1dGVkLCB3ZSBuZWVkIGV4dHJhCiAgZ2V0Xy9wdXRfdW5hbGlnbmVk
X2xlMzIoKSBjYWxscyBhbmQgcGFjay91bnBhY2sgYnl0ZXMgaW4gdGhlIGhvdCBwYXRoCi0gOC1i
aXQgYWNjZXNzZXMgaW1wbHkgYW4gZXh0ZW5zaXZlIHVzZSBvZiBGSUVMRF9HRVQoR0VOTUFTSygp
LCkgbWFjcm9zLAogIHdoaWNoIG1ha2UgdGhlIHdob2xlIGZvbmN0aW9uIHRvdGFsbHkgbm9uIG9i
dmlvdXMgYW55bW9yZS4KCldoZXJlYXMsIGEgc2ltcGxlOgoKICAgICAgICBpZiAoc3IyKQogICAg
ICAgICAgICAgICAgKnNyMiA9IGZvbzsKCmlzIHNlbGYgZXhwbGFuYXRvcnkuIEkgYWxzbyBkbyBu
b3QgcmVhbGx5IGdldCB0aGUgd2lzaCBmb3IgYSBRRSBtYXNrCmluc3RlYWQgb2YgYSB0d28gYnl0
ZXMgYXJyYXkuCgpTbyBJIHdpbGwgcmVuYW1lIHRoZSAic3JzIiBuYW1pbmcgdGhhdCB5b3UgZGlz
bGlrZSwgSSB3aWxsIGdyb3VwIHRoZQpvcGNvZGVzIGluIGEgYmlnIHN0cnVjdHVyZSwgY2hhbmdl
IHRoZSBiYXNlbGluZSBkZWZhdWx0IHRvIG1hdGNoIHlvdXIKc3VnZ2VzdGlvbiBhbmQgZm9sbG93
LXVwIHdpdGggdGhlIG90aGVyIG1pbm9yIGNvbW1lbnRzLCBidXQgSSBiZWxpZXZlCkknbSBnb2lu
ZyB0byBhdm9pZCB0aGUgdTMyIHN3aXRjaC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
