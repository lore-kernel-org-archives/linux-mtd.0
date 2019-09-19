Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22BAC4CEC4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 12:15:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7615A205F4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 12:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gar3GOJx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="UAwpLUY+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7615A205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hOe5P6oJmUI7RK14irbwCGTNa96MTP0QOiEEg0DDaDI=; b=Gar3GOJx7Vwu1qPvXHuMmxzGK
	Bq5AlZwWoIxmkqvqfruprKCXo8V5WOaG9DXuEXPBmbqFn58M/VRZF4IWaEgQqvXr5y9wUDhLrfJAY
	7XjktUvhMpZMZ+zqAvU1SYBOTBZ4NxJB3Xz93qlls1eOF0vhaj42JSPntTHMhegKptdfBhr1f8PMo
	KyYZ0Az4o1X1TzwrrI5QBpH6v5PUdEopPRgF8xnhCN1pvmRG7x8D7kJwqvbzsHHrKLh24adBTKVVp
	r7y1Dw4sELQiddmjyKsjHo0XUz3nigd6jnjLCRLXHyC5tvqXOkB9NMPdxrEL6SsXEvM/7AV63jMU7
	61Kye/X3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAvLm-0006Wb-L3; Thu, 19 Sep 2019 12:15:54 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAvLj-0006Vq-3p
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 12:15:52 +0000
Received: from [192.168.100.95] (unknown [95.138.208.137])
 by first.geanix.com (Postfix) with ESMTPSA id 9EB3068147;
 Thu, 19 Sep 2019 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1568895346; bh=2RGlv0x/QhpfLfGEefIzRgEgR608QAYBtOMcjCADwWQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=UAwpLUY+d0hZA0qSsa0l3xQQYwHPKJ9A401nCsHfYadDSd8ObMf3INUpnSr/QR39x
 9SfjaqJB6UOITl0EWWwzlSFvvwfesasOPVXqZzej8rFp0CwqxMwEIHjqCDnbGGeped
 S8IU5/Yp6SofBTx+WGbVnC4ddwY0muLc2SrM50/YUcs8zWybEz2jsoRnUAF8lyvbOB
 8FwUbqJYsJDrWPUlt593p92TE1FZpVLcXUjBCyY2fLIW5RV2cRtZuy3NghY1ppEz7j
 NsmfmnQ6Vjb/oAQWtFn2cMEayARkYg3kdDgOGPXVlncMGZaPEP92LBJqsnhvQ/ayr6
 4kT+ysvwZIvJQ==
Subject: Re: [Bug] mtd: rawnand: gpmi
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
 <20190910095515.yjg6zcoqrtwylyg3@pengutronix.de>
 <a0f518e3-2465-8e64-418b-cac27cde98de@geanix.com>
 <20190910104807.7r3x2crdhpcteomn@pengutronix.de>
 <b26d583f-454f-fbf1-280d-f1753cc13896@geanix.com>
 <20190910110833.5ngkqpgdps4y3t2v@pengutronix.de>
 <3a1a0bf1-4dd0-9be1-23bd-a2e1f2bc6783@geanix.com>
 <a4a68ef3-3f66-3e5e-b0d9-cf5d5e898b40@geanix.com>
 <20190919132719.3ca48967@xps13>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <6c0a1fdb-45cc-87aa-d1fb-f07f7e21a4a5@geanix.com>
