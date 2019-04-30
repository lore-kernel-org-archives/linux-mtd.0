Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C37C04AA8
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 11:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4B8521707
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 11:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bYg7ELWE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4B8521707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SfKXBwU16bREFTD8sMrvkwkIE6gs205AGCW6Z5gX+w=; b=bYg7ELWEMW9MDq
	IPR2Qp5lB1AB+A7iZAlAJ6wzW8aCaTQZFkW1M6cP66ha4hX422xOmPFTQxAlEwfyH5tLBMdagOAUv
	7OxvOk/uYa6Ur7XTYCNXMVu18KPTirGWZhJL+HWAtVNEE+sFj1tg9bRVvNdTlS5HSP4ZELzb2sCih
	eizU71S2MUmzcVklqe2rxdcqYNPSWWahATWQCCEd65SAt8GSe30q81ZlzimQLSU2F890pHDpEMG/2
	dQ7mw2PO5vF3/xcyBjp+Eh+2Typ1eOc0mIMIh7YvME/kQLCEZrUPqEaieY39t2EzMXEJcdOWYNeXz
	+fgreqsV2eQA6GaXGZmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLRPx-00011U-Uq; Tue, 30 Apr 2019 11:59:25 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLRPu-00010G-3m; Tue, 30 Apr 2019 11:59:23 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9B44DFF807;
 Tue, 30 Apr 2019 11:59:11 +0000 (UTC)
Date: Tue, 30 Apr 2019 13:59:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: Re: [PATCH v2 1/5] mtd: rawnand: mtk: Correct low level time
 calculation of r/w cycle
Message-ID: <20190430135910.1deddd51@xps13>
In-Reply-To: <20190430100250.28083-2-xiaolei.li@mediatek.com>
References: <20190430100250.28083-1-xiaolei.li@mediatek.com>
 <20190430100250.28083-2-xiaolei.li@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_045922_458896_EC04670E 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: richard@nod.at, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 srv_heupstream@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWGlhb2xlaSwKClhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiB3cm90ZSBv
