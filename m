Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216FEE7E0C5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Feb 2026 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7ABSRY+j5o5/Z5ElM9vBfKZ5YYbtiTqcDMHIekpq8w=; b=vcql98ySBpaLHo
	Cr2/l9MWYSPaI2ZS4aZYNbbujROg1DVi4kV4d9vnfKYa58pqBwnYpNPy82G8iwj5ZFkOJIufy86UX
	pfLGqeRsPUWk7eIiG2y+npfyLfwp8PfoO3cRBzlrFA/Sd+yKkhgP86eHYAIsU5Q2tXVVbMgRX0oHT
	e+rTUUpuxe1TP03QR2hGG+m4jb+UaVKwfR8f6DfM7yeKD/K6DWGG1gXulifLVhJZJEhwohZaPjApo
	MFY8Ag7T/oZP1e7XQVgoCeUwKZ79lMJZyoykDL3eHg3x2FPDIgzyAbRFNaqnv7xB7PJYG4zmEQaEe
	yunKukyxSIRjCx/UkknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOs2-0000000FG7O-2qPO;
	Mon, 09 Feb 2026 10:51:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOrz-0000000FG6y-0C67
	for linux-mtd@lists.infradead.org;
	Mon, 09 Feb 2026 10:51:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A3F71C250FF;
	Mon,  9 Feb 2026 10:51:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC99E6074B;
	Mon,  9 Feb 2026 10:51:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECF9E119D220D;
	Mon,  9 Feb 2026 11:51:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770634311; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rVRzYmwkvkQtJicW7A0Akip70SHXFog0rxc7Dv/8xPs=;
	b=TyAce8vLHYeUQ8OHs6R1O9UXO56cxFUYmmRB9SNPd8grn4FRYus98fCo0EzQRP5t0mwn95
	Sj5PqqxMQU16UTVR2RZ69d//rgS10tfWg+zF8fPOW3MBlTWmD99eqGpvkWmXbqX+l4L7F1
	PDjmy0sXASndKCcsjbMb5B47YoYCllsK/06OK1ak7x0HE12u/dV1Q4U2e5eEkvsMu3mW9u
	/fDq/9zN4ojgbubIYgTM6CL9pb5oh6tH4wiZ6Tgtu9EmB/C+g3GlIwrokYVN4lWPBl4S8s
	CjllxoON5Wz+XYeGybHI1r99dXqDAC47xRIHUxTWS84yPTMAGKdNY/PrufIjew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Eliav Farber <farbere@amazon.com>
Cc: <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,
  <mwalle@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] mtd: spi-nor: winbond: Fix protection handling and
 enable dual/quad reads
In-Reply-To: <20260208061919.30498-1-farbere@amazon.com> (Eliav Farber's
	message of "Sun, 8 Feb 2026 06:19:15 +0000")
References: <20260208061919.30498-1-farbere@amazon.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Feb 2026 11:51:47 +0100
Message-ID: <871piu196k.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_025155_630148_FE9E9D48 
X-CRM114-Status: GOOD (  13.50  )
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

SGkgRWxpYXYsCgpPbiAwOC8wMi8yMDI2IGF0IDA2OjE5OjE1IEdNVCwgRWxpYXYgRmFyYmVyIDxm
YXJiZXJlQGFtYXpvbi5jb20+IHdyb3RlOgoKPiBUaGlzIHNlcmllcyBmaXhlcyBibG9jayBwcm90
ZWN0aW9uIGhhbmRsaW5nIGZvciB0aGUgZm9sbG93aW5nIFdpbmJvbmQKPiBTUEktTk9SIGRldmlj
ZXM6Cj4gIC0gdzI1cTI1Nmp3bQo+ICAtIHcyNXEyNTZqdwo+ICAtIHcyNXE2NGp2bQo+Cj4gVGhl
IGRldmljZXMgZG8gbm90IGNvcnJlY3RseSBkZXNjcmliZSB0aGVpciBTdGF0dXMgUmVnaXN0ZXIg
bGF5b3V0IGFuZAo+IHByb3RlY3Rpb24gY2FwYWJpbGl0aWVzIChsb2NraW5nIGZsYWdzLCBUQiBi
aXQsIEJQIGJpdCBjb25maWd1cmF0aW9uKS4KPiBBcyBhIHJlc3VsdCwgdGhlIHNwaS1ub3IgY29y
ZSByZWplY3RzIHByb3RlY3Rpb24gcmVxdWVzdHMgYW5kIGxvY2tpbmcKPiBvcGVyYXRpb25zIGZh
aWwgd2l0aCAtRUlOVkFMLCBlLmcuOgo+Cj4gICBmbGFzaF9sb2NrIC1sIC9kZXYvbXRkMjkKPiAg
IGZsYXNoX2xvY2s6IGVycm9yITogY291bGQgbm90IGxvY2sgZGV2aWNlOiAvZGV2L210ZDI5Cj4g
ICBlcnJvciAyMiAoSW52YWxpZCBhcmd1bWVudCkKPgo+IFVwZGF0ZSB0aGUgZGV2aWNlIGZsYWdz
IHRvIG1hdGNoIHRoZSBhY3R1YWwgaGFyZHdhcmUgYmVoYXZpb3Igc28gdGhhdAo+IGxvY2tpbmcg
YW5kIHVubG9ja2luZyByZWdpb25zIHdvcmsgY29ycmVjdGx5Lgo+Cj4gQWRkaXRpb25hbGx5LCBl
bmFibGUgRHVhbCBhbmQgUXVhZCByZWFkIHN1cHBvcnQgZm9yIHcyNXE2NGp2bSB3aGVuIFNGRFAK
PiBpcyBub3QgdXNlZC4KPgo+IEFsbCBjaGFuZ2VzIHdlcmUgdmFsaWRhdGVkIHVzaW5nIGZsYXNo
X2xvY2sgb24gdGhlIGFmZmVjdGVkIGRldmljZXMuCj4KPiBFbGlhdiBGYXJiZXIgKDQpOgo+ICAg
bXRkOiBzcGktbm9yOiB3aW5ib25kOiBGaXggbG9ja2luZyBzdXBwb3J0IGZvciB3MjVxMjU2andt
Cj4gICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IEZpeCBsb2NraW5nIHN1cHBvcnQgZm9yIHcyNXEy
NTZqdwo+ICAgbXRkOiBzcGktbm9yOiB3aW5ib25kOiBGaXggbG9ja2luZyBzdXBwb3J0IGZvciB3
MjVxNjRqdm0KPiAgIG10ZDogc3BpLW5vcjogd2luYm9uZDogRW5hYmxlIER1YWwgYW5kIFF1YWQg
c3VwcG9ydCBmb3IgdzI1cTY0anZtCj4KPiAgZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMg
fCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKCkxvb2tzIHNlbnNpYmxlLCBJIHdhcyBsb29raW5nIHRvIGZpbmQgRml4ZXMgdGFncyBi
dXQgZHVlIHRvIHRoZSBudW1iZXIKb2YgcmVmYWN0b3JpbmdzLCB0aGVzZSBhcmUgaGFyZCB0byB0
cmFjaywgc28gSSdtIGZpbmUga2VlcGluZyB0aGUKY29tbWl0cyBhcyB0aGV5IGFyZS4KClJldmll
d2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
