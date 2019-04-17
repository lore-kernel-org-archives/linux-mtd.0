Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722A5C10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:34:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB212173C
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SOletlRK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KqjZV+LR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB212173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHCos8/Jz7dzeUMTuRqd01gezHN2JWQZ6C2GmGILMwY=; b=SOletlRK0Sa3bA
	/wx42vUDfhmSe1aFXAAx7tWevQ85bbAIDQa9M8UxSQH8gf557qb0obAnwwyY4DhRlkIz+N9fFY9C3
	OLaCZRiheCBmqw8h6uRHJPfrw3VBt135j0ZAPMBxkJwXvZNeMqhdoMJgUcjtqXP5F6q22C048564Q
	oxspIaIyOZqRydft1kP/+J5IytmJs4OhKsJNK8BbKvJl4HSyXjiRGu1pYvSeDmXuOd9M+skOTumV6
	6f73vB9HhKwTRhlcOkAv7pjU9G1L4n+OaETlMtPfuVCKPKh3D+0K1ITeKva2590Jd1XLeQn6RAWXe
	AIs+oWS2XHmocJjsC3Pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhts-0006fW-3A; Wed, 17 Apr 2019 10:34:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhtp-0006fO-KS
 for linux-mtd@bombadil.infradead.org; Wed, 17 Apr 2019 10:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CoPkKeRxaomt2syGOKOGg/MZpu5fUK/1MnaXc/map5c=; b=KqjZV+LRZaMFtLnncF9pfiVKkz
 /Sw50ZzSE81rIG6RF3PL3GN/hKgZtSVi3Ih1w4QFs36R+KVXeZ7am4VBTURI6bWBGD75dlMVT+B2b
 YQQcTVYdN7KIPo3vQX0BfGp+zSghIBHWoPr73v8qM84IYolUOp79bblacL1Ln9+FmMQJ83W7YWUus
 mTPtoR90la48MsYsYumQFrGooAsDkUV4RTGTCUHTlM5aa+a7tqqUWKQ0KzBpiLOFUIaF3A9hzwVnh
 DQXYfLjVfDf3bQd5CCymI1MmEdlzjGP4EfaqPdZovIzmC/oPWwyVYsA1njBKcIcd3M6GHS2932+k2
 C0sxMP1g==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhtl-0001PW-Se
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:34:39 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 215FF40015;
 Wed, 17 Apr 2019 10:33:55 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:33:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 14/14] mtd: rawnand: gpmi: Implement exec_op
