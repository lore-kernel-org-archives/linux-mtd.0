Return-Path: <SRS0=/ENy=75=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE462C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 13:05:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 792BE20A8B
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 13:05:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lj9/Xv8e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 792BE20A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nxhaKsKoE+D8xK9tfulAmZ97m/CA/cmDqd/ngFbOI0=; b=Lj9/Xv8eIqojEt
	DHJZqQt7dlbQU9deilX7R2b8XrsIaLsBphSeXR5fXbzC6GWSDkQ0gdvs/hT6/8Ovjj9Be3jCZJYtk
	SxBlTOKso6n9tpGGVvoMhk5aVDnwc4XWk/HhMW8ThrXLguflX+9I3DyjensJxPRNiKmvudj7SHlQY
	DzY9EBu/j4W/G8ap2N9BtN0+5W7v51R41pK/OyMtmDRfhlg0JQnyJSz2xFea7enXXWvtI346j4+HC
	DizvLNYwYrzoJLpyNKN/iAUO276FtX0F6QICzz43SGqV/dhl1vIJDnNWdG80n4iZn1cDjYYjc1j3K
	D5hLsiLy8xdAowA8kf9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlBGy-0001zg-87; Tue, 16 Jun 2020 13:05:04 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlBGu-0001dm-I8
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2020 13:05:02 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jlBGs-0006JI-0n; Tue, 16 Jun 2020 13:04:58 +0000
Subject: Re: [PATCH][next] mtd: rawnand: qcom: fix incorrect masking operator, 
 used & instead of |
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200616115125.74298-1-colin.king@canonical.com>
 <20200616145756.4875d0c6@xps13>
From: Colin Ian King <colin.king@canonical.com>
Autocrypt: addr=colin.king@canonical.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2df422ef-5e47-ed5b-31b0-58b29f2f0f8e@canonical.com>
Date: Tue, 16 Jun 2020 14:04:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616145756.4875d0c6@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_060500_731894_8C6C5288 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTYvMDYvMjAyMCAxMzo1NywgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBDb2xpbiwKPiAK
PiBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlIG9uIFR1ZSwgMTYg
SnVuIDIwMjAKPiAxMjo1MToyNSArMDEwMDoKPiAKPj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPj4KPj4gQ3VycmVudGx5IHRoZSBleHByZXNzaW9uIChu
YW5kX2N0cmwgfCBCQU1fTU9ERV9FTikgaXMgYWx3YXlzIHRydWUgbm8KPj4gbWF0dGVyIHRoZSB2
YWx1ZSBvZiBuYW5kX2N0cmwgYmVjYXVzZSB0aGUgaW5jb3JyZWN0IG1hc2tpbmcgb3BlcmF0b3IK
Pj4gaXMgYmVpbmcgdXNlZC4gIEZpeCB0aGlzIGJ5IHVzaW5nIGJpdC13aXNlICYgaW5zdGVhZCBv
ZiB8Lgo+IAo+IEkgc2F3IGl0IHdoZW4gcmV2aWV3aW5nIGFuZCBtYXJrZWQgaXQgdG8gc29sdmUg
YmVmb3JlIGFwcGx5aW5nIGJ1dCBpdAo+IGxvb2tzIGxpa2UgSSBmb3Jnb3QgdG8gZG8gc28uIElm
IHlvdSBkb24ndCBtaW5kIEknbGwgbWVyZ2UgdGhpcyB3aXRoCj4gdGhlIG9yaWdpbmFsIGNvbW1p
dC4KPiAKPj4KPj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIldyb25nIG9wZXJhdG9yIHVzZWQiKQo+
PiBGaXhlczogZGQwYzFmYzhkZTEyICgibXRkOiByYXduYW5kOiBxY29tOiBzZXQgQkFNIG1vZGUg
b25seSBpZiBub3Qgc2V0IGFscmVhZHkiKQo+PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2lu
ZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L3Fjb21fbmFuZGMuYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+IGluZGV4
IGEzZWY0Mjg4YmUyNy4uMzdkOTU1MzJiYTdlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9xY29tX25hbmRjLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9u
YW5kYy5jCj4+IEBAIC0yNzkwLDcgKzI3OTAsNyBAQCBzdGF0aWMgaW50IHFjb21fbmFuZGNfc2V0
dXAoc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYykKPj4gIAkJICogb25seSBpZiBp
dCBpcyBub3QgaW4gQkFNIG1vZGUuIEluIG1vc3QgY2FzZXMgQkFNCj4+ICAJCSAqIG1vZGUgd2ls
bCBiZSBlbmFibGVkIGluIGJvb3Rsb2FkZXIKPj4gIAkJICovCj4+IC0JCWlmICghKG5hbmRfY3Ry
bCB8IEJBTV9NT0RFX0VOKSkKPj4gKwkJaWYgKCEobmFuZF9jdHJsICYgQkFNX01PREVfRU4pKQo+
PiAgCQkJbmFuZGNfd3JpdGUobmFuZGMsIE5BTkRfQ1RSTCwgbmFuZF9jdHJsIHwgQkFNX01PREVf
RU4pOwo+PiAgCX0gZWxzZSB7Cj4+ICAJCW5hbmRjX3dyaXRlKG5hbmRjLCBOQU5EX0ZMQVNIX0NI
SVBfU0VMRUNULCBETV9FTik7Cj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKClN1cmUgbWVyZ2Ug
aXQuCgpDb2xpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
