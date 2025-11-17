Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48936CEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 19:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrWJXyK1lvbqD8Lwjae5hT3WxK/2vbH3trz9cgs5zis=; b=wpOwe9q3BxzBQE
	hZH7fDTH/VW8m3nQ8lFScelHrzfWkMloGLZ8YYvA5SAd7e+WRT8jGQ76G5sB2mFCB9Ya17QKv+FHv
	oryPKMAc/JZxLvXy/tcToBnPqQdGY7221ax1Bnzy3SnLPaQh75lJx/fyD3e0ggMXreC1OuCKuHztf
	ISuAzKwp9IJ8Rd+KS3n6LDhuvdt/PICTvKIMNxGVjKsIq8ZHvERffsvnJclphwYrIZ/k1R/ypR/hV
	q/cdmU447b622cp+bkiarrHEMzWScsux3RaH+gVIuTeHT7HlZQm8zoq4xWloE4RvFhtWNALVYj1Yu
	fxy6gaW3NotDskTuMtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4r6-0000000Gkej-0ZBJ;
	Mon, 17 Nov 2025 19:25:40 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4r4-0000000Gke6-1cyj;
	Mon, 17 Nov 2025 19:25:38 +0000
Message-ID: <a78ffac5-157d-4f78-a9e7-fdb15ebca360@infradead.org>
Date: Mon, 17 Nov 2025 11:25:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: docg3: fix kernel-doc warnings
From: Randy Dunlap <rdunlap@infradead.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <20251116070944.84071-1-rdunlap@infradead.org>
 <874iqtf576.fsf@bootlin.com>
 <5fadee48-4a35-40ef-aac2-eb307e2ee869@infradead.org>
Content-Language: en-US
In-Reply-To: <5fadee48-4a35-40ef-aac2-eb307e2ee869@infradead.org>
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

CgpPbiAxMS8xNy8yNSAxMTowOSBBTSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IAo+IAo+IE9uIDEx
LzE3LzI1IDEyOjEyIEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSBSYW5keSwKPj4KPj4g
T24gMTUvMTEvMjAyNSBhdCAyMzowOTo0NCAtMDgsIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPiB3cm90ZToKPj4KPj4+IEZpeCBrZXJuZWwtZG9jIHdhcm5pbmdzIGluIGRvY2cz
LmggdG8gYXZvaWQgYnVpbGQgd2FybmluZ3MgYW5kIHRvCj4+PiBpbXByb3ZlIGFuZCBkb2N1bWVu
dGF0aW9uOgo+Pgo+PiAidG8gaW1wcm92ZSBhbmQgZG9jdW1lbnRhdGlvbiIgaXMgaW5jb3JyZWN0
LCBjYW4geW91IHBsZWFzZSBmaXg/Cj4gCj4gdWdoLiBZZXMsIHdpbGwgZml4Lgo+IAo+Pj4gV2Fy
bmluZzogLi4vZHJpdmVycy9tdGQvZGV2aWNlcy9kb2NnMy5oOjI3NiBiYWQgbGluZToKPj4+IFdh
cm5pbmc6IGRyaXZlcnMvbXRkL2RldmljZXMvZG9jZzMuaDoyOTkgc3RydWN0IG1lbWJlciAnbWF4
X2Jsb2NrJyBub3QKPj4+ICBkZXNjcmliZWQgaW4gJ2RvY2czJwo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+Pj4gLS0tCj4+PiBDYzog
Um9iZXJ0IEphcnptaWsgPHJvYmVydC5qYXJ6bWlrQGZyZWUuZnI+Cj4+PiBDYzogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPj4+IENjOiBSaWNoYXJkIFdlaW5iZXJn
ZXIgPHJpY2hhcmRAbm9kLmF0Pgo+Pj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hy
QHRpLmNvbT4KPj4+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gLS0tCj4+
PiAgZHJpdmVycy9tdGQvZGV2aWNlcy9kb2NnMy5oIHwgICAgMyArKy0KPj4+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gLS0tIGxpbnV4LW5l
eHQtMjAyNTExMTQub3JpZy9kcml2ZXJzL210ZC9kZXZpY2VzL2RvY2czLmgKPj4+ICsrKyBsaW51
eC1uZXh0LTIwMjUxMTE0L2RyaXZlcnMvbXRkL2RldmljZXMvZG9jZzMuaAo+Pj4gQEAgLTI3NCwx
MSArMjc0LDEyIEBAIHN0cnVjdCBkb2NnM19jYXNjYWRlIHsKPj4+ICAgKiBAY2FzY2FkZTogdGhl
IGNhc2NhZGUgdGhpcyBkZXZpY2UgYmVsb25ncyB0bwo+Pj4gICAqIEBkZXZpY2VfaWQ6IG51bWJl
ciBvZiB0aGUgY2FzY2FkZWQgRG9DRzMgZGV2aWNlICgwLCAxLCAyIG9yIDMpCj4+PiAgICogQGlm
X2NmZzogaWYgdHJ1ZSwgcmVhZHMgYXJlIG9uIDE2Yml0cywgZWxzZSByZWFkcyBhcmUgb24gOGJp
dHMKPj4+IC0KPj4+ICsgKgo+Pgo+PiBXcm9uZyBmaXggSSBiZWxpZXZlLiBXaGF0IG1ha2UgeW91
IHRoaW5rIGEgc3BhY2UgaXMgcmVsZXZhbnQgaGVyZT8KPiAKPiBUaGUgJyonIGlzIHJlbGV2YW50
IGhlcmUuIEEgYmxhbmsgbGluZSBvZiBrZXJuZWwtZG9jIHNob3VsZCBoYXZlIGEKPiBiZWdpbm5p
bmcgYXN0ZXJpc2s6Cj4gICoKCkFoLCBJJ2xsIGp1c3QgcmVtb3ZlIHRoZSBibGFuayBsaW5lIGlu
c3RlYWQuIFRoYW5rcy4KCj4+PiAgICogQHJlbGlhYmxlOiBpZiAwLCBkb2NnMyBpbiBub3JtYWwg
bW9kZSwgaWYgMSBkb2NnMyBpbiBmYXN0IG1vZGUsIGlmIDIgaW4KPj4+ICAgKiAgICAgICAgICAg
IHJlbGlhYmxlIG1vZGUKPj4+ICAgKiAgICAgICAgICAgIEZhc3QgbW9kZSBpbXBsaWVzIG1vcmUg
ZXJyb3JzIHRoYW4gbm9ybWFsIG1vZGUuCj4+PiAgICogICAgICAgICAgICBSZWxpYWJsZSBtb2Rl
IGltcGxpZXMgdGhhdCBwYWdlIDIqbiBhbmQgMipuKzEgYXJlIGNsb25lcy4KPj4+ICsgKiBAbWF4
X2Jsb2NrOiBtYXhpbXVtIGJsb2NrIG51bWJlciBmb3IgdGhpcyBkZXZpY2UKPj4+ICAgKiBAYmJ0
OiBiYWQgYmxvY2sgdGFibGUgY2FjaGUKPj4+ICAgKiBAb29iX3dyaXRlX29mczogb2Zmc2V0IG9m
IHRoZSBNVEQgd2hlcmUgdGhpcyBPT0Igc2hvdWxkIGJlbG9uZyAoaWUuIGluIG5leHQKPj4+ICAg
KiAgICAgICAgICAgICAgICAgcGFnZV93cml0ZSkKPj4KPj4gVGhhbmtzLAo+PiBNaXF1w6hsCj4g
CgotLSAKflJhbmR5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
