Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F46C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:29:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 212182076A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gxDE0aHj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 212182076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kodBcB+6n5/6Qh67YoqecFd4x4n2LVcAsLp+J1ZQw5w=; b=gxDE0aHjBPL287
	0fANQKoySYB77/WPl16Qo8i++me6ocye02jFyChLRSgkl5VhJP+MFjsD5fAR/3WBhW1gbZT6IMR0K
	tKNTwuSjE1ORaHwQjpAdGDmc/x9LviyFzACaC096cvwQufzubCFkAqTYOYnAX+pmS1BwZ7GXDrH76
	xxBH2c+PXuZAp9vNEhiLkpYYTNGMJ3rqkwPmPcVyLMylGy2iqzasQ+cdcTb9ssewrnf+g9euuMb7D
	ce9RcgEy/7eUNzGNc0uyoY6eTJAn5T7rpFBke+rP1WOwdwnaUJVDvHBTpvQSKR8Qftnz2zy5UxpYg
	GTmMDvJtyFQtgTILDhyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9Qx-0007Ay-4n; Mon, 27 Apr 2020 19:28:51 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9Qv-0007AU-00
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:28:50 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D8F4FC0009;
 Mon, 27 Apr 2020 19:28:46 +0000 (UTC)
Date: Mon, 27 Apr 2020 21:28:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: cafe: Set the NAND_NO_BBM_QUIRK flag
Message-ID: <20200427212845.068f47fb@xps13>
In-Reply-To: <20200427072453.375642-2-boris.brezillon@collabora.com>
References: <20200427072453.375642-1-boris.brezillon@collabora.com>
 <20200427072453.375642-2-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_122849_172101_F13C9E1C 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDI3IEFwcgoyMDIwIDA5OjI0OjUyICswMjAwOgoKPiBXZSBoYXZlIGEg
ZHVtbXkgYmxvY2tfYmFkKCkgaW1wbGVtZW50YXRpb24gcmV0dXJuaW5nIDAuIExldCdzIHNldCB0
aGUKPiBOQU5EX05PX0JCTV9RVUlSSyBmbGFnIGFuZCBsZXQgdGhlIGNvcmUgdGFrZSBjYXJlIG9m
IHRoYXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5k
LmMgfCAxMSArKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZl
X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jCj4gaW5kZXggMmQxYzIy
ZGM4OGMxLi4yYTBkZjEzZGY1ZjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
Y2FmZV9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYwo+IEBA
IC01NDYsMTEgKzU0Niw2IEBAIHN0YXRpYyBpbnQgY2FmZV9uYW5kX3dyaXRlX3BhZ2VfbG93bGV2
ZWwoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCXJldHVybiBuYW5kX3Byb2dfcGFnZV9lbmRf
b3AoY2hpcCk7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgY2FmZV9uYW5kX2Jsb2NrX2JhZChzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwLCBsb2ZmX3Qgb2ZzKQo+IC17Cj4gLQlyZXR1cm4gMDsKPiAtfQo+
IC0KPiAgLyogRl8yW1hdLyhYKio2K1grMSkgICovCj4gIHN0YXRpYyB1bnNpZ25lZCBzaG9ydCBn
ZjY0X211bCh1OCBhLCB1OCBiKQo+ICB7Cj4gQEAgLTcxOCwxMCArNzEzLDggQEAgc3RhdGljIGlu
dCBjYWZlX25hbmRfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCj4gIAkvKiBFbmFibGUgdGhl
IGZvbGxvd2luZyBmb3IgYSBmbGFzaCBiYXNlZCBiYWQgYmxvY2sgdGFibGUgKi8KPiAgCWNhZmUt
Pm5hbmQuYmJ0X29wdGlvbnMgPSBOQU5EX0JCVF9VU0VfRkxBU0g7Cj4gIAo+IC0JaWYgKHNraXBi
YnQpIHsKPiAtCQljYWZlLT5uYW5kLm9wdGlvbnMgfD0gTkFORF9TS0lQX0JCVFNDQU47Cj4gLQkJ
Y2FmZS0+bmFuZC5sZWdhY3kuYmxvY2tfYmFkID0gY2FmZV9uYW5kX2Jsb2NrX2JhZDsKPiAtCX0K
PiArCWlmIChza2lwYmJ0KQo+ICsJCWNhZmUtPm5hbmQub3B0aW9ucyB8PSBOQU5EX1NLSVBfQkJU
U0NBTiB8IE5BTkRfTk9fQkJNX1FVSVJLOwo+ICAKPiAgCWlmIChudW10aW1pbmdzICYmIG51bXRp
bWluZ3MgIT0gMykgewo+ICAJCWRldl93YXJuKCZjYWZlLT5wZGV2LT5kZXYsICIlZCB0aW1pbmcg
cmVnaXN0ZXIgdmFsdWVzIGlnbm9yZWQ7IHByZWNpc2VseSB0aHJlZSBhcmUgcmVxdWlyZWRcbiIs
IG51bXRpbWluZ3MpOwoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
