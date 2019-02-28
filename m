Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3E7C4360F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 15:42:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BA83218AE
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 15:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="czyP7PXv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BA83218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGQQMwJv2YZgHR5YsvlwTcP3lOVgtTBhBHrXmNn7RxI=; b=czyP7PXvLg4k7l
	Gd2P/gHMhwS5NV3bD71LScur7Qdf9v3hG+t1la30e29oh8Qjo2jJ5Yv7tdwcJDq26okmv/Tk+E54H
	b3o8YB3V3Gu0TxP38kMA7Wjyrc2HYFxCGiaOaNM8Au/WcATLwYEfyzREThGkrEVpDWEbjr4bk13GT
	+ZKoSj89jc6UNtRV9+jPRuJMyR9S9zyKdkWvB62ADbPFF+npC2w/R+JAB/E/Yir2W+rF9KdK0Y7IU
	0MM7aAR0WEn2RINSjOXFO7FQz7Lyu8mf5bIvzm+ppi0BgsWL3mgbrSEvkWTQyGEzqf6aB8YwTaxP8
	Gz7766l0Eh9MEwlBDLqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzNpY-0004rR-8H; Thu, 28 Feb 2019 15:42:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzNpU-0004qS-I2
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2019 15:42:39 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E1BBA278659;
 Thu, 28 Feb 2019 15:42:31 +0000 (GMT)
Date: Thu, 28 Feb 2019 16:42:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "liujian (CE)" <liujian56@huawei.com>
Subject: Re: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Message-ID: <20190228164228.734ede80@collabora.com>
In-Reply-To: <4F88C5DDA1E80143B232E89585ACE27D0264F137@DGGEMM528-MBX.china.huawei.com>
References: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
 <016001d4cf71$865e7b60$931b7220$@gmail.com>
 <4F88C5DDA1E80143B232E89585ACE27D0264F137@DGGEMM528-MBX.china.huawei.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_074236_858911_C4AF604B 
