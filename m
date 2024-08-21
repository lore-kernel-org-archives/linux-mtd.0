Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245BFC52D6F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5DSw/VNjy+lzUHs1VIVgcS2gUlNMDkV9lLX2Ykqv8I=; b=FXKNS2N86JzHLu
	1a9tbSPxHk/+Km2LNoiRt8r/Ko/67wtnootH+QmJtPxGOzKMbTov4eL2Qb+grjvD3FrZx71VmUbLq
	Ny2KANKuAp8JLVjRQ//Kjbn6QMg+XgMKfI0hwl65YgLig+CwFcNg4Q0RlRxhVqUs6YY0Cg48qciXJ
	kbZI4SimXqdCHiZKWxTb3mDtEHGlcit6PSrQTyPoX7Fv1GD8M99tYAEJGk2tRjAQgQ1Wlu9E3zRbB
	BcPgU3kFCWBV9n+UgzOAe0DeeaLzH3Osxii3E/9MNJ4Odg7vegJW9BUb+PggKfYTgqw7AVQbY1nN6
	4fWvQyBrEXcZhHi5s0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgl94-000000094WL-3o3r;
	Wed, 21 Aug 2024 13:13:02 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgl8z-000000094Tk-3Lke;
	Wed, 21 Aug 2024 13:13:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C24C61C0003;
	Wed, 21 Aug 2024 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724245972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vs7divW60kguKgDMWWHovgfstUgnqjKRitONyQjoVng=;
	b=YkbjEK4R82sHBIvsdW/oWF2IuNoZgjx5jHlgkzzHPJd9bsH0QqJDzjARZg5eJ5QkdGWfwD
	9JDpbpJbXvM5P2Qwyni0G5qt1moiqFbRqgAn1YUNt+T6vspiSd35YcKzwKJHWccsuaBFwn
	l3zfDYdK1q7AnCDoI8qUYr2yjeOBbgsA7F95lKWmDBj2M1MPB0jNN3qU/lgLU2BfxL9xL2
	q1A/zo4JUmj1lxpB06dFwHWfbQU7cAVItFkKyIjYlAEJNl3u1PyfUyfXOL01Z8F6z8OU8J
	wvGqeTQu3Yzm5cn1YjRNBYseglMsRRlTYm/22I8Ly3wBv8Q/P5U8yunZ5JXH8g==
Date: Wed, 21 Aug 2024 15:12:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Joern Engel <joern@lazybastard.org>, Keith
 Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Saravana Kannan
 <saravanak@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Florian Fainelli
 <f.fainelli@gmail.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH v4 3/7] dt-bindings: mmc: add property for partitions
 node in mmc-card node
Message-ID: <20240821151249.294590ec@xps-13>
In-Reply-To: <66c5b8ec.5d0a0220.11ef1f.b572@mx.google.com>
References: <20240809172106.25892-1-ansuelsmth@gmail.com>
	<20240809172106.25892-4-ansuelsmth@gmail.com>
	<20240813200734.GA1659224-robh@kernel.org>
	<66c5b8ec.5d0a0220.11ef1f.b572@mx.google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_061259_010031_938E3D76 
X-CRM114-Status: GOOD (  39.30  )
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

