Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D22CE7717D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 13:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFRCUeQ5sqp88MjGsO0VR0gKN1SoXy4dfrDxo+NuwNo=; b=xIm+5tadG0YTjuNCSPusMk7Zhq
	iEIaENbwsOXW/XBDMo1cDfeM8kClt7yv5gnqY5RbDKmmtxB3toD3KVaa85pHPpOl8AgmLlss/VXb4
	qFBNBlIZ+tE7avv5gWUDI2C+1jhHGBgvY4VwiOWGToATOlurdeVQar8aPKkrv2lHc+0ElbCyfN+Qm
	J04g1L3EOy55ZOOgNINTBXBkaZc3ft0GYV0FAhVcA6nIBcaH0bHv/VK1opaEXw/+ZKv9ouVPUYOIu
	GiKMNxRbf8AhzaZppYRrE/4bfXjPAgE/gY0Q0QE+igi3ihgJSJIBl9uVT1yl3RlYls4WwlufFwE/W
	l5gIzMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeIF-000000087Gb-156r;
	Mon, 09 Dec 2024 13:59:23 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeE6-000000086Ic-3xR0
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 13:55:08 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y6NcD1fb5z21msb;
	Mon,  9 Dec 2024 21:53:16 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 15B3B1A016C;
	Mon,  9 Dec 2024 21:54:59 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Dec 2024 21:54:58 +0800
Subject: Re: [PATCH v4 2/2] ubi: Implement ioctl for detailed erase counters
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241209114843.2484141-1-rickard.andersson@axis.com>
 <20241209114843.2484141-2-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <d8a04b33-3369-3b4e-26c8-012a41080341@huawei.com>
Date: Mon, 9 Dec 2024 21:54:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241209114843.2484141-2-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_055507_287408_5980D5CA 
X-CRM114-Status: GOOD (  21.54  )
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

