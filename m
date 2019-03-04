Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FD1C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 09:01:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FC120836
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 09:01:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UR9YMSdz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5FC120836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vf8Qpo/cr0KRnDjLiRYEpky0OB9urQL8gP9I3xz0u58=; b=UR9YMSdzUf/xwQ
	oJJaRhfSlxIv0Y0cFLq4AXNkfD3K3m2elDswov+5KrBBZd66C2R6cew6KHhFDmPA4GXUWRH4pSr0Z
	/Z7zAdIUeP7sx546RLmszd8DYzaDw9oPRqbbFOCpfc67rsEaUuBmgUCH2RWxXb7xfyjsON6AQX9Jv
	2IY84c7uiDPbt579JM8seX5YSZekS/SvzTGaaz+ywNlO1J8GC7Ut0T34AOev/1EY+PZRoMDV+KExd
	4nW6ayHr/+PXyrqwazLxGfWUXwKeaNsKQ1tvzvUD2rDnq5G4LICkSZVMX22VX2yB+/n8dfjKikBRN
	ih4RZYJhn98k/CNG5Xvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0jTP-0004Lf-U7; Mon, 04 Mar 2019 09:01:23 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0jTM-0004L8-EY
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 09:01:22 +0000
X-Originating-IP: 90.88.147.150
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1BF8D1C0002;
 Mon,  4 Mar 2019 09:01:07 +0000 (UTC)
Date: Mon, 4 Mar 2019 10:01:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 02/10] mtd: rawnand: denali: refactor syndrome layout
 handling for raw access
Message-ID: <20190304100106.72ad49c3@xps13>
In-Reply-To: <1549955582-30346-3-git-send-email-yamada.masahiro@socionext.com>
References: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
 <1549955582-30346-3-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_010120_640510_9A9CF4F1 
