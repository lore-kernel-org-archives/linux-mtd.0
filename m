Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86096C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 13:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21S5rVaTyrD8QlXeSCNigtMKFjHd2IFKjt28ajwGXtk=; b=kE0ZsGHXidyYTb
	C0nkT2EblrbhQzIGgAOPce7L65v9YahTjbUuHofyqhffbDtV1D/C+mf176IyAEo9x0AnPldKPYkHO
	ewNKmzBwbKtFMfHlHqJ2pfA0iQYGd+5cwEDLTc2oKAec1r6j+dEvj0Fl1itwhR8OxOD/YqwDgR1Vj
	2TwoTaGYAhWUjViE6ODkCtlpdpMo65RB7vWLnOgddM6eOtgqbiijw86odW1cGjUNqbE5gv2sjSHCf
	Wvw4jtqkmvfCAzO45uHUKZLnUhfdgcVNsCPA3hyEQRX0VxSxJgK2wHUO/UIB6R6K0JcMNfXVXFiBz
	g6jHFroA+LboQ/Af2uRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUw0-00000000Niv-2CbS;
	Mon, 12 Aug 2024 13:18:04 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUvw-00000000NiA-24n8;
	Mon, 12 Aug 2024 13:18:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41E7620002;
	Mon, 12 Aug 2024 13:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723468677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JdcV2kRk9M7GFAK/D+USec3altBfiWngrF1bMZJR0h0=;
	b=T1DGM4+ftpehFe4HTk9kRVwPAVKw3AXm0nD1T1JMZhEdelkbXoOfgy4NgYAKj95rVaLvIp
	nZnomFB1XkmKUg7BHzwy2Zpp7FfDaMYjbRXKCK5jVbxGkA4HSJ1kb6ERXFei+u8THVVKQK
	AB7ydR869hd6hCgePz3L2ncJBB48RgAJbw3nqvRXWZ2bnwmJrOyzsbOyD1LgGLVygbOXe1
	h2sXickvc/8OCgBUceYdm1WA7UmkQX6+A8msWci8Mu3YNPv7JKtz5mpXi+/Z91kCss8Pbp
	noYDmTyhdrsEflAz5id8Ax4oD5XfbGH/ORmkMLDhKex9GquwQMFbGoeyrW6ljA==
Date: Mon, 12 Aug 2024 15:17:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v4 0/7] mtd: improve block2mtd + airoha parser
Message-ID: <20240812151755.0feab4b2@xps-13>
In-Reply-To: <66b9df7c.050a0220.3574aa.d5bb@mx.google.com>
References: <20240809172106.25892-1-ansuelsmth@gmail.com>
	<20240812104954.1e8d55f7@xps-13>
	<66b9df7c.050a0220.3574aa.d5bb@mx.google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_061801_340107_76D26B03 
X-CRM114-Status: GOOD (  45.70  )
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

