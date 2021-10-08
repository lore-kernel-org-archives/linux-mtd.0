Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8E8C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 07:28:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF3B60F5D
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 07:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BF3B60F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6AcHu4NgOgQkugz/iq3wB0AKD9IACnJmtYPsbQiA9bo=; b=V8N8DzU/qbDOBl
	eqt72RGSWsfJ5DbI99ZK0fyGGDJDiWY7zDAp8g0c0eD91+iFOQpOEDwkQrOVwrRivHUoEkXQb69KQ
	cchUyB6XE+y6l4vF5Fha4fp3TMJ48WiC/UyJrxUJbbI6NEl8z9uL0uozxt++iX+12TnUd7kCDx9Tb
	M3i+9Ly58aXNCanZHK58sI+SdgHlzyRDclPnd+qfOg0WT4giALEzbVWb0KWBpCuO5fCyImNbWf6Sw
	l8+kNAeZvePf5gwCzZLBbMQHDF2aAEdU97Lx1zshEqeMIEBk46kK1J9G2/xEDNcLoZdO4QFaLcm7s
	/Bh5KM3UFpixF0h78xCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYkIQ-001rEq-92; Fri, 08 Oct 2021 07:27:58 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYkIM-001rDj-HU
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 07:27:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5FC91240014;
 Fri,  8 Oct 2021 07:27:49 +0000 (UTC)
Date: Fri, 8 Oct 2021 09:27:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>
Subject: Re: [PATCH 1/1] mtd: block2mtd: add support for an optional custom
 MTD label
Message-ID: <20211008092748.6b47fce6@xps13>
In-Reply-To: <20211005080359.170360-1-troglobit@gmail.com>
References: <20211005080359.170360-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_002754_894944_7589DA15 
X-CRM114-Status: GOOD (  28.11  )
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