biBUdWUsIDMwIEFwciAyMDE5IDE4OjAyOjQ2CiswODAwOgoKPiBBdCBwcmVzZW50LCB0aGUgZmxv
dyBvZiBjYWxjdWxhdGluZyBBQyB0aW1pbmcgb2YgcmVhZC93cml0ZSBjeWNsZSBpbiBTRFIKPiBt
b2RlIGlzIHRoYXQ6Cj4gQXQgZmlyc3QsIGNhbGN1bGF0ZSBoaWdoIGhvbGQgdGltZSB3aGljaCBp
cyB2YWxpZCBmb3IgYm90aCByZWFkIGFuZCB3cml0ZQo+IGN5Y2xlIHVzaW5nIHRoZSBtYXggdmFs
dWUgYmV0d2VlbiB0UkVIX21pbiBhbmQgdFdIX21pbi4KPiBTZWNvbmRseSwgY2FsY3VsYXRlIFdF
IyBwdWxzZSB3aWR0aCB1c2luZyB0V1BfbWluLgo+IFRocmlkbHksIGNhbGN1bGF0ZSBSRSMgcHVs
c2Ugd2lkdGggdXNpbmcgdGhlIGJpZ2dlciBvbmUgYmV0d2VlbiB0UkVBX21heAo+IGFuZCB0UlBf
bWluLgo+IAo+IEJ1dCBOQU5EIFNQRUMgc2hvd3MgdGhhdCBDb250cm9sbGVyIHNob3VsZCBhbHNv
IG1lZXQgd3JpdGUvcmVhZCBjeWNsZSB0aW1lLgo+IFRoYXQgaXMgd3JpdGUgY3ljbGUgdGltZSBz
aG91bGQgYmUgbW9yZSB0aGFuIHRXQ19taW4gYW5kIHJlYWQgY3ljbGUgc2hvdWxkCj4gYmUgbW9y
ZSB0aGFuIHRSQ19taW4uIE9idmlvdXNseSwgd2UgZG8gbm90IGFjaGlldmUgdGhhdCBub3cuCj4g
Cj4gVGhpcyBwYXRjaCBjb3JyZWN0cyB0aGUgbG93IGxldmVsIHRpbWUgY2FsY3VsYXRpb24gdG8g
bWVldCBtaW5pbXVtCj4gcmVhZC93cml0ZSBjeWNsZSB0aW1lIHJlcXVpcmVkLiBBZnRlciBnZXR0
aW5nIHRoZSBoaWdoIGhvbGQgdGltZSwgV0UjIGxvdwo+IGxldmVsIHRpbWUgd2lsbCBiZSBwcm9t
aXNlZCB0byBtZWV0IHRXUF9taW4gYW5kIHRXQ19taW4gcmVxdWlyZW1lbnQsCj4gYW5kIFJFIyBs
b3cgbGV2ZWwgdGltZSB3aWxsIGJlIHByb21pc2VkIHRvIG1lZXQgdFJFQV9tYXgsIHRSUF9taW4g
YW5kCj4gdFJDX21pbiByZXF1aXJlbWVudC4KPiAKPiBGaXhlczogZWRmZWUzNjE5YzQ5ICgibXRk
OiBuYW5kOiBtdGs6IGFkZCAtPnNldHVwX2RhdGFfaW50ZXJmYWNlKCkgaG9vayIpCj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBYaWFvbGVpIExpIDx4aWFvbGVp
LmxpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQu
YyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbXRrX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiBp
bmRleCBiNmI0NjAyZjUxMzIuLjRmYmIwYzZlY2FlMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25h
bmQuYwo+IEBAIC01MDgsNyArNTA4LDggQEAgc3RhdGljIGludCBtdGtfbmZjX3NldHVwX2RhdGFf
aW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBjc2xpbmUsCj4gIHsKPiAgCXN0
cnVjdCBtdGtfbmZjICpuZmMgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gIAlj
b25zdCBzdHJ1Y3QgbmFuZF9zZHJfdGltaW5ncyAqdGltaW5nczsKPiAtCXUzMiByYXRlLCB0cG9l
Y3MsIHRwcmVjcywgdGMyciwgdHcyciwgdHdoLCB0d3N0LCB0cmx0Owo+ICsJdTMyIHJhdGUsIHRw
b2VjcywgdHByZWNzLCB0YzJyLCB0dzJyLCB0d2gsIHR3c3QgPSAwLCB0cmx0ID0gMDsKPiArCXUz
MiB0aG9sZDsKPiAgCj4gIAl0aW1pbmdzID0gbmFuZF9nZXRfc2RyX3RpbWluZ3MoY29uZik7Cj4g
IAlpZiAoSVNfRVJSKHRpbWluZ3MpKQo+IEBAIC01NDQsMTEgKzU0NSwyOCBAQCBzdGF0aWMgaW50
IG10a19uZmNfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50
IGNzbGluZSwKPiAgCXR3aCA9IERJVl9ST1VORF9VUCh0d2ggKiByYXRlLCAxMDAwMDAwKSAtIDE7
Cj4gIAl0d2ggJj0gMHhmOwo+ICAKPiAtCXR3c3QgPSB0aW1pbmdzLT50V1BfbWluIC8gMTAwMDsK
PiArCS8qIENhbGN1bGF0ZSByZWFsIFdFIy9SRSMgaG9sZCB0aW1lIGluIG5hbm9zZWNvbmQgKi8K
PiArCXRob2xkID0gKHR3aCArIDEpICogMTAwMDAwMCAvIHJhdGU7Cj4gKwkvKiBuYW5vc2Vjb25k
IHRvIHBpY29zZWNvbmQgKi8KPiArCXRob2xkICo9IDEwMDA7Cj4gKwo+ICsJLyoqCgogICAgICAg
IC8qCgo+ICsJICogV0UjIGxvdyBsZXZlbCB0aW1lIHNob3VsZCBiZSBleHBhbmVkIHRvIG1lZXQg
V0UjIHB1bHNlIHRpbWUKPiArCSAqIGFuZCBXRSMgY3ljbGUgdGltZSBhdCB0aGUgc2FtZSB0aW1l
Lgo+ICsJICovCj4gKwlpZiAodGhvbGQgPCB0aW1pbmdzLT50V0NfbWluKQo+ICsJCXR3c3QgPSB0
aW1pbmdzLT50V0NfbWluIC0gdGhvbGQ7Cj4gKwl0d3N0ID0gbWF4KHRpbWluZ3MtPnRXUF9taW4s
IHR3c3QpIC8gMTAwMDsKPiAgCXR3c3QgPSBESVZfUk9VTkRfVVAodHdzdCAqIHJhdGUsIDEwMDAw
MDApIC0gMTsKPiAgCXR3c3QgJj0gMHhmOwo+ICAKPiAtCXRybHQgPSBtYXgodGltaW5ncy0+dFJF
QV9tYXgsIHRpbWluZ3MtPnRSUF9taW4pIC8gMTAwMDsKPiArCS8qKgoKRGl0dG8KCj4gKwkgKiBS
RSMgbG93IGxldmVsIHRpbWUgc2hvdWxkIGJlIGV4cGFuZWQgdG8gbWVldCBSRSMgcHVsc2UgdGlt
ZSwKPiArCSAqIFJFIyBhY2Nlc3MgdGltZSBhbmQgUkUjIGN5Y2xlIHRpbWUgYXQgdGhlIHNhbWUg
dGltZS4KPiArCSAqLwo+ICsJaWYgKHRob2xkIDwgdGltaW5ncy0+dFJDX21pbikKPiArCQl0cmx0
ID0gdGltaW5ncy0+dFJDX21pbiAtIHRob2xkOwo+ICsJdHJsdCA9IG1heDModHJsdCwgdGltaW5n
cy0+dFJFQV9tYXgsIHRpbWluZ3MtPnRSUF9taW4pIC8gMTAwMDsKPiAgCXRybHQgPSBESVZfUk9V
TkRfVVAodHJsdCAqIHJhdGUsIDEwMDAwMDApIC0gMTsKPiAgCXRybHQgJj0gMHhmOwo+ICAKCldp
dGggdGhpcyBmaXhlZDoKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
