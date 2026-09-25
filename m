Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E071C9830D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HySl1/yLuXmoPq8aULNf6LZflhUpS+XUwoXUZp0wHWQ=; b=eGF7HKXzAhx9qI
	K6W/+AHp5eLsYCY6IJoQ5MPxPK4n3+r/hxmOxjtJzSsmKe9OBDmdBqlrWhr5zTtama9MMBY59GJpm
	UyHLYj6c0kCt1kpdvonh35+St4axaKOSNZ/P5vJ5G3tqTyO1vz7D3LXLeCzUeoc4aVga0MIqN/uDE
	BAiZGYGV7Y/UuPdH6Tjs1HX7KvnAme9cMGBVlW7W3dSD4Qulam17tEFeQu9791b70R3O9ljqVPiDN
	2SC4zJSBZCffu1hMmp8hZm2SOIh1AE5PLquQ2kQPp095/GttC/kbiZKKmrjT4rtaEJuKAB8vQv/Zz
	GdMsUhdSq6qefDRSXvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2VK-0000000D1CP-0vKc;
	Fri, 25 Sep 2026 09:46:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2VH-0000000D1BS-0PLs
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 09:46:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B09F51A1020;
	Fri, 25 Sep 2026 09:45:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 835886073B;
	Fri, 25 Sep 2026 09:45:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C531103282AA;
	Fri, 25 Sep 2026 11:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790329558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EOThfG1gAEQrdHbmqd9U2MHSe1d8X1Jx4rb69pMs/X8=;
	b=U1u0vcPS0rl4z2+2fhX2VGhVdHFt5eSkTXIxrhry+eSFu7QOpEtU9vCK2f9IYzl8ajgjLg
	Kcn+Klbb4KJLqYMMRcFDbrBR3ckaE2OHtDU8y5BMPf7ADpMoFmdkrvDx5D2HZMfUL9ptTE
	ztq1fekIUw73uu79IhccWuBuvsEdgrqHk/8D6MZpaMIncWO2fRsXmAVMbTuPin4zcpEp1S
	a+dcG5iMctAIaGVE4RzzcVB1sV/EfKO2By3dRvRMb/aUXLt1JJ/0cv9apHwoQydLknN2hp
	2AzOVrDyYH8CA5qwTZ4D0ZA/ODweTBwZWDOoFmpULIPl3cJjGcMY28vs9WP7kw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Xie <fei.xie@horizon.auto>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Parshuram Thombare <pthombar@cadence.com>,
  linux-spi@vger.kernel.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] spi: cadence-xspi: add ACMD support for SPI NAND
