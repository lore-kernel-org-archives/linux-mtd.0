Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE06C10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 15:22:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4012F2067C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 15:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sPd3Le5c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4012F2067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRZWkxjKXJ196lPjaOz5ezbumUeihmxuf5b089w4TAM=; b=sPd3Le5cV0PdGh
	TWbpyA4GcMzzvJOeR04Gi3JqlNtrBkOyJ7IW7zglmrYDIcdwtb5bkFYF2nU5B9MU9oFCninatJ227
	cPR7plRUIhcRk/KjRLPJr7y/yIZ6vNlCE6UL5trR0frhp1vNqm5LRE6X08P2uKh+uCN9dWIl8LoDf
	MLSj7d0krak/2Mt6ez6L3GW1A6NHF9tZSyYNlsV+8VklDb4EZDwvCZYKbFKJbAI7KCUtDG8lQVSY9
	zGsUAjeCVTobl/j5HPLB/1cYMN52BUWf/OhIxkAEp9FO54jPsNxzbjX5R+R56fLbQdb0huJ8KpkBb
	MFZBrqXKffE+bM4MXQxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBKEr-0004CB-E2; Mon, 09 Mar 2020 15:22:41 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBKEn-0004BT-J5
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 15:22:39 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5ACF240008;
 Mon,  9 Mar 2020 15:22:24 +0000 (UTC)
Date: Mon, 9 Mar 2020 16:22:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: fix calculating partition end address
Message-ID: <20200309162223.15582d12@xps13>
In-Reply-To: <e2873d10-2513-8d09-6601-cb542453e10f@milecki.pl>
References: <20200309074445.23524-1-zajec5@gmail.com>
 <20200309150424.4b75af66@xps13>
 <6125d86fee0c83653cc281b3069e1587@milecki.pl>
 <20200309152221.28dc38ab@xps13>
 <e2873d10-2513-8d09-6601-cb542453e10f@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_082237_900093_0F4EDD9E 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: Richard Weinberger <richard@nod.at>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFmYcWCLAoKUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPiB3cm90ZSBvbiBN
