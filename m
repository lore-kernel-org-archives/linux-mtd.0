Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A975ACF6497
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 09:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNaYTD6jjsBu+fnW19Ef7UIcAUS3MXiXqG/b/f5nKPM=; b=W5TA0XOwgPVKyi
	laJsnNqtXJpn/uYCs6xGe84qxZzSmQvcWygMKXiVA8cBR9fWswSGUxHc9ypSmqGfiw3wrDHJQR+Ih
	8pc30J/zIlVrDjkEMyEa7RNA0SAAGO2kW+XFrhN9QPKc0SxJitEe070BBlg0b16Nm/mjlYkSKH08u
	upaFUGqHsWwH7NkK7h+oxsv0fk+TucH/CIPiKmZzjrpeKcSzZUgevqBsiRijcuIHA4HeLeGCRscPZ
	ILzfGR+QLjS7dD/QBE9I7LVjuP5lDNAioB1dkChgF4JtJlusx+tMz9aRD22m+n29haZ2QXnHXZeml
	MaGg33NtwjwUk+YLV3+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCLX-0000000GRFP-0N4B;
	Mon, 30 Sep 2024 09:05:35 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCKH-0000000GQyY-0Iyg;
	Mon, 30 Sep 2024 09:04:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29C2D40009;
	Mon, 30 Sep 2024 09:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727687053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/Yd74SXWwnJNHzkH+B1zGDPYPSWPzutmB3r6NlN8+k=;
	b=oopwFy97Xs7m4K3UfEGC1hiSSNHKTDyWZt9dJs73tB3PhVekjYUwWjFTpXxO9rhGuwRcmO
	7EY460BtJoyBI+PszIgN0UqnD7FmeuGdO66U/wzlSL49YKAnVFWxzKZQqg5GViNphID+YS
	GoW6P4MpEYAGoSwerOwunKoJeKsq5S7j+qpOV5xD/FKvGAzX4OMK2gx61LXZ8CWjDIOEXS
	+7H8X+m6td/vhZ38an6ytEtNTgQNe8GqLcq3hxsAfAS0En8/N59vH5/z446z+0K/TdOA5Y
	riEwwRZm+c++1OUJ0NH0ycTAbZzXXGCnsAHUqCs6sQ6pgE8FYRgGMxIkB8Voig==
Date: Mon, 30 Sep 2024 11:04:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, "michael@walle.cc"
 <michael@walle.cc>, "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, Rob Herring
 <robh@kernel.org>, "cornor+dt@kernel.org" <cornor+dt@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "nicolas.ferre@microchip.com"
 <nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "claudiu.beznea@tuxon.dev"
 <claudiu.beznea@tuxon.dev>, "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, Conor Dooley
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: Add stacked and parallel memories support in spi-nor
Message-ID: <20240930110408.6ec43e97@xps-13>
In-Reply-To: <IA0PR12MB7699B360C7CF59E0A3D095F9DC8D2@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <IA0PR12MB7699B360C7CF59E0A3D095F9DC8D2@IA0PR12MB7699.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_020417_731408_198A9AA5 
X-CRM114-Status: GOOD (  20.70  )
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