SGkgSm9hY2hpbSwKCnRyb2dsb2JpdEBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAgNSBPY3QgMjAy
MSAxMDowMzo1OSArMDIwMDoKCj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGFuIG9wdGlv
bmFsIE1URCBsYWJlbCBmb3IgbXRkMmJsb2NrIGVtdWxhdGVkCj4gTVREIGRldmljZXMuICBVc2Vm
dWwgd2hlbiwgZS5nLiB0ZXN0aW5nIGRldmljZSBpbWFnZXMgdXNpbmcgUWVtdS4gIFRoZQo+IGZv
bGxvd2luZyAvZXRjL2ZzdGFiIGxpbmUgaW4gY2FuIHRoZW4gYmUgdXNlZCB0byBtb3VudCBhIGZp
bGUgc3lzdGVtCj4gcmVnYXJkbGVzcyBvZiB0aGUgYWN0dWFsIE1URCBwYXJ0aXRpb24gbnVtYmVy
Ogo+IAo+ICAgICBtdGQ6Q29uZmlnICAvbW50ICAgIGpmZnMyICAgbm9hdGltZSxub2RpcmF0aW1l
ICAgICAgMCAgICAwCj4gCj4gS2VybmVsIGNvbW1hbmQgbGluZSBzeW50YXg6Cj4gCj4gICAgIGJs
b2NrMm10ZC5ibG9jazJtdGQ9L2Rldi9zZGEsLENvbmZpZwo+IAo+IFRoZSAnLCwnIGlzIHRoZSBv
cHRpb25hbCBlcmFzZV9zaXplLCB3aGljaCBsaWtlIGJlZm9yZSB0aGlzIHBhdGNoLAo+IGRlZmF1
bHRzIHRvIFBBR0VfU0laRSB3aGVuIG9taXR0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9hY2hp
bSBXaWJlcmcgPHRyb2dsb2JpdEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL2Rldmlj
ZXMvYmxvY2sybXRkLmMgfCAyNiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9jazJtdGQuYyBiL2RyaXZlcnMvbXRkL2RldmljZXMv
YmxvY2sybXRkLmMKPiBpbmRleCBjMDg3MjFiMTE2NDIuLjk0NjViOGZmNDhmNiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jCj4gKysrIGIvZHJpdmVycy9tdGQv
ZGV2aWNlcy9ibG9jazJtdGQuYwo+IEBAIC0yMTQsNyArMjE0LDcgQEAgc3RhdGljIHZvaWQgYmxv
Y2sybXRkX2ZyZWVfZGV2aWNlKHN0cnVjdCBibG9jazJtdGRfZGV2ICpkZXYpCj4gIAo+ICAKPiAg
c3RhdGljIHN0cnVjdCBibG9jazJtdGRfZGV2ICphZGRfZGV2aWNlKGNoYXIgKmRldm5hbWUsIGlu
dCBlcmFzZV9zaXplLAo+IC0JCWludCB0aW1lb3V0KQo+ICsJCWNoYXIgKmxhYmVsLCBpbnQgdGlt
ZW91dCkKPiAgewo+ICAjaWZuZGVmIE1PRFVMRQo+ICAJaW50IGk7Cj4gQEAgLTI3OCw3ICsyNzgs
MTAgQEAgc3RhdGljIHN0cnVjdCBibG9jazJtdGRfZGV2ICphZGRfZGV2aWNlKGNoYXIgKmRldm5h
bWUsIGludCBlcmFzZV9zaXplLAo+ICAKPiAgCS8qIFNldHVwIHRoZSBNVEQgc3RydWN0dXJlICov
Cj4gIAkvKiBtYWtlIHRoZSBuYW1lIGNvbnRhaW4gdGhlIGJsb2NrIGRldmljZSBpbiAqLwo+IC0J
bmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiYmxvY2sybXRkOiAlcyIsIGRldm5hbWUpOwo+
ICsJaWYgKCFsYWJlbCkKPiArCQluYW1lID0ga2FzcHJpbnRmKEdGUF9LRVJORUwsICJibG9jazJt
dGQ6ICVzIiwgZGV2bmFtZSk7Cj4gKwllbHNlCj4gKwkJbmFtZSA9IGtzdHJkdXAobGFiZWwsIEdG
UF9LRVJORUwpOwo+ICAJaWYgKCFuYW1lKQo+ICAJCWdvdG8gZXJyX2Rlc3Ryb3lfbXV0ZXg7Cj4g
IAo+IEBAIC0zMDQsNyArMzA3LDcgQEAgc3RhdGljIHN0cnVjdCBibG9jazJtdGRfZGV2ICphZGRf
ZGV2aWNlKGNoYXIgKmRldm5hbWUsIGludCBlcmFzZV9zaXplLAo+ICAKPiAgCWxpc3RfYWRkKCZk
ZXYtPmxpc3QsICZibGttdGRfZGV2aWNlX2xpc3QpOwo+ICAJcHJfaW5mbygibXRkJWQ6IFslc10g
ZXJhc2Vfc2l6ZSA9ICVkS2lCIFslZF1cbiIsCj4gLQkJZGV2LT5tdGQuaW5kZXgsCj4gKwkJZGV2
LT5tdGQuaW5kZXgsIGxhYmVsID8gbGFiZWwgOgoKQ2FuIHlvdSBwdXQgdGhpcyBvbiB0aGUgbmV4
dCBsaW5lPwoKPiAgCQlkZXYtPm10ZC5uYW1lICsgc3RybGVuKCJibG9jazJtdGQ6ICIpLAo+ICAJ
CWRldi0+bXRkLmVyYXNlc2l6ZSA+PiAxMCwgZGV2LT5tdGQuZXJhc2VzaXplKTsKPiAgCXJldHVy
biBkZXY7Cj4gQEAgLTM4MSw4ICszODQsOCBAQCBzdGF0aWMgaW50IGJsb2NrMm10ZF9zZXR1cDIo
Y29uc3QgY2hhciAqdmFsKQo+ICAJLyogODAgZm9yIGRldmljZSwgMTIgZm9yIGVyYXNlIHNpemUs
IDgwIGZvciBuYW1lLCA4IGZvciB0aW1lb3V0ICovCj4gIAljaGFyIGJ1Zls4MCArIDEyICsgODAg
KyA4XTsKPiAgCWNoYXIgKnN0ciA9IGJ1ZjsKPiAtCWNoYXIgKnRva2VuWzJdOwo+IC0JY2hhciAq
bmFtZTsKPiArCWNoYXIgKnRva2VuWzNdOwoKVGhpcyBudW1iZXIgZGVzZXJ2ZXMgYSBkZWZpbmUg
YW5kIHNob3VsZCBiZSB1c2VkIGxhdGVyIG9uIGFzIHdlbGwuCgo+ICsJY2hhciAqbmFtZSwgKmxh
YmVsID0gTlVMTDsKPiAgCXNpemVfdCBlcmFzZV9zaXplID0gUEFHRV9TSVpFOwo+ICAJdW5zaWdu
ZWQgbG9uZyB0aW1lb3V0ID0gTVREX0RFRkFVTFRfVElNRU9VVDsKPiAgCWludCBpLCByZXQ7Cj4g
QEAgLTM5NSw3ICszOTgsNyBAQCBzdGF0aWMgaW50IGJsb2NrMm10ZF9zZXR1cDIoY29uc3QgY2hh
ciAqdmFsKQo+ICAJc3RyY3B5KHN0ciwgdmFsKTsKPiAgCWtpbGxfZmluYWxfbmV3bGluZShzdHIp
Owo+ICAKPiAtCWZvciAoaSA9IDA7IGkgPCAyOyBpKyspCj4gKwlmb3IgKGkgPSAwOyBpIDwgMzsg
aSsrKQo+ICAJCXRva2VuW2ldID0gc3Ryc2VwKCZzdHIsICIsIik7Cj4gIAo+ICAJaWYgKHN0cikg
ewo+IEBAIC00MTQsNyArNDE3LDcgQEAgc3RhdGljIGludCBibG9jazJtdGRfc2V0dXAyKGNvbnN0
IGNoYXIgKnZhbCkKPiAgCQlyZXR1cm4gMDsKPiAgCX0KPiAgCj4gLQlpZiAodG9rZW5bMV0pIHsK
PiArCWlmICh0b2tlblsxXSAmJiBzdHJsZW4odG9rZW5bMV0pKSB7CgpUaGlzIGNoYW5nZSBpcyBu
b3QgcmVsYXRlZCB0byB5b3VyIGNvbW1pdCBJIGJlbGlldmUsIHBsZWFzZSBzcGxpdCBpZgpteSBh
c3N1bXB0aW9uIGlzIHJpZ2h0LgoKPiAgCQlyZXQgPSBwYXJzZV9udW0oJmVyYXNlX3NpemUsIHRv
a2VuWzFdKTsKPiAgCQlpZiAocmV0KSB7Cj4gIAkJCXByX2VycigiaWxsZWdhbCBlcmFzZSBzaXpl
XG4iKTsKPiBAQCAtNDIyLDcgKzQyNSwxMiBAQCBzdGF0aWMgaW50IGJsb2NrMm10ZF9zZXR1cDIo
Y29uc3QgY2hhciAqdmFsKQo+ICAJCX0KPiAgCX0KPiAgCj4gLQlhZGRfZGV2aWNlKG5hbWUsIGVy
YXNlX3NpemUsIHRpbWVvdXQpOwo+ICsJaWYgKHRva2VuWzJdKSB7Cj4gKwkJbGFiZWwgPSB0b2tl
blsyXTsKPiArCQlwcl9pbmZvKCJVc2luZyBjdXN0b20gTVREIGxhYmVsICclcycgZm9yIGRldiAl
c1xuIiwgbGFiZWwsIG5hbWUpOwoKTm90IHN1cmUgdGhpcyBxdWFsaWZpZXMgYXMgYW4gaW5mbyBs
b2cgbWVzc2FnZSwgcGVyaGFwcyBhIGRlYnVnIG9uZQp3b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRl
PwoKPiArCX0KPiArCj4gKwlhZGRfZGV2aWNlKG5hbWUsIGVyYXNlX3NpemUsIGxhYmVsLCB0aW1l
b3V0KTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+IEBAIC00NTYsNyArNDY0LDcgQEAgc3RhdGlj
IGludCBibG9jazJtdGRfc2V0dXAoY29uc3QgY2hhciAqdmFsLCBjb25zdCBzdHJ1Y3Qga2VybmVs
X3BhcmFtICprcCkKPiAgCj4gIAo+ICBtb2R1bGVfcGFyYW1fY2FsbChibG9jazJtdGQsIGJsb2Nr
Mm10ZF9zZXR1cCwgTlVMTCwgTlVMTCwgMDIwMCk7Cj4gLU1PRFVMRV9QQVJNX0RFU0MoYmxvY2sy
bXRkLCAiRGV2aWNlIHRvIHVzZS4gXCJibG9jazJtdGQ9PGRldj5bLDxlcmFzZXNpemU+XVwiIik7
Cj4gK01PRFVMRV9QQVJNX0RFU0MoYmxvY2sybXRkLCAiRGV2aWNlIHRvIHVzZS4gXCJibG9jazJt
dGQ9PGRldj5bLFs8ZXJhc2VzaXplPl1bLDxsYWJlbD5dXVwiIik7Cj4gIAo+ICBzdGF0aWMgaW50
IF9faW5pdCBibG9jazJtdGRfaW5pdCh2b2lkKQo+ICB7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
