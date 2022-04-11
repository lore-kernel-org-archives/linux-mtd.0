Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAE1C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 12:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWLkn6B09iOneGh9ybrhBDVF8TGJMlawCT9Tl3nqNVU=; b=SNUcU33IqJ+Md3
	zaIV905IS2JLfb1CRm8ee5xkzOMYaygSQYV7LJMtJvUx3LInFwAFiNikZZSoMMF0ObQKlKB9I8xLm
	EG6m1c19++SbluYRxHkGh5Ou8pOnLDKMt1YPv7clCe/AbeY7j222jaIfZyYDG6VSozi22n9kBrktM
	rA1Uo8Wbjo7kB14A3YCvX2myZVrgll1Rt+TUbrTNda6TLqeHnfJ2Id7rPC18yZYcvW/o2E1zvIEl3
	slo0EWaS9iFi+BJeSVgHOI01rzT/nsVVMfSMqApsLUozoLlIwu9H0cC85fJE9JY4BBTaAjlp40bLc
	acbLLXZCrrF04zyoRJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndtS2-0091lS-Cq; Mon, 11 Apr 2022 12:47:26 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndtRy-0091jt-PF
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 12:47:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 08CF01BF205;
 Mon, 11 Apr 2022 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649681236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOhGrupBv5BZo/T0IffoldQiJaqfYTq0n0a0T+OCi+I=;
 b=SHrE47RtGnZTw25wVFb9Z4eZEOtLtknUSNPtLyjVtFAd9YTgJgfRqHC4yFrK81LxXd3BNQ
 eGESDWRhWNrlTRBeB60fXo2BJy+duzJm0EG5g9VeOhu3ElExffzi7ziQvXMsg6Jqg1dmVG
 iRLB6rGtvRwjeaiL5jnPP+Un0F3NLh2Acz+W2vgWTZVdVKueXBc9OjlkkM47EqaJh+pM0Y
 FDQwkCQhrGVtKjD66tMHHNtZOopHPfzuCQjF+cNjVwuvHdoJvJyWnYOl7x/7/tb4ItqjAW
 hXi4VvJKep9C+eKsiS0tLC1JdvM28Kk9GphAE992QLXjY4OIu/72kDUng3yHQQ==
Date: Mon, 11 Apr 2022 14:47:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Use managed device resources
Message-ID: <20220411144713.3057dd17@xps13>
In-Reply-To: <20220411112124.3700126-1-zheyuma97@gmail.com>
References: <20220411112124.3700126-1-zheyuma97@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_054723_114952_081B2EC4 
X-CRM114-Status: GOOD (  17.30  )
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