X-CRM114-Status: GOOD (  21.26  )
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
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "vigneshr@ti.com" <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyOCBGZWIgMjAxOSAxNToxMjoxNSArMDAwMAoibGl1amlhbiAoQ0UpIiA8bGl1amlh
bjU2QGh1YXdlaS5jb20+IHdyb3RlOgoKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4g
PiBGcm9tOiBUb2t1bm9yaSBJa2VnYW1pIFttYWlsdG86aWtlZ2FtaS50QGdtYWlsLmNvbV0KPiA+
IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyOCwgMjAxOSAxMDoyNiBQTQo+ID4gVG86IGxpdWpp
YW4gKENFKSA8bGl1amlhbjU2QGh1YXdlaS5jb20+OyBkd213MkBpbmZyYWRlYWQub3JnOwo+ID4g
Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tOyBiYnJlemlsbG9uQGtlcm5lbC5vcmc7Cj4gPiBt
YXJlay52YXN1dEBnbWFpbC5jb207IHJpY2hhcmRAbm9kLmF0OyBqb2FraW0udGplcm5sdW5kQGlu
ZmluZXJhLmNvbTsKPiA+IGlrZWdhbWlAYWxsaWVkLXRlbGVzaXMuY28uanA7IGtlZXNjb29rQGNo
cm9taXVtLm9yZzsgdmlnbmVzaHJAdGkuY29tCj4gPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+IFN1YmplY3Q6IFJFOiBb
UEFUQ0ggdjNdIGNmaTogZml4IGRlYWRsb29wIGluIGNmaV9jbWRzZXRfMDAwMi5jIGRvX3dyaXRl
X2J1ZmZlcgo+ID4gCj4gPiAKPiA+ICAgCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4gPiA+IEZyb206IGxpbnV4LW10ZCBbbWFpbHRvOmxpbnV4LW10ZC1ib3VuY2VzQGxpc3RzLmlu
ZnJhZGVhZC5vcmddIE9uCj4gPiA+IEJlaGFsZiBPZiBMaXUgSmlhbgo+ID4gPiBTZW50OiBUdWVz
ZGF5LCBGZWJydWFyeSAyNiwgMjAxOSAxMTowMSBQTQo+ID4gPiBUbzogZHdtdzJAaW5mcmFkZWFk
Lm9yZzsgY29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tOwo+ID4gPiBiYnJlemlsbG9uQGtlcm5l
bC5vcmc7IG1hcmVrLnZhc3V0QGdtYWlsLmNvbTsgcmljaGFyZEBub2QuYXQ7Cj4gPiA+IGpvYWtp
bS50amVybmx1bmRAaW5maW5lcmEuY29tOyBpa2VnYW1pQGFsbGllZC10ZWxlc2lzLmNvLmpwOwo+
ID4gPiBrZWVzY29va0BjaHJvbWl1bS5vcmc7IHZpZ25lc2hyQHRpLmNvbQo+ID4gPiBDYzogbGlu
dXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpdWppYW41NkBodWF3ZWkuY29tOwo+ID4gPiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2M10gY2Zp
OiBmaXggZGVhZGxvb3AgaW4gY2ZpX2NtZHNldF8wMDAyLmMKPiA+ID4gZG9fd3JpdGVfYnVmZmVy
Cj4gPiA+Cj4gPiA+IEluIGZ1bmN0aW9uIGRvX3dyaXRlX2J1ZmZlcigpLCBpbiB0aGUgZm9yIGxv
b3AsIHRoZXJlIGlzIGEgY2FzZQo+ID4gPiBjaGlwX3JlYWR5KCkgcmV0dXJucyAxIHdoaWxlIGNo
aXBfZ29vZCgpIHJldHVybnMgMCwgc28gaXQgbmV2ZXIgYnJlYWsKPiA+ID4gdGhlIGxvb3AuCj4g
PiA+IFRvIGZpeCB0aGlzLCBjaGlwX2dvb2QoKSBpcyBlbm91Z2ggYW5kIGl0IHNob3VsZCB0aW1l
b3V0IGlmIGl0IHN0YXkKPiA+ID4gYmFkIGZvciBhIHdoaWxlLgo+ID4gPgo+ID4gPiBGaXhlczog
ZGZlYWUxMDczNTgzKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogQ2hhbmdlIHdyaXRlIGJ1ZmZlciB0
bwo+ID4gPiBjaGVjayBjb3JyZWN0IHZhbHVlIikKPiA+ID4gU2lnbmVkLW9mZi1ieTogWWkgSHVh
aWppZSA8eWlodWFpamllQGh1YXdlaS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IExpdSBKaWFu
IDxsaXVqaWFuNTZAaHVhd2VpLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IFRva3Vub3JpIElrZWdh
bWkgPGlrZWdhbWlfdG9AeWFob28uY28uanA+Cj4gPiA+IC0tLQo+ID4gPiB2Mi0+djM6Cj4gPiA+
IEZvbGxvdyBWaWduZXNoJ3MgYWR2aWNlOgo+ID4gPiBhZGQgb25lIG1vcmUgY2hlY2sgZm9yIGNo
ZWNrX2dvb2QoKSBldmVuIHdoZW4gdGltZV9hZnRlcigpIHJldHVybnMgdHJ1ZS4KPiA+ID4KPiA+
ID4gIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIHwgMiArLQo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+ID4gPiBiL2Ry
aXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gPiA+IGluZGV4IDcyNDI4YjYuLjNk
YTIzNzYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAw
Mi5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gPiA+
IEBAIC0xODc2LDcgKzE4NzYsNyBAQCBzdGF0aWMgaW50IF9feGlwcmFtIGRvX3dyaXRlX2J1ZmZl
cihzdHJ1Y3QKPiA+ID4gbWFwX2luZm8gKm1hcCwgc3RydWN0IGZsY2hpcCAqY2hpcCwKPiA+ID4g
IAkJCWNvbnRpbnVlOwo+ID4gPiAgCQl9Cj4gPiA+Cj4gPiA+IC0JCWlmICh0aW1lX2FmdGVyKGpp
ZmZpZXMsIHRpbWVvKSAmJiAhY2hpcF9yZWFkeShtYXAsIGFkcikpCj4gPiA+ICsJCWlmICh0aW1l
X2FmdGVyKGppZmZpZXMsIHRpbWVvKSAmJiAhY2hpcF9nb29kKG1hcCwgYWRyLAo+ID4gPiBkYXR1
bSkpICAKPiA+IAo+ID4gICBKdXN0IGFub3RoZXIgaWRlYSB0byB1bmRlcnN0YW5kIGVhc2lseS4K
PiA+IAo+ID4gICAgIHVuc2lnbmVkIGxvbmcgbm93ID0gamlmZmllczsKPiA+IAo+ID4gICAgIGlm
IChjaGlwX2dvb2QobWFwLCBhZHIsIGRhdHVtKSkgewo+ID4gICAgICAgICB4aXBfZW5hYmxlKG1h
cCwgY2hpcCwgYWRyKTsKPiA+ICAgICAgICAgZ290byBvcF9kb25lOwo+ID4gICAgIH0KPiA+IAo+
ID4gICAgIGlmICh0aW1lX2FmdGVyKG5vdywgdGltZW8pIHsKPiA+ICAgICAgICAgYnJlYWs7Cj4g
PiAgICAgfQo+ID4gICAKPiAKPiBUaGFuayB5b3V+LiBJdCBpcyBtb3JlIGVhc2llciB0byB1bmRl
cnN0YW5k77yBCj4gSWYgdGhlcmUgYXJlIG5vIG90aGVyIGNvbW1lbnRzLCBJIHdpbGwgc2VuZCBu
ZXcgcGF0Y2ggYWdhaW4gKTogCgpFeGNlcHQgdGhpcyB2ZXJzaW9uIG5vIGxvbmdlciBkb2VzIHdo
YXQgVmlnbmVzaCBzdWdnZXN0ZWQuIFNlZSBob3cgeW91Cm5vIGxvbmdlciB0ZXN0IGlmIGNoaXBf
Z29vZCgpIGlzIHRydWUgaWYgdGltZV9hZnRlcigpIHJldHVybnMgdHJ1ZS4gU28sCmltYWdpbmUg
dGhlIHRocmVhZCBlbnRlcmluZyB0aGlzIGZ1bmN0aW9uIGlzIHByZWVtcHRlZCBqdXN0IGFmdGVy
IHRoZQpmaXJzdCBjaGlwX2dvb2QoKSB0ZXN0LCBhbmQgcmVzdW1lZCBhIGZldyBtcyBsYXRlci4g
dGltZV9hZnRlcigpIHdpbGwKcmV0dXJuIHRydWUsIGJ1dCBjaGlwX2dvb2QoKSBtaWdodCBhbHNv
IHJldHVybiB0cnVlLCBhbmQgeW91IGlnbm9yZSBpdC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
