Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDD7D32D9A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CeG73b9DONSgrrHGMpIfLsPZ9+bOEOpAgRQdOSS4oOI=; b=Xg3F+LM/RTCrhQ
	p0vsEHzCTFdFDQqZU03q+MW+4ZRTwftxaxUqVJKhXvO43dz3uh+rEVVMkHRZzY27gY3zP8fq8DzLR
	yBzPfY2Oyg0+f5kQHRQHY4wLZoG25whaJI7l8MRyjERg3NGMwxdwNgNkW8rPA6aPs52GZa7n7thjG
	VtqjvYso7XOOCzNFC9yJE7k0nRTPu4iH02+b6oF2lU/0GZX0v44qcxbI5pClIguivZ8xX0IFs2PAt
	WFttEXkkSEs0AT21rl/3sTe5Rr0jd2TCBpPMt+rgKEx5V3/BVwz6IUxi/3m7FijKmc560IFVbCSEY
	3Q4Uo8TEJVE2tY2ISifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApPU-00000003Hvj-2VlV;
	Tue, 12 Nov 2024 11:50:16 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAotd-00000003BuU-44t3
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 11:17:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0B41240008;
	Tue, 12 Nov 2024 11:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731410238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwJ5gUGil3S1ZD9QkCtfYxlbkSFPT8MXJtUT0r746v0=;
	b=BYX4f8hMOjqs0FgwJhp0tbgDc2sYzMuYwpphFRaehkwiJtgjEbaWFODsGDykHwxXa2UxZy
	UzgwEYY9Ko7E/mQZBfYO8C70Jlju4yjhK+9z2qg/qBaSQRmRRrKwMRPGrwHBX/TRjwIUwS
	nUWOZwhGhRp7INlbNNMjeXW/Jf0Y5+E8Pzn4r3qG8/5D+oOZ3fGyZ5bXjOav/kw550sDO8
	N9S7e6v574je9xdTW3cIwRUAfVRYYTTnOqxcOUUVeLvELmpGK0P/la4NO1YNpnAlqZW7aV
	bgMh5k23QIByVZ9Na4ffdzeeoTLWXqVI36ftXrEZEAI6lPrBUgBAQs2nnnEvPA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v2 2/6] memory: ti-aemif: Export aemif_set_cs_timings()