SGVsbG8sCgp6aGV5dW1hOTdAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMTEgQXByIDIwMjIgMTk6
MjE6MjQgKzA4MDA6CgpQcmVmaXggc2hvdWxkIGJlICJtdGQ6IHJhd25hbmQ6IGRlbmFsaToiCgo+
IEFsbCBvZiB0aGUgcmVzb3VyY2VzIHVzZWQgYnkgdGhpcyBkcml2ZXIgaGFzIG1hbmFnZWQgaW50
ZXJmYWNlcywgc28gdXNlCj4gdGhlbS4gT3RoZXJ3aXNlIHdlIHdpbGwgZ2V0IHRoZSBmb2xsb3dp
bmcgc3BsYXQ6Cj4gCj4gWyAgICA0LjQ3MjcwM10gZGVuYWxpLW5hbmQtcGNpIDAwMDA6MDA6MDUu
MDogdGltZW91dCB3aGlsZSB3YWl0aW5nIGZvciBpcnEgMHgxMDAwCj4gWyAgICA0LjQ3NDA3MV0g
ZGVuYWxpLW5hbmQtcGNpOiBwcm9iZSBvZiAwMDAwOjAwOjA1LjAgZmFpbGVkIHdpdGggZXJyb3Ig
LTUKPiBbICAgIDQuNDczNTM4XSBuYW5kOiBObyBOQU5EIGRldmljZSBmb3VuZAo+IFsgICAgNC40
NzQwNjhdIEJVRzogdW5hYmxlIHRvIGhhbmRsZSBwYWdlIGZhdWx0IGZvciBhZGRyZXNzOiBmZmZm
YzkwMDA1MDAwNDEwCj4gWyAgICA0LjQ3NTE2OV0gI1BGOiBzdXBlcnZpc29yIHdyaXRlIGFjY2Vz
cyBpbiBrZXJuZWwgbW9kZQo+IFsgICAgNC40NzU1NzldICNQRjogZXJyb3JfY29kZSgweDAwMDIp
IC0gbm90LXByZXNlbnQgcGFnZQo+IFsgICAgNC40NzgzNjJdIFJJUDogMDAxMDppb3dyaXRlMzIr
MHg5LzB4NTAKPiBbICAgIDQuNDg2MDY4XSBDYWxsIFRyYWNlOgo+IFsgICAgNC40ODYyNjldICA8
SVJRPgo+IFsgICAgNC40ODY0NDNdICBkZW5hbGlfaXNyKzB4MTViLzB4MzAwIFtkZW5hbGldCj4g
WyAgICA0LjQ4Njc4OF0gID8gZGVuYWxpX2RpcmVjdF93cml0ZSsweDUwLzB4NTAgW2RlbmFsaV0K
PiBbICAgIDQuNDg3MTg5XSAgX19oYW5kbGVfaXJxX2V2ZW50X3BlcmNwdSsweDE2MS8weDNiMAo+
IFsgICAgNC40ODc1NzFdICBoYW5kbGVfaXJxX2V2ZW50KzB4N2QvMHgxYjAKPiBbICAgIDQuNDg3
ODg0XSAgaGFuZGxlX2Zhc3Rlb2lfaXJxKzB4MmIwLzB4NzcwCj4gWyAgICA0LjQ4ODIxOV0gIF9f
Y29tbW9uX2ludGVycnVwdCsweGM4LzB4MWIwCj4gWyAgICA0LjQ4ODU0OV0gIGNvbW1vbl9pbnRl
cnJ1cHQrMHg5YS8weGMwCj4gCj4gRml4ZXM6IDkzZGI0NDZhNDI0YyAoIm10ZDogbmFuZDogbW92
ZSByYXcgTkFORCByZWxhdGVkIGNvZGUgdG8gdGhlIHJhdy8gc3ViZGlyIikKPiAKCkV4dHJhIHNw
YWNlCgo+IFNpZ25lZC1vZmYtYnk6IFpoZXl1IE1hIDx6aGV5dW1hOTdAZ21haWwuY29tPgoKT3Ro
ZXJ3aXNlIExHVE0uCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGlfcGNpLmMg
fCAxNSArKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Rl
bmFsaV9wY2kuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaV9wY2kuYwo+IGluZGV4IDIw
YzA4NWEzMGFkYy4uZGU3ZTcyMmQzODI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2RlbmFsaV9wY2kuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaV9wY2ku
Ywo+IEBAIC03NCwyMiArNzQsMjEgQEAgc3RhdGljIGludCBkZW5hbGlfcGNpX3Byb2JlKHN0cnVj
dCBwY2lfZGV2ICpkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKPiAgCQlyZXR1
cm4gcmV0Owo+ICAJfQo+ICAKPiAtCWRlbmFsaS0+cmVnID0gaW9yZW1hcChjc3JfYmFzZSwgY3Ny
X2xlbik7Cj4gKwlkZW5hbGktPnJlZyA9IGRldm1faW9yZW1hcChkZW5hbGktPmRldiwgY3NyX2Jh
c2UsIGNzcl9sZW4pOwo+ICAJaWYgKCFkZW5hbGktPnJlZykgewo+ICAJCWRldl9lcnIoJmRldi0+
ZGV2LCAiU3BlY3RyYTogVW5hYmxlIHRvIHJlbWFwIG1lbW9yeSByZWdpb25cbiIpOwo+ICAJCXJl
dHVybiAtRU5PTUVNOwo+ICAJfQo+ICAKPiAtCWRlbmFsaS0+aG9zdCA9IGlvcmVtYXAobWVtX2Jh
c2UsIG1lbV9sZW4pOwo+ICsJZGVuYWxpLT5ob3N0ID0gZGV2bV9pb3JlbWFwKGRlbmFsaS0+ZGV2
LCBtZW1fYmFzZSwgbWVtX2xlbik7Cj4gIAlpZiAoIWRlbmFsaS0+aG9zdCkgewo+ICAJCWRldl9l
cnIoJmRldi0+ZGV2LCAiU3BlY3RyYTogaW9yZW1hcCBmYWlsZWQhIik7Cj4gLQkJcmV0ID0gLUVO
T01FTTsKPiAtCQlnb3RvIG91dF91bm1hcF9yZWc7Cj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gIAl9
Cj4gIAo+ICAJcmV0ID0gZGVuYWxpX2luaXQoZGVuYWxpKTsKPiAgCWlmIChyZXQpCj4gLQkJZ290
byBvdXRfdW5tYXBfaG9zdDsKPiArCQlyZXR1cm4gcmV0Owo+ICAKPiAgCW5zZWxzID0gZGVuYWxp
LT5uYmFua3M7Cj4gIAo+IEBAIC0xMTcsMTAgKzExNiw2IEBAIHN0YXRpYyBpbnQgZGVuYWxpX3Bj
aV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAq
aWQpCj4gIAo+ICBvdXRfcmVtb3ZlX2RlbmFsaToKPiAgCWRlbmFsaV9yZW1vdmUoZGVuYWxpKTsK
PiAtb3V0X3VubWFwX2hvc3Q6Cj4gLQlpb3VubWFwKGRlbmFsaS0+aG9zdCk7Cj4gLW91dF91bm1h
cF9yZWc6Cj4gLQlpb3VubWFwKGRlbmFsaS0+cmVnKTsKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAg
Cj4gQEAgLTEyOSw4ICsxMjQsNiBAQCBzdGF0aWMgdm9pZCBkZW5hbGlfcGNpX3JlbW92ZShzdHJ1
Y3QgcGNpX2RldiAqZGV2KQo+ICAJc3RydWN0IGRlbmFsaV9jb250cm9sbGVyICpkZW5hbGkgPSBw
Y2lfZ2V0X2RydmRhdGEoZGV2KTsKPiAgCj4gIAlkZW5hbGlfcmVtb3ZlKGRlbmFsaSk7Cj4gLQlp
b3VubWFwKGRlbmFsaS0+cmVnKTsKPiAtCWlvdW5tYXAoZGVuYWxpLT5ob3N0KTsKPiAgfQo+ICAK
PiAgc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVyIGRlbmFsaV9wY2lfZHJpdmVyID0gewoKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