SGkgQW1pdCwKCj4gRm9yIGltcGxlbWVudGluZyB0aGlzIHRoZSBjdXJyZW50IERUIGJpbmRpbmdb
MV0gWzJdIFszXSBuZWVkIHRvIGJlIHVwZGF0ZWQgYXMgZm9sbG93cy4KPiAKPiAKPiAKPiBzdGFj
a2VkLW1lbW9yaWVzIERUIGNoYW5nZXM6Cj4gCj4gLSBGbGFzaCBzaXplIGluZm9ybWF0aW9uIGNh
biBiZSByZXRyaWV2ZWQgZGlyZWN0bHkgZnJvbSB0aGUgZmxhc2gsIHNvIGl0IGhhcyBiZWVuIHJl
bW92ZWQgZnJvbSB0aGUgRFQgYmluZGluZy4KPiAKPiAtIEVhY2ggc3RhY2tlZCBmbGFzaCB3aWxs
IGhhdmUgaXRzIG93biBmbGFzaCBub2RlLiBUaGlzIGFwcHJvYWNoIGFsbG93cyBmbGFzaGVzIG9m
IGRpZmZlcmVudCBtYWtlcyBhbmQgc2l6ZXMgdG8gYmUgc3RhY2tlZCB0b2dldGhlciwgYXMgZWFj
aCBmbGFzaCB3aWxsIGJlIHByb2JlZCBpbmRpdmlkdWFsbHkuCj4gCj4gLSAgRWFjaCBvZiB0aGUg
Zmxhc2ggbm9kZSB3aWxsIGhhdmUgaXRzIG93biAicmVnIiBwcm9wZXJ0eSB0aGF0IHdpbGwgY29u
dGFpbiBpdHMgcGh5c2ljYWwgQ1MuCgpUaGVzZSB0aHJlZSBmaXJzdCBwb2ludHMgYXJlIGp1c3Qg
ZGVzY3JpYmluZyB0aGUgZXhpc3RpbmcgYmluZGluZ3MgZm9yCm5vbi1jb25jYXRlbmF0ZWQgc2l0
dWF0aW9ucy4KCj4gLSBUaGUgc3RhY2tlZC1tZW1vcmllcyBEVCBiaW5kaW5ncyB3aWxsIGNvbnRh
aW4gdGhlIHBoYW5kbGVzIG9mIHRoZSBmbGFzaCBub2RlcyBjb25uZWN0ZWQgaW4gc3RhY2tlZCBt
b2RlLgo+IAo+IC0gVGhlIGZpcnN0IGZsYXNoIG5vZGUgd2lsbCBjb250YWluIHRoZSBtdGQgcGFy
dGl0aW9uIHRoYXQgd291bGQgaGF2ZSB0aGUgY3Jvc3Mgb3ZlciBtZW1vcnkgc3RhcmluZyBhdCBh
IG1lbW9yeSBsb2NhdGlvbiBpbiB0aGUgZmlyc3QgZmxhc2ggYW5kIGVuZGluZyBhdCBzb21lIG1l
bW9yeSBsb2NhdGlvbiBvZiB0aGUgMm5kIGZsYXNoCgpJIGRvbid0IGxpa2UgdGhhdCBtdWNoLiBE
ZXNjcmliaW5nIHBhcnRpdGlvbnMgcGFzdCB0aGUgYWN0dWFsIGRldmljZQpzb3VuZHMgd3Jvbmcu
IElmIHlvdSBsb29rIGludG8gWzFdIHRoZXJlIGlzIGEgc3VnZ2VzdGlvbiBmcm9tIFJvYiB0bwpo
YW5kbGUgdGhpcyBjYXNlIHVzaW5nIGEgcHJvcGVydHkgdGhhdCB0ZWxscyB1cyB0aGVyZSBpcyBh
CmNvbnRpbnVhdGlvbiwgc28gZnJvbSBhIHNvZnR3YXJlIHBlcnNwZWN0aXZlIHdlIGNhbiBlYXNp
bHkgbWFrZSB0aGUKbGluaywgYnV0IG9uIHRoZSBoYXJkd2FyZSBkZXNjcmlwdGlvbiBzaWRlIHRo
ZSBpbmZvcm1hdGlvbiBhcmUgY29ycmVjdC4KCklmIHRoaXMgZGVzY3JpcHRpb24gaXMgYWNjZXB0
ZWQsIHRoZW4gZmluZSwgeW91IGNhbiBkZXByZWNhdGUgdGhlIAoic3RhY2tlZC1tZW1vcmllcyIg
cHJvcGVydHkuCgo+ICAtIFRoZSBuZXcgbGF5ZXIgd2lsbCB1cGRhdGUgdGhlIG10ZC0+c2l6ZSBh
bmQgb3RoZXIgbXRkX2luZm8gcGFyYW1ldGVycyBhZnRlciBib3RoIHRoZSBmbGFzaGVzIGFyZSBw
cm9iZWQgYW5kIHdpbGwgY2FsbCBtdGRfZGV2aWNlX3JlZ2lzdGVyIHdpdGggdGhlIGNvbWJpbmVk
IGluZm9ybWF0aW9uLgoKT2theSwgdGhpcyBpcyBiYWNrIHRvIHRoZSBtdGQtY29uY2F0IHRoaW5n
IEkgaW5pdGlhbGx5IHByb3Bvc2VkLCBidXQgSQpiZWxpZXZlIGl0IGNhbiB3b3JrLgoKWy4uLl0K
Cj4gcGFyYWxsZWwtbWVtb3JpZXMgRFQgY2hhbmdlczoKPiAKPiAtIEZsYXNoIHNpemUgaW5mb3Jt
YXRpb24gY2FuIGJlIHJldHJpZXZlZCBkaXJlY3RseSBmcm9tIHRoZSBmbGFzaCwgc28gaXQgaGFz
IGJlZW4gcmVtb3ZlZCBmcm9tIHRoZSBEVCBiaW5kaW5nLgoKSXQncyBub3QgcmVhbGx5IGFib3V0
IHRoZSBzaXplIGJ1dCBtb3JlIGFib3V0IHRoZSBmYWN0IHRoYXQgdHdvCm1lbW9yaWVzIGFyZSBp
biB1c2UuIElmIHRoZSBzdGFja2VkIHNpdHVhdGlvbiBkb2VzIG5vdCByZXF1aXJlIGFueXRoaW5n
CnNwZWNpZmljIGJlc2lkZXMgdGhlIHBhcnRpdGlvbnMgdHJpY2ssIHRoZW4geW91IGNhbiBhc3N1
bWUgdGhhdCBkb3VibGUKcmVnIGZsYXNoZXMgYXJlIGp1c3QgdHdvIGZsYXNoZXMgYW5kIHRoaXMg
Y2FuIGJlIHlvdXIgd2F5IHRvCmRpc2NyaW1pbmF0ZSB0aGUgZGF0YSBvcmdhbml6YXRpb24uIEJ1
dCBJIGRvbid0IGxpa2UgbXVjaCB0aGlzIHNob3J0Y3V0CmJlY2F1c2UgaXQgaXMgbm90IGZ1dHVy
ZSBwcm9vZiwgYW5kIGluc3RlYWQgSSdkIGtlZXAgdGhlIHN0YWNrZWQtbWVtb3J5CnByb3BlcnR5
LiBJZiB5b3UgZG9uJ3QgbGlrZSB0aGUgc2l6ZSwgSSBkb24ndCByZWFsbHkgY2FyZSwganVzdCB1
c2UgaXQKYXMgYSBib29sZWFuLiBCdXQgSSBiZWxpZXZlIHdlIG5lZWQgc29tZSBuYW1pbmcgdG8g
dGVsbCB0aGUgT1MgdGhhdCB0aGUKZGF0YSBpcyBzcHJlYWQgaW4gYSBzcGVjaWZpYyB3YXkgaW5z
aWRlIHRoZSBtZW1vcnkgZGV2aWNlcy4KCj4gLSBFYWNoIGZsYXNoIGNvbm5lY3RlZCBpbiBwYXJh
bGxlbCBtb2RlIHNob3VsZCBiZSBpZGVudGljYWwgYW5kIHdpbGwgaGF2ZSBvbmUgZmxhc2ggbm9k
ZSBmb3IgYm90aCB0aGUgZmxhc2ggZGV2aWNlcy4KClRoaXMgaXMgYWxyZWFkeSB0aGUgY2FzZS4K
Cj4gLSBUaGUgInJlZyIgcHJvcCB3aWxsIGNvbnRhaW4gdGhlIHBoeXNpY2FsIENTIG51bWJlciBm
b3IgYm90aCB0aGUgY29ubmVjdGVkIGZsYXNoZXMuCgpUaGlzIGlzIGFscmVhZHkgdGhlIGNhc2Uu
Cgo+IC0gVGhlIG5ldyBsYXllciB3aWxsIGRvdWJsZSB0aGUgbXRkLT4gc2l6ZSBhbmQgcmVnaXN0
ZXIgaXQgd2l0aCB0aGUgbXRkIGxheWVyLgoKVGhpcyBpcyBub3QgYSBEVCBjaGFuZ2UuCgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
