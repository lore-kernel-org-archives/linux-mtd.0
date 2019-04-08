Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AD1C10F13
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 21:30:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B97F020857
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 21:30:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHwEk6Q7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B97F020857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAw/Aw9N6EucYWv9WX0hJ6bBxrxg8qza1OuaH0zE7e8=; b=SHwEk6Q7hDj+9f
	/JsOsjRRjnuO209O1EnbrzXJZjfEnzjB5msdotBsOZIpuldTeXPD/l+lYN6WxyfwVoyZaWJKj9Hbs
	68/qkASux/A4OBgccsFXKtELcUiCuqElwaW83BndmfFwTT57+cSYL9obpZdEFsZUQ3F6GrHT6rtqe
	KRdF8f3uV7ri5vHP+Efxo/EbFFnPdS/Opc2mflhy9UMA5VzbjSB0riQCjiBPbMtHmBNFGpcNGJ8SR
	bbn5ugkXXGoUA52LXOlJ5UH1lFRkLarGxnNZyaz8etIYwMlC9yhDciEtF02papgfBN1r3qglxxS4B
	cxzC5KGmjahekey3mj3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDbqk-000183-Rj; Mon, 08 Apr 2019 21:30:42 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDbqg-00017N-I7
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2019 21:30:40 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 64FC660002;
 Mon,  8 Apr 2019 21:30:29 +0000 (UTC)
Date: Mon, 8 Apr 2019 23:30:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: nand_op_parser_exec_op should use longest pattern
Message-ID: <20190408233027.7caa1281@xps13>
In-Reply-To: <270be087c7dda47f208d194c0671f902@agner.ch>
References: <20190329133513.bj55sb373q4vo6yv@pengutronix.de>
 <bc75ec7a12c681a618ee641736141100@agner.ch>
 <20190330102134.4e85e130@collabora.com>
 <270be087c7dda47f208d194c0671f902@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_143038_900230_D7D5BED6 
