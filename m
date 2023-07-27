Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A33C00528
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1+KTpXCnx4AlQjQs2lw9M7O1irySO0CoYUQpIRkUyw=; b=tkPSWviKGfuYVtAU4g1lIR92W1
	iUNVdDD20q2zNrj/b+B1UxOBzRdgHBOI9VTvPUbZM1Lf7fStQmzV1C0QZL5dgI04p0vDHL8UOH1BS
	KZHmodHgzIjrRMjIYgPM0qCCuRCd2GqGLS4lwnWwc+zosMc/GpHb1HaOZ/WyWG26cDJHZctVZ2Iwk
	cd13PVR3aZy+gM5lMM0hCCGOl/G0kxdeb3msZH8AvLetCIL1NffZbDQg8wxul2MEs+3QI9Nh14kub
	7y9eUt46HMYPpY0x/ohUypLXRKyjBsvdkez7qHrQWzgREGNI95D/l/r3PjTxp7hLPJK5WNEI62qO4
	st0MV+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxya-00Cx9k-0p;
	Thu, 27 Jul 2023 10:12:08 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxyX-00Cx7a-1W
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 10:12:06 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D759DBC3;
	Thu, 27 Jul 2023 12:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690452723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QS26LnYeVxg7KjcYfDS3nOhBviL+sgthBFC+hOndXSo=;
	b=X3pQWi5Q4ZIBUlsX/t0UYFkXAce8qazgELa/ZeJK/EdAiqSN+pAoq4yyNSOix9CvFdFHkh
	z+zpCQyKWh4rCmnxBS3im4yZPx6uu1k7qQ1XTI9/ytS+AM1/eeGoKWlilU+b88AeP+VuJt
	1vHpsIgct7NZENSlG+vnMOX/pHaFzMP+ms5urRdhOJ9sMTXmTuMUZToUdFbiKeCnp5SIyy
	aSM9rs15ZD2kqMnBuVyrwjcUJvxhEvwL8gMHl/R0rcBq15AzNfMPsW5JtMvjyg9d2x91eN
	x+WkbLdpmDwcDbX7rYj3FywcrBta7Al1oLZQ0q0jxn9mIaG1ingShlM0H8O9+A==
MIME-Version: 1.0
Date: Thu, 27 Jul 2023 12:12:03 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: add support for Macronix Octal flash
In-Reply-To: <42731f09-e198-24b1-c293-c383dd706c10@linaro.org>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-3-jaimeliao.tw@gmail.com>
 <a2e8544b-f97b-e318-1c98-7f424b1c810c@linaro.org>
 <ef91b41242da72c4bf6b5e3bed9862d5@walle.cc>
 <42731f09-e198-24b1-c293-c383dd706c10@linaro.org>
Message-ID: <eeb66e55d77a4933f7c20ffee9d5f84b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_031205_683236_64F0A7B2 
X-CRM114-Status: UNSURE (   7.23  )
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

QW0gMjAyMy0wNy0yNyAxMjoxMCwgc2NocmllYiBUdWRvciBBbWJhcnVzOgo+IE9uIDcvMjcvMjMg
MTE6MDQsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+IEhpLAo+PiAKPj4+PiArwqDCoMKgIHsgIm14
NjZ1dzJnMzQ1Z3gwIiwgSU5GT0IoMHhjMjk0M2MsIDAsIDAsIDAsIDQpCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIEZMQUdTKFNQSV9OT1JfUldXKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZM
QUdTKFNFQ1RfNEsgfCBTUElfTk9SX09DVEFMX1JFQUQgfCAKPj4+PiBTUElfTk9SX09DVEFMX0RU
Ul9SRUFEIHwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElfTk9S
X09DVEFMX0RUUl9QUCkgfSwKPj4+PiArwqDCoMKgIHsgIm14MjV1dzUxMzQ1ZyIsIElORk9CKDB4
YzI4NDNhLCAwLCAwLCAwLCA0KQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBGTEFHUyhTUElfTk9SX1JX
VykKPj4+PiArwqDCoMKgwqDCoMKgwqAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRLIHwgU1BJX05PUl9P
Q1RBTF9EVFJfUkVBRCB8IAo+Pj4+IFNQSV9OT1JfT0NUQUxfRFRSX1BQKSB9LAo+Pj4+ICvCoMKg
wqAgeyAibXgyNXVtMjUzNDVnIiwgSU5GTygweGMyODMzOSwgMCwgMCwgMCkKPj4+PiArwqDCoMKg
wqDCoMKgwqAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRLIHwgU1BJX05PUl9PQ1RBTF9EVFJfUkVBRCB8
IAo+Pj4+IFNQSV9OT1JfT0NUQUxfRFRSX1BQKSB9LAo+Pj4+ICvCoMKgwqAgeyAibXgyNXV3MjUz
NDVnIiwgSU5GT0IoMHhjMjg0MzksIDAsIDAsIDAsIDQpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIEZM
QUdTKFNQSV9OT1JfUldXKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1Rf
NEsgfCBTUElfTk9SX09DVEFMX0RUUl9SRUFEIHwgCj4+Pj4gU1BJX05PUl9PQ1RBTF9EVFJfUFAp
IH0sCj4+Pj4gK8KgwqDCoCB7ICJteDI1dXcxMjM0NWciLCBJTkZPQigweGMyODQzOCwgMCwgMCwg
MCwgNCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgRkxBR1MoU1BJX05PUl9SV1cpCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIE5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfT0NUQUxfRFRSX1JFQUQg
fCAKPj4+PiBTUElfTk9SX09DVEFMX0RUUl9QUCkgfSwKPj4+PiArwqDCoMKgIHsgIm14MjV1dzYz
NDVnIiwgSU5GT0IoMHhjMjg0MzcsIDAsIDAsIDAsIDQpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIEZM
QUdTKFNQSV9OT1JfUldXKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1Rf
NEsgfCBTUElfTk9SX09DVEFMX0RUUl9SRUFEIHwgCj4+Pj4gU1BJX05PUl9PQ1RBTF9EVFJfUFAp
IH0sCj4+PiAKPj4+IFBBUlNFX1NGRFAgZm9yIGFsbCB0aGUgZmxhc2hlcyBwbGVhc2UuCj4+IAo+
PiBBbmQgbm8gTk9fU0ZEUF9GTEFHUygpIGFzIGRpc2N1c3NlZC4KPj4gCj4gCj4gQXJlIHRoZXJl
IGZsYXZvcnMgb2YgdGhlc2UgZmxhc2hlcyB0aGF0IGRvbid0IHN1cHBvcnQgU0ZEUCwKPiBvciB3
aHkgZGlkIHlvdSBhc2sgZm9yIE5PX1NGRFBfRkxBR1M/IERvIGVhY2ggb2YgdGhlc2UgZmxhc2hl
cwo+IGhhdmUgU0ZEUCBhbmQgbm8tU0ZEUCBmbGF2b3JzPwoKSSBhc2tlZCB0byBkcm9wIE5PX1NG
RFBfRkxBR1MoKS4KCi1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
