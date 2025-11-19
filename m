Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D4FCF3972
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 17:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JSYGyNGja/tiAbGtZLrPV7pHLU1w6yn1uK2y0rM57U=; b=AYxwphvX8MfAkj
	TQ6vfXj7A13aXbxPWC4LevS/L8nvu1LN1fPOFWi4V5GT4vRlsYK5f81Z19TOFwJE4YXRT20SEvrmq
	owY/QxCswwCqxChhXH5IXZMRZVwY2H5hPROPU4Ih5ZV9tQB2zpEUSRyLAs8eCVmRIxx3UrSR5kxIa
	v/jq040hdjwdPpCNIQrruY6RsPXZeumy9pTl0ZLAivk0GokAT3E3GK9D1l9f6MZe2jKXf4J1/1AIH
	hkO1/AFL5b9xV1HmCXAJe5L2eNaeQKZv7BoBa9rTHxlYe3LLXkdv3C5/UsBJPhDqtyt7Kvc67DDhj
	Oy3jZ9te/K0XHcZF/enw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlhx-00000003vyr-1s9E;
	Wed, 19 Nov 2025 17:11:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlht-00000003vwG-1zyS
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 17:11:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 97BDD1A1BE7;
	Wed, 19 Nov 2025 17:10:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F4D960699;
	Wed, 19 Nov 2025 17:10:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3694710371A3F;
	Wed, 19 Nov 2025 18:10:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763572256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Oi3Rozw+0ipekAzwE82KlZd/dZ7LDaSEcV43fCc6o9Q=;
	b=2ND/s5WtAar8KGYiYT5Y8ltdrKn509ue/5mzCwr7Ju3OxIquegqIzPcs+lLikjkGu5xA1I
	yuj8RNIk1Hlez/fJEwxFQMxYGwC7dnrjTBr/dbaaxUbkKcx6ZJA4xRZRfUdoV8tCabTAWT
	ntkGo4AAqsWILdPONynj19MsiLqu7EkywX2tH2caZKfPuWw6ZoepT3bwkDdDHBEn7PUfcH
	9YbMvR9NYppFbIle7X62iSw25A8i8CfEhxeIT3z6Kp6pmiDGDWzJbJaimBxF9ftz9kNtR6
	viF786dVS1M7JQR1rDSGzw3J80uY8e9I0WX+kKdBEXb45MPVbalDYlZKYBDJPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Steam Lin <STLin2@winbond.com>,  Santhosh Kumar K <s-k6@ti.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 02/28] spi: spi-mem: Create a repeated address operation
In-Reply-To: <0be97b27-4f8b-4d22-a653-154e87ecbc78@linaro.org> (Tudor
	Ambarus's message of "Wed, 5 Nov 2025 16:43:58 +0100")
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
	<20251031-winbond-v6-17-rc1-oddr-v1-2-be42de23ebf1@bootlin.com>
	<0be97b27-4f8b-4d22-a653-154e87ecbc78@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 18:10:50 +0100
Message-ID: <871pluc5id.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_091101_670868_8630A4D5 
X-CRM114-Status: GOOD (  15.01  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgpGaXJzdCwgdGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgYWxsIHRoaXMgcHJlY2lv
dXMgZmVlZGJhY2shIEkgYW0gaGFwcHkgdG8KZ2V0IGZlZWRiYWNrIG5vdCBvbmx5IG9uIHRoZSBz
cGktbWVtIHNpZGUsIGJ1dCBhbHNvIG9uIHRoZSBOQU5EIGNoYW5nZXMhCgpPbiAwNS8xMS8yMDI1
IGF0IDE2OjQzOjU4ICswMSwgVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3Jn
PiB3cm90ZToKCj4gT24gMTAvMzEvMjUgNjoyNiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4g
SW4gb2N0YWwgRFRSIG1vZGUsIHdoaWxlIHRoZSBjb21tYW5kIG9wY29kZSBpcyAqYWx3YXlzKiBy
ZXBlYXRlZCwKPgo+IHRoaXMgaW5mbyBpcyB3cm9uZzogb3Bjb2RlIGNhbiBiZSByZXBlYXRlZCwg
aW52ZXJ0ZWQgb3IgYSBkZWRpY2F0ZWQgMTZiaXQsCj4gc28gcGxlYXNlIGZpeCB0aGlzIHRvIG5v
dCBtaXNsZWFkIHJlYWRlcnMKCkkgZGlkbid0IGtub3cgOikgQnV0IHllYWggSSBoYWQgU1BJIE5B
TkQgbWluZCB3aGljaCB3YXMgb2J2aW91c2x5Cndyb25nLiBJJ2xsIGNvcnJlY3QuCgo+PiBhZGRy
ZXNzZXMgbWF5IGVpdGhlciBiZSBsb25nIGVub3VnaCB0byBjb3ZlciBhdCBsZWFzdCB0d28gYnl0
ZXMgKGluCj4+IHdoaWNoIGNhc2UgdGhlIGV4aXN0aW5nIG1hY3JvIHdvcmtzKSwgb3Igb3RoZXJ3
aXNlIGZvciBzaW5nbGUgYnl0ZQo+PiBhZGRyZXNzZXMsIHRoZSBieXRlIG11c3QgYWxzbyBiZSBk
dXBsaWNhdGVkIGFuZCBzZW50IHR3aWNlOiBvbiBlYWNoCj4+IGZyb250IG9mIHRoZSBjbG9jay4g
Q3JlYXRlIGEgbWFjcm8gZm9yIHRoaXMgY29tbW9uIGNhc2UuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiAtLS0KPj4gIGlu
Y2x1ZGUvbGludXgvc3BpL3NwaS1tZW0uaCB8IDggKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NwaS9z
cGktbWVtLmggYi9pbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmgKPj4gaW5kZXggODFjOWM3ZTc5
M2I2YWI4OTQ2NzVlMDE5OGQ0MTJkODRiODUyNWMyZS4uZTRkYjA5MjQ4OThjZTViMTdkMmI2ZDQy
Njk0OTViYjk2OGRiMjg3MSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9zcGkvc3BpLW1l
bS5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvc3BpL3NwaS1tZW0uaAo+PiBAQCAtNDMsNiArNDMs
MTQgQEAKPj4gIAkJLmR0ciA9IHRydWUsCQkJCQlcCj4+ICAJfQo+PiAgCj4+ICsjZGVmaW5lIFNQ
SV9NRU1fRFRSX09QX1JQVF9BRERSKF9fdmFsLCBfX2J1c3dpZHRoKQkJXAo+Cj4gSSBmaW5kIHRo
ZSBuYW1lIHRvbyBnZW5lcmljLiBUaGlzIGlzIGFuIG1hY3JvIGZvciAxIGJ5dGUgYWRkcmVzc2Vz
LAo+IHJpZ2h0PwoKWWVzIGl0IGlzLiBUaGUgbmFtZSBtaW1pY3MgdGhlICJkdHIgY29tbWFuZCBy
ZXBlYXQiIG1hY3JvIG5hbWUuIE1heWJlCnlvdSB3YW50IHRvIGluY2x1ZGUgdGhlIGluZm8gdGhh
dCBpdCBpcyAgY2FycnlpbmcgYSBzaW5nbGUgYnl0ZT8gbWF5YmUKIipSUFRfU0lOR0xFX0JZVEVf
QUREUiI/IGJ1dCB0aGF0J3MgYSBiaWcgdG9vIGxvbmcgSU1PLiBBbnkgb3RoZXIgaWRlYT8KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
