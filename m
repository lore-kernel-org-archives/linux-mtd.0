Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BC6C10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 14:08:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D447B20727
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 14:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ahs1ZT7q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D447B20727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxMruWFPJAZhaFAQQ3yekq1nyjliDMsOF/F+xYJhrwk=; b=Ahs1ZT7q7+HWn4
	PlbsbJbzwjDkdk5gh0W7lbkO84hTJryYkHP7KXwV5TPxvqm74y/wsrspjKqInSoabqt0Z/CC8Qx1B
	rTMp7fA6OewewOQTakgeVHG1KxPQaNjvPxLlGJq6Vx4ppINKQMeVpMUlx8S0uJLgJ7BF4WRibZbjJ
	Btv2xANi8zAaSPzQuCE2wO22gZ5oPEaVFfsvm1Pq0gBeXxE/gcFSj4F8YQeEDB4iIL/O+DbfHZZo6
	HFsQ/hRkk/uGr/IFKTxP7+PoQSMIBZS0B4YJbGl3AMhGLrNYEI4Ch2WHLN8yHyI+0d2o/YErs+1Nj
	5fpIPikn6YVaLe2Za3wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBJ4c-0006il-Nw; Mon, 09 Mar 2020 14:08:04 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBJ4L-0006Wl-FQ
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 14:07:47 +0000
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 72B91100017;
 Mon,  9 Mar 2020 14:07:40 +0000 (UTC)
Date: Mon, 9 Mar 2020 15:07:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3] mtd: implement proper partition handling
Message-ID: <20200309150739.6a2e2087@xps13>
In-Reply-To: <20200114090952.11232-1-miquel.raynal@bootlin.com>
References: <20200114090952.11232-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_070745_702349_EFCE2E2D 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIFR1ZSwg
MTQgSmFuIDIwMjAKMTA6MDk6NTIgKzAxMDA6Cgo+IEluc3RlYWQgb2YgY29sbGVjdGluZyBwYXJ0
aXRpb25zIGluIGEgZmxhdCBsaXN0LCBjcmVhdGUgYSBoaWVyYXJjaHkKPiB3aXRoaW4gdGhlIG10
ZF9pbmZvIHN0cnVjdHVyZTogdXNlIGEgcGFydGl0aW9ucyBsaXN0IHRvIGtlZXAgdHJhY2sgb2YK
PiB0aGUgcGFydGl0aW9ucyBvZiBhbiBNVEQgZGV2aWNlICh3aGljaCBtaWdodCBiZSBpdHNlbGYg
YSBwYXJ0aXRpb24gb2YKPiBhbm90aGVyIE1URCBkZXZpY2UpLCBhIHBvaW50ZXIgdG8gdGhlIHBh
cmVudCBkZXZpY2UgKE5VTEwgd2hlbiB0aGUgTVRECj4gZGV2aWNlIGlzIHRoZSByb290IG9uZSwg
bm90IGEgcGFydGl0aW9uKS4KPiAKPiBCeSBhbHNvIHNhdmluZyBkaXJlY3RseSBpbiBtdGRfaW5m
byB0aGUgb2Zmc2V0IG9mIHRoZSBwYXJ0aXRpb24sIHdlCj4gY2FuIGdldCByaWQgb2YgdGhlIG10
ZF9wYXJ0IHN0cnVjdHVyZS4KPiAKPiBXaGlsZSBhdCBpdCwgYmUgY29uc2lzdGVudCBpbiB0aGUg
bmFtaW5nIG9mIHRoZSBtdGRfaW5mbyBzdHJ1Y3R1cmVzIHRvCj4gZWFzZSB0aGUgdW5kZXJzdGFu
ZGluZyBvZiB0aGUgbmV3IGhpZXJhcmNoeTogdGhlc2Ugc3RydWN0dXJlcyBhcmUKPiB1c3VhbGx5
IGNhbGxlZCAnbXRkJywgdW5sZXNzIHRoZXJlIGFyZSBtdWx0aXBsZSBpbnN0YW5jZXMgb2YgdGhl
IHNhbWUKPiBzdHJ1Y3R1cmUuIEluIHRoaXMgY2FzZSwgdGhlcmUgaXMgdXN1YWxseSBhIHBhcmVu
dC9jaGlsZCBib3VuZCBzbyB3ZQo+IHdpbGwgY2FsbCB0aGVtICdwYXJlbnQnIGFuZCAnY2hpbGQn
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+Cj4gLS0tCgpBcHBsaWVkIHRvIG10ZC9uZXh0LgoKPiAKPiBDaGFuZ2UgaW4gdjM6Cj4g
KiBLZWVwIHRoZSBuYW1pbmcgZm9yIHRoZSAtPnBhcmVudCBmaWVsZCBidXQgYWRkIG1vcmUgZGV0
YWlscyBpbiB0aGUKPiAgIG10ZF9tYXN0ZXIgc3RydWN0dXJlIGtlcm5lbCBkb2N1bWVudGF0aW9u
IGFuZCB0aGUgLT5wYXJlbnQgZmllbGQgb2YKPiAgIHN0cnVjdCBtdGRfaW5mbyB0aGF0IHRoaXMg
cGFyZW50aW5nIGlzIGZyb20gYW4gTVREIHBhcnRpdGlvbiBwb2ludAo+ICAgb2Ygdmlldywgbm90
IGZyb20gdGhlIGRldmljZSBtb2RlbCBwZXJzcGVjdGl2ZS4KPiAKPiBDaGFuZ2VzIGluIHYyOgo+
ICogQ29tbWl0IG5hbWUgY2hhbmdlZCAicHJvcGVyIHBhcnRpdGlvbiBoYW5kbGluZyIgLT4gInJl
d29yayBwYXJ0aXRpb24KPiAgIHRyZWUiLgo+ICogVXBkYXRlIG10ZF9nZXRfZGV2aWNlX3NpemUo
KSB0byBzdXBwb3J0IHJlY3Vyc2l2ZSBwYXJ0aXRpb25pbmcuCj4gKiBSZW1vdmUgcGFydF8qKCkg
aGVscGVycywgdXBkYXRlIHRoZSBjb3JyZXNwb25kaW5nIG10ZF8qKCkgaGVscGVycyB0bwo+ICAg
aGFuZGxlIHRoZSBwYXJ0aXRpb25zIHRoZW1zZWx2ZXMuCj4gKiBEcm9wIHRoZSBnbG9iYWwgcGFy
dGl0aW9ucyBsb2NrLCBhZGQgYSBsb2NrIHBlciBtdGRfaW5mbyBidXQgb25seSB1c2UKPiAgIHRo
ZSByb290IG9uZSB0byBwcm90ZWN0IGFnYWluc3QgcGFydGl0aW9ucyB1cGRhdGVzLgo+IAo+ICBk
cml2ZXJzL210ZC9tdGRjaGFyLmMgICAgICAgICAgfCAgMTIgKy0KPiAgZHJpdmVycy9tdGQvbXRk
Y29yZS5jICAgICAgICAgIHwgMjUwICsrKysrKysrLS0tLQo+ICBkcml2ZXJzL210ZC9tdGRwYXJ0
LmMgICAgICAgICAgfCA2OTcgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGlu
Y2x1ZGUvbGludXgvbXRkL210ZC5oICAgICAgICB8IDEyNSArKysrKy0KPiAgaW5jbHVkZS9saW51
eC9tdGQvcGFydGl0aW9ucy5oIHwgICAxIC0KPiAgNSBmaWxlcyBjaGFuZ2VkLCA0NzkgaW5zZXJ0
aW9ucygrKSwgNjA2IGRlbGV0aW9ucygtKQoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
