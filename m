Return-Path: <SRS0=ZMxb=VF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C293AC606AF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 13:16:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 904D420861
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 13:16:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XuUgs1Yn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 904D420861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNEBEuv+r4ttmRINzE/66B3rV564RUwhwqaoUWc2g4M=; b=XuUgs1YnXW6Lz/
	zHDtZzcB8Z3NMSSz66goOFSgezdo10tjhBiX3/hZUkKB5xI5Rq/xN0xIRSoAHsOqUG12vvXdztmco
	3B3S2lLlyGpW3XIwzuMcfSLclTFnv3UxNhnkHYCKIWKK9CxWUIIStWTDU8xYc08LvbELrE5wcahaN
	x0Othsjz87p5QlfcSG0gjSPNyncEydq5WG8+C2XyYtKkhr4fVPfHNS3sQ52okSLb51FFPyN5FkdM6
	uz0wb+crKSCH4DyMv91BElBsURdOPfMyx3pXxvo5jbvTLlae3RzP5XHGlF4LqW8Ka1rjdxQQ9oGj/
	1ZDBHfw+EsJYNDAuhe7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkTV2-00078n-Dk; Mon, 08 Jul 2019 13:16:08 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkTUy-00078H-CO
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2019 13:16:06 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 51EE3181821EF;
 Mon,  8 Jul 2019 15:16:00 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id z5dXEPBIF_Yx; Mon,  8 Jul 2019 15:15:59 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Cm9L34___Fhf; Mon,  8 Jul 2019 15:15:59 +0200 (CEST)
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
 by lilium.sigma-star.at (Postfix) with ESMTP id 151D1181821EF;
 Mon,  8 Jul 2019 15:15:59 +0200 (CEST)
