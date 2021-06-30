Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB772C11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 08:44:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5832961426
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 08:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5832961426
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rr+JWUarNJPjteOrBaU3hQ5BOFjTETHhn2h/FSYbu5o=; b=DiPQmTfM8BcKxS
	v3cDVqOi342AFSPT68qF+iYx0LdfQcdvRE9wluaYsgp6ZsQssk6DLufkvKSIIjn39ACc5uwnXgUhV
	A5rSkWOu7mlpPmWVBCyIBcT5JQTUUwKPCpVIu72wQFSfF6+lku4cKJY4WRI0ZnReZbS9OhzsClHv1
	JGInK2W9QX5J2byImbejy4VniBoab9MRePnQZWsZVsskaO8kJTw/nulhFYfxI3/HPqH7ss/asWAQc
	qaq0pnsDrkj59rv1O34c+d+HqD7LAnrBYqnWgjq6PgOCSWwswMsuJk9MfOClK2Xqc7Lzd2WBV0myQ
	fvPxiPf4MeRiGb2itDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyVpH-00DJkN-Oa; Wed, 30 Jun 2021 08:44:07 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyVpD-00DJiR-5H
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 08:44:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BF226C0009;
 Wed, 30 Jun 2021 08:43:54 +0000 (UTC)
Date: Wed, 30 Jun 2021 10:43:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com, Christoph Hellwig
 <hch@lst.de>
Subject: Re: [PATCH v2] mtd: break circular locks in register_mtd_blktrans
Message-ID: <20210630104353.7575e920@xps13>
In-Reply-To: <03e19ec8-7479-9be2-3563-a2fcf9d0ec0c@gmail.com>
References: <20210617160904.570111-1-desmondcheongzx@gmail.com>
 <03e19ec8-7479-9be2-3563-a2fcf9d0ec0c@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_014403_577772_7ABC7396 
X-CRM114-Status: GOOD (  22.87  )
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