Date: Thu, 19 Sep 2019 14:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190919132719.3ca48967@xps13>
Content-Language: en-US-large
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_051551_453769_8ECBE387 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: mkl@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cj4+IEhpIFNhc2NoYQo+Pgo+PiBQbGVhc2UgbGV0IG1lIGtub3cgd2hlbiB5b3UgaGF2ZSBzb21l
IHRpbWUgdG8gbG9vayBpbnRvIHRoaXMgOi0pCj4+IEkgZG9zZW4ndCBzZWVtIHJpZ2h0IHRoYXQg
aXQgd3JpdGVzIHRoZSBiYnQgb24gYSA0LjE5IHNlcmllcyBrZXJuZWwgdHdpY2UKPj4KPiAKPiBG
b3IgbWUgdGhlIGRpc3R1cmJpbmcgcGFydCBpczoKPiAKPj4+Pj4gW8KgwqDCoCA0LjE3NTkxOF0g
QmFkIGJsb2NrIHRhYmxlIG5vdCBmb3VuZCBmb3IgY2hpcCAwCj4+Pj4+IFvCoMKgwqAgNC4xODQw
NTldIEJhZCBibG9jayB0YWJsZSBub3QgZm91bmQgZm9yIGNoaXAgMAo+IAo+IFdyaXRpbmcgdGhl
IEJCVCB0d2ljZSBpcyBleHBlY3RlZC4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAoKSGksCgpU
cmllZCB0aGlzOgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmJ0LmMg
CmIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYwppbmRleCAzOWRiMzUyZjg3NTcuLmIw
MzM3ZjhhMGRhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYwor
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JidC5jCkBAIC0xMjAwLDYgKzEyMDAsOCBA
QCBzdGF0aWMgaW50IG5hbmRfc2Nhbl9iYnQoc3RydWN0IG10ZF9pbmZvICptdGQsIApzdHJ1Y3Qg
bmFuZF9iYnRfZGVzY3IgKmJkKQogICAgICAgICBpZiAocmVzKQogICAgICAgICAgICAgICAgIGdv
dG8gZXJyOwoKKyAgICAgICBzZWFyY2hfcmVhZF9iYnRzKG10ZCwgYnVmLCB0ZCwgbWQpOworCiAg
ICAgICAgIC8qIFByZXZlbnQgdGhlIGJidCByZWdpb25zIGZyb20gZXJhc2luZyAvIHdyaXRpbmcg
Ki8KICAgICAgICAgbWFya19iYnRfcmVnaW9uKG10ZCwgdGQpOwogICAgICAgICBpZiAobWQKClJl
c3VsdCBpczoKClsgICAgMi4xOTE0MTJdIG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVy
IElEOiAweDk4LCBDaGlwIElEOiAweGRjIAogCgpbICAgIDIuMTk4MDk1XSBuYW5kOiBUb3NoaWJh
IE5BTkQgNTEyTWlCIDMsM1YgOC1iaXQgCgpbICAgIDIuMjAyODQ4XSBuYW5kOiA1MTIgTWlCLCBT
TEMsIGVyYXNlIHNpemU6IDI1NiBLaUIsIHBhZ2Ugc2l6ZTogNDA5NiwgCk9PQiBzaXplOiAxMjgg
CgpbICAgIDIuMjE3MzM3XSBCYWQgYmxvY2sgdGFibGUgbm90IGZvdW5kIGZvciBjaGlwIDAgCiAK
ClsgICAgMi4yMjU1MzVdIEJhZCBibG9jayB0YWJsZSBub3QgZm91bmQgZm9yIGNoaXAgMCAKIAoK
WyAgICAyLjIzMDQ3NV0gU2Nhbm5pbmcgZGV2aWNlIGZvciBiYWQgYmxvY2tzIAogCgpbICAgIDIu
NzQ5ODMyXSBCYWQgZXJhc2VibG9jayA3OTggYXQgMHgwMDAwMGM3ODAwMDAKWyAgICAzLjIzMDcx
Ml0gQmFkIGVyYXNlYmxvY2sgMTUzNiBhdCAweDAwMDAxODAwMDAwMApbICAgIDMuMjM2MjYzXSBC
YWQgZXJhc2VibG9jayAxNTM3IGF0IDB4MDAwMDE4MDQwMDAwClsgICAgMy41NzQxMjJdIEJhZCBi
bG9jayB0YWJsZSB3cml0dGVuIHRvIDB4MDAwMDFmZmMwMDAwLCB2ZXJzaW9uIDB4MDEKWyAgICAz
LjU4NDg3NF0gQmFkIGJsb2NrIHRhYmxlIHdyaXR0ZW4gdG8gMHgwMDAwMWZmODAwMDAsIHZlcnNp
b24gMHgwMQpbICAgIDMuNTkyMzA2XSBCYWQgYmxvY2sgdGFibGUgZm91bmQgYXQgcGFnZSAxMzEw
MDgsIHZlcnNpb24gMHgwMSAKIAoKWyAgICAzLjYwMDA1OV0gQmFkIGJsb2NrIHRhYmxlIGZvdW5k
IGF0IHBhZ2UgMTMwOTQ0LCB2ZXJzaW9uIDB4MDEKWyAgICAzLjYwNzEyOV0gMyBmaXhlZC1wYXJ0
aXRpb25zIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSAKZ3BtaS1uYW5kIAoKWyAgICAz
LjYxNDEwNV0gQ3JlYXRpbmcgMyBNVEQgcGFydGl0aW9ucyBvbiAiZ3BtaS1uYW5kIjoKWyAgICAz
LjYxOTU0MF0gMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDA4MDAwMDAgOiAiYm9vdCIKWyAgICAzLjYz
NTQzN10gMHgwMDAwMDA4MDAwMDAtMHgwMDAwMWNhMDAwMDAgOiAidWJpIgpbICAgIDQuMDE4MTgz
XSAweDAwMDAxY2EwMDAwMC0weDAwMDAyMDAwMDAwMCA6ICJ0ZXN0aW5nIiAKIAoKWyAgICA0LjA3
MDczNF0gZ3BtaS1uYW5kIDE4MDYwMDAuZ3BtaS1uYW5kOiBkcml2ZXIgcmVnaXN0ZXJlZC4KClNl
ZW1zIGxpa2UgaXQncyBVLWJvb3QgdGhhdCBpcyBjb3JydXB0aW5nIHRoZSB0YWJsZS4KCkJ1dCBJ
IGRvbid0IHRoaW5rIGl0J3MgcmVsYXRlZCB0byB0aGUgb3JpZ2luYWwgaXNzdWUgd2l0aCBjb21t
aXQKZWYzNDdjMGNmZDYxOWE5MjUxZTVhMmY5ZmY3MmUzMzY1MGE5YmNjYgoKL1NlYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