5ZyoIDIwMjQvMTIvOSAxOTo0OCwgUmlja2FyZCBBbmRlcnNzb24g5YaZ6YGTOgo+IEN1cnJlbnRs
eSwgIm1heF9lYyIgY2FuIGJlIHJlYWQgZnJvbSBzeXNmcywgd2hpY2ggcHJvdmlkZXMgYSBsaW1p
dGVkCj4gdmlldyBvZiB0aGUgZmxhc2ggZGV2aWNl4oCZcyB3ZWFyLiBJbiBjZXJ0YWluIGNhc2Vz
LCBzdWNoIGFzIGJ1Z3MgaW4KPiB0aGUgd2Vhci1sZXZlbGluZyBhbGdvcml0aG0sIHNwZWNpZmlj
IGJsb2NrcyBjYW4gYmUgd29ybiBkb3duIG1vcmUKPiB0aGFuIG90aGVycywgcmVzdWx0aW5nIGlu
IHVuZXZlbiB3ZWFyIGRpc3RyaWJ1dGlvbi4gQWxzbyBzb21lIHVzZSBjYXNlcwo+IGNhbiB3ZWFy
IHRoZSBlcmFzZSBibG9ja3Mgb2YgdGhlIGZhc3RtYXAgYXJlYSBtb3JlIGhlYXZpbHkgdGhhbiBv
dGhlcgo+IHBhcnRzIG9mIGZsYXNoLgo+IFByb3ZpZGluZyBkZXRhaWxlZCBlcmFzZSBjb3VudGVy
IHZhbHVlcyBnaXZlIGEgYmV0dGVyIHVuZGVyc3RhbmRpbmcgb2YKPiB0aGUgb3ZlcmFsbCBmbGFz
aCB3ZWFyIGFuZCBpcyBuZWVkZWQgdG8gYmUgYWJsZSB0byBjYWxjdWxhdGUgZm9yIGV4YW1wbGUK
PiBleHBlY3RlZCBsaWZlIHRpbWUuCj4gVGhlcmUgZXhpc3RzIG1vcmUgZGV0YWlsZWQgaW5mbyBp
biBkZWJ1Z2ZzLCBidXQgdGhpcyBpbmZvcm1hdGlvbiBpcwo+IG9ubHkgYXZhaWxhYmxlIGZvciBk
ZWJ1ZyBidWlsZHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2th
cmQuYW5kZXJzc29uQGF4aXMuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2NkZXYuYyB8
IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxl
IGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKykKPiAKCkl0IHdvcmtzLCBmZWVsIGZyZWUgdG8gYWRk
ClRlc3RlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KUmV2aWV3
ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC91YmkvY2Rldi5jIGIvZHJpdmVycy9tdGQvdWJpL2NkZXYuYwo+IGlu
ZGV4IDBkOGYwNGNmMDNjNS4uZTJmMjU4MWU5ZjA5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L3ViaS9jZGV2LmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvY2Rldi5jCj4gQEAgLTgyOCw2ICs4
MjgsNjkgQEAgc3RhdGljIGludCByZW5hbWVfdm9sdW1lcyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJp
LAo+ICAgCXJldHVybiBlcnI7Cj4gICB9Cj4gICAKPiArc3RhdGljIGludCB1YmlfZ2V0X2VjX2lu
Zm8oc3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV9lY2luZm9fcmVxIF9fdXNlciAq
dXJlcSkKPiArewo+ICsJc3RydWN0IHViaV9lY2luZm9fcmVxIHJlcTsKPiArCXN0cnVjdCB1Ymlf
d2xfZW50cnkgKndsOwo+ICsJaW50IHJlYWRfY250Owo+ICsJaW50IHBlYjsKPiArCWludCBlbmRf
cGViOwo+ICsKPiArCS8qIENvcHkgdGhlIGlucHV0IGFyZ3VtZW50cyAqLwo+ICsJaWYgKGNvcHlf
ZnJvbV91c2VyKCZyZXEsIHVyZXEsIHNpemVvZihzdHJ1Y3QgdWJpX2VjaW5mb19yZXEpKSkKPiAr
CQlyZXR1cm4gLUVGQVVMVDsKPiArCj4gKwkvKiBDaGVjayBpbnB1dCBhcmd1bWVudHMgKi8KPiAr
CWlmIChyZXEubGVuZ3RoIDw9IDAgfHwgcmVxLnN0YXJ0IDwgMCB8fCByZXEuc3RhcnQgPj0gdWJp
LT5wZWJfY291bnQpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJaWYgKGNoZWNrX2FkZF9v
dmVyZmxvdyhyZXEuc3RhcnQsIHJlcS5sZW5ndGgsICZlbmRfcGViKSkKPiArCQlyZXR1cm4gLUVJ
TlZBTDsKPiArCj4gKwlpZiAoZW5kX3BlYiA+IHViaS0+cGViX2NvdW50KQo+ICsJCWVuZF9wZWIg
PSB1YmktPnBlYl9jb3VudDsKPiArCj4gKwkvKiBDaGVjayBhY2Nlc3MgcmlnaHRzIGJlZm9yZSBm
aWxsaW5nIGVyYXNlX2NvdW50ZXJzIGFycmF5ICovCj4gKwlpZiAoIWFjY2Vzc19vayh1cmVxLT5l
cmFzZV9jb3VudGVycywgKGVuZF9wZWItcmVxLnN0YXJ0KSAqIHNpemVvZihpbnQzMl90KSkpCj4g
KwkJcmV0dXJuIC1FRkFVTFQ7Cj4gKwo+ICsJLyogRmlsbCBlcmFzZSBjb3VudGVyIGFycmF5ICov
Cj4gKwlyZWFkX2NudCA9IDA7Cj4gKwlmb3IgKHBlYiA9IHJlcS5zdGFydDsgcGViIDwgZW5kX3Bl
YjsgcmVhZF9jbnQrKywgcGViKyspIHsKPiArCQlpbnQgZWM7Cj4gKwo+ICsJCWlmICh1YmlfaW9f
aXNfYmFkKHViaSwgcGViKSkgewo+ICsJCQlpZiAoX19wdXRfdXNlcihVQklfVU5LTk9XTiwgdXJl
cS0+ZXJhc2VfY291bnRlcnMrcmVhZF9jbnQpKQo+ICsJCQkJcmV0dXJuIC1FRkFVTFQ7Cj4gKwo+
ICsJCQljb250aW51ZTsKPiArCQl9Cj4gKwo+ICsJCXNwaW5fbG9jaygmdWJpLT53bF9sb2NrKTsK
PiArCj4gKwkJd2wgPSB1YmktPmxvb2t1cHRibFtwZWJdOwo+ICsJCWlmICh3bCkKPiArCQkJZWMg
PSB3bC0+ZWM7Cj4gKwkJZWxzZQo+ICsJCQllYyA9IFVCSV9VTktOT1dOOwo+ICsKPiArCQlzcGlu
X3VubG9jaygmdWJpLT53bF9sb2NrKTsKPiArCj4gKwkJaWYgKF9fcHV0X3VzZXIoZWMsIHVyZXEt
PmVyYXNlX2NvdW50ZXJzK3JlYWRfY250KSkKPiArCQkJcmV0dXJuIC1FRkFVTFQ7Cj4gKwo+ICsJ
fQo+ICsKPiArCS8qIFJldHVybiBhY3R1YWwgcmVhZCBsZW5ndGggKi8KPiArCXJlcS5yZWFkX2xl
bmd0aCA9IHJlYWRfY250Owo+ICsKPiArCS8qIENvcHkgZXZlcnl0aGluZyBleGNlcHQgZXJhc2Ug
Y291bnRlciBhcnJheSAqLwo+ICsJaWYgKGNvcHlfdG9fdXNlcih1cmVxLCAmcmVxLCBzaXplb2Yo
c3RydWN0IHViaV9lY2luZm9fcmVxKSkpCj4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4gKwo+ICsJcmV0
dXJuIDA7Cj4gK30KPiArCj4gICBzdGF0aWMgbG9uZyB1YmlfY2Rldl9pb2N0bChzdHJ1Y3QgZmls
ZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZCwKPiAgIAkJCSAgIHVuc2lnbmVkIGxvbmcgYXJnKQo+
ICAgewo+IEBAIC05OTEsNiArMTA1NCwxMiBAQCBzdGF0aWMgbG9uZyB1YmlfY2Rldl9pb2N0bChz
dHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZCwKPiAgIAkJYnJlYWs7Cj4gICAJfQo+
ICAgCj4gKwljYXNlIFVCSV9JT0NFQ05GTzoKPiArCXsKPiArCQllcnIgPSB1YmlfZ2V0X2VjX2lu
Zm8odWJpLCBhcmdwKTsKPiArCQlicmVhazsKPiArCX0KPiArCj4gICAJZGVmYXVsdDoKPiAgIAkJ
ZXJyID0gLUVOT1RUWTsKPiAgIAkJYnJlYWs7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
