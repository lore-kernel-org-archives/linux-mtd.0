Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C4DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 16:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15FB6127C
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 16:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D15FB6127C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWrNDqy6Yx7WqFvvZCwIp6pdMmNaC6k+v8HzbY4vQec=; b=O6Wc4MwRZKdsOK
	ZDv4RSBEN1W6XcnltdYsJvEvp5ex1lNiKd1vM/m/xK4STX7Htq+PwCdpOvbIpwvoiCO9OpaOuwJCf
	YIBC+LD9Mbmgy4h3/jjEg4XN2p43qNS6HQz1GYj2jctLkudwIlzm+dfgCDvPIcL4VhkdmJztnS33b
	IGeQ3iv4X2kAKezbKP0bZ7OxhRzT9mGrUyJuelvcmR+DoG5GhfThLzT3Csx6ws3Cb2O+ycs/cVWXQ
	Qga2Jr1JU1Z21Ey13+tCrllQf5kqGQjRKIIhmco7x8FdCYB2O+HwuuKAfdSLELGGs/uUup6lxqc0s
	HORZxIP1WUEwyjq9iTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVFbm-007zqF-4C; Tue, 28 Sep 2021 16:05:30 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVFbh-007znV-TS
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 16:05:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7CB161C0012;
 Tue, 28 Sep 2021 16:05:22 +0000 (UTC)
Date: Tue, 28 Sep 2021 18:05:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>
Subject: Re: [RFC PATCH 1/1] mtd: block2mtd: add support for an optional
 custom MTD label
Message-ID: <20210928180521.4516405c@xps13>
In-Reply-To: <20210928154937.2668575-1-troglobit@gmail.com>
References: <20210928154937.2668575-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_090526_251246_632A1C7A 
X-CRM114-Status: GOOD (  25.47  )
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

