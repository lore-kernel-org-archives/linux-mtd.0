Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE6DC10F05
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:23:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F924208E4
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:23:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RoNiCVIy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F924208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HN8C87SePvpiuACrGGXXQrbgY+R0MYm4E3p/TahDV0=; b=RoNiCVIy+WWR4r
	TttGyw9qpc65Hn+ys4JoEmL5GiWYVq0rFeW/dr2b25qNOCOdMN+yCouibs/Of9GBONh4MdUOnJsnw
	dCPuYDJj4vdUsPSi+8WU+R8A7Lz0I3bxnD8URbk6lk9rVxNve+4S+vtVxkvYypwkX0265hS6iKD0M
	uqDm7HbK5yCyyJ022KJC6CMsSr+3T2QWJeo12Uf0BpSgqaNcrdUOKTijxBBn5mnHjX8mNAXad+0ys
	85Is40RTU8tXAl7Hmbk6AySxeIOaBQ12txciXuQeeN9992BoFU8NaZYESrXATYJ5y5y3+LBclxkkv
	MCzrnBQIIJ/kmqKTOYqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAymW-0004lx-V0; Mon, 01 Apr 2019 15:23:28 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAymM-0004d8-Fu; Mon, 01 Apr 2019 15:23:20 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DEED2C0003;
 Mon,  1 Apr 2019 15:23:10 +0000 (UTC)
