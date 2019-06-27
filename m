Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFD4C48BD6
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 14:50:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E02F420644
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 14:50:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hl4sCZgd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E02F420644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGENz/9iKHvbhX5zTTnEoNpQbrIIo1pz9tMfc4mrHt4=; b=Hl4sCZgdfFh8V8
	Jb9VhwWdNV8ny2d6EUvW+d+KpkySuF7d3ZshVUZ/1dhd1Y7TjWeZ2u2OYtMwKfkrP8egyv5cXA3dK
	Vwh9AX1P9ehyOnfHRQePgkI6jygWFLZGmmLJIoH7iDt0tQ7BeZQ5r6iwqs1k0sYPSx0/Hie1b+t5k
	onpNs2U4SDQFUWudA52Hyc4mKddal5mlpYxlbjcWuZqVpYjTko908cldyJy9hoG72kDI3HX6A6gRB
	K2RA8IPpMbNH/uJu6BB/3h6ZSDWJSrs4D/c4ljE2Faot6R9G8naNhG8sGkfCxqOv0urP0i7IrzI38
	L8GftnDr8bD9stvTsvXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgVig-0003wW-3y; Thu, 27 Jun 2019 14:49:50 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgViJ-0003fO-Om
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 14:49:30 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9296D240019;
 Thu, 27 Jun 2019 14:49:15 +0000 (UTC)
Date: Thu, 27 Jun 2019 16:49:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [PATCH v3 00/12] Introduce generic ONFI support
Message-ID: <20190627164914.1cae84ff@xps13>
In-Reply-To: <MN2PR08MB59514E77250C3F0DA76D4801B8140@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <MN2PR08MB59514E77250C3F0DA76D4801B8140@MN2PR08MB5951.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_074928_614533_57F65F89 
X-CRM114-Status: GOOD (  10.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, Yixun Lan <yixun.lan@amlogic.com>,
 Chuanhong Guo <gch981213@gmail.com>, Stefan Agner <stefan@agner.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Anders Roxell <anders.roxell@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmFtdXJ0aHksCgoiU2hpdmFtdXJ0aHkgU2hhc3RyaSAoc3NoaXZhbXVydGh5KSIgPHNz
aGl2YW11cnRoeUBtaWNyb24uY29tPiB3cm90ZSBvbgpNb24sIDMgSnVuIDIwMTkgMTI6NDM6MjAg
KzAwMDA6Cgo+IEN1cnJlbnQgc3VwcG9ydCB0byBPTkZJIHBhcmFtZXRlciBwYWdlIGlzIG9ubHkg
Zm9yIHJhdyBOQU5ELCB0aGlzIHBhdGNoCj4gc2VyaWVzIHR1cm4gT05GSSBzdXBwb3J0IGludG8g
Z2VuZXJpYy4gU28gdGhhdCwgb3RoZXIgTkFORCBkZXZpY2VzIGxpa2UKPiBTUEkgTkFORCBjYW4g
dXNlIHRoaXMuCj4gCj4gVGhlcmUgYXJlIGZpdmUgcGFydHMgaW4gdGhpcyBzZXJpZXMuCj4gMS4g
UHJlcGFyZSBmb3IgdHVybmluZyBPTkZJIGludG8gZ2VuZXJpYwo+IDIuIFR1cm4gT05GSSBpbnRv
IGdlbmVyaWMsIHdoaWNoIGNhbiBiZSB1c2VkIGJ5IFNQSSBOQU5EcyBsYXRlcgo+IDMuIFR1cm4g
U1BJIE5BTkQgY29yZSB0byB1c2UgcGFyYW1ldGVyIHBhZ2UKPiA0LiBSZWRlc2lnbiBNaWNyb24g
U1BJIE5BTkQgZHJpdmVyIGltcGxlbWVudGF0aW9uCj4gNS4gU3VwcG9ydCBmb3IgbmV3IE1pY3Jv
biBTUEkgTkFORCBkZXZpY2VzCj4gCgpJIGFtIHZlcnkgc29ycnkgZm9yIHRoZSBkZWxheSwgSSB3
aWxsIGhhdmUgYSBkZWVwIGxvb2sgYXQgeW91ciBzZXJpZXMKdmVyeSBzb29uLgoKPiBDaGFuZ2Vz
IGluIFYzCj4gLS0tLS0tLS0tLS0tLQo+IAo+ICogUmViYXNlZCB0byBuYW5kL25leHQKPiAqIFNw
bGl0IHRoZSBwYXRjaGVzIGFzIHBlciBzdWdnZXN0aW9uCj4gKiBBZGRyZXNzZWQgdGhlIGNvbW1l
bnRzCj4gKiBTb21lIGZpeGVzIHdoaWNoIEkgbWlzc2VkIGluIGxhc3QgdmVyc2lvbgoKQXMgYSBz
aW1wbGUgbm90ZSwgcGxlYXNlIG1pbmQgdGhhdCAiYWRkcmVzc2VkIHRoZSBjb21tZW50cyIgaXMg
d2F5IHRvbwpnZW5lcmljLiAiU29tZSBmaXhlcyIgYXMgd2VsbC4gSSBoYXZlIHBsZW50eSBvZiBz
ZXJpZXMgdG8gZm9sbG93LCB5b3UKbmVlZCB0byBkbyB2ZXJ5IGNhcmVmdWwgd2hlbiB5b3Ugd3Jp
dGUgdGhpcyBjaGFuZ2Vsb2csIGl0IGlzIGltcG9ydGFudApmb3IgbWUuCgpBbHNvLCBmb3IgdGhl
IG5leHQgc2VyaWVzIHlvdSBzdWJtaXQsIHBsZWFzZSB1c2UgYSB0aHJlYWRlZCBsb2dpYyB3aGVy
ZQphbGwgcGF0Y2hlcyBhcmUgYW5zd2VycyB0byB0aGUgY292ZXIgbGV0dGVyICh0aGlzIHdheSBp
dCBhcHBlYXJzIGFzIGEKdGhyZWFkIGFuZCBpdCBpcyBjb25zaWRlcmVkIGFzIG9uZSBzZXJpZXMg
YnkgcGF0Y2h3b3JrLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
