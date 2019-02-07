Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832FEC282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 12:53:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5315921902
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 12:53:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sdw0EDot"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5315921902
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5tRc1Ju6djIwLBMeQA8RskQCKOf7zNWh8zb/jJvt2Q=; b=Sdw0EDotFhEah8
	NXF+wQqnnO+txUxLhAiQHTioxud6fIIl4W5WjED2/MEpvWyX3hQNPwCYidRpqrSlsybliXydSHSQo
	4tVIBz3I7y2Ghktztie9fRlFi5yKVPCcI5HMCDl88BBWLiw0SNo7DHh1hSYeBESjW0FTiGSzwouXV
	Gt55J/C/9ZcRG42d8SPYkIi/y9zFOzE9yACkVg4TFyryYtym//EXth3CiA1DBHXw0WxlotdjhmoPb
	jsnFvPK6zrd1YSI7t2fopmg00astfCfeT5jh7v7yc2IvJFaruazjrQvlRvpZ62ndOkh7Z59W5tqBS
	i+fQh2+pBW9XGpfCtmRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grjBd-0006Ee-Hr; Thu, 07 Feb 2019 12:53:49 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grjBR-00064x-NE; Thu, 07 Feb 2019 12:53:39 +0000
Received: from xps13 (aaubervilliers-681-1-80-177.w90-88.abo.wanadoo.fr
 [90.88.22.177]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B1FCF200012;
 Thu,  7 Feb 2019 12:53:33 +0000 (UTC)
Date: Thu, 7 Feb 2019 13:53:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wen Yang <yellowriver2010@hotmail.com>
Subject: Re: [PATCH v4 2/3] mtd: rawnand: jz4780: fix possible object
 reference leak
Message-ID: <20190207135332.4ef588d8@xps13>
In-Reply-To: <HK0PR02MB363417B2E91D8D6D7D31B1D6B2680@HK0PR02MB3634.apcprd02.prod.outlook.com>
References: <HK0PR02MB363417B2E91D8D6D7D31B1D6B2680@HK0PR02MB3634.apcprd02.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_045337_911106_34A8467B 
X-CRM114-Status: GOOD (  16.16  )
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
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgV2VuLAoKV2VuIFlhbmcgPHllbGxvd3JpdmVyMjAxMEBob3RtYWlsLmNvbT4gd3JvdGUgb24g
VGh1LCA3IEZlYiAyMDE5CjEyOjAyOjQ1ICswMDAwOgoKPiBvZl9maW5kX2RldmljZV9ieV9ub2Rl
KCkgdGFrZXMgYSByZWZlcmVuY2UgdG8gdGhlIHN0cnVjdCBkZXZpY2UKPiB3aGVuIGl0IGZpbmRz
IGEgbWF0Y2ggdmlhIGdldF9kZXZpY2UsIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2FsbAo+IGdldF9k
ZXZpY2UoKSB0d2ljZS4KPiBXZSBhbHNvIHNob3VsZCBtYWtlIHN1cmUgdG8gZHJvcCB0aGUgcmVm
ZXJlbmNlIHRvIHRoZSBkZXZpY2UKPiB0YWtlbiBieSBvZl9maW5kX2RldmljZV9ieV9ub2RlKCkg
b24gZHJpdmVyIHVuYmluZC4KPiAKPiBGaXhlczogYWUwMmFiMDBhYTNjICgibXRkOiBuYW5kOiBq
ejQ3ODA6IGRyaXZlciBmb3IgTkFORCBkZXZpY2VzIG9uIEpaNDc4MCBTb0NzIikKPiBTaWduZWQt
b2ZmLWJ5OiBXZW4gWWFuZyA8eWVsbG93cml2ZXIyMDEwQGhvdG1haWwuY29tPgo+IC0tLQo+IHY0
LT52MzogQWRkIHBlb3BsZSBpbiBDYyBhbmQgcmVtb3ZlIGFsbCBsaW5lcy4KPiB2My0+djI6IEF2
b2lkIHR3byB0aW1lcyBvZiBjYWxsaW5nIGdydGZvcm1fZ2V0X2RydmRhdGEoKQo+IHYyLT52MTog
U2luY2UgdGhlcmUgaXMgdGhlIG9ubHkgb25lIHVzZXIsIGxldCdzIHJlbW92ZSB0aGUgZXJyX3B1
dF9kZXZpY2UgbGFiZWwuCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2p6NDc4MF9iY2guYyB8
IDEwICsrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvano0NzgwX2Jj
aC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvano0NzgwX2JjaC5jCj4gaW5kZXggNzIwMTgyNy4u
N2FhYjg1MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9qejQ3ODBfYmNoLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9qejQ3ODBfYmNoLmMKPiBAQCAtMjgxLDEyICsy
ODEsMTQgQEAgc3RhdGljIHN0cnVjdCBqejQ3ODBfYmNoICpqejQ3ODBfYmNoX2dldChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wKQo+ICAJc3RydWN0IGp6NDc4MF9iY2ggKmJjaDsKPiAgCj4gIAlwZGV2
ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShucCk7Cj4gLQlpZiAoIXBkZXYgfHwgIXBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpKQo+ICsJaWYgKCFwZGV2KQo+ICAJCXJldHVybiBFUlJfUFRSKC1F
UFJPQkVfREVGRVIpOwo+IC0KPiAtCWdldF9kZXZpY2UoJnBkZXYtPmRldik7Cj4gLQoKUGxlYXNl
IGtlZXAgb25lIGJsYW5rIGxpbmUgaGVyZS4KCj4gIAliY2ggPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShwZGV2KTsKPiArCWlmICghYmNoKSB7Cj4gKwkJcHV0X2RldmljZSgmcGRldi0+ZGV2KTsKPiAr
CQlyZXR1cm4gRVJSX1BUUigtRVBST0JFX0RFRkVSKTsKPiArCX0KPiArCj4gIAljbGtfcHJlcGFy
ZV9lbmFibGUoYmNoLT5jbGspOwo+ICAKPiAgCXJldHVybiBiY2g7CgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