In-Reply-To: <07cd5d53-ce99-4ada-a7f1-53795eff5c42@bootlin.com> (Bastien
	Curutchet's message of "Tue, 12 Nov 2024 10:13:38 +0100")
References: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
	<20241106085507.76425-3-bastien.curutchet@bootlin.com>
	<87ttcdr2ym.fsf@bootlin.com>
	<07cd5d53-ce99-4ada-a7f1-53795eff5c42@bootlin.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Tue, 12 Nov 2024 12:17:17 +0100
Message-ID: <87y11osnuq.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_031722_185991_3BCEF6D4 
X-CRM114-Status: GOOD (  15.90  )
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

SGkgQmFzdGllbiwKCk9uIDEyLzExLzIwMjQgYXQgMTA6MTM6MzggKzAxLCBCYXN0aWVuIEN1cnV0
Y2hldCA8YmFzdGllbi5jdXJ1dGNoZXRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSBNaXF1w6hs
LAo+Cj4gT24gMTEvMTEvMjQgODoyMSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gSGVsbG8g
QmFzdGllbiwKPj4gT24gMDYvMTEvMjAyNCBhdCAwOTo1NTowMyArMDEsIEJhc3RpZW4gQ3VydXRj
aGV0Cj4+IDxiYXN0aWVuLmN1cnV0Y2hldEBib290bGluLmNvbT4gd3JvdGU6Cj4+IAo+Pj4gRXhw
b3J0IHRoZSBhZW1pZl9zZXRfY3NfdGltaW5nKCkgc3ltYm9sIHNvIGl0IGNhbiBiZSB1c2VkIGJ5
IG90aGVyCj4+PiBkcml2ZXJzCj4+Pgo+Pj4gQWRkIGEgc3BpbmxvY2sgdG8gcHJvdGVjdCB0aGUg
Q1MgY29uZmlndXJhdGlvbiByZWdpc3RlciBmcm9tIGNvbmN1cnJlbnQKPj4+IGFjY2Vzc2VzLgo+
PiBXaGF0IGNvbmN1cnJlbnQgYWNjZXNzZXMgYXJlIHlvdSB0cnlpbmcgdG8gcHJvdGVjdCB5b3Vy
c2VsZiBhZ2FpbnN0Pwo+PiBJIGZhaWwgdG8gc2VlIHRoZSB1c2UgY2FzZSwgYnV0IFRCSCBJIGhh
dmVuJ3QgdHJpZWQgaGFyZCBlbm91Z2ggbWF5YmUuCj4+IAo+Cj4gVGhlIHJlZ2lzdGVyIHRoYXQg
aGFuZGxlcyB0aGUgQ1MgY29uZmlndXJhdGlvbiBiZWxvbmdzIHRvIHRoZSBBRU1JRgo+IGNvbXBv
bmVudCBidXQgaXQgd2lsbCBhbHNvIGJlIGFjY2Vzc2VkIGJ5IHRoZSBBRU1JRiAnY2hpbGRyZW4n
IHdpdGggdGhlCj4gYWVtaWZfc2V0X2NzX3RpbWluZygpIGZ1bmN0aW9uLiBTbyBmYXIsIGNvbmN1
cnJlbnQgYWNjZXNzZXMgc2hvdWxkbid0Cj4gb2NjdXIgYmVjYXVzZSB0aGUgQUVNSUYgY29uZmln
dXJlcyB0aGUgQ1MgdGltaW5ncyBvbmx5IG9uY2UgYW5kIGRvZXMgc28KPiBiZWZvcmUgcHJvYmlu
ZyBpdHMgJ2NoaWxkcmVuJzsgYnV0IEkgZG9uJ3Qga25vdyBob3cgdGhpbmdzIGNhbiBldm9sdmUg
aW4KPiB0aGUgZnV0dXJlLgoKT2theSwgYW5kIEkgZ3Vlc3Mgd2UgY2FuIGhhdmUgbW9yZSB0aGFu
IG9uZSBjaGlsZHJlbiwgaW4gdGhpcyBjYXNlCmluZGVlZCB3ZSBuZWVkIHNlcmlhbGl6YXRpb24u
Cgo+PiBBbHNvLCB3aGF0IGp1c3RpZmllcyB0aGUgdXNlIG9mIGEgc3Bpbi1sb2NrIGluIHRoaXMg
Y2FzZT8KPj4gCj4KPiBUQkgsIEkgYWx3YXlzIHN0cnVnZ2xlIHRvIGNob29zZSBiZXR3ZWVuIG11
dGV4ZXMgYW5kIHNwaW4tbG9ja3MuIEkgY2hvc2UKPiBzcGluLWxvY2sgYmVjYXVzZSBpdCBvbmx5
IHByb3RlY3RzIG9uZSBtZW1vcnktbWFwcGVkIHJlZ2lzdGVyIHNvIEkgdGhpbmsKPiBpdCBkb2Vz
bid0IHdvcnRoIGdvaW5nIHRvIHNsZWVwIHdoZW4gd2FpdGluZyBmb3IgdGhlIGxvY2suCgpJbiBn
ZW5lcmFsLCBJIGJlbGlldmUgaW4gYSBwYXRoIHRoYXQgaXMgbm90IGEgaG90LXBhdGggYW5kIGlm
IHlvdSBjYW4Kc2xlZXAsIHlvdSBzaG91bGQgZ28gZm9yIGEgbXV0ZXguCgpDaGVlcnMsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
