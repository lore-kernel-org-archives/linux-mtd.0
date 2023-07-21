Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13344EB64DD
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 07:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMKT/z5+ZiX+RoQ4/bzi/BmKzUaD8/rLROBQmQIOXXE=; b=A1LF/MPySiQA/0LKnxNWdJ3u/3
	7QnrBsn+HRAzDptAq8xQ3nhK5x2GmpUUrSv+hMYuR7V7fA48EXg5suPs1l5pmHjijwFCa31V/Ep4d
	EQejhliV+9yb46U79yZc/xNWTLLS2xfYyJGp6Pblve9/6YrbekYQivSjD25EiDj2Q24Le/OoEdcTy
	o09AfAO5wuAfpF4VtIjcb/7rnWLJoBY8V5sAlA+IUordxoPypDp+WhSveYT5I/LwDUf236ggjT//9
	7rH7vSRnzlsa2PVolo4BdNqeE7utxfdtcebg9e351Djhq85bICLP9QAgM7iw/LGfd/E1YhbLes3gv
	h51gOLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkln-00DDXH-2e;
	Fri, 21 Jul 2023 07:41:47 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMklk-00DDVT-0P
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 07:41:46 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 48D9B5E6;
	Fri, 21 Jul 2023 09:41:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689925297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UbQmHU+C8ZYTtOIH5DrZDvSS0VGEOCXbjcqDQfVMMk=;
	b=ec8UShmMSCqWSZdwrUdestLBa1aY+puNKY6Q+ISwqSp6LCo4TXtaDUIV6AxsCkzcTi5mi1
	ey7N7Ao9GIlcJ5o3MHsCAgCf7ZqG4/QHLc45LjLV4rStdMfzk5LHHXGYFise82Z8158406
	bkNgaTo6Ly+OTGCkh9ZUTx9u4KbIeI3xYpSmvRPbDSoI67YW2nsNpmQ12qtBEQSMVm5rd1
	gJp4H5FRdNVBciThmzH2UxbA1yOhVidDlYTFLeq0bVatNi0gHpt7aJ2xwcgzbUHb2wDQX6
	irAm029PY54kUU0yyz/O47jHA6Rq98YRFBYB/MQimJsnxGifJKraYyeBb4BbFA==
MIME-Version: 1.0
Date: Fri, 21 Jul 2023 09:41:36 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Vlim <vlim@gigadevice.com>, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 akumarma@amd.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vikhyat.goyal@amd.com
Subject: Re: [PATCH V1 1/1] linux: drivers: mtd: spi-nor: gigadevice.c
In-Reply-To: <130b3742-fe0b-2030-654f-0cf8863c1479@linaro.org>
References: <20230720042834.12296-1-vlim@gigadevice.com>
 <62663146a51c2beac4eff48abe1f61f8@walle.cc>
 <TY0PR06MB56580D3FEE55389F41E33398BB3EA@TY0PR06MB5658.apcprd06.prod.outlook.com>
 <55d60aec-3b20-d9d3-aeb2-77abbcc47d16@linaro.org>
 <TY0PR06MB56581B9A28DCD7A7270CFC0ABB3FA@TY0PR06MB5658.apcprd06.prod.outlook.com>
 <130b3742-fe0b-2030-654f-0cf8863c1479@linaro.org>
Message-ID: <3795b6594981a236481f70f9172d140b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_004144_854786_7CE0E372 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pj4gCj4+IHsgImdkMjVxMTI4IiwgSU5GTygweGM4NDAxOCwgMCwgNjQgKiAxMDI0LCAyNTYpCj4+
IOKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgkZMQUdTKFNQSV9OT1JfSEFTX0xP
Q0sgfCBTUElfTk9SX0hBU19UQikKPiAKPiBUaGUgbG9ja2luZyBzdXBwb3J0IGlzIG5vdCBwYXJ0
IG9mIHRoZSBKRURFQyBTRkRQIHN0YW5kYXJkLCBidXQgdmVuZG9ycwo+IGNhbiBkZWZpbmUgdGhl
aXIgb3duIFNGRFAgdGFibGVzIHdoZXJlIHRoZXkgZGVzY3JpYmUgdGhlIGxvY2tpbmcKPiBzdXBw
b3J0LiBTbyBmb3Igbm93LCBpZiB5b3Ugd2FudCB0byBlbmFibGUgbG9ja2luZyB5b3UgaGF2ZSB0
byBzcGVjaWZ5Cj4gdGhlIGxvY2tpbmcgZmxhZ3MsIHdoYXRldmVyIHRoZXkgYXJlLiBUaGVyZSBh
cmUgZGlmZmVyZW50IGZsYXZvcnMgb2YKPiBibG9jayBwcm90ZWN0aW9uIGxvY2tpbmcsIHdpdGgg
MyBvciA0IGJsb2NrIHByb3RlY3Rpb24gYml0cywgdGhlaXIKPiBvcmRlciwgZXRjLiBZb3UnbGwg
aGF2ZSB0byBjaGVjayB0aGUgZGF0YXNoZWV0LgoKSSd2ZSBzZWVuIHRoYXQgZ2lnYWRldmljZSBo
YXMgdGhlaXIgb3duIHByb3ByaWV0YXJ5IFNGRFAgdGFibGUgd2hpY2gKYWxzbyBpbmRpY2F0ZXMg
bG9ja2luZy4gSSdkIHByZWZlciB0byBoYXZlIGEgcGFyc2VyIGZvciB0aGVzZSwgZXNwLgpiZWNh
dXNlIHRoZSBwYXRjaCBpcyBjb21pbmcgZnJvbSB0aGUgdmVuZG9yIGl0c2VsZiA6KQoKLW1pY2hh
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
