Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD312CAC599
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Sep 2025 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6PodbijCpZ/o19vgyA/8IjdXGVM+h3IWntAlIowxu8=; b=v7kQkO7a1+EhhJ
	khSheFYRgI+fgx+SLThbS1sqW117KYF1lZ1Vr059qWDKvbHFPp/3nzP19XJ0yWtCezORCd9EpT7d5
	nB6lQZDwg9NalEiGpBytfIuCXBuMSXHPgdECpsaKfZaOI6vrk8SG9a28uzoKY+6rQ+iGwKl0dcrn/
	4ZeGqf4oBQy5ABLBj4hPOl2eEhgTpH68tpj1Mm5crvLv5xKMZvLehbw6UcVW7jmwXUQcCbKyRSnA2
	ydSqMfph2Fg7pgmEWG6tp1Zvvvwva2607LSTAcHWoBE3A0c5gSIQKN7esmn92iqQ2dVa1Q6ytHtkM
	ArJhCHF8XBfcJBcwcJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySh2-00000007Tzr-3izN;
	Tue, 16 Sep 2025 10:13:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySgz-00000007TzU-3RIl
	for linux-mtd@lists.infradead.org;
	Tue, 16 Sep 2025 10:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B43A540854;
	Tue, 16 Sep 2025 10:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08071C4CEEB;
	Tue, 16 Sep 2025 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758017624;
	bh=XE5aRf5elUQLlYab94MFaFajCUdS9gSnYBjmUZD5/Pc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ji+8rxXWnqJsAr4UPQwklYoyFxIaCMqAScuaBO41k0rrPh0k10Y33/U9TL8mv1p5V
	 a7nSfgm985Q40YTyGlD3hgYv5Ys9Euc6/LtWIuP2vMym5sNhMeHDkM3dIk2xGsPxON
	 vrJBAnzhHnFeQ4w2MWNHO0BD+LgLy9QF7B40wcbq1Ida+lieZTnYGpxgk9wtKf0YNX
	 CMxyGb7CPJ7zV8yOa0R/2do44xVNVS28JgoGqH0cXBW7Qj8nmY9xEhgRk1jT2tJSRi
	 gxOdHgSiXmndVDA8bQTHIfgz4WHy3aMDvHPgm7voY9csM5x6Zm66YONCOBAHp3AeK9
	 2KI8zsGZ3S8UA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Kang.Kerry =?utf-8?B?5bq35a6H6Imv?= TAO <Kang.Kerry@inventec.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: mtd: spi-nor: Add Winbond w25q512jvdtr
In-Reply-To: <4645d0cbce50491c9a428b57d97e09e0@inventec.com>
References: <CAG2w3Fsj6q8buVE+cXSuoTZj9gEP29u+mh6Xm3ryBqAxxRsQyg@mail.gmail.com>
	<mafs0cy7yjon6.fsf@kernel.org>
	<31265f84726047ebb49b3ea2e7836830@inventec.com>
	<mafs0o6rbj4k2.fsf@kernel.org>
	<4645d0cbce50491c9a428b57d97e09e0@inventec.com>
Date: Tue, 16 Sep 2025 12:13:42 +0200
Message-ID: <mafs0jz1yiu21.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_031345_879907_C49ACFDB 
X-CRM114-Status: GOOD (  14.69  )
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