X-CRM114-Status: GOOD (  19.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDEyIEZlYgoyMDE5IDE2OjEyOjU0ICswOTAwOgoKPiBUaGUgRGVu
YWxpIElQIGFkb3B0cyB0aGUgc3luZHJvbWUgcGFnZSBsYXlvdXQgKHBheWxvYWQgYW5kIEVDQyBh
cmUKPiBpbnRlcmxlYXZlZCkuIFRoZSAqX3BhZ2VfcmF3KCkgYW5kICpfb29iKCkgY2FsbGJhY2tz
IGFyZSBjb21wbGljYXRlZAo+IGJlY2F1c2UgdGhleSBtdXN0IGhpZGUgdGhlIHVuZGVybHlpbmcg
bGF5b3V0IHVzZWQgYnkgdGhlIGhhcmR3YXJlLAo+IGFuZCBhbHdheXMgcmV0dXJuIGNvbnRpZ3Vv
dXMgaW4tYmFuZCBhbmQgb3V0LW9mLWJhbmQgZGF0YS4KPiAKPiBDdXJyZW50bHksIHNpbWlsYXIg
Y29kZSBpcyBkdXBsaWNhdGVkIHRvIHJlb3JnYW5pemUgdGhlIGRhdGEgbGF5b3V0Lgo+IEZvciBl
eGFtcGxlLCBkZW5hbGlfcmVhZF9wYWdlX3JhdygpIGFuZCBkZW5hbGlfd3JpdGVfcGFnZV9yYXco
KSBsb29rCj4gYWxtb3N0IHRoZSBzYW1lLgo+IAo+IFRoZSBpZGVhIGZvciByZWZhY3RvcmluZyBp
cyB0byBzcGxpdCB0aGUgY29kZSBpbnRvIHR3byBwYXJ0czoKPiAgIFsxXSBjb252ZXJzaW9uIG9m
IHBhZ2UgbGF5b3V0Cj4gICBbMl0gd2hhdCB0byBkbyBhdCBldmVyeSBFQ0MgY2h1bmsgYm91bmRh
cnkKPiAKPiBGb3IgWzFdLCBJIHdyb3RlIGRlbmFsaV9yYXdfcGF5bG9hZF9vcCgpIGFuZCBkZW5h
bGlfcmF3X29vYl9vcCgpLgo+IFRoZXkgbWFuaXB1bGF0ZSBkYXRhIGZvciB0aGUgRGVuYWxpIGNv
bnRyb2xsZXIncyBzcGVjaWZpYyBwYWdlIGxheW91dAo+IG9mIGluLWJhbmQsIG91dC1vZi1iYW5k
LCByZXNwZWN0aXZlbHkuCgpDb3VsZCB5b3UgcGxlYXNlIGNvbW1lbnQgdGhlIHB1cnBvc2Ugb2Yg
dGhlc2UgdHdvIGZ1bmN0aW9ucyBpbiB0aGUgY29kZQphcyB3ZWxsPwoKPiAKPiBUaGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHdyaXRlIGFuZCByZWFkIGlzIGp1c3QgdGhlIG9wZXJhdGlvbiBhdAo+IEVD
QyBjaHVuayBib3VuZGFyaWVzLiBGb3IgZXhhbXBsZSwgZGVuYWxpX3JlYWRfb29iKCkgY2FsbHMK
PiBuYW5kX2NoYW5nZV9yZWFkX2NvbHVtbl9vcCgpLCB3aGVyZWFzIGRlbmFsaV93cml0ZV9vb2Io
KSBjYWxscwo+IG5hbmRfY2hhbmdlX3dyaXRlX2NvbHVtbl9vcCgpLiBTbywgSSBpbXBsZW1lbnRl
ZCBbMl0gYXMgYSBjYWxsYmFjawo+IHBhc3NlZCBpbnRvIFsxXS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+IC0tLQo+
IAo+IENoYW5nZXMgaW4gdjI6IE5vbmUKPiAKPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGku
YyB8IDM1NCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAxIGZp
bGUgY2hhbmdlZCwgMTYzIGluc2VydGlvbnMoKyksIDE5MSBkZWxldGlvbnMoLSkKClRvbyBiYWQg
dGhhdCB0aGUgc2l6ZSBvZiB0aGUgZHJpdmVyIGRpZCBub3Qgc2hyaW5rIG1vcmUgdGhhbiB0aGF0
IDopCgpbLi4uXQoKPiAtCS8qIE9PQiBmcmVlICovCj4gLQlsZW4gPSBvb2JzaXplIC0gKGJ1ZnBv
aSAtIGNoaXAtPm9vYl9wb2kpOwo+IC0JaWYgKHdyaXRlKQo+IC0JCW5hbmRfY2hhbmdlX3dyaXRl
X2NvbHVtbl9vcChjaGlwLCBzaXplIC0gbGVuLCBidWZwb2ksIGxlbiwKPiAtCQkJCQkgICAgZmFs
c2UpOwo+IC0JZWxzZQo+IC0JCW5hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKGNoaXAsIHNpemUg
LSBsZW4sIGJ1ZnBvaSwgbGVuLAo+IC0JCQkJCSAgIGZhbHNlKTsKPiArCXJldHVybiAwOwo+ICt9
Cj4gKwo+ICtzdGF0aWMgaW50IGRlbmFsaV9tZW1jcHlfaW4odm9pZCAqYnVmLCB1bnNpZ25lZCBp
bnQgb2Zmc2V0LCB1bnNpZ25lZCBpbnQgbGVuLAo+ICsJCQkgICAgdm9pZCAqcHJpdikKPiArewo+
ICsJbWVtY3B5KGJ1ZiwgcHJpdiArIG9mZnNldCwgbGVuKTsKPiArCXJldHVybiAwOwo+ICB9CgpN
YXliZSB0aGlzICJjYWxsYmFjayIgYW5kIHRoZSAoX291dCBjb3VzaW4pIGNvdWxkIGJlIHBhcnQg
b2YgeW91CmNvbnRyb2xsZXIncyBzdHJ1Y3R1cmUsIGFuZCB5b3UgY291bGQgdXNlIGEgcmVhZC93
cml0ZSBmbGFnIGluc3RlYWQgb2YKcGFzc2luZyB0aGUgZnVuY3Rpb25zJyBwb2ludGVyPwoKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