SGkgQ2hyaXN0aWFuLAoKYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGUgb24gTW9uLCAxMiBBdWcg
MjAyNCAxMjoxMDowMyArMDIwMDoKCj4gT24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMTA6NDk6NTRB
TSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIENocmlzdGlhbiwKPiA+IAo+ID4g
YW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGUgb24gRnJpLCAgOSBBdWcgMjAyNCAxOToyMDo1OCAr
MDIwMDoKPiA+ICAgCj4gPiA+IFRoaXMgc21hbGwgc2VyaWVzIGhhbmRsZSAyIHByb2JsZW1zLgo+
ID4gPiAKPiA+ID4gSXQgZG9lcyB0cnkgdG8gIiJzdGFuZGFyZGl6ZSIiIHRoZSB1c2FnZSBvZiBi
bG9jazJtdGQgbW9kdWxlIHdpdGgKPiA+ID4gTVREIE9GIG5vZGVzLgo+ID4gPiAKPiA+ID4gSXQg
aXMgdmVyeSBlYXN5IHRvIGFkZCBzdXBwb3J0IGZvciBNVEQgcGFyc2VyIGJ5IGp1c3QgYWRkaW5n
IGFuCj4gPiA+IE9GIG5vZGUgdG8gdGhlIG10ZCBjcmVhdGVkIGZvciBibG9jazJtdGQuCj4gPiA+
IAo+ID4gPiBUaGlzIGFwcGx5IG9ubHkgaWYgdGhlIHJvb3QgYmxvY2sgaXMgdXNlZCBmb3IgYmxv
Y2sybXRkIHRvIGFsbG93Cj4gPiA+IHNjZW5hcmlvIHdoZXJlIHRoZSBmdWxsIGVNTUMgb3IgYW4g
TlZNRSBpcyB1c2VkIGZvciBNVEQgYW5kIGl0IGRvZXNuJ3QKPiA+ID4gaGF2ZSBhbnkgcGFydGl0
aW9uIHRhYmxlLgo+ID4gPiAKPiA+ID4gVG8gYWxzbyBzdXBwb3J0IE5WTUUsIHNpbWlsYXIgdG8g
aG93IGl0J3MgZG9uZSB3aXRoIGVNTUMsIHdlIGludHJvZHVjZQo+ID4gPiBhIHN1Ym5vZGUgdG8g
dGhlIE5WTUUgY29udHJvbGxlciB0aGF0IG5lZWRzIHRvIGhhdmUgdGhlICJudm1lLWNhcmQiCj4g
PiA+IGNvbXBhdGlibGUgd2hlcmUgYSBkZXYgY2FuIGRlZmluZSBmaXhlZC1wYXJpdGlvbnMgZm9y
IE1URCBwYXJzZXIgdXNhZ2UuCj4gPiA+IAo+ID4gPiBUaGlzIHNlcmllcyBhbHNvIGFkZCBzdXBw
b3J0IGZvciB0aGUgQWlyb2hhIHBhcnRpdGlvbiB0YWJsZSB3aGVyZQo+ID4gPiB0aGUgbGFzdCBw
YXJ0aXRpb24gaXMgYWx3YXlzIEFSVCBhbmQgaXMgcGxhY2VkIGF0IHRoZSBlbmQgb2YgdGhlIGZs
YXNoLgo+ID4gPiAKPiA+ID4gVGhpcyByZXF1aXJlIGR5bmFtaWMgY2FsY3VsYXRpb24gb2YgdGhl
IG9mZnNldCBhcyBzb21lIGRlZGljYXRlZAo+ID4gPiBkcml2ZXIgZm9yIGJhZCBibG9jayBtYW5h
Z2VtZW50IG1pZ2h0IGJlIHVzZWQgdGhhdCByZXNlcnZlIHNvbWUgc3BhY2UKPiA+ID4gYXQgdGhl
IGVuZCBvZiB0aGUgZmxhc2ggZm9yIGJsb2NrIGFjY291bnRpbmcuICAKPiA+IAo+ID4gV2hvIGlz
IHJlc2VydmluZyB0aGlzIHNwYWNlPyBBbmQgdGhpcyBpcyBub3QgcmVmbGVjdGVkIGFueXdoZXJl
IGluIHRoZQo+ID4gcGFydGl0aW9uIHRhYmxlPwo+ID4gIAo+IAo+IFRvIGJlIG1vcmUgcHJlY2lz
ZSBNZWRpYXRlayB1c2UgYSBjdXN0b20gd2F5IHRvIGhhbmRsZSBiYWQgYmxvY2tzIGNhbGxlZAo+
IEJNVCB3aGVyZSB0aGV5IHJlc2VydmUgYW5kIHN0b3JlIGRhdGEgYXQgdGhlIGVuZCBvZiB0aGUg
bmFuZC4gVGhpcyBpcwo+IGxvYWRlZCBiZWZvcmUgdGhlIGZsYXNoIGRyaXZlciBjb250cm9sbGVy
IHNvIHdoZW4gTVREIGlzIGluaXQsIHRoZSBzaXplCj4gaXMgYWxyZWFkeSByZWR1Y2VkLiBUaGUg
cmVzZXJ2ZWQgc3BhY2UgY2FuIGNoYW5nZSBhbmQgaXQgcmVhbGx5IGRlcGVuZHMKPiBvbiB0aGUg
dHVuZWQgdmFsdWVzIGhlbmNlIGl0IG1heSBjaGFuZ2UuCgpJcyB0aGlzIHN1cHBvcnRlZCBpbiBt
YWlubGluZSBMaW51eD8gTVREIGhhbmRsZXMgdGhlIGJhZCBibG9ja3MgYW5kIHRoZQpiYWQgYmxv
Y2sgdGFibGVzLCBzbyBJIGRvbid0IHVuZGVyc3RhbmQgaG93IHRoaXMgaGFyZHdhcmUgZmVhdHVy
ZSBjYW4KbGl2ZSB0b2dldGhlciB3aXRoIE1URC4KCkFueXdheSwgeW91IGFyZSB0YWxraW5nIGFi
b3V0IE1NQ3MsIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhlcmUgYXJlCmJhZCBibG9ja3MsIG5v
ciB3aGF0IGlzIGNoZWNraW5nIHRoZW0gYW5kIHdoZW4uIFRoaXMgaXMgYWxsIHN0aWxsIHZlcnkK
ZnV6enkgdG8gbWUsIEknbSBzb3JyeS4KCj4gPiA+IE5ldyBhYXJjaDY0IEFpcm9oYSBTb0MgbWFr
ZSB1c2Ugb2YgdGhpcyBwYXJ0aXRpb24gdGFibGUgYW5kIHVzZSBibG9jazJtdGQKPiA+ID4gZm9y
IGVNTUMgdG8gdHJlYXQgdGhlbSBhcyBNVEQgd2l0aCBjdXN0b20gYmFkIGJsb2NrIG1hbmFnZW1l
bnQgYW5kIGJsb2NrCj4gPiA+IHRyYWNraW5nLiAgCj4gPiAKPiA+IEkgYW0gc29ycnksIEkgYW0g
bm90IHVzZWQgdG8gc3VjaCB1c2UgY2FzZXMsIGFuZCBJIHJlYWxseSBmYWlsIGdldHRpbmcKPiA+
IHdoeSB5b3Ugd291bGQgbGlrZSB0byB1c2UgbXRkIHdpdGggYW4gZU1NQy4gQ2FuIHlvdSBleHBs
YWluIGEgbGl0dGxlCj4gPiBiaXQgbW9yZSB3aGF0IGlzIG5vdCBhdmFpbGFibGUgaW4gdGhlIGJs
b2NrIHdvcmxkIHRoYXQgeW91IHJlYWxseSBuZWVkCj4gPiBmcm9tIG10ZD8gIAo+IAo+IFNpbmNl
IHZlbmRvciBuZWVkcyBtb3JlIHNwYWNlIGFuZCBkb2Vzbid0IHdhbnQgdG8gYWRhcHQgdG8gYmxv
Y2sgd29ybGQsCj4gdGhleSBhcmUgc3RhcnRpbmcgdG8gdXNlIGVNTUMgb3IgYmxvY2sgZGV2aWNl
cyBpbiBnZW5lcmFsIHVucGFydGl0aW9uZWQKPiBhbmQgcmF3IAoKT2theSwgd2h5IG5vdCwgaXQn
cyBlYXNpZXIgZm9yIFJPTXMgdG8gYWNjZXNzIGl0IEkgZ3Vlc3MuCgo+IGFuZCB1c2luZyBibG9j
azJtdGQgdG8gc2ltdWxhdGUgaXQuCgpUaGlzIGlzIHdoYXQgSSBkb24ndCB1bmRlcnN0YW5kLiBZ
b3UgY2FuIHZlcnkgd2VsbCBhY2Nlc3MgeW91ciBibG9jawpkZXZpY2UgYnkgb2Zmc2V0LCB3aHkg
ZG8geW91IG5lZWQgdGhlIG10ZCBpbnRlcmZhY2UgYXQgYWxsPwoKPiBUaGV5IGRvbid0IGNhcmUg
YWJvdXQgdGhlCj4gcGVyZm9ybWFuY2UgcGVuYWxpdGllcyBhcyBpdCdzIHNvbWV0aGluZyByZWFk
IGF0IGJvb3QgdGltZSBhbmQgb25seSBuZXcKPiBmaXJtd2FyZSBvciBzb21lIGNvbmZpZyBmaWxl
cyBhcmUgd3JpdHRlbi4KPiAKPiBJcyBpdCBtb3JlIGNsZWFyIG5vdz8KCkkgc3RpbGwgZG9uJ3Qg
dW5kZXJzdGFuZCB0aGUgbmVlZCBmb3IgZ29pbmcgdGhyb3VnaCBNVEQgdGJoLgoKPiA+IEFsc28s
IGRpZCB5b3UgY29uc2lkZXIgbnZtZW0gbGF5b3V0cyBpbnN0ZWFkIHRvIGRldGVjdCBhbmQgZGVm
aW5lIHRoZQo+ID4gQVJUIGFyZWE/IChqdXN0IGFza2luZykuCj4gPiAgIAo+IAo+IFRoZXkgc3Rp
bGwgbmVlZCBhIE1URCBwYXJ0aXRpb24KCldoeT8KCj4gYW5kIG1vc3Qgb2YgdGhlIHRpbWUgdXNl
cnNwYWNlIHRvb2wgYXJlCj4gdXNlZCBvbiB0aGUgQVJUIHBhcnRpdGlvbi4gVXNpbmcgYmxvY2sy
bXRkIGFuZCBEVCBzdXBwb3J0IHdpbGwgcGVybWl0Cj4gdGhlIHVzZSBvZiBudm1lbSBjZWxsIGFz
IGEgc2lkZSBlZmZlY3QgKGFuZCB0aGF0IGlzIGEgbWlzc2l2ZSBib251cwo+IHBvaW50IG9mIHRo
aXMgaG9uZXN0bHkpCgpNVEQgYWxzbyByZWdpc3RlcnMgaW50byBOVk1FTSwgc28gdGhpcyBpcyBu
aWNlIGlmIHlvdSBuZWVkIGJvdGgsIGJ1dCBpZgp3aGF0IHlvdSBuZWVkIGlzIHNvbWUgTlZNRU0g
YXJlYSBkZXJpdmVkIGR5bmFtaWNhbGx5IGFuZCB5b3UgcmVnaXN0ZXIKaW50byBNVEQgZm9yIHRo
YXQsIHRoZW4gbm8sIEknbSBzb3JyeSwgdGhhdCdzIG5vdCB0aGUgY29ycmVjdCBhcHByb2FjaC4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
