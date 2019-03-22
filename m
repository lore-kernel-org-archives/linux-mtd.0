Return-Path: <SRS0=aBH3=RZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25863C10F03
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 08:31:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E069A2083D
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 08:31:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rRJa3oHi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E069A2083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDclNVuVz/IRR3kQCmi/rbDk13pYsmDELO2U0GgqYas=; b=rRJa3oHiZCegfk
	jfYMxkfqRXqrIIhnRCi5oHk9FiYic1SMFodxGqPke71C+YbqxH5Y8DyiqQh1FiP71Ktg8wrLDSJ3Z
	wCTFbbKToj3GwWhyTLWDWHhsqCTgA84oeU8YXu8f0YaE5/1O4Rsojpy1z/AZjyuhZzbIlAGMUT1EB
	QVKBFemRCZX9dkyRNwA7cMGEcWy+OGQyR6tF7GBFk+WfHVgGKuAc1idTOSiox4nB0sNkRFqRRVM+N
	zz8Nb42EzwoawHRXNp5U+NURTf1OtGKduDiPGSfwUlYUJaxyZDudmx14X6zwbsZni/SO0Sw9MEO0W
	cnvNn7h6CdiofEwNoSeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7FZz-00016l-So; Fri, 22 Mar 2019 08:31:07 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7FZq-0000zL-LH; Fri, 22 Mar 2019 08:31:00 +0000
Received: from xps13 (aaubervilliers-681-1-92-153.w90-88.abo.wanadoo.fr
 [90.88.33.153]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9D859100006;
 Fri, 22 Mar 2019 08:30:48 +0000 (UTC)
Date: Fri, 22 Mar 2019 09:30:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: select target before setting up
 data interface
Message-ID: <20190322093046.71df010d@xps13>
In-Reply-To: <20190321212010.3995-1-daniel@zonque.org>
References: <20190321212010.3995-1-daniel@zonque.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_013058_846849_21BA69AE 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>, stable@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGFuaWVsLAoKKyBSaWNoYXJkOiB0aGlzIGlzIGZpeGVzIG1hdGVyaWFscwoKRGFuaWVsIE1h
Y2sgPGRhbmllbEB6b25xdWUub3JnPiB3cm90ZSBvbiBUaHUsIDIxIE1hciAyMDE5IDIyOjIwOjEw
CiswMTAwOgoKPiBOb3cgdGhhdCB0aGUgbmFuZCBkcml2ZXJzIGFyZSByZXNwb25zaWJsZSBmb3Ig
c2VsZWN0aW5nIHRoZSB0YXJnZXQKPiBwcmlvciB0byBoYXJkd2FyZSBhY2Nlc3MsIGEgY2FsbCB0
byBtYXJ2ZWxsX25mY19zZWxlY3RfdGFyZ2V0KCkgaXMKPiBuZWNlc3NhcnkgZnJvbSBtYXJ2ZWxs
X25mY19zZXR1cF9kYXRhX2ludGVyZmFjZSgpLgo+IAo+IFRoaXMgaXMgYSByZWdyZXNzaW9uIGlu
dHJvZHVjZWQgYnkgY29tbWl0IGIyNTI1MTQxNGY2ZSAoIm10ZDoKPiByYXduYW5kOiBtYXJ2ZWxs
OiBTdG9wIGltcGxlbWVudGluZyAtPnNlbGVjdF9jaGlwKCkiKS4KPiAKPiBGaXhlczogYjI1MjUx
NDE0ZjZlICgibXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBTdG9wIGltcGxlbWVudGluZyAtPnNlbGVj
dF9jaGlwKCkiKQo+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJv
cmEuY29tPgo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgTWFjayA8ZGFuaWVsQHpvbnF1ZS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L21hcnZlbGxfbmFuZC5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKPiBpbmRleCA4NDI4M2M2YmIw
ZmYuLjkzYWJlNWJlODk5NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2
ZWxsX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4g
QEAgLTIzMjUsNiArMjMyNSw4IEBAIHN0YXRpYyBpbnQgbWFydmVsbF9uZmNfc2V0dXBfZGF0YV9p
bnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKPiAgCXN0cnVjdCBt
YXJ2ZWxsX25mY190aW1pbmdzIG5mY190bWc7Cj4gIAlpbnQgcmVhZF9kZWxheTsKPiAgCj4gKwlt
YXJ2ZWxsX25mY19zZWxlY3RfdGFyZ2V0KGNoaXAsIGNoaXAtPmN1cl9jcyk7Cj4gKwo+ICAJc2Ry
ID0gbmFuZF9nZXRfc2RyX3RpbWluZ3MoY29uZik7Cj4gIAlpZiAoSVNfRVJSKHNkcikpCj4gIAkJ
cmV0dXJuIFBUUl9FUlIoc2RyKTsKCkkgaGFkIGEgc2hvcnQgbG9vayB5ZXN0ZXJkYXkgYW5kIHRo
aXMgaXMgdmVyeSBsaWtlbHkgdG8gYmUgdGhlIHJvb3QKY2F1c2Ugb2YgdGhlIHJlZ3Jlc3Npb24s
IHRoYW5rIHlvdSB2ZXJ5IG11Y2ghCgpBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