In-Reply-To: <67f4e1a4-fc0e-4b2b-b41e-8dbb33227302@sirena.org.uk> (Mark
	Brown's message of "Thu, 24 Sep 2026 19:55:58 +0100")
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
	<20260921093701.1341766-3-fei.xie@horizon.auto>
	<arFEjzkHGMbecWWV@sirena.co.uk>
	<20260923061211.1608907-1-fei.xie@horizon.auto>
	<67f4e1a4-fc0e-4b2b-b41e-8dbb33227302@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 11:45:51 +0200
Message-ID: <87pky1ll4g.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_024603_289948_AFFAC208 
X-CRM114-Status: GOOD (  15.13  )
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

T24gMjQvMDkvMjAyNiBhdCAxOTo1NTo1OCArMDEsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFdlZCwgU2VwIDIzLCAyMDI2IGF0IDAyOjEyOjExUE0gKzA4MDAs
IEZlaSBYaWUgd3JvdGU6Cj4KPj4gVGhlIGRpZmZpY3VsdHkgaXMgdGhhdCB0aGUgaGFyZHdhcmUg
QUNNRCBzZXF1ZW5jZXIgbmVlZHMgdGhlIGNvbXBsZXRlCj4+IG11bHRpLW9wZXJhdGlvbiBzZXF1
ZW5jZSB0byBiZSBkZXNjcmliZWQgYmVmb3JlIGl0IGlzIHN0YXJ0ZWQuIEZvcgo+PiBleGFtcGxl
LCB0aGUgU1BJIE5BTkQgY29yZSBjdXJyZW50bHkgc3VibWl0cyBQQUdFIFJFQUQsIHN0YXR1cyBw
b2xsaW5nCj4+IGFuZCBSRUFEIENBQ0hFIGFzIHNlcGFyYXRlIHNwaV9tZW1fZXhlY19vcCgpIGNh
bGxzLiBUaGUgU1RJRyBwYXRoIGNhbgo+PiBleGVjdXRlIHRob3NlIG9wZXJhdGlvbnMgaW5kaXZp
ZHVhbGx5LCB3aGlsZSB0aGUgQUNNRCBoYXJkd2FyZSBjb21iaW5lcwo+PiB0aGVtIGludG8gb25l
IHByb2dyYW1tZWQgc2VxdWVuY2UuCj4KPj4gV291bGQgYW4gU1BJLW1lbSBvcGVyYXRpb24tc2Vx
dWVuY2UgaW50ZXJmYWNlIGJlIGEgcmVhc29uYWJsZSBkaXJlY3Rpb24KPj4gdG8gZXhwbG9yZT8g
VGhlIE5BTkQgY29yZSBjb3VsZCBkZXNjcmliZSB0aGUgb3JkZXJlZCBvcGVyYXRpb25zIGFuZAo+
PiBwb2xsaW5nIGNvbmRpdGlvbiwgYW5kIHRoZSBjb250cm9sbGVyIGNvdWxkIGVpdGhlciBleGVj
dXRlIHRoZSBzZXF1ZW5jZQo+PiBpbiBoYXJkd2FyZSBvciBmYWxsIGJhY2sgdG8gdGhlIGV4aXN0
aW5nIGluZGl2aWR1YWwgb3BlcmF0aW9ucy4gVGhpcwo+PiB3b3VsZCBrZWVwIE5BTkQtc3BlY2lm
aWMga25vd2xlZGdlIG91dCBvZiB0aGUgY29udHJvbGxlciBkcml2ZXIuCj4KPiBJIHRoaW5rIHRo
YXQgbWFrZXMgc2Vuc2UsIHRoYXQgbWlycm9ycyBzb21lIGlkZWFzIHBlb3BsZSBoYXZlIGhhZCBm
b3IKPiBvcHRpbWlzaW5nIFNQSSBtZXNhZ2VzIGluIGdlbmVyYWwgLSBzdWJtaXQgdGhlIHNlcXVl
bmNlIHRvIHRoZSBkcml2ZXIgdG8KPiBzZWUgaWYgaXQgY2FuIGRvIGl0IGluIG9uZSwgZmFsbGlu
ZyBiYWNrIHRvIGp1c3QgcnVubmluZyBpbmRpdmlkdWFsCj4gb3BlcmF0aW9ucyBpZiB0aGF0IGRv
ZXNuJ3Qgd29yay4gIFNlZSBzcGlfb3B0aW1pemVfbWVzc2FnZSgpLgoKVGhlIHNwaS1tZW0gb3Bl
cmF0aW9uLXNlcXVlbmNlIGludGVyZmFjZSBzZWVtcyB2ZXJ5IGNvbXBsZXggdG8gaGFuZGxlCmNv
cnJlY3RseSBJTUhPLiBJIGZlYXIgc3VjaCBhIHNvbHV0aW9uIHdvdWxkIGFsc28gcmVxdWlyZSBt
YWpvciByZXdyaXRlcwpvZiB0aGUgY29yZS4gSXQgaXMgYWx3YXlzIGhhcmQgdG8gbWFrZSBmaXQg
aGFyZHdhcmUgaW4gY29kZSBiYXNlcyBub3QKdGhvdWdodCBmb3IgdGhlbS4gTW9zdCBvZiB0aGUg
dGltZSBiZWluZyBzcGVudCBpbiBJL09zIGFuZCB3YWl0IHN0YXRlcywKSSBhbSB3b25kZXJpbmcg
aG93IG11Y2ggd291bGQgYmUgc2F2ZWQgYnkgcGFja2luZyB0aGUgY29tbWFuZHMuIERvIHlvdQpo
YXZlIGJlbmNobWFya3M/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