SGksCgpPbiBUdWUsIFNlcCAxNiAyMDI1LCBLYW5nLktlcnJ5IOW6t+Wuh+iJryBUQU8gd3JvdGU6
Cgo+Pj4gSSBjb25maWd1cmVkIHRoZSBEVFMgd2l0aCAnY29tcGF0aWJsZSA9ICJqZWRlYyxzcGkt
bm9yIjsnCj4+IGFuZCBlbmFibGVkIHRoZSBrZXJuZWwgb3B0aW9uczoKPj4gQ09ORklHX01URF9Q
QVJUSVRJT05FRF9NQVNURVI9eQo+PiBDT05GSUdfTVREX1NQSV9OT1I9eQo+Pgo+Pj4gSG93ZXZl
ciwgdGhlIGRtZXNnIG91dHB1dCBzaG93cyB0aGF0IHRoZSBrZXJuZWwgaXMgZmFpbGluZyB0byBy
ZWNvZ25pemUgdGhlIGZsYXNoJ3MgSkVERUMgSUQuIFRoaXMgc3VnZ2VzdHMgdGhhdCB0aGUgZ2Vu
ZXJpYyBTRkRQLWJhc2VkIGRyaXZlciBpc24ndCB3b3JraW5nIGFzIGV4cGVjdGVkLgo+Pj4KPj4+
IFsgIDEzNS4yOTQ2MjRdIHNwaS1ub3Igc3BpMS4wOiB1bnJlY29nbml6ZWQgSkVERUMgaWQgYnl0
ZXM6IGVmIDcwIDIwIAo+Pj4gMDAgMDAgMDAgWyAgMTM1LjMwMTYwMl0gc3BpLW5vcjogcHJvYmUg
b2Ygc3BpMS4wIGZhaWxlZCB3aXRoIGVycm9yIC0yCj4+Pgo+Pj4gSSB0aGluayB3ZSBuZWVkIHRv
IGFkZCB0aGlzIHRvIHRhYmxlIHRvIG1ha2Ugc3VyZSBXMjVRNTEySlYtRFRSIGlzIHJlY29nbml6
ZWQuCj4+Cj4+VGhpcyBtZWFucyBzcGlfbm9yX2NoZWNrX3NmZHBfc2lnbmF0dXJlKCkgZmFpbHMu
IENhbiB5b3UgY2hlY2sgd2h5PyBUaGUgZmxhc2ggZGF0YXNoZWV0IHNheXMgaXQgaGFzIGEgU0ZE
UCB0YWJsZSBzbyB0aGlzIHNob3VsZCB3b3JrLgo+Pgo+PkJUVywgd2hpY2gga2VybmVsIHZlcnNp
b24gYXJlIHlvdSB0ZXN0aW5nIHRoaXMgb24/Cj4+Cj4+Wy4uLl0KPj4KPj4tLQo+PlJlZ2FyZHMs
Cj4+UHJhdHl1c2ggWWFkYXYKPgo+IEkgdXNlZCBrZXJuZWwgNS4xNSBmb3IgdGVzdGluZy4KPiBJ
dCBzZWVtcyB0aGUga2VybmVsIGlzIGZhaWxpbmcgdG8gcmVjb2duaXplIEpFREVDIGlkIG9mIHRo
ZSBXaW5ib25kIGZsYXNoLCB3aGljaCBpcyBjYXVzaW5nIHRoZSBlcnJvci4KPgo+IFdoZW4gSSB0
ZXN0IHdpdGggTnV2b3RvbiBrZXJuZWwgNi42LCBpdCBpcyBhYmxlIHRvIHJlY29nbml6ZSB0aGUg
Zmxhc2ggYXMgYSBnZW5lcmljIGRldmljZS4KPiBbICAgNTAuODA0MTYwXSBzcGktbm9yIHNwaTEu
MDogc3BpLW5vci1nZW5lcmljICg2NTUzNiBLYnl0ZXMpCgpXZSBvbmx5IGFjY2VwdCBwYXRjaGVz
IGZvciB0aGUgbGF0ZXN0IGtlcm5lbC4gU2luY2UgdGhlIGxhdGVzdCBzZWVtcyB0bwpiZSB3b3Jr
aW5nIGZvciB5b3UsIEkgdGhpbmsgdGhlIG9udXMgaXMgb24geW91IHRvIGJhY2twb3J0IHRoZSBy
aWdodCBzZXQKb2YgcGF0Y2hlcyB0byB5b3VyIDUuMTUga2VybmVsLgoKLS0gClJlZ2FyZHMsClBy
YXR5dXNoIFlhZGF2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