b24sIDkgTWFyIDIwMjAgMTY6MDg6MTIKKzAxMDA6Cgo+IE9uIDA5LjAzLjIwMjAgMTU6MjIsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
IHdyb3RlIG9uIE1vbiwgMDkgTWFyIDIwMjAgMTU6MTk6MTAKPiA+ICswMTAwOgo+ID4gICAKPiA+
PiBPbiAyMDIwLTAzLTA5IDE1OjA0LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+IFJhZmHF
giBNacWCZWNraSA8emFqZWM1QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAgOSBNYXIgMjAyMCAw
ODo0NDo0NQo+ID4+PiArMDEwMDogIAo+ID4+PiAgICA+Pj4+IEZyb206IFJhZmHFgiBNacWCZWNr
aSA8cmFmYWxAbWlsZWNraS5wbD4gIAo+ID4+Pj4+PiBUaGlzIGZpeGVzIGNoZWNrIGZvciBwYXJ0
aXRpb25zIHRoYXQgZG9uJ3Qgc3RhcnQgYXQgYmVnaW5uaW5nIG9mIHRoZWlyICAKPiA+Pj4+IHBh
cmVudHMuIE1pc3NpbmcgcGFydGl0aW9uJ3Mgb2Zmc2V0IGluIGZvcm11bGEgY291bGQgcmVzdWx0
IGluIGZvcmNpbmcKPiA+Pj4+IHJlYWQtb25seSBpbmNvcnJlY3RseS4gIAo+ID4+Pj4+PiBGaXhl
czogNjc1MGY2MWExM2EwICgibXRkOiBpbXByb3ZlIGNhbGN1bGF0aW5nIHBhcnRpdGlvbiBib3Vu
ZGFyaWVzID4+IHdoZW4gY2hlY2tpbmcgZm9yIGFsaWdubWVudCIpICAKPiA+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiA+Pj4+IC0tLQo+ID4+
Pj4gICBkcml2ZXJzL210ZC9tdGRwYXJ0LmMgfCAyICstCj4gPj4+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKSAgCj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMgIAo+ID4+Pj4gaW5k
ZXggNzMyOGMwNjZjNWJhLi5jNjgzYjQzMmNjNWUgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJz
L210ZC9tdGRwYXJ0LmMKPiA+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+ID4+Pj4g
QEAgLTUyNCw3ICs1MjQsNyBAQCBzdGF0aWMgc3RydWN0IG10ZF9wYXJ0ICphbGxvY2F0ZV9wYXJ0
aXRpb24oc3RydWN0ID4+IG10ZF9pbmZvICpwYXJlbnQsCj4gPj4+PiAgIAkJCXBhcnQtPm5hbWUp
Owo+ID4+Pj4gICAJfSAgCj4gPj4+Pj4+IC0JdG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFy
ZW50KSArIHNsYXZlLT5tdGQuc2l6ZTsgIAo+ID4+Pj4gKwl0bXAgPSBwYXJ0X2Fic29sdXRlX29m
ZnNldChwYXJlbnQpICsgc2xhdmUtPm9mZnNldCArID4+IHNsYXZlLT5tdGQuc2l6ZTsgIAo+ID4+
Pgo+ID4+PiBJIHRoaW5rIHlvdSBhcmUgZG9pbmcgdGhlIGNoYW5nZSBhdCB0aGUgd3JvbmcgcGxh
Y2UsIGlmIHlvdSB3YW50IHRvCj4gPj4+IGNoZWNrIHdoZXJlIHRoZSBwYXJ0aXRpb24gKnN0YXJ0
cyogeW91IHNob3VsZCBkbyBpdCBhIGZldyBsaW5lcyBhYm92ZS4KPiA+Pj4gQnV0IEkgdGhpbmsg
dGhlIGNoZWNrIHNob3VsZCBiZSBoZXJlIGFzIHdlbGwsIHByb2JhYmx5LiAgCj4gPj4KPiA+PiBU
aGUgY2hlY2sgd2hlcmUgdGhlIHBhcnRpdGlvbiAqc3RhcnRzKiBpcyBPSyBhbmQgSSBkb24ndCBt
ZWFuIHRvIGNoYW5nZQo+ID4+IGl0LiBUaGUgYnVnIGlzIGFib3V0IGNhbGN1bGF0aW5nIGFic29s
dXRlICplbmQqIGFkZHJlc3Mgb2YgcGFydGl0aW9uLiAgCj4gPiAKPiA+IENhbiB5b3UgZGV0YWls
IGEgbGl0dGxlIGJpdCB0aGVuPyBCZWNhdXNlIEkgZG9uJ3Qgc2VlIHRoZSBpc3N1ZSBhbnltb3Jl
Cj4gPiBldmVuIHRob3VnaCBJIGFtIGNvbnZpbmNlZCBzb21ldGhpbmcgaXMgd3JvbmcgaGVyZSA6
KSAgCj4gCj4gUGxlYXNlIGNvbnNpZGVyIGZvbGxvd2luZyBwYXJ0aXRpb25zIGxheW91dDoKPiAq
IGJjbTQ3eHhzZmxhc2gKPiDilJzilIAgYm9vdAkJMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDAwNDAw
MDAKPiDilJTilKwgZmlybXdhcmUJMHgwMDAwMDAwNDAwMDAtMHgwMDAwMDEwMDAwMDAKPiAgIOKU
nOKUgCBsaW51eAkweDAwMDAwMDAwMDAxYy0weDAwMDAwMDE4ZjgwMAo+ICAg4pSU4pSsIGNvbnRh
aW5lcgkweDAwMDAwMDE4ZjgwMC0weDAwMDAwMGZjMDAwMAo+ICAgIOKUnOKUgCBmb28JMHgwMDAw
MDAwMDAwMDAtMHgwMDAwMDA2MzA4MDAKPiAgICDilJTilIAgYmFyCTB4MDAwMDAwNjMwODAwLTB4
MDAwMDAwZTMwODAwIChzaXplOiAweDgwMDAwMCkKPiAKPiAKPiBFeGlzdGluZyAoY29ycmVjdCkg
KnN0YXJ0KiBjYWxjdWxhdGlvbjoKPiBiYXIgc3RhcnQ6IDAgKyAweDA0MDAwMCArIDB4MThmODAw
ICsgMHg2MzA4MDAgPSAweDgwMDAwMAo+IAo+IEV4aXN0aW5nICh3cm9uZykgZW5kIGNhbGN1bGF0
aW9uOgo+IGJhciBlbmQ6IDAgKyAweDA0MDAwMCArIDB4MThmODAwICsgMHg4MDAwMDAgPSAweDlj
ZjgwMAo+IAo+IEZpeGVkIChjb3JyZWN0KSBlbmQgY2FsY3VsYXRpb246Cj4gYmFyIGVuZDogMCAr
IDB4MDQwMDAwICsgMHgxOGY4MDAgKyAweDYzMDgwMCArIDB4ODAwMDAwID0gMHgxMDAwMDAwCgpP
ayBJIGdldCBpdCEgSSB0aGluayBtZW50aW9uaW5nICJwYXJ0aXRpb25zIHRoYXQgZG9uJ3Qgc3Rh
cnQgYXQKYmVnaW5uaW5nIG9mIHRoZWlyIHBhcmVudHMiLCBkZXNwaXRlIGJlaW5nIHRydWUsIHdh
cyBtaXNsZWFkaW5nIHRvIG1lCmFzIEkgdW5kZXJzdG9vZCAibGVhdmluZyBleHRyYSBzcGFjZSB3
aXRoIHRoZSBzdGFydCBvZiB0aGVpciBwYXJlbnQiLgoKSSBzdXBwb3NlIHlvdSBhbHNvIGhhdmUg
dGhlIGlzc3VlIHdpdGggImNvbnRhaW5lciIgdG9vPwoKQW55d2F5LCBJIHRoaW5rIHRoZSBmaXgg
aXMgZmluZS4gQSBiZXR0ZXIgZm9ybXVsYXRpb24gZm9yIHRoZSBjb21taXQKbG9nIHdvdWxkIGJl
IHdlbGNvbWUgOikgKG1heWJlIGFkZGluZyB0aGlzIGV4YW1wbGUgaXMgYSBnb29kIGlkZWEhKQoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