Date: Mon, 8 Jul 2019 15:15:58 +0200 (CEST)
From: Richard Weinberger <richard@sigma-star.at>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Message-ID: <146340031.32120.1562591758888.JavaMail.zimbra@sigma-star.at>
In-Reply-To: <3e2b525c8c0d9e3ebe13fcfe7b28cc0d3b203d64.camel@toradex.com>
References: <3e2b525c8c0d9e3ebe13fcfe7b28cc0d3b203d64.camel@toradex.com>
Subject: Re: [REGRESSION] ubifs: Don't leak orphans on memory during commit
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Don't leak orphans on memory during commit
Thread-Index: AQHVNY3F90AlETdzv0al4GI8EIQzeR8Hs1/M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190708_061604_710922_8E53C82C 
X-CRM114-Status: GOOD (  11.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-tegra@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TWFyYywKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJNYXJjZWwgWmlz
d2lsZXIiIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+Cj4gQW46ICJsaW51eC1tdGQiIDxs
aW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiBDQzogIlJpY2hhcmQgUlcuIFdlaW5iZXJn
ZXIiIDxyaWNoYXJkQHNpZ21hLXN0YXIuYXQ+LCBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmcK
PiBHZXNlbmRldDogTW9udGFnLCA4LiBKdWxpIDIwMTkgMTU6MDU6MTAKPiBCZXRyZWZmOiBbUkVH
UkVTU0lPTl0gdWJpZnM6IERvbid0IGxlYWsgb3JwaGFucyBvbiBtZW1vcnkgZHVyaW5nIGNvbW1p
dAoKPiBIaSB0aGVyZQo+IAo+IEknbSBjdXJyZW50bHkgaW52ZXN0aWdhdGluZyBhIHN0cmFuZ2Ug
VUJJRlMgcm9vdGZzIGNyYXNoIGlzc3VlIHNlZW4gb24KPiBDb2xpYnJpIFQyMCBha2Egb24gdG9w
IG9mIHRoZSB0ZWdyYV9uYW5kIGRyaXZlci4gSSBiaXNlY3RlZCBpdCB0byB0aGUKPiBmb2xsb3dp
bmcgY29tbWl0IGMxNmU3MzU4N2FkNiAoInViaWZzOiBEb24ndCBsZWFrIG9ycGhhbnMgb24gbWVt
b3J5Cj4gZHVyaW5nIGNvbW1pdCIpIGFuZCBpbmRlZWQganVzdCByZXZlcnRpbmcgdGhhdCBvbmUg
ZXZlbiBvbiB0b3Agb2YKPiB0b2RheSdzIGxhdGVzdCAtbmV4dCBtYWtlcyBpdCB3b3JrIGFnYWlu
LiBUaGUgZm9sbG93aW5nIGlzIHdoYXQgSSBnZXQKPiBkdXJpbmcgYm9vdCBpZiB0aGF0IGNvbW1p
dCBpcyBpbmNsdWRlZDoKPiAKPiBbICAgMTQuNDQzMjUzXSA4PC0tLSBjdXQgaGVyZSAtLS0KPiBb
ICAgMTQuNDQ2NTE1XSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2
aXJ0dWFsCj4gYWRkcmVzcyA2YjZiNmI2Ygo+IFsgICAxNC40NTM3NzldIHBnZCA9IDAyMTAyMmQw
Cj4gWyAgIDE0LjQ1NjUzNV0gWzZiNmI2YjZiXSAqcGdkPTAwMDAwMDAwCj4gWyAgIDE0LjQ2MDEz
MV0gSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDUgWyMxXSBQUkVFTVBUIFNNUCBBUk0KPiBbICAgMTQu
NDY1NDg4XSBNb2R1bGVzIGxpbmtlZCBpbjoKPiBbICAgMTQuNDY4NjEyXSBDUFU6IDEgUElEOiAz
MTEgQ29tbTogbHhkbS1iaW5hcnkgTm90IHRhaW50ZWQgNS4yLjAtcmM3LQo+IG5leHQtMjAxOTA3
MDQtZGlydHkgIzI0Cj4gWyAgIDE0LjQ3NzAzMF0gSGFyZHdhcmUgbmFtZTogTlZJRElBIFRlZ3Jh
IFNvQyAoRmxhdHRlbmVkIERldmljZSBUcmVlKQo+IFsgICAxNC40ODMzNzddIFBDIGlzIGF0IHVi
aWZzX2RlbGV0ZV9vcnBoYW4rMHg3Yy8weGQ0Cj4gWyAgIDE0LjQ4ODIxNV0gTFIgaXMgYXQgMHg2
YjZiNmI2Ygo+IFsgICAxNC40OTEzOTddIHBjIDogWzxjMDNlMjZmMD5dICAgIGxyIDogWzw2YjZi
NmI2Yj5dICAgIHBzcjogNjAwZjAxMTMKPiBbICAgMTQuNDk3NzE1XSBzcCA6IGQxZGExZWU4ICBp
cCA6IGQxZGU0YWMwICBmcCA6IGQyN2IyOWI4Cj4gWyAgIDE0LjUwMjk4NV0gcjEwOiAwMDAwMDAw
MiAgcjkgOiBkMjMzOTZjYyAgcjggOiAwMDAwMDAwMAo+IFsgICAxNC41MDgyNjBdIHI3IDogZDIz
MzkwYWMgIHI2IDogZDIzMzkwMDAgIHI1IDogMDAwMDYzZDggIHI0IDoKPiBkMWRlNGE4MAo+IFsg
ICAxNC41MTQ4NDFdIHIzIDogNmI2YjZiNmIgIHIyIDogZjM0NGFhMGQgIHIxIDogMTIxM2QwMDAg
IHIwIDoKPiBkMWRlNGE4MAo+IFsgICAxNC41MjE0MjZdIEZsYWdzOiBuWkN2ICBJUlFzIG9uICBG
SVFzIG9uICBNb2RlIFNWQ18zMgo+IElTQSBBUk0gIFNlZ21lbnQgbm9uZQo+IFsgICAxNC41Mjg2
MTldIENvbnRyb2w6IDEwYzUzODdkICBUYWJsZTogMTFmMjQwNGEgIERBQzogMDAwMDAwNTEKPiBb
ICAgMTQuNTM0NDIxXSBQcm9jZXNzIGx4ZG0tYmluYXJ5IChwaWQ6IDMxMSwgc3RhY2sgbGltaXQg
PSAweDNlNjViNTZjKQo+IFsgICAxNC41NDA4MjldIFN0YWNrOiAoMHhkMWRhMWVlOCB0byAweGQx
ZGEyMDAwKQo+IFsgICAxNC41NDUyNDddIDFlZTA6ICAgICAgICAgICAgICAgICAgIGQyN2IyOWI4
IGQyMzM5MDAwIDAwMDAwMDAwCj4gZDIzMzkwYWMgMDAwMDAwMDAgZmZmZmZmOWMKPiBbICAgMTQu
NTUzNTEwXSAxZjAwOiAwMDAwMDAwMiBjMDNjYTgwNCBkMjdiMjliOCBkMjMzOTAwMCAwMDAwMDAw
MAo+IDAwMDAwMDAwIDAwMDAwMDAwIGMwM2QxZjkwCj4gWyAgIDE0LjU2MTc3Ml0gMWYyMDogZDI3
YjI5YjggZDI3YjJhNzAgYzBiMjRmNjggZDFkYTFmNjggMDAwMDAwMDAKPiBjMDI4ZWQ4YyBkMjdh
MjY0OCAwMDAwMDAwMAo+IFsgICAxNC41NzAwMzZdIDFmNDA6IGQxZjgzMDAwIGMwMjgzYjM0IGQx
ZGExZjY4IGQxZGExZjU4IDYwMGQwMDEzCj4gYzEwMDRjNDggMDAwMDAwMDAgMDAwMDAwMDAKPiBb
ICAgMTQuNTc4MzAwXSAxZjYwOiBkMmM4NjAxMCBkMjViYWFhOCAxYWYxMzI1YSAwMDAwMDAwYyBk
MWY4MzAxOQo+IGQxZGExZWQ0IDAwMDAwMDAwIGYzNDRhYTBkCj4gWyAgIDE0LjU4NjU2M10gMWY4
MDogMDAwMGVjZDQgMDAwMGVjZDQgMDAwMDAwMDAgMDAwMGIxZTQgMDAwMDAwMGEKPiBjMDEwMTIw
NCBkMWRhMDAwMCAwMDAwMDAwYQo+IFsgICAxNC41OTQ4MjZdIDFmYTA6IDAwMDAwMDAwIGMwMTAx
MDAwIDAwMDBlY2Q0IDAwMDAwMDAwIDAwMDBmNWNjCj4gYmVkODZlNjQgYmVkODZlNmMgMDAwMGFl
MTUKPiBbICAgMTQuNjAzMDg3XSAxZmMwOiAwMDAwZWNkNCAwMDAwMDAwMCAwMDAwYjFlNCAwMDAw
MDAwYSAwMDAwMDAwMAo+IDAwMDAwMDAwIGI2ZjJlZmFjIDAwMDAwMDAwCj4gWyAgIDE0LjYxMTM1
MF0gMWZlMDogYjZkYTE3YzAgYmVkODZjMTQgMDAwMGIwOTUgYjZkYTE3Y2MgNjAwZDAwMTAKPiAw
MDAwZjVjYyAwMDAwMDAwMCAwMDAwMDAwMAo+IFsgICAxNC42MTk2NDhdIFs8YzAzZTI2ZjA+XSAo
dWJpZnNfZGVsZXRlX29ycGhhbikgZnJvbSBbPGMwM2NhODA0Pl0KPiAodWJpZnNfam5sX2RlbGV0
ZV9pbm9kZSsweGRjLzB4ZTApCj4gWyAgIDE0LjYyODgwMV0gWzxjMDNjYTgwND5dICh1Ymlmc19q
bmxfZGVsZXRlX2lub2RlKSBmcm9tIFs8YzAzZDFmOTA+XQo+ICh1Ymlmc19ldmljdF9pbm9kZSsw
eDc4LzB4ZjQpCj4gWyAgIDE0LjYzNzc3NF0gWzxjMDNkMWY5MD5dICh1Ymlmc19ldmljdF9pbm9k
ZSkgZnJvbSBbPGMwMjhlZDhjPl0KPiAoZXZpY3QrMHg5OC8weDE2OCkKPiBbICAgMTQuNjQ1MzUw
XSBbPGMwMjhlZDhjPl0gKGV2aWN0KSBmcm9tIFs8YzAyODNiMzQ+XQo+IChkb191bmxpbmthdCsw
eDIyOC8weDI5OCkKPiBbICAgMTQuNjUyNDgzXSBbPGMwMjgzYjM0Pl0gKGRvX3VubGlua2F0KSBm
cm9tIFs8YzAxMDEwMDA+XQo+IChyZXRfZmFzdF9zeXNjYWxsKzB4MC8weDU0KQo+IFsgICAxNC42
NjAyOTRdIEV4Y2VwdGlvbiBzdGFjaygweGQxZGExZmE4IHRvIDB4ZDFkYTFmZjApCj4gWyAgIDE0
LjY2NTQwOF0gMWZhMDogICAgICAgICAgICAgICAgICAgMDAwMGVjZDQgMDAwMDAwMDAgMDAwMGY1
Y2MKPiBiZWQ4NmU2NCBiZWQ4NmU2YyAwMDAwYWUxNQo+IFsgICAxNC42NzM2NjldIDFmYzA6IDAw
MDBlY2Q0IDAwMDAwMDAwIDAwMDBiMWU0IDAwMDAwMDBhIDAwMDAwMDAwCj4gMDAwMDAwMDAgYjZm
MmVmYWMgMDAwMDAwMDAKPiBbICAgMTQuNjgxOTE5XSAxZmUwOiBiNmRhMTdjMCBiZWQ4NmMxNCAw
MDAwYjA5NSBiNmRhMTdjYwo+IFsgICAxNC42ODcwMzhdIENvZGU6IGUxYTAxMDA0IGUxYTAwMDA2
IGViZmZmZjgwIGU1OTQzMDFjIChlNDEzMjAxYykKPiBbICAgMTQuNjkzMzUzXSAtLS1bIGVuZCB0
cmFjZSBmODFiZTI3ZjZjOTkxMWQ0IF0tLS0KPiAKPiBIYXMgYW55Ym9keSBhbnkgY2x1ZSB3aGF0
IG1heSBiZSBnb2luZyBvbj8gSWYgeW91IG5lZWQgYW55IG1vcmUKPiBpbmZvcm1hdGlvbiBkbyBs
ZXQgbWUga25vdy4KCkRhbWl0LCBJIGZvcmdvdCB0byBkcm9wIHRoaXMgcGF0Y2ggZnJvbSAtbmV4
dCwgaXQgaXMgd3JvbmcuIFRoYW5rcyBmb3IgdGhlIG5vdGlmeS4KClRoYW5rcywKLy9yaWNoYXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