SGVsbG8sCgpEZXNtb25kIENoZW9uZyBaaGkgWGkgPGRlc21vbmRjaGVvbmd6eEBnbWFpbC5jb20+
IHdyb3RlIG9uIFdlZCwgMzAgSnVuCjIwMjEgMTY6MDQ6MTcgKzA4MDA6Cgo+IE9uIDE4LzYvMjEg
MTI6MDkgYW0sIERlc21vbmQgQ2hlb25nIFpoaSBYaSB3cm90ZToKPiA+IFN5emJvdCByZXBvcnRl
ZCBhIGNpcmN1bGFyIGxvY2tpbmcgZGVwZW5kZW5jeToKPiA+IGh0dHBzOi8vc3l6a2FsbGVyLmFw
cHNwb3QuY29tL2J1Zz9pZD03YmQxMDZjMjhlODQ2ZDEwMjNkNGNhOTE1NzE4YjFhMDkwNTQ0NGNi
Cj4gPiAKPiA+IFRoaXMgaGFwcGVucyBiZWNhdXNlIG9mIHRoZSBmb2xsb3dpbmcgbG9jayBkZXBl
bmRlbmNpZXM6Cj4gPiAKPiA+IDEuIGxvb3BfY3RsX211dGV4IC0+IGJkZXYtPmJkX211dGV4ICh3
aGVuIGxvb3BfY29udHJvbF9pb2N0bCBjYWxscwo+ID4gbG9vcF9yZW1vdmUsIHdoaWNoIHRoZW4g
Y2FsbHMgZGVsX2dlbmRpc2s7IHRoaXMgYWxzbyBoYXBwZW5zIGluCj4gPiBsb29wX2V4aXQgd2hp
Y2ggZXZlbnR1YWxseSBjYWxscyBsb29wX3JlbW92ZSkKPiA+IAo+ID4gMi4gYmRldi0+YmRfbXV0
ZXggLT4gbXRkX3RhYmxlX211dGV4ICh3aGVuIGJsa2Rldl9nZXRfYnlfZGV2IGNhbGxzCj4gPiBf
X2Jsa2Rldl9nZXQsIHdoaWNoIHRoZW4gY2FsbHMgYmxrdHJhbnNfb3BlbikKPiA+IAo+ID4gMy4g
bXRkX3RhYmxlX211dGV4IC0+IG1ham9yX25hbWVzX2xvY2sgKHdoZW4gcmVnaXN0ZXJfbXRkX2Js
a3RyYW5zCj4gPiBjYWxscyBfX3JlZ2lzdGVyX2Jsa2RldikKPiA+IAo+ID4gNC4gbWFqb3JfbmFt
ZXNfbG9jayAtPiBsb29wX2N0bF9tdXRleCAod2hlbiBibGtfcmVxdWVzdF9tb2R1bGUgY2FsbHMK
PiA+IGxvb3BfcHJvYmUpCj4gPiAKPiA+IEhlbmNlIHRoZXJlJ3MgYW4gb3ZlcmFsbCBkZXBlbmRl
bmN5IG9mOgo+ID4gCj4gPiBsb29wX2N0bF9tdXRleCAgIC0tLS0tLS0tLS0+IGJkZXYtPmJkX211
dGV4Cj4gPiAgICAgICAgXiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gPiAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gPiAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2Cj4gPiBtYWpvcl9uYW1lc19sb2NrIDwtLS0tLS0tLS0gIG10ZF90YWJs
ZV9tdXRleAo+ID4gCj4gPiBXZSBjYW4gYnJlYWsgdGhpcyBjaXJjdWxhciBkZXBlbmRlbmN5IGJ5
IGhvbGRpbmcgbXRkX3RhYmxlX211dGV4IG9ubHkKPiA+IGZvciB0aGUgcmVxdWlyZWQgY3JpdGlj
YWwgc2VjdGlvbiBpbiByZWdpc3Rlcl9tdGRfYmxrdHJhbnMuIFRoaXMKPiA+IGF2b2lkcyB0aGUg
bXRkX3RhYmxlX211dGV4IC0+IG1ham9yX25hbWVzX2xvY2sgZGVwZW5kZW5jeS4KPiA+IAo+ID4g
UmVwb3J0ZWQtYW5kLXRlc3RlZC1ieTogc3l6Ym90KzZhOGEwZDkzYzkxZThmYmYyZTgwQHN5emth
bGxlci5hcHBzcG90bWFpbC5jb20KPiA+IENvLWRldmVsb3BlZC1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KPiA+IFNpZ25lZC1vZmYtYnk6IERlc21vbmQgQ2hlb25nIFpoaSBYaSA8ZGVzbW9u
ZGNoZW9uZ3p4QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gCj4gPiBDaGFuZ2VzIGluIHYxIC0+IHYy
Ogo+ID4gCj4gPiBCcmVhayB0aGUgY2lyY3VsYXIgZGVwZW5kZW5jeSBpbiByZWdpc3Rlcl9tdGRf
YmxrdHJhbnMgaW5zdGVhZCBvZiBibGtfcmVxdWVzdF9tb2R1bGUsIGFzIHN1Z2dlc3RlZCBieSBD
aHJpc3RvcGggSGVsbHdpZy4KPiA+IAo+ID4gICBkcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jIHwg
OCArKy0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyBi
L2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKPiA+IGluZGV4IGZiOGUxMmQ1OTBhMS4uN2QyNmNm
ZTI0ZDA1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+ID4gKysr
IGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+ID4gQEAgLTUyOCwxNCArNTI4LDEwIEBAIGlu
dCByZWdpc3Rlcl9tdGRfYmxrdHJhbnMoc3RydWN0IG10ZF9ibGt0cmFuc19vcHMgKnRyKQo+ID4g
ICAJaWYgKCFibGt0cmFuc19ub3RpZmllci5saXN0Lm5leHQpCj4gPiAgIAkJcmVnaXN0ZXJfbXRk
X3VzZXIoJmJsa3RyYW5zX25vdGlmaWVyKTsKPiA+ICAgPiAtCj4gPiAtCW11dGV4X2xvY2soJm10
ZF90YWJsZV9tdXRleCk7Cj4gPiAtCj4gPiAgIAlyZXQgPSByZWdpc3Rlcl9ibGtkZXYodHItPm1h
am9yLCB0ci0+bmFtZSk7Cj4gPiAgIAlpZiAocmV0IDwgMCkgewo+ID4gICAJCXByaW50ayhLRVJO
X1dBUk5JTkcgIlVuYWJsZSB0byByZWdpc3RlciAlcyBibG9jayBkZXZpY2Ugb24gbWFqb3IgJWQ6
ICVkXG4iLAo+ID4gICAJCSAgICAgICB0ci0+bmFtZSwgdHItPm1ham9yLCByZXQpOwo+ID4gLQkJ
bXV0ZXhfdW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOwo+ID4gICAJCXJldHVybiByZXQ7Cj4gPiAg
IAl9Cj4gPiAgID4gQEAgLTU0NSwxMiArNTQxLDEyIEBAIGludCByZWdpc3Rlcl9tdGRfYmxrdHJh
bnMoc3RydWN0IG10ZF9ibGt0cmFuc19vcHMgKnRyKQo+ID4gICAJdHItPmJsa3NoaWZ0ID0gZmZz
KHRyLT5ibGtzaXplKSAtIDE7Cj4gPiAgID4gICAJSU5JVF9MSVNUX0hFQUQoJnRyLT5kZXZzKTsK
PiA+IC0JbGlzdF9hZGQoJnRyLT5saXN0LCAmYmxrdHJhbnNfbWFqb3JzKTsKPiA+ICAgPiArCW11
dGV4X2xvY2soJm10ZF90YWJsZV9tdXRleCk7Cj4gPiArCWxpc3RfYWRkKCZ0ci0+bGlzdCwgJmJs
a3RyYW5zX21ham9ycyk7Cj4gPiAgIAltdGRfZm9yX2VhY2hfZGV2aWNlKG10ZCkKPiA+ICAgCQlp
ZiAobXRkLT50eXBlICE9IE1URF9BQlNFTlQpCj4gPiAgIAkJCXRyLT5hZGRfbXRkKHRyLCBtdGQp
Owo+ID4gLQo+ID4gICAJbXV0ZXhfdW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOwo+ID4gICAJcmV0
dXJuIDA7Cj4gPiAgIH0KPiA+IAo+IAo+IEhpIG1haW50YWluZXJzLAo+IAo+IEFueSBjaGFuY2Ug
dG8gcmV2aWV3IHRoaXMgcGF0Y2g/Cj4gCj4gRm9yIGFkZGl0aW9uYWwgcmVmZXJlbmNlLCB0aGUg
bXRkX3RhYmxlX211dGV4IC0tPiBtYWpvcl9uYW1lc19sb2NrIGhpZXJhcmNoeSB0aGF0IGNhbiBi
ZSByZW1vdmVkIGJ5IHRoaXMgcGF0Y2ggYWxzbyBhcHBlYXJzIGluIGEgZGlmZmVyZW50IGxvY2sg
Y2hhaW46Cj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPWNiZjVmZTg0NmYx
NGE5MGYwNWUxMGRmMjAwYjA4YzU3OTQxZGM3NTAKCkknbSBmaW5lIHdpdGggdGhlIHBhdGNoLCBi
dXQgaXQgY2FtZSB0b28gbGF0ZSBpbiB0aGUgcmVsZWFzZSBjeWNsZSBzbwpub3cgSSdtIHdhaXRp
bmcgLXJjMSB0byBhcHBseSBpdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