X-CRM114-Status: GOOD (  24.06  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU3RlZmFuLAoKU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+IHdyb3RlIG9uIE1vbiwg
MDggQXByIDIwMTkgMjI6MDA6MTggKzAyMDA6Cgo+IEhpIEJvcmlzLAo+IAo+IE9uIDMwLjAzLjIw
MTkgMTA6MjEsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+ICtNaXF1ZWwKPiA+IAo+ID4gT24g
RnJpLCAyOSBNYXIgMjAxOSAxNTozNzo1NiArMDEwMAo+ID4gU3RlZmFuIEFnbmVyIDxzdGVmYW5A
YWduZXIuY2g+IHdyb3RlOgo+ID4gICAKPiA+PiBPbiAyOS4wMy4yMDE5IDE0OjM1LCBTYXNjaGEg
SGF1ZXIgd3JvdGU6ICAKPiA+PiA+IEhpIEFsbCwKPiA+PiA+Cj4gPj4gPiBJIGp1c3QgcGxheWVk
IHdpdGggdGhlIG5ldyBleGVjX29wIGludGVyZmFjZSBmb3IgdGhlIGZpcnN0IHRpbWUgYW5kCj4g
Pj4gPiB0b2dldGhlciB3aXRoIEJvcmlzIHdlIGZvdW5kIGEgcHJvYmxlbSBpbiB0aGUgcGF0dGVy
biB0YWJsZSBwYXJzZXIuCj4gPj4gPgo+ID4+ID4gVGhlIHZmNjEwIGRyaXZlciB1c2VzIHRoaXMg
cGF0dGVybiB0YWJsZToKPiA+PiA+Cj4gPj4gPiBzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfb3Bf
cGFyc2VyIHZmNjEwX25mY19vcF9wYXJzZXIgPSBOQU5EX09QX1BBUlNFUigKPiA+PiA+IAlOQU5E
X09QX1BBUlNFUl9QQVRURVJOKHZmNjEwX25mY19jbWQsCj4gPj4gPiAJCU5BTkRfT1BfUEFSU0VS
X1BBVF9DTURfRUxFTSh0cnVlKSwKPiA+PiA+IAkJTkFORF9PUF9QQVJTRVJfUEFUX0FERFJfRUxF
TSh0cnVlLCA1KSwKPiA+PiA+IAkJTkFORF9PUF9QQVJTRVJfUEFUX0RBVEFfT1VUX0VMRU0odHJ1
ZSwgUEFHRV8ySyArIE9PQl9NQVgpLAo+ID4+ID4gCQlOQU5EX09QX1BBUlNFUl9QQVRfQ01EX0VM
RU0odHJ1ZSksCj4gPj4gPiAJCU5BTkRfT1BfUEFSU0VSX1BBVF9XQUlUUkRZX0VMRU0odHJ1ZSkp
LAo+ID4+ID4gCU5BTkRfT1BfUEFSU0VSX1BBVFRFUk4odmY2MTBfbmZjX2NtZCwKPiA+PiA+IAkJ
TkFORF9PUF9QQVJTRVJfUEFUX0NNRF9FTEVNKHRydWUpLAo+ID4+ID4gCQlOQU5EX09QX1BBUlNF
Ul9QQVRfQUREUl9FTEVNKHRydWUsIDUpLAo+ID4+ID4gCQlOQU5EX09QX1BBUlNFUl9QQVRfQ01E
X0VMRU0odHJ1ZSksCj4gPj4gPiAJCU5BTkRfT1BfUEFSU0VSX1BBVF9XQUlUUkRZX0VMRU0odHJ1
ZSksCj4gPj4gPiAJCU5BTkRfT1BfUEFSU0VSX1BBVF9EQVRBX0lOX0VMRU0odHJ1ZSwgUEFHRV8y
SyArIE9PQl9NQVgpKSwKPiA+PiA+IAkpOwo+ID4+ID4KPiA+PiA+IEl0IGhhcyB0d28gcGF0dGVy
bnMsIG9uZSBzdXBwb3NlZCBmb3Igd3JpdGluZyBhbmQgb25lIGZvciByZWFkaW5nLiBBbGwgZWxl
bWVudHMKPiA+PiA+IGFyZSBvcHRpb25hbC4gTm93IHdpdGggYSB0eXBpY2FsIHBhZ2UgcmVhZCB3
ZSdsbCBnZXQgdGhpczoKPiA+PiA+Cj4gPj4gPiBbICAgMzMuOTMyNDY0XSBuYW5kOiAgICAgLT5D
TUQgICAgICBbMHgwMF0KPiA+PiA+IFsgICAzMy45MzYzMzhdIG5hbmQ6ICAgICAtPkFERFIgICAg
IFs1IGN5YzogMDAgMDAgMDAgMGEgMDBdCj4gPj4gPiBbICAgMzMuOTQxNzU1XSBuYW5kOiAgICAg
LT5DTUQgICAgICBbMHgzMF0KPiA+PiA+IFsgICAzMy45NDU2MjhdIG5hbmQ6ICAgICAtPldBSVRS
RFkgIFttYXggMSBtc10KPiA+PiA+IFsgICAzMy45NDk5MDldIG5hbmQ6ICAgICAgIERBVEFfSU4g
IFsyMTc2IEJdICAKPiAKPiBIbSwgc2luY2UgSSB1c2UgSFcgRUNDICh3aGljaCB1c2VzIGN1c3Rv
bSBmdW5jdGlvbiBjYWxscyksIEkgZG8gbm90IGdldAo+IHN1Y2ggbGFyZ2UgZGF0YSByZWFkcy4g
QnV0IEkgZG8gaGF2ZSBPT0IgcmVhZHMgZnJvbSB0aW1lIHRvIHRpbWU6Cj4gCj4gWyAgICA0LjYw
MzU4NV0gbmFuZDogZXhlY3V0aW5nIHN1Ym9wOgo+IFsgICAgNC42MDM2MTZdIG5hbmQ6ICAgICAt
PkNNRCAgICAgIFsweDAwXQo+IFsgICAgNC42MDM2NDZdIG5hbmQ6ICAgICAtPkFERFIgICAgIFs1
IGN5YzogMDAgMDggZWEgOTQgMDJdCj4gWyAgICA0LjYwMzY3M10gbmFuZDogICAgIC0+Q01EICAg
ICAgWzB4MzBdCj4gWyAgICA0LjYwMzcwMF0gbmFuZDogICAgIC0+V0FJVFJEWSAgW21heCAyMDAw
MDAgbXNdCj4gWyAgICA0LjYwMzcyN10gbmFuZDogICAgICAgREFUQV9JTiAgWzY0IEJdCj4gWyAg
ICA0LjYwMzg4MV0gbmFuZDogZXhlY3V0aW5nIHN1Ym9wOgo+IFsgICAgNC42MDM5MTJdIG5hbmQ6
ICAgICAgIENNRCAgICAgIFsweDAwXQo+IFsgICAgNC42MDM5NDFdIG5hbmQ6ICAgICAgIEFERFIg
ICAgIFs1IGN5YzogMDAgMDggZWEgOTQgMDJdCj4gWyAgICA0LjYwMzk2OF0gbmFuZDogICAgICAg
Q01EICAgICAgWzB4MzBdCj4gWyAgICA0LjYwMzk5NF0gbmFuZDogICAgICAgV0FJVFJEWSAgW21h
eCAyMDAwMDAgbXNdCj4gWyAgICA0LjYwNDAyMl0gbmFuZDogICAgIC0+REFUQV9JTiAgWzY0IEJd
Cj4gCj4gCj4gCj4gPj4gPgo+ID4+ID4gT25seSB0aGUgZmlyc3QgZm91ciBlbGVtZW50cyBhcmUg
ZXhlY3V0ZWQgaW4gb25lIGdvLCB0aGUgZmlmdGggaXMKPiA+PiA+IGV4ZWN0dXRlZCBzZXBhcmF0
ZWx5LiBUaGlzIGlzIGJlY2F1c2UgdGhlIHBhdHRlcm4gdGFibGUgcGFyc2VyIGZpbmRzCj4gPj4g
PiB0aGF0IHRoZSBmaXJzdCBwYXR0ZXJuIChzdXBwb3NlZCBmb3Igd3JpdGluZykgYWxyZWFkeSBt
YXRjaGVzIGZvciB0aGUKPiA+PiA+IGZpcnN0IGZvdXIgZWxlbWVudHMgYW5kIHRoZW4gdXNlcyBp
dCBpbnN0ZWFkIG9mIHJlYWxpemluZyB0aGF0IHRoZQo+ID4+ID4gc2Vjb25kIHBhdHRlcm4gbWF0
Y2hlcyB0aGUgd2hvbGUgb3BlcmF0aW9uLiAgCj4gPj4KPiA+PiBIbSwgSSBkbyBub3QgcmVtZW1i
ZXIgbm90aWNpbmcgdGhhdCBkdXJpbmcgZGV2ZWxvcG1lbnQuIEkgd29uZGVyIGlmIGl0Cj4gPj4g
d2FzIHRoZSBjYXNlIGFscmVhZHkgYmFjayB0aGVuLgo+ID4+Cj4gPj4gSWYgeWVzLCBpdCBkaWQg
bm90IHNlZW0gdG8gaGF2ZSBhIG5lZ2F0aXZlIGltcGFjdCBvbiBwZXJmb3JtYW5jZQo+ID4+IGNv
bXBhcmVkIHRvIHRoZSBvbGQgaW50ZXJmYWNlOgo+ID4+IGh0dHBzOi8vbGludXgtbXRkLmluZnJh
ZGVhZC5uYXJraXZlLmNvbS9xWmdFblBzQy9wYXRjaC12Ni0wLTMtbXRkLXJhd25hbmQtdmY2MTAt
bmZjLW1ha2UtdXNlLW9mLWV4ZWMtb3AKPiA+PiAgCj4gPj4gPgo+ID4+ID4gSSBoYXZlIG5vIGZp
eCBmb3IgdGhpcywganVzdCB3YW50ZWQgdG8gbGV0IHlvdSBrbm93LiBJdCB0dXJuZWQgb3V0IHRo
YXQKPiA+PiA+IGluIG15IGNhc2UgZm9yIHRoZSBHUE1JIG5hbmQgZHJpdmVyIEkgcHJvYmFibHkg
d29uJ3QgbmVlZCBhbnkgcGF0dGVybgo+ID4+ID4gdGFibGUuICAKPiA+Pgo+ID4+IFRoYW5rcyBm
b3IgYnJpbmdpbmcgaXQgdXAhIFdpbGwgdHJ5IGl0IG91dCB3aGVuIEkgY29tZSBhcm91bmQuICAK
PiA+IAo+ID4gSGVyZSBpcyBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBwcm9wb3NlZCBmaXggdGhhdCBj
b21waWxlcywgYXQKPiA+IGxlYXN0IDotKS4gU3RpbGwgbm90IHRlc3RlZCB0ZXN0ZWQgb24gYSBy
ZWFsIEhXIHRob3VnaC4gIAo+IAo+IFRlc3RlZCBpdCBoZXJlLCBzZWVtcyB0byBib290IGEgcm9v
dGZzIGZyb20gZmxhc2gganVzdCBmaW5lIQo+IAo+IFRoZSBPT0IgcmVhZHMgbG9vayBsaWtlIHRo
aXMgbm93Ogo+IFsgICA3NC40Nzg0NjldIG5hbmQ6IGV4ZWN1dGluZyBzdWJvcDoKPiBbICAgNzQu
NDc4NTAwXSBuYW5kOiAgICAgLT5DTUQgICAgICBbMHgwMF0KPiBbICAgNzQuNDc4NTI5XSBuYW5k
OiAgICAgLT5BRERSICAgICBbNSBjeWM6IDAwIDA4IGMwIDFkIDAwXQo+IFsgICA3NC40Nzg1NTVd
IG5hbmQ6ICAgICAtPkNNRCAgICAgIFsweDMwXQo+IFsgICA3NC40Nzg1ODBdIG5hbmQ6ICAgICAt
PldBSVRSRFkgIFttYXggMjAwMDAwIG1zXQo+IFsgICA3NC40Nzg2MDZdIG5hbmQ6ICAgICAtPkRB
VEFfSU4gIFs2NCBCXQo+IAo+IFNvIHRoZSBwYXRjaCBiZWxvdyBzZWVtcyB0byBkbyB3aGF0IHdl
IGludGVuZC4KCkdyZWF0ISBTdGVmYW4sIEkga25vdyBCb3JpcyBpcyBidXN5LCBjYW4geW91IHBs
ZWFzZSBzZW5kIHRoZSBwYXRjaD8KClRoYW5rcyEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