SGkgQ2hyaXN0aWFuLAoKYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAyMCBBdWcg
MjAyNCAyMjoyMDo1OSArMDIwMDoKCj4gT24gVHVlLCBBdWcgMTMsIDIwMjQgYXQgMDI6MDc6MzRQ
TSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBPbiBGcmksIEF1ZyAwOSwgMjAyNCBhdCAw
NzoyMTowMVBNICswMjAwLCBDaHJpc3RpYW4gTWFyYW5naSB3cm90ZTogIAo+ID4gPiBBZGQgcHJv
cGVydHkgZm9yIGRlZmluaW5nIHBhcnRpdGlvbnMgbm9kZSBpbiBtbWMtY2FyZCBub2RlIHRvIGRl
ZmluZQo+ID4gPiBwYXJ0aXRpb25zIGluIERUIGJ5IHRoZSB1c2Ugb2YgdGhlIGJsb2NrMm10ZCBt
b2R1bGUgdG8gdXNlIGJsb2NrCj4gPiA+IGRldmljZXMgYXMgTVRELiAgCj4gPiAKPiA+IFlvdSBq
dXN0aWZpZWQgcGF0Y2ggMSBzYXlpbmcgZU1NQyBhbHJlYWR5IHN1cHBvcnRlZCB0aGlzLCBidXQg
dGhlbiBoZXJlIAo+ID4geW91IGFkZCBzdXBwb3J0Lgo+ID4gCj4gPiBCb3RoIGFyZSBhIE5BSyBm
b3IgbWUgYXMgYm90aCBhbHJlYWR5IGhhdmUgYSB3YXkgdG8gZGVzY3JpYmUgcGFydGl0aW9ucyAK
PiA+IHdpdGggR1BULgo+ID4gIAo+IAo+IEkgdGhpbmsgdGhpcyBnb3QgYSBiaXQgY29uZnVzZWQg
YW5kIGhvcGUgd2UgY2FuIGZpbmQgYSB3YXkgdG8gYWRkCj4gc3VwcG9ydCBmb3IgdGhpcy4KPiAK
PiBXaGF0IGlzICJhbHJlYWR5IHN1cHBvcnRlZCIgaXMgYXNzaWduaW5nIGFuIE9GIG5vZGUgc28g
ZHJpdmVyIGNhbgo+IHJlZmVyZW5jZSBpdC4gVGhpcyBwYXRjaCB3YXMganVzdCBhZGRpbmcgdGhl
IG5vZGVzIGluIHRoZSBzY2hlbWEgdG8gc2F5Cj4gdGhhdCBwYXJ0aXRpb25zIGNhbiBiZSBkZWZp
bmVkLgo+IAo+IEkgdGhpbmsgd2hhdCBpcyBub3QgY2xlYXIgaXMgdGhhdCBibG9jayBkZXZpY2Vz
IG1pZ2h0IGJlIHVzZWQgYXMgcmF3Cj4gZGV2aWNlcyB3aXRob3V0IGEgcGFydGl0aW9uIHRhYmxl
IGRlZmluZWQgaW4gdGhlIGRldmljZS4gSW4gc3VjaCBjYXNlCj4gaXQncyB0aGUga2VybmVsIHRo
YXQgZGVmaW5lIGEgZml4ZWQgcGFydGl0aW9uIHRhYmxlLgo+IAo+IE9uZSBleGFtcGxlIGlzIFsx
XSB3aGVyZSB0aGUgcGFydGl0aW9uIHRhYmxlIGlzIHByb3ZpZGVkIGJ5IGNtZGxpbmUuCj4gU2lt
aWxhciB0byBjbWRsaW5lcGFydCBNVEQgcGFyc2VyLgo+IAo+IFRoZSB1c2Ugb2YgYmxvY2sybXRk
IGlzIGp1c3QgdG8gbWFrZSB1c2Ugb2YgdGhlIE1URCBwYXJzZXIgc3lzdGVtLgo+IAo+IENvbnNp
ZGVyaW5nCj4gLSBlTU1DIGlzIHNvbGRlcmVkIHRvIHRoZSBkZXZpY2UgKG5vIGR5bmFtaWMgc2Nh
bikKPiAtIGNtZGxpbmUgbWlnaHQgYmUgbm90IHR1bmFibGUgYW5kIGhhcmRjb2RpbmcgaXQgbWln
aHQgYWxzbyBiZQo+ICAgcHJvYmxlbWF0aWMgKGFzIHNvbWUgY21kbGluZSBuZWVkcyB0byBiZSB1
c2VkKQo+IC0gY29uY2VwdCBvZiBmaXhlZCBwYXJ0aXRpb24gZm9yIGJsb2NrIGRldmljZSBpcyBh
bHJlYWR5IGEgdGhpbmcgYW5kCj4gICB1c2VkIGEgbG90IChhbmRyb2lkIEFGQUlLKQo+IAo+IEkg
dGhpbmsgaXQgc2hvdWxkIGJlIGFjY2VwdGFibGUgdG8gaW50cm9kdWNlIGluIERUIHN1cHBvcnQg
Zm9yIGRlZmluaW5nCj4gZml4ZWQgcGFydGl0aW9uIGZvciBibG9jayBkZXZpY2VzIGFuZCBzb21l
IGtpbmQgb2YgcGFyc2VyIHN5c3RlbSBzaW1pbGFyCj4gdG8gTVRELiBXaGF0IGRvIHlvdSB0aGlu
az8gV291bGQgdGhpcyBiZSBtb3JlIGFjY2VwdGFibGU/IElkZWEgaXMgdG8KPiBqdXN0IGhhdmUg
YSBEVCBzY2hlbWEgdGhhdCBtYWtlcyB1c2Ugb2YgdGhlIHZhbHVlcyB0aGF0IGNhbiBiZSBzZXQg
aW4KPiBbMV0uCj4gCj4gSG9wZSB3ZSBjYW4gZmluZCBhIHNvbHV0aW9uIHRvIHRoaXMsIEknbSB0
b3RhbGx5IE9LIGZvciBkcm9wcGluZyBOVk1lIGFzCj4gSSB1bmRlcnN0YW5kIGl0J3MgUENJZSBz
dHVmZiBhbmQgdmVyeSBkeW5hbWljIGJ1dCBPRU0gYXJlIG1ha2luZyBsb3RzIG9mCj4gdXNlIG9m
IGVNTUMgYW5kIGFyZSBzdGFydGluZyB0byB1c2UgdGhlc2Ugc3RyYW5nZSB3YXkgKGJsb2NrMm10
ZCkgYXMgd2UKPiBjdXJyZW50bHkgZG9uJ3QgZ2l2ZSBhIHByb3BlciBhbmQgZWFzeSBzb2x1dGlv
biBmb3IgdGhlIHRhc2suCgpUaGFua3MgZm9yIHRoZSBzdW1tYXJ5LiBJIGJlbGlldmUgSSBub3cg
aGF2ZSBhIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mCndoYXQgeW91IHdhbnQgdG8gZG8sIGJ1dCBJ
IGFtIHN0aWxsIGNvbnZpbmNlZCB5b3Ugc2hvdWxkIG5vdCBhYnVzZSB0aGUKbXRkIGxheWVyIGZv
ciB0aGF0LiBJZiBibG9ja3MgY2FuIGJlIHBhcnRpdGlvbmVkIGJhc2VkIG9uIHRoZSBjbWRsaW5l
CihvciBmcm9tIHRoZSBEVCkgdGhlbiB0aGUgcGFydGl0aW9uaW5nIGxvZ2ljIHNob3VsZCBiZSBz
cGVjaWZpYyB0bwp0aGUgYmxvY2sgbGF5ZXIuIEhvd2V2ZXIsIHRoZSBwYXJzaW5nIGxvZ2ljIGlz
IHByb2JhYmx5IHZlcnkgc2ltaWxhcgphbmQgY291bGQgYmUgZXh0cmFjdGVkIGludG8gYSBsaWIv
LCBwcm92aWRlZCB0aGF0IHRoZSBtdGQgYml0cyBhcmUKbW92ZWQgYXdheSBjbGV2ZXJseS4gWW91
IG9ubHkgbmVlZCB0aGUgZml4ZWQgcGFyc2VyIGFueXdheSwgYW5kIHlvdQpwcm9iYWJseSBkb24n
dCB3YW50IGFsbCB0aGUgd2VpcmQgY29ybmVyIGNhc2VzIHdlIGtlZXAgc3VwcG9ydGluZyBmb3IK
YmFja3dhcmQgY29tcGF0aWJpbGl0eSByZWFzb25zLgoKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29t
L3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL0RvY3VtZW50YXRpb24vYmxvY2svY21kbGluZS1w
YXJ0aXRpb24ucnN0Cj4gCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gTWFy
YW5naSA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvbW1jL21tYy1jYXJkLnlhbWwgICAgIHwgNDAgKysrKysrKysrKysrKysrKysr
Kwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykgIAo+IAoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
