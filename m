Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3491AC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 07:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUqqgjZwsG9k/jBKl9QJhdA2QYQ00em7+PZ3IJRE4TE=; b=Ih3OsnZNxMpVaE
	SN1s55ftP7SA7sKMpCcirLLKqRjEp3ob3Fo7Hp/ymmmaez7Kg18Rhj5izCuPlkFI8OnT6dPDrEKH9
	T7B7Z/d0uyAMl1ytpw85h8QJDSCdoLGFPH67I8fu17ZP4hlys5zoID0WSMjl0Utwxu60578zLQzou
	6f4pQQhMmvC0btmbZ6WzXaV7q1yYYYgt/PRv1f2aazlBEqhzfJc90pHcRyZezvPl3lheSk/DIuq7x
	laqYy6Zhu7DBKMnPllrXly/NYLNmhzgnyjtFfOZ2fWHeZHCrTxs1+HkFeHdSx/mIjXv+0nTmCvTEW
	FbKV6kCY3yqF3P9bYCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msgUM-00BB7H-Sw; Thu, 02 Dec 2021 07:26:42 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msgUJ-00BB6M-U6
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 07:26:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 314DF200005;
 Thu,  2 Dec 2021 07:26:35 +0000 (UTC)
Date: Thu, 2 Dec 2021 08:26:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-spi@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Mark Brown <broonie@kernel.org>, Richard
 Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 devicetree@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 linux-mtd@lists.infradead.org, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 5/5] spi: dt-bindings: Add an example with two
 stacked flashes
Message-ID: <20211202082634.0592fecf@xps13>
In-Reply-To: <YagL29VKiKZcu7KQ@robh.at.kernel.org>
References: <20211126163450.394861-1-miquel.raynal@bootlin.com>
 <20211126163450.394861-6-miquel.raynal@bootlin.com>
 <1638054802.100671.1973542.nullmailer@robh.at.kernel.org>
 <YaO0ahOhM3XwLqND@robh.at.kernel.org>
 <20211129102319.1efe1841@xps13>
 <YagL29VKiKZcu7KQ@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_232640_131602_5CD5897C 
X-CRM114-Status: GOOD (  22.23  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwgMSBEZWMgMjAyMSAxNzo1Nzox
NSAtMDYwMDoKCj4gT24gTW9uLCBOb3YgMjksIDIwMjEgYXQgMTA6MjM6MTlBTSArMDEwMCwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIFJvYiwKPiA+IAo+ID4gcm9iaEBrZXJuZWwub3JnIHdy
b3RlIG9uIFN1biwgMjggTm92IDIwMjEgMTA6NTU6MDYgLTA2MDA6Cj4gPiAgIAo+ID4gPiBPbiBT
YXQsIE5vdiAyNywgMjAyMSBhdCAwNDoxMzoyMlBNIC0wNzAwLCBSb2IgSGVycmluZyB3cm90ZTog
IAo+ID4gPiA+IE9uIEZyaSwgMjYgTm92IDIwMjEgMTc6MzQ6NTAgKzAxMDAsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6ICAgIAo+ID4gPiA+ID4gUHJvdmlkZSBhbiBleGFtcGxlIG9mIGhvdyB0byBkZXNj
cmliZSB0d28gZmxhc2hlcyBpbiBlZy4gc3RhY2tlZCBtb2RlLgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sIHwgNyArKysrKysrCj4gPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gICAgIAo+ID4gPiA+IAo+ID4gPiA+
IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0
X2JpbmRpbmdfY2hlY2snCj4gPiA+ID4gb24geW91ciBwYXRjaCAoRFRfQ0hFQ0tFUl9GTEFHUyBp
cyBuZXcgaW4gdjUuMTMpOgo+ID4gPiA+IAo+ID4gPiA+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9y
czoKPiA+ID4gPiAKPiA+ID4gPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgo+ID4gPiA+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3BpLWNvbnRyb2xsZXIuZXhh
bXBsZS5kdHM6NDAuMjMtNDUuMTU6IFdhcm5pbmcgKHNwaV9idXNfcmVnKTogL2V4YW1wbGUtMC9z
cGlAODAwMTAwMDAvZmxhc2hAMiwzOiBTUEkgYnVzIHVuaXQgYWRkcmVzcyBmb3JtYXQgZXJyb3Is
IGV4cGVjdGVkICIyIiAgICAKPiA+ID4gCj4gPiA+IFVuaXQtYWRkcmVzc2VzIGFyZSBiYXNlZCBv
biB0aGUgZmlyc3QgcmVnIGVudHJ5LiAgCj4gPiAKPiA+IFllcywgSSBiZWxpZXZlIHRoaXMgZXJy
b3IgaXMgZXhwZWN0ZWQgc2luY2UgZHRjIGhhcyBub3QgYmVlbiB5ZXQKPiA+IHVwZGF0ZWQuIEJl
bG93IHRoZSBwYXRjaCBmb3IgYWRhcHRpbmcgZHRjIHRvIHRoaXMgbmV3IHNpdHVhdGlvbiBhbmQK
PiA+IGtlZXAgdGhlIHJvYm90cyBoYXBweS4KPiA+IAo+ID4gSG93IHNob3VsZCB3ZSBwcm9jZWVk
PyAgCj4gCj4gTm8sIEknbSBzYXlpbmcgeW91IGhhdmUgdGhpcyB3cm9uZy4gQSB1bml0LWFkZHJl
c3MgaXMgY29tcG9zZWQgb2YgCj4gZGlmZmVyZW50IGZpZWxkcywgbm90IGRpZmZlcmVudCBlbnRy
aWVzIG9mIHRoZSBzYW1lIGZpZWxkLiBGb3IgCj4gZXhhbXBsZSwgYW4gZXh0ZXJuYWwgcGFyYWxs
ZWwgYnVzIGhhcyBhIGNoaXAgc2VsZWN0IHBsdXMgYWRkcmVzcywgc28gdGhlIAo+IHVuaXQtYWRk
cmVzcyBpcyAnPGNzPiw8YWRkcj4nLiBJZiB5b3UgaGF2ZSAyIFNQSSBjaGlwIHNlbGVjdHMsIHRo
YXQncyAyIAo+IGVudHJpZXMgb2YgdGhlIHNhbWUgdGhpbmcuIFRoZSBTUEkgYnVzIGlzIG5vdCAy
IGFkZHJlc3MgY2VsbHMsIGJ1dCAxIAo+IGNlbGwgd2l0aCAyIGVudHJpZXMuCgpNeSBiYWQsIG5v
dyBJIGdldCBpdCwgdGhhbmtzLgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