Date: Mon, 1 Apr 2019 17:23:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v3] mtd: rawnand: Mark expected switch fall-throughs
Message-ID: <20190401172309.4c6929a8@xps13>
In-Reply-To: <20190208174930.GA12962@embeddedor>
References: <20190208174930.GA12962@embeddedor>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_082318_832409_AE7473CF 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: Kees Cook <keescook@chromium.org>, Wan ZongShun <mcuos.com@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gRnJpLCA4IEZlYiAyMDE5CjExOjQ5OjMwIC0wNjAwOgoKPiBJbiBwcmVwYXJh
dGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3aXRjaAo+IGNh
c2VzIHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLgo+IAo+IFRoaXMgcGF0
Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+IAo+IGRyaXZlcnMvbXRkL25hbmQvcmF3
L2Rpc2tvbmNoaXAuYzogSW4gZnVuY3Rpb24g4oCYZG9jX3Byb2Jl4oCZOgo+IC4vaW5jbHVkZS9s
aW51eC9wcmludGsuaDozMDM6Mjogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhy
b3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICBwcmludGsoS0VSTl9FUlIgcHJfZm10
KGZtdCksICMjX19WQV9BUkdTX18pCj4gICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29uY2hpcC5jOjE0Nzk6NDog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHByX2VycuKAmQo+ICAgICBwcl9lcnIoIkRp
c2tPbkNoaXAgTWlsbGVubml1bSBQbHVzIDMyTUIgaXMgbm90IHN1cHBvcnRlZCwgaWdub3Jpbmcu
XG4iKTsKPiAgICAgXn5+fn5+Cj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29uY2hpcC5jOjE0
ODA6Mzogbm90ZTogaGVyZQo+ICAgIGRlZmF1bHQ6Cj4gICAgXn5+fn5+fgo+IGRyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRzaW0uYzogSW4gZnVuY3Rpb24g4oCYbnNfaW5pdF9tb2R1bGXigJk6Cj4g
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jOjIyNTQ6MjI6IHdhcm5pbmc6IHRoaXMgc3Rh
dGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgICBj
aGlwLT5iYnRfb3B0aW9ucyB8PSBOQU5EX0JCVF9OT19PT0I7Cj4gZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZHNpbS5jOjIyNTU6Mjogbm90ZTogaGVyZQo+ICAgY2FzZSAxOgo+ICAgXn5+fgo+IGRy
aXZlcnMvbXRkL25hbmQvcmF3L251YzkwMF9uYW5kLmM6IEluIGZ1bmN0aW9uIOKAmG51YzkwMF9u
YW5kX2NvbW1hbmRfbHDigJk6Cj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pby5oOjkxOjIyOiB3
YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0
aHJvdWdoPV0KPiAgI2RlZmluZSBfX3Jhd193cml0ZWwgX193cml0ZWwKPiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9udWM5MDBfbmFuZC5jOjUyOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDi
gJhfX3Jhd193cml0ZWzigJkKPiAgIF9fcmF3X3dyaXRlbCgodmFsKSwgKGRldiktPnJlZyArIFJF
R19TTUNNRCkKPiAgIF5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L251YzkwMF9u
YW5kLmM6MTk2OjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJh3cml0ZV9jbWRfcmVn
4oCZCj4gICAgd3JpdGVfY21kX3JlZyhuYW5kLCBOQU5EX0NNRF9SRUFEU1RBUlQpOwo+ICAgIF5+
fn5+fn5+fn5+fn4KPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9udWM5MDBfbmFuZC5jOjE5NzoyOiBu
b3RlOiBoZXJlCj4gICBkZWZhdWx0Ogo+ICAgXn5+fn5+fgo+IGRyaXZlcnMvbXRkL25hbmQvcmF3
L29tYXBfZWxtLmM6IEluIGZ1bmN0aW9uIOKAmGVsbV9jb250ZXh0X3Jlc3RvcmXigJk6Cj4gZHJp
dmVycy9tdGQvbmFuZC9yYXcvb21hcF9lbG0uYzo1MTI6NDogd2FybmluZzogdGhpcyBzdGF0ZW1l
bnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgIGVsbV93
cml0ZV9yZWcoaW5mbywgRUxNX1NZTkRST01FX0ZSQUdNRU5UXzQgKyBvZmZzZXQsCj4gICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICAg
ICAgcmVncy0+ZWxtX3N5bmRyb21lX2ZyYWdtZW50XzRbaV0pOwo+ICAgICAgIH5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXBfZWxtLmM6
NTE0OjM6IG5vdGU6IGhlcmUKPiAgICBjYXNlIEJDSDhfRUNDOgo+ICAgIF5+fn4KPiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9vbWFwX2VsbS5jOjUxNzo0OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBt
YXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAgICAgZWxtX3dyaXRl
X3JlZyhpbmZvLCBFTE1fU1lORFJPTUVfRlJBR01FTlRfMiArIG9mZnNldCwKPiAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICBy
ZWdzLT5lbG1fc3luZHJvbWVfZnJhZ21lbnRfMltpXSk7Cj4gICAgICAgfn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcF9lbG0uYzo1MTk6
Mzogbm90ZTogaGVyZQo+ICAgIGNhc2UgQkNINF9FQ0M6Cj4gICAgXn5+fgo+IGRyaXZlcnMvbXRk
L25hbmQvcmF3L29tYXBfZWxtLmM6IEluIGZ1bmN0aW9uIOKAmGVsbV9jb250ZXh0X3NhdmXigJk6
Cj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcF9lbG0uYzo0NjY6Mzc6IHdhcm5pbmc6IHRoaXMg
c3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAg
ICByZWdzLT5lbG1fc3luZHJvbWVfZnJhZ21lbnRfNFtpXSA9IGVsbV9yZWFkX3JlZyhpbmZvLAo+
ICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+
fgo+ICAgICAgIEVMTV9TWU5EUk9NRV9GUkFHTUVOVF80ICsgb2Zmc2V0KTsKPiAgICAgICB+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFw
X2VsbS5jOjQ2ODozOiBub3RlOiBoZXJlCj4gICAgY2FzZSBCQ0g4X0VDQzoKPiAgICBefn5+Cj4g
ZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcF9lbG0uYzo0NzE6Mzc6IHdhcm5pbmc6IHRoaXMgc3Rh
dGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgICBy
ZWdzLT5lbG1fc3luZHJvbWVfZnJhZ21lbnRfMltpXSA9IGVsbV9yZWFkX3JlZyhpbmZvLAo+ICAg
ICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fgo+
ICAgICAgIEVMTV9TWU5EUk9NRV9GUkFHTUVOVF8yICsgb2Zmc2V0KTsKPiAgICAgICB+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwX2Vs
bS5jOjQ3MzozOiBub3RlOiBoZXJlCj4gICAgY2FzZSBCQ0g0X0VDQzoKPiAgICBefn5+Cj4gCj4g
V2FybmluZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKPiAKPiBU
aGlzIHBhdGNoIGlzIHBhcnQgb2YgdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGluZwo+IC1X
aW1wbGljaXQtZmFsbHRocm91Z2guCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBT
aWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KPiAtLS0KCkFwcGxpZWQgdG8gZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQKb24gbmFu
ZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
