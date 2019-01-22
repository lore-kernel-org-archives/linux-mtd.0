Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB0CC282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 692DD20879
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bG1TinV4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 692DD20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sk72qMh+YKhsAykikCp205po0K4CkdFq8HJlLFgIa0w=; b=bG1TinV4MnL2ZC
	bOV/T/OY4BlkSb8iKxqnQBA1RotcFwQV5sS1A+uZDSk+WRBF3aJyz6OaeU+kl3LGEMLb+XZX7QgHd
	8WNV3OjLj9ZZwshW1Ps0yJwJNGF1kBH5NKueJK9uaBg7ZGkTonif72iXJzw27TD1G8lNHOnYAx8Em
	X70+dWceOQ0VY7CD+I6hejpu3S+zjvvDmeqvYIJu2NPzJGErILgo/JwA+Nu0U0A29dRDx/SmYAMxO
	umnpm9/gIjos+R244ku3cgc7pgRqsHSXXZEJ4dz1enSERmRIfdwN1caLQzTbgdqy/QM1SVhQqLDZm
	nVrOg8FGjA1QE2vwMtZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gluMm-0002wt-Ov; Tue, 22 Jan 2019 11:37:16 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gluMj-0002wU-Tu
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 11:37:15 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 74E242078C; Tue, 22 Jan 2019 12:37:12 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-37-87.w90-88.abo.wanadoo.fr
 [90.88.156.87])
 by mail.bootlin.com (Postfix) with ESMTPSA id 315E5206A7;
 Tue, 22 Jan 2019 12:37:02 +0100 (CET)
Date: Tue, 22 Jan 2019 12:37:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v2] mtd: rework partitions handling
Message-ID: <20190122123702.384736ac@xps13>
In-Reply-To: <20190121095120.5d7850cb@bbrezillon>
References: <20190116162144.4458-1-miquel.raynal@bootlin.com>
 <20190121095120.5d7850cb@bbrezillon>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_033714_098095_BD80F3B2 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUg
b24gTW9uLCAyMSBKYW4gMjAxOQowOTo1MToyMCArMDEwMDoKCj4gT24gV2VkLCAxNiBKYW4gMjAx
OSAxNzoyMTo0NCArMDEwMAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+IAo+ID4gQEAgLTQ1NywxMyArNTI1LDMxIEBAIGludCBtdGRfYmxvY2tfbWFy
a2JhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IG9mcyk7Cj4gPiAgCj4gPiAgc3RhdGlj
IGlubGluZSBpbnQgbXRkX3N1c3BlbmQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPiAgewo+ID4g
LQlyZXR1cm4gbXRkLT5fc3VzcGVuZCA/IG10ZC0+X3N1c3BlbmQobXRkKSA6IDA7Cj4gPiArCXN0
cnVjdCBtdGRfaW5mbyAqbWFzdGVyID0gbXRkX2dldF9tYXN0ZXIobXRkKTsKPiA+ICsJaW50IHJl
dDsKPiA+ICsKPiA+ICsJaWYgKG1hc3Rlci0+c3VzcGVuZGVkKQo+ID4gKwkJcmV0dXJuIDA7Cj4g
PiArCj4gPiArCXJldCA9IG1hc3Rlci0+X3N1c3BlbmQgPyBtYXN0ZXItPl9zdXNwZW5kKG1hc3Rl
cikgOiAwOwo+ID4gKwlpZiAocmV0KQo+ID4gKwkJcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsJbWFz
dGVyLT5zdXNwZW5kZWQgPSAxOyAgCj4gCj4gSXQncyBub3QgZW50aXJlbHkgY2xlYXIgdG8gbWUg
d2hldGhlciBkZXYtPnN1c3BlbmQoKSBob29rcyBjYW4gYmUKPiBjYWxsZWQgc2ltdWx0YW5lb3Vz
bHkgb24gc2V2ZXJhbCBDUFVzIG9yIG5vdCwgaWYgdGhhdCdzIHRoZSBjYXNlLCB3ZQo+IHNob3Vs
ZCB1c2UgYW4gYXRvbWljX3QgZm9yIHRoZSAtPnN1c3BlbmRlZCBmaWVsZCBhbmQgdXNlIHRoZQo+
IGF0b21pY19hZGRfdW5sZXNzKCkgZnVuY3Rpb24gd2hlbiBtYW5pcHVsYXRpbmcgaXQuCj4gCj4g
CWlmICghYXRvbWljX2FkZF91bmxlc3MoJm1hc3Rlci0+c3VzcGVuZGVkLCAxLCAxKSkKPiAJCXJl
dHVybiAwOwo+IAo+IAlyZXQgPSBtYXN0ZXItPl9zdXNwZW5kID8gbWFzdGVyLT5fc3VzcGVuZCht
YXN0ZXIpIDogMDsKPiAJaWYgKHJldCkgewo+IAkJYXRvbWljX2RlYygmbWFzdGVyLT5zdXNwZW5k
ZWQpOwo+IAkJcmV0dXJuIHJldDsKPiAJfQo+IAo+ID4gKwlyZXR1cm4gMDsKPiA+ICB9Cj4gPiAg
Cj4gPiAgc3RhdGljIGlubGluZSB2b2lkIG10ZF9yZXN1bWUoc3RydWN0IG10ZF9pbmZvICptdGQp
Cj4gPiAgewo+ID4gLQlpZiAobXRkLT5fcmVzdW1lKQo+ID4gLQkJbXRkLT5fcmVzdW1lKG10ZCk7
Cj4gPiArCXN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyID0gbXRkX2dldF9tYXN0ZXIobXRkKTsKPiA+
ICsKPiA+ICsJaWYgKCFtYXN0ZXItPnN1c3BlbmRlZCkKPiA+ICsJCXJldHVybjsKPiA+ICsKPiA+
ICsJaWYgKG1hc3Rlci0+X3Jlc3VtZSkKPiA+ICsJCW1hc3Rlci0+X3Jlc3VtZShtYXN0ZXIpOwo+
ID4gKwo+ID4gKwltYXN0ZXItPnN1c3BlbmRlZCA9IDA7ICAKPiAKPiBTYW1lIGhlcmU6Cj4gCj4g
CWlmICghYXRvbWljX2FkZF91bmxlc3MoJm1hc3Rlci0+c3VzcGVuZGVkLCAtMSwgMCkpCj4gCQly
ZXR1cm47Cj4gCj4gCWlmIChtYXN0ZXItPl9yZXN1bWUpCj4gCQltYXN0ZXItPl9yZXN1bWUobWFz
dGVyKTsKPiA+ICB9ICAKCkkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIG5lY2Vzc2FyeSBidXQgSSBt
YWRlIHRoZSBjaGFuZ2VzLgoKSSBhbHNvIGhhZCB0byBjaGFuZ2UgInN1c3BlbmRlZCIgdHlwZSBm
cm9tIHVuc2lnbmVkIGludCBiaXRmaWVsZCB0bwphdG9taWNfdC4KCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