SGkgSm9hY2hpbSwKCnRyb2dsb2JpdEBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAyOCBTZXAgMjAy
MSAxNzo0OTozOCArMDIwMDoKCj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGFuIG9wdGlv
bmFsIE1URCBsYWJlbCBmb3IgbXRkMmJsb2NrIGVtdWxhdGVkCj4gTVREIGRldmljZXMuICBVc2Vm
dWwgd2hlbiwgZS5nLiB0ZXN0aW5nIGRldmljZSBpbWFnZXMgdXNpbmcgUWVtdS4gIFRoZQo+IGZv
bGxvd2luZyAvZXRjL2ZzdGFiIGxpbmUgaW4gY2FuIHRoZW4gYmUgdXNlZCB0byBtb3VudCBhIGZp
bGUgc3lzdGVtCj4gcmVnYXJkbGVzcyBvZiB0aGUgYWN0dWFsIE1URCBwYXJ0aXRpb24gbnVtYmVy
Ogo+IAo+ICAgICBtdGQ6Q29uZmlnICAvbW50ICAgIGpmZnMyICAgbm9hdGltZSxub2RpcmF0aW1l
ICAgICAgMCAgICAwCj4gCj4gS2VybmVsIGNvbW1hbmQgbGluZSBzeW50YXg6Cj4gCj4gICAgIGJs
b2NrMm10ZC5ibG9jazJtdGQ9L2Rldi9zZGEsLENvbmZpZwo+IAo+IFRoZSAnLCwnIGlzIHRoZSBv
cHRpb25hbCBlcmFzZV9zaXplLCB3aGljaCBsaWtlIGJlZm9yZSB0aGlzIHBhdGNoLAo+IGRlZmF1
bHRzIHRvIFBBR0VfU0laRSB3aGVuIG9taXR0ZWQuCgpXZSBhbHJlYWR5IGhhdmUgYSBsYWJlbCBw
cm9wZXJ0eSB0aGF0IGNhbiBiZSBhZGRlZCBpbiB0aGUgRFQsIGlzbid0Cml0IGVub3VnaD8KClRo
YW5rcywKTWlxdcOobAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2FjaGltIFdpYmVyZyA8dHJvZ2xv
Yml0QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9jazJtdGQuYyB8
IDI2ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9k
ZXZpY2VzL2Jsb2NrMm10ZC5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9jazJtdGQuYwo+IGlu
ZGV4IGMwODcyMWIxMTY0Mi4uODdjZGYwNDFhMjE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L2RldmljZXMvYmxvY2sybXRkLmMKPiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10
ZC5jCj4gQEAgLTIxNCw3ICsyMTQsNyBAQCBzdGF0aWMgdm9pZCBibG9jazJtdGRfZnJlZV9kZXZp
Y2Uoc3RydWN0IGJsb2NrMm10ZF9kZXYgKmRldikKPiAgCj4gIAo+ICBzdGF0aWMgc3RydWN0IGJs
b2NrMm10ZF9kZXYgKmFkZF9kZXZpY2UoY2hhciAqZGV2bmFtZSwgaW50IGVyYXNlX3NpemUsCj4g
LQkJaW50IHRpbWVvdXQpCj4gKwkJY2hhciAqbGFiZWwsIGludCB0aW1lb3V0KQo+ICB7Cj4gICNp
Zm5kZWYgTU9EVUxFCj4gIAlpbnQgaTsKPiBAQCAtMjc4LDcgKzI3OCwxMCBAQCBzdGF0aWMgc3Ry
dWN0IGJsb2NrMm10ZF9kZXYgKmFkZF9kZXZpY2UoY2hhciAqZGV2bmFtZSwgaW50IGVyYXNlX3Np
emUsCj4gIAo+ICAJLyogU2V0dXAgdGhlIE1URCBzdHJ1Y3R1cmUgKi8KPiAgCS8qIG1ha2UgdGhl
IG5hbWUgY29udGFpbiB0aGUgYmxvY2sgZGV2aWNlIGluICovCj4gLQluYW1lID0ga2FzcHJpbnRm
KEdGUF9LRVJORUwsICJibG9jazJtdGQ6ICVzIiwgZGV2bmFtZSk7Cj4gKwlpZiAoIWxhYmVsKQo+
ICsJCW5hbWUgPSBrYXNwcmludGYoR0ZQX0tFUk5FTCwgImJsb2NrMm10ZDogJXMiLCBkZXZuYW1l
KTsKPiArCWVsc2UKPiArCQluYW1lID0ga3N0cmR1cChsYWJlbCwgR0ZQX0tFUk5FTCk7Cj4gIAlp
ZiAoIW5hbWUpCj4gIAkJZ290byBlcnJfZGVzdHJveV9tdXRleDsKPiAgCj4gQEAgLTMwNCw3ICsz
MDcsNyBAQCBzdGF0aWMgc3RydWN0IGJsb2NrMm10ZF9kZXYgKmFkZF9kZXZpY2UoY2hhciAqZGV2
bmFtZSwgaW50IGVyYXNlX3NpemUsCj4gIAo+ICAJbGlzdF9hZGQoJmRldi0+bGlzdCwgJmJsa210
ZF9kZXZpY2VfbGlzdCk7Cj4gIAlwcl9pbmZvKCJtdGQlZDogWyVzXSBlcmFzZV9zaXplID0gJWRL
aUIgWyVkXVxuIiwKPiAtCQlkZXYtPm10ZC5pbmRleCwKPiArCQlkZXYtPm10ZC5pbmRleCwgbGFi
ZWwgPyBsYWJlbCA6Cj4gIAkJZGV2LT5tdGQubmFtZSArIHN0cmxlbigiYmxvY2sybXRkOiAiKSwK
PiAgCQlkZXYtPm10ZC5lcmFzZXNpemUgPj4gMTAsIGRldi0+bXRkLmVyYXNlc2l6ZSk7Cj4gIAly
ZXR1cm4gZGV2Owo+IEBAIC0zODEsOCArMzg0LDggQEAgc3RhdGljIGludCBibG9jazJtdGRfc2V0
dXAyKGNvbnN0IGNoYXIgKnZhbCkKPiAgCS8qIDgwIGZvciBkZXZpY2UsIDEyIGZvciBlcmFzZSBz
aXplLCA4MCBmb3IgbmFtZSwgOCBmb3IgdGltZW91dCAqLwo+ICAJY2hhciBidWZbODAgKyAxMiAr
IDgwICsgOF07Cj4gIAljaGFyICpzdHIgPSBidWY7Cj4gLQljaGFyICp0b2tlblsyXTsKPiAtCWNo
YXIgKm5hbWU7Cj4gKwljaGFyICp0b2tlblszXTsKPiArCWNoYXIgKm5hbWUsICpsYWJlbCA9IE5V
TEw7Cj4gIAlzaXplX3QgZXJhc2Vfc2l6ZSA9IFBBR0VfU0laRTsKPiAgCXVuc2lnbmVkIGxvbmcg
dGltZW91dCA9IE1URF9ERUZBVUxUX1RJTUVPVVQ7Cj4gIAlpbnQgaSwgcmV0Owo+IEBAIC0zOTUs
NyArMzk4LDcgQEAgc3RhdGljIGludCBibG9jazJtdGRfc2V0dXAyKGNvbnN0IGNoYXIgKnZhbCkK
PiAgCXN0cmNweShzdHIsIHZhbCk7Cj4gIAlraWxsX2ZpbmFsX25ld2xpbmUoc3RyKTsKPiAgCj4g
LQlmb3IgKGkgPSAwOyBpIDwgMjsgaSsrKQo+ICsJZm9yIChpID0gMDsgaSA8IDM7IGkrKykKPiAg
CQl0b2tlbltpXSA9IHN0cnNlcCgmc3RyLCAiLCIpOwo+ICAKPiAgCWlmIChzdHIpIHsKPiBAQCAt
NDE0LDcgKzQxNyw3IEBAIHN0YXRpYyBpbnQgYmxvY2sybXRkX3NldHVwMihjb25zdCBjaGFyICp2
YWwpCj4gIAkJcmV0dXJuIDA7Cj4gIAl9Cj4gIAo+IC0JaWYgKHRva2VuWzFdKSB7Cj4gKwlpZiAo
dG9rZW5bMV0gJiYgc3RybGVuKHRva2VuWzFdKSkgewo+ICAJCXJldCA9IHBhcnNlX251bSgmZXJh
c2Vfc2l6ZSwgdG9rZW5bMV0pOwo+ICAJCWlmIChyZXQpIHsKPiAgCQkJcHJfZXJyKCJpbGxlZ2Fs
IGVyYXNlIHNpemVcbiIpOwo+IEBAIC00MjIsNyArNDI1LDEyIEBAIHN0YXRpYyBpbnQgYmxvY2sy
bXRkX3NldHVwMihjb25zdCBjaGFyICp2YWwpCj4gIAkJfQo+ICAJfQo+ICAKPiAtCWFkZF9kZXZp
Y2UobmFtZSwgZXJhc2Vfc2l6ZSwgdGltZW91dCk7Cj4gKwlpZiAodG9rZW5bMl0pIHsKPiArCQls
YWJlbCA9IHRva2VuWzJdOwo+ICsJCXByX2luZm8oIlVzaW5nIGN1c3RvbSBNVEQgbGFiZWwgJyVz
JyBmb3IgZGV2ICVzXG4iLCBsYWJlbCwgbmFtZSk7Cj4gKwl9Cj4gKwo+ICsJYWRkX2RldmljZShu
YW1lLCBlcmFzZV9zaXplLCBsYWJlbCwgdGltZW91dCk7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0K
PiBAQCAtNDU2LDcgKzQ2NCw3IEBAIHN0YXRpYyBpbnQgYmxvY2sybXRkX3NldHVwKGNvbnN0IGNo
YXIgKnZhbCwgY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJhbSAqa3ApCj4gIAo+ICAKPiAgbW9kdWxl
X3BhcmFtX2NhbGwoYmxvY2sybXRkLCBibG9jazJtdGRfc2V0dXAsIE5VTEwsIE5VTEwsIDAyMDAp
Owo+IC1NT0RVTEVfUEFSTV9ERVNDKGJsb2NrMm10ZCwgIkRldmljZSB0byB1c2UuIFwiYmxvY2sy
bXRkPTxkZXY+Wyw8ZXJhc2VzaXplPl1cIiIpOwo+ICtNT0RVTEVfUEFSTV9ERVNDKGJsb2NrMm10
ZCwgIkRldmljZSB0byB1c2UuIFwiYmxvY2sybXRkPTxkZXY+WyxbPGVyYXNlc2l6ZT5dWyw8bmFt
ZT5dXVwiIik7Cj4gIAo+ICBzdGF0aWMgaW50IF9faW5pdCBibG9jazJtdGRfaW5pdCh2b2lkKQo+
ICB7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
