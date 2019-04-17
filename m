Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8504C10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:08:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 617E320835
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:08:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ciIF4zbP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 617E320835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aal23HDi9vrRPkwgKiVVIESvAqVB7g/SW+SumJTeclI=; b=ciIF4zbPqxBpa3
	H0JRr/0VCEEYKSsMkB54S1KZ71PZy0n+0b5zZr0K5V5Y65al8GMEr6l94PLHacNPKVJdBvGxOdf4E
	Ex275yH5cB9KoVWPLajx7+qfYAJ9LImklKKceeiB7WTa6h5mNPiX8Q8GKpr8De2/b4OZKKkq3SRSo
	hkdJ8TiOgePO7WIGWXfO6Zd94AOEBzEU8Jccd4I12nvO7TxqS3LxkderX044ElMdZDuTIVDH7laWr
	o5D5MtiZVoI4iwlzQvcJ9R/biCnUMf+1PoARRXTHpR4f+My0FdJveSHtovdiWmdKLliRUAFUNgOkM
	p/GaZ8U93r4SmIHLH7EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhUR-00026j-T6; Wed, 17 Apr 2019 10:08:27 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhUO-00024v-Di
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:08:26 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C7A9CC0003;
 Wed, 17 Apr 2019 10:08:21 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:08:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v4 7/7] mtd: rawnand: AMD: Also use the last page for
 bad block markers
Message-ID: <20190417120821.56af381c@xps13>
In-Reply-To: <20190218104122.18788-8-frieder.schrempf@kontron.de>
References: <20190218104122.18788-1-frieder.schrempf@kontron.de>
 <20190218104122.18788-8-frieder.schrempf@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_030824_609839_8897CB83 
X-CRM114-Status: GOOD (  16.17  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRnJpZWRlciwKClNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5k
ZT4gd3JvdGUgb24gTW9uLCAxOCBGZWIKMjAxOSAxMDo0Mjo0NiArMDAwMDoKCj4gRnJvbTogRnJp
ZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgo+IAo+IEFjY29yZGlu
ZyB0byB0aGUgZGF0YXNoZWV0IG9mIHNvbWUgQ3lwcmVzcyBTTEMgTkFORHMsIHRoZSBiYWQKPiBi
bG9jayBtYXJrZXJzIGNhbiBiZSBpbiB0aGUgZmlyc3QsIHNlY29uZCBvciBsYXN0IHBhZ2Ugb2Yg
YSBibG9jay4KPiBTbyBsZXQncyBjaGVjayBhbGwgdGhyZWUgbG9jYXRpb25zLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4K
PiBSZXZpZXdlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+Cj4g
LS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYW1kLmMgfCA4ICsrKysrKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9hbWQuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYW1kLmMKPiBpbmRleCA2MjAyY2JmN2VlOGQuLjJmZmNkZGZmM2UyNyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2FtZC5jCj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9hbWQuYwo+IEBAIC00MCw3ICs0MCwxMyBAQCBzdGF0aWMgdm9pZCBh
bWRfbmFuZF9kZWNvZGVfaWQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgc3RhdGljIGludCBh
bWRfbmFuZF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIHsKPiAgCWlmIChuYW5kX2lz
X3NsYyhjaGlwKSkKPiAtCQljaGlwLT5vcHRpb25zIHw9IE5BTkRfQkJNX0ZJUlNUUEFHRSB8IE5B
TkRfQkJNX1NFQ09ORFBBR0U7Cj4gKwkJLyoKPiArCQkgKiBBY2NvcmRpbmcgdG8gdGhlIGRhdGFz
aGVldCBvZiBzb21lIEN5cHJlc3MgU0xDIE5BTkRzLAo+ICsJCSAqIHRoZSBiYWQgYmxvY2sgbWFy
a2VycyBjYW4gYmUgaW4gdGhlIGZpcnN0LCBzZWNvbmQgb3IgbGFzdAo+ICsJCSAqIHBhZ2Ugb2Yg
YSBibG9jay4gU28gbGV0J3MgY2hlY2sgYWxsIHRocmVlIGxvY2F0aW9ucy4KPiArCQkgKi8KPiAr
CQljaGlwLT5vcHRpb25zIHw9IE5BTkRfQkJNX0ZJUlNUUEFHRSB8IE5BTkRfQkJNX1NFQ09ORFBB
R0UgfAo+ICsJCQkJIE5BTkRfQkJNX0xBU1RQQUdFOwo+ICAKPiAgCXJldHVybiAwOwo+ICB9CgoK
UmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