Message-ID: <20190417123355.529297e2@xps13>
In-Reply-To: <20190409113421.3037-15-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-15-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_113438_051474_9FBE30B3 
X-CRM114-Status: GOOD (  30.81  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUdWUsICA5IEFwciAyMDE5CjEzOjM0OjIxICswMjAwOgoKPiBUaGUgZ3BtaSBkcml2ZXIgcGVy
Zm9ybWFuY2Ugc3VmZmVycyBmcm9tIG5hbmQgb3BlcmF0aW9ucyBiZWluZyBzcGxpdAo+IGluIG11
bHRpcGxlIHNtYWxsIGRtYSB0cmFuc2ZlcnMuIFRoaXMgaGFzIGJlZW4gZm9yY2VkIGJ5IHRoZSBu
YW5kIGxheWVyCj4gaW4gdGhlIGZvcm1lciBkYXlzLCBidXQgbm93IHdpdGggZXhlY19vcCB3ZSBj
YW4gdXNlIHRoZSBjb250cm9sbGVyIGFzCj4gaW50ZW5kZWQuCj4gCj4gV2l0aCB0aGlzIHBhdGNo
IGdwbWlfbmZjX2V4ZWNfb3AgYmVjb21lcyB0aGUgbWFpbiBlbnRyeSBwb2ludCB0byBuYW5kCj4g
b3BlcmF0aW9ucy4gSGVyZSBhbGwgaW5zdHJ1Y3Rpb25zIGFyZSBjb2xsZWN0ZWQgYW5kIGNoYWlu
ZWQgYXMgc2VwYXJhdGUKPiBETUEgdHJhbnNmZXJzLiBJbiB0aGUgZW5kIHdob2xlIGNoYWluIGlz
IGZpcmVkIGFuZCB3YWl0ZWQgdG8gYmUKPiBmaW5pc2hlZC4gZ3BtaV9uZmNfZXhlY19vcCBvbmx5
IGRvZXMgdGhlIGhhcmR3YXJlIG9wZXJhdGlvbnMsIGJhZCBibG9jawo+IG1hcmtlciBzd2FwcGlu
ZyBhbmQgYnVmZmVyIHNjcmFtYmxpbmcgaXMgZG9uZSBieSB0aGUgY2FsbGVycy4gSXQncyB3b3J0
aAo+IG5vdGluZyB0aGF0IHRoZSBuYW5kXypfb3AgZnVuY3Rpb25zIGFsd2F5cyB0YWtlIHRoZSBi
dWZmZXIgbGVuZ3RocyBmb3IKPiB0aGUgZGF0YSB0aGF0IHRoZSBuYW5kIGNoaXAgYWN0dWFsbHkg
dHJhbnNmZXJzLiBXaGVuIGRvaW5nIEJDSCB3ZSBoYXZlCj4gdG8gY2FsY3VsYXRlIHRoZSBuZXQg
ZGF0YSBzaXplIGZyb20gdGhlIHJhdyBkYXRhIHNpemUgaW4gc29tZSBwbGFjZXMuCj4gCj4gVGhp
cyBwYXRjaCBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCAyMDQ4LzY0IGFuZCAyMDQ4LzEyOCBieXRlIG5h
bmQgb24KPiBpLk1YNnEuIG10ZF9vb2J0ZXN0LCBtdGRfc3VicGFnZXRlc3QgYW5kIG10ZF9zcGVl
ZHRlc3QgcnVuIHdpdGhvdXQKPiBlcnJvcnMuIG5hbmRiaXRlcnJzLCBuYW5kcGFnZXRlc3QgYW5k
IG5hbmRzdWJwYWdldGVzdCB1c2Vyc3BhY2UgdGVzdHMKPiBmcm9tIG10ZHV0aWxzIHJ1biB3aXRo
b3V0IGVycm9ycyBhbmQgVUJJRlMgY2FuIHN1Y2Nlc3NmdWxseSBiZSBtb3VudGVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPiAtLS0K
PiAgZHJpdmVycy9kbWEvbXhzLWRtYS5jICAgICAgICAgICAgICAgICAgICAgIHwgICAgMyArCgpb
Li4uXQoKPiArc3RhdGljIGludCBncG1pX25mY19leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAsCj4gKwkJCSAgICAgY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCwKPiArCQkJICAg
ICBib29sIGNoZWNrX29ubHkpCj4gK3sKPiArCWNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICpp
bnN0cjsKPiArCXN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcyA9IG5hbmRfZ2V0X2NvbnRyb2xs
ZXJfZGF0YShjaGlwKTsKPiArCXN0cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciAqZGVzYyA9
IE5VTEw7Cj4gKwlpbnQgaSwgcmV0LCBidWZfbGVuID0gMCwgbmJ1ZnMgPSAwOwo+ICsJdTggY21k
ID0gMDsKPiArCXZvaWQgKmJ1Zl9yZWFkID0gTlVMTDsKPiArCWNvbnN0IHZvaWQgKmJ1Zl93cml0
ZSA9IE5VTEw7Cj4gKwlib29sIGRpcmVjdCA9IGZhbHNlOwo+ICsJc3RydWN0IGNvbXBsZXRpb24g
KmNvbXBsZXRpb247Cj4gKwl1bnNpZ25lZCBsb25nIHRvOwo+ICsKPiArCXRoaXMtPm50cmFuc2Zl
cnMgPSAwOwo+ICsJZm9yIChpID0gMDsgaSA8IEdQTUlfTUFYX1RSQU5TRkVSUzsgaSsrKQo+ICsJ
CXRoaXMtPnRyYW5zZmVyc1tpXS5kaXJlY3Rpb24gPSBETUFfTk9ORTsKPiArCj4gKwlyZXQgPSBw
bV9ydW50aW1lX2dldF9zeW5jKHRoaXMtPmRldik7Cj4gKwlpZiAocmV0IDwgMCkKPiArCQlyZXR1
cm4gcmV0Owo+ICsKPiArCS8qCj4gKwkgKiBUaGlzIGRyaXZlciBjdXJyZW50bHkgc3VwcG9ydHMg
b25seSBvbmUgTkFORCBjaGlwLiBQbHVzLCBkaWVzIHNoYXJlCj4gKwkgKiB0aGUgc2FtZSBjb25m
aWd1cmF0aW9uLiBTbyBvbmNlIHRpbWluZ3MgaGF2ZSBiZWVuIGFwcGxpZWQgb24gdGhlCj4gKwkg
KiBjb250cm9sbGVyIHNpZGUsIHRoZXkgd2lsbCBub3QgY2hhbmdlIGFueW1vcmUuIFdoZW4gdGhl
IHRpbWUgd2lsbAo+ICsJICogY29tZSwgdGhlIGNoZWNrIG9uIG11c3RfYXBwbHlfdGltaW5ncyB3
aWxsIGhhdmUgdG8gYmUgZHJvcHBlZC4KPiArCSAqLwo+ICsJaWYgKHRoaXMtPmh3Lm11c3RfYXBw
bHlfdGltaW5ncykgewo+ICsJCXRoaXMtPmh3Lm11c3RfYXBwbHlfdGltaW5ncyA9IGZhbHNlOwo+
ICsJCWdwbWlfbmZjX2FwcGx5X3RpbWluZ3ModGhpcyk7Cj4gKwl9Cj4gKwo+ICsJZGV2X2RiZyh0
aGlzLT5kZXYsICIlczogJWQgaW5zdHJ1Y3Rpb25zXG4iLCBfX2Z1bmNfXywgb3AtPm5pbnN0cnMp
Owo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBvcC0+bmluc3RyczsgaSsrKSB7Cj4gKwkJaW5zdHIg
PSAmb3AtPmluc3Ryc1tpXTsKPiArCj4gKwkJbmFuZF9vcF90cmFjZSgiICAiLCBpbnN0cik7Cj4g
Kwo+ICsJCXN3aXRjaCAoaW5zdHItPnR5cGUpIHsKPiArCQljYXNlIE5BTkRfT1BfV0FJVFJEWV9J
TlNUUjoKPiArCQkJZGVzYyA9IGdwbWlfY2hhaW5fd2FpdF9yZWFkeSh0aGlzKTsKPiArCQkJYnJl
YWs7Cj4gKwkJY2FzZSBOQU5EX09QX0NNRF9JTlNUUjoKPiArCQkJY21kID0gaW5zdHItPmN0eC5j
bWQub3Bjb2RlOwo+ICsKPiArCQkJLyoKPiArCQkJICogV2hlbiB0aGlzIGNvbW1hbmQgaGFzIGFu
IGFkZHJlc3MgY3ljbGUgY2hhaW4gaXQKPiArCQkJICogdG9nZXRoZXIgd2l0aCB0aGUgYWRkcmVz
cyBjeWNsZQo+ICsJCQkgKi8KPiArCQkJaWYgKGkgKyAxICE9IG9wLT5uaW5zdHJzICYmCj4gKwkJ
CSAgICBvcC0+aW5zdHJzW2kgKyAxXS50eXBlID09IE5BTkRfT1BfQUREUl9JTlNUUikKPiArCQkJ
CWNvbnRpbnVlOwo+ICsKPiArCQkJZGVzYyA9IGdwbWlfY2hhaW5fY29tbWFuZCh0aGlzLCBjbWQs
IE5VTEwsIDApOwo+ICsKPiArCQkJYnJlYWs7Cj4gKwkJY2FzZSBOQU5EX09QX0FERFJfSU5TVFI6
Cj4gKwkJCWRlc2MgPSBncG1pX2NoYWluX2NvbW1hbmQodGhpcywgY21kLCBpbnN0ci0+Y3R4LmFk
ZHIuYWRkcnMsCj4gKwkJCQkJCSAgaW5zdHItPmN0eC5hZGRyLm5hZGRycyk7Cj4gKwkJCWJyZWFr
Owo+ICsJCWNhc2UgTkFORF9PUF9EQVRBX09VVF9JTlNUUjoKPiArCQkJYnVmX3dyaXRlID0gaW5z
dHItPmN0eC5kYXRhLmJ1Zi5vdXQ7Cj4gKwkJCWJ1Zl9sZW4gPSBpbnN0ci0+Y3R4LmRhdGEubGVu
Owo+ICsJCQluYnVmcysrOwo+ICsKPiArCQkJZGVzYyA9IGdwbWlfY2hhaW5fZGF0YV93cml0ZSh0
aGlzLCBidWZfd3JpdGUsIGJ1Zl9sZW4pOwo+ICsKPiArCQkJYnJlYWs7Cj4gKwkJY2FzZSBOQU5E
X09QX0RBVEFfSU5fSU5TVFI6Cj4gKwkJCWlmICghaW5zdHItPmN0eC5kYXRhLmxlbikKPiArCQkJ
CWJyZWFrOwo+ICsJCQlidWZfcmVhZCA9IGluc3RyLT5jdHguZGF0YS5idWYuaW47Cj4gKwkJCWJ1
Zl9sZW4gPSBpbnN0ci0+Y3R4LmRhdGEubGVuOwo+ICsJCQluYnVmcysrOwo+ICsKPiArCQkJZGVz
YyA9IGdwbWlfY2hhaW5fZGF0YV9yZWFkKHRoaXMsIGJ1Zl9yZWFkLCBidWZfbGVuLAo+ICsJCQkJ
CQkgICAmZGlyZWN0KTsKPiArCQkJYnJlYWs7Cj4gKwkJfQoKU28gdGhlcmUgaXMgbm8gbGltaXRh
dGlvbiBmb3IgdGhlIGNvbnRyb2xsZXIgaW4gdGVybXMgb2YKYWRkcmVzcy9kYXRhIGN5Y2xlcyB0
aGF0IGNhbiBiZSBhc3NlcnRlZCBpbiBvbmUgZ28/Cgo+ICsKPiArCQlpZiAoIWRlc2MpIHsKPiAr
CQkJcmV0ID0gLUVOWElPOwo+ICsJCQlnb3RvIHVubWFwOwo+ICsJCX0KPiArCX0KPiArCj4gKwlk
ZXZfZGJnKHRoaXMtPmRldiwgIiVzIHNldHVwIGRvbmVcbiIsIF9fZnVuY19fKTsKPiArCj4gKwlp
ZiAobmJ1ZnMgPiAxKSB7Cj4gKwkJZGV2X2Vycih0aGlzLT5kZXYsICJNdWx0aXBsZSBkYXRhIGlu
c3RydWN0aW9ucyBub3Qgc3VwcG9ydGVkXG4iKTsKPiArCQlyZXQgPSAtRUlOVkFMOwo+ICsJCWdv
dG8gdW5tYXA7Cj4gKwl9Cj4gKwo+ICsJaWYgKHRoaXMtPmJjaCkgewo+ICsJCXdyaXRlbCh0aGlz
LT5iY2hfZmxhc2hsYXlvdXQwLAo+ICsJCSAgICAgICB0aGlzLT5yZXNvdXJjZXMuYmNoX3JlZ3Mg
KyBIV19CQ0hfRkxBU0gwTEFZT1VUMCk7Cj4gKwkJd3JpdGVsKHRoaXMtPmJjaF9mbGFzaGxheW91
dDEsCj4gKwkJICAgICAgIHRoaXMtPnJlc291cmNlcy5iY2hfcmVncyArIEhXX0JDSF9GTEFTSDBM
QVlPVVQxKTsKPiArCX0KPiArCj4gKwlpZiAodGhpcy0+YmNoICYmIGJ1Zl9yZWFkKSB7Cj4gKwkJ
d3JpdGVsKEJNX0JDSF9DVFJMX0NPTVBMRVRFX0lSUV9FTiwKPiArCQkgICAgICAgdGhpcy0+cmVz
b3VyY2VzLmJjaF9yZWdzICsgSFdfQkNIX0NUUkxfU0VUKTsKPiArCQljb21wbGV0aW9uID0gJnRo
aXMtPmJjaF9kb25lOwo+ICsJfSBlbHNlIHsKPiArCQlkZXNjLT5jYWxsYmFjayA9IGRtYV9pcnFf
Y2FsbGJhY2s7Cj4gKwkJZGVzYy0+Y2FsbGJhY2tfcGFyYW0gPSB0aGlzOwo+ICsJCWNvbXBsZXRp
b24gPSAmdGhpcy0+ZG1hX2RvbmU7Cj4gKwl9Cj4gKwo+ICsJaW5pdF9jb21wbGV0aW9uKGNvbXBs
ZXRpb24pOwo+ICsKPiArCWRtYWVuZ2luZV9zdWJtaXQoZGVzYyk7Cj4gKwlkbWFfYXN5bmNfaXNz
dWVfcGVuZGluZyhnZXRfZG1hX2NoYW4odGhpcykpOwo+ICsKPiArCXRvID0gd2FpdF9mb3JfY29t
cGxldGlvbl90aW1lb3V0KGNvbXBsZXRpb24sIG1zZWNzX3RvX2ppZmZpZXMoMTAwMCkpOwo+ICsJ
aWYgKCF0bykgewo+ICsJCWRldl9lcnIodGhpcy0+ZGV2LCAiRE1BIHRpbWVvdXQsIGxhc3QgRE1B
XG4iKTsKPiArCQlncG1pX2R1bXBfaW5mbyh0aGlzKTsKPiArCQlyZXQgPSAtRVRJTUVET1VUOwo+
ICsJCWdvdG8gdW5tYXA7Cj4gKwl9Cj4gKwo+ICsJd3JpdGVsKEJNX0JDSF9DVFJMX0NPTVBMRVRF
X0lSUV9FTiwKPiArCSAgICAgICB0aGlzLT5yZXNvdXJjZXMuYmNoX3JlZ3MgKyBIV19CQ0hfQ1RS
TF9DTFIpOwo+ICsJZ3BtaV9jbGVhcl9iY2godGhpcyk7Cj4gKwo+ICsJcmV0ID0gMDsKPiArCj4g
K3VubWFwOgo+ICsJZm9yIChpID0gMDsgaSA8IHRoaXMtPm50cmFuc2ZlcnM7IGkrKykgewo+ICsJ
CXN0cnVjdCBncG1pX3RyYW5zZmVyICp0cmFuc2ZlciA9ICZ0aGlzLT50cmFuc2ZlcnNbaV07Cj4g
Kwo+ICsJCWlmICh0cmFuc2Zlci0+ZGlyZWN0aW9uICE9IERNQV9OT05FKQo+ICsJCQlkbWFfdW5t
YXBfc2codGhpcy0+ZGV2LCAmdHJhbnNmZXItPnNnbCwgMSwKPiArCQkJCSAgICAgdHJhbnNmZXIt
PmRpcmVjdGlvbik7Cj4gKwl9Cj4gKwo+ICsJaWYgKCFyZXQgJiYgYnVmX3JlYWQgJiYgIWRpcmVj
dCkKPiArCQltZW1jcHkoYnVmX3JlYWQsIHRoaXMtPmRhdGFfYnVmZmVyX2RtYSwKPiArCQkgICAg
ICAgZ3BtaV9yYXdfbGVuX3RvX2xlbih0aGlzLCBidWZfbGVuKSk7Cj4gKwo+ICsJdGhpcy0+YmNo
ID0gZmFsc2U7Cj4gKwo+ICsJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSh0aGlzLT5kZXYpOwo+
ICsJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQodGhpcy0+ZGV2KTsKPiArCj4gKwlyZXR1cm4g
cmV0Owo+ICt9Cj4gKwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
