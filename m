Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2001BE7716E
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 04:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vF14WTokb/joQy0//8upKOzMbhYd4pMQBjYLh9e5Dfo=; b=WQc4QXQGYUZBNE5N4XPbRHiBlO
	/cqlumum+dsMDzvKJxoTYu9k9ZcrRuLKInJbM/5cOkb1JACvvndy4F5GvFOfdOuqtIi1gfvroDSZR
	OU0p8qBvWmGwnKYe6RS72CFR/x7/pu+nP1R2VnSrpNUy27St+Vl5IGOXwwIkmVZio+L2tfcPjKsvs
	VqWwTnhA0A7S68FdzBIFiz+2XGY5FdbCuRlyZXT1hySAEQflIeANe4iCHgvpI+oNDiinD1LZGNNhq
	0fp6ngS8Zb8pUAV0cbF7kxsD1uW6jxBme/hk7Q3TDzMi1n+UDO8mazeaVggI4CzOAshYg8CMdexTW
	y2seKsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJm0s-00000003Hhf-03d7;
	Sat, 07 Dec 2024 04:01:50 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJm0o-00000003HgZ-47b0
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 04:01:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y4vWl4vlTz1kvck;
	Sat,  7 Dec 2024 11:59:15 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id CB9EF14010D;
	Sat,  7 Dec 2024 12:01:35 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Dec 2024 12:01:35 +0800
Subject: Re: [PATCH v3 2/2] ubi: Implement ioctl for detailed erase counters
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241206115127.2304701-1-rickard.andersson@axis.com>
 <20241206115127.2304701-2-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <adeb2ad0-f922-9bb6-db68-deaf7983704b@huawei.com>
Date: Sat, 7 Dec 2024 12:01:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241206115127.2304701-2-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_200147_368463_48E247D5 
X-CRM114-Status: GOOD (  22.90  )
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

5ZyoIDIwMjQvMTIvNiAxOTo1MSwgUmlja2FyZCBBbmRlcnNzb24g5YaZ6YGTOgo+IEN1cnJlbnRs
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
IDcyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxl
IGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKykKCkhpIFJpY2thcmQuIFNvbWUgc21hbGwgbml0cyBi
ZWxvdy4KPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2NkZXYuYyBiL2RyaXZlcnMv
bXRkL3ViaS9jZGV2LmMKPiBpbmRleCAwZDhmMDRjZjAzYzUuLmJjZGM0NzM3NDU3OCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC91YmkvY2Rldi5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2Nk
ZXYuYwo+IEBAIC04MjgsNiArODI4LDcyIEBAIHN0YXRpYyBpbnQgcmVuYW1lX3ZvbHVtZXMoc3Ry
dWN0IHViaV9kZXZpY2UgKnViaSwKPiAgIAlyZXR1cm4gZXJyOwo+ICAgfQo+ICAgCj4gK3N0YXRp
YyBpbnQgdWJpX2dldF9lY19pbmZvKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1Ymlf
ZWNpbmZvX3JlcSBfX3VzZXIgKnVyZXEpCj4gK3sKPiArCXN0cnVjdCB1YmlfZWNpbmZvX3JlcSBy
ZXE7Cj4gKwlzdHJ1Y3QgdWJpX3dsX2VudHJ5ICp3bDsKPiArCWludCBpOwoKV2UgY2FuIHVzZSBh
IG9idmlvdXMgbmFtZSBsaWtlICdyZWFkX2NudCcgb3IgJ3JlYWRfbGVuZ3RoJywgaW5zdGVhZCBv
ZiAnaScuCj4gKwlpbnQgcGViOwo+ICsJaW50IGVuZF9wZWI7Cj4gKwo+ICsJLyogQ29weSB0aGUg
aW5wdXQgYXJndW1lbnRzICovCj4gKwlpZiAoY29weV9mcm9tX3VzZXIoJnJlcSwgdXJlcSwgc2l6
ZW9mKHN0cnVjdCB1YmlfZWNpbmZvX3JlcSkpKQo+ICsJCXJldHVybiAtRUZBVUxUOwo+ICsKPiAr
CS8qIENoZWNrIGlucHV0IGFyZ3VtZW50cyAqLwo+ICsJaWYgKHJlcS5sZW5ndGggPD0gMCB8fCBy
ZXEuc3RhcnQgPCAwKQoKSG93IGFib3V0ICdpZiAocmVxLmxlbmd0aCA8PSAwIHx8IHJlcS5zdGFy
dCA8IDAgfHwgcmVxLnN0YXJ0ID49IAp1YmktPnBlYl9jb3VudCknPyBUaGVuICdpZiAocmVxLnN0
YXJ0ID4gZW5kX3BlYiknIGJlbG93IGNhbiBiZSBkZWxldGVkLgo+ICsJCXJldHVybiAtRUlOVkFM
Owo+ICsKPiArCWlmIChjaGVja19hZGRfb3ZlcmZsb3cocmVxLnN0YXJ0LCByZXEubGVuZ3RoLCAm
ZW5kX3BlYikpCgpIb3cgYWJvdXQgJ2lmICh1bmxpa2VseShjaGVja19hZGRfb3ZlcmZsb3cocmVx
LnN0YXJ0LCByZXEubGVuZ3RoLCAKJmVuZF9wZWIpKSknID8KPiArCQlyZXR1cm4gLUVJTlZBTDsK
PiArCj4gKwlpZiAoZW5kX3BlYiA+IHViaS0+cGViX2NvdW50KQo+ICsJCWVuZF9wZWIgPSB1Ymkt
PnBlYl9jb3VudDsKPiArCj4gKwlpZiAocmVxLnN0YXJ0ID4gZW5kX3BlYikKClRoaXMgY2hlY2sg
Y2FuIGJlIHJlbW92ZWQuCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJLyogQ2hlY2sgYWNj
ZXNzIHJpZ2h0cyBiZWZvcmUgZmlsbGluZyBlcmFzZV9jb3VudGVycyBhcnJheSAqLwo+ICsJaWYg
KCFhY2Nlc3Nfb2sodXJlcS0+ZXJhc2VfY291bnRlcnMsIChlbmRfcGViLXJlcS5zdGFydCkgKiBz
aXplb2YoaW50MzJfdCkpKQo+ICsJCXJldHVybiAtRUZBVUxUOwoKV2UgY2FuIHVzZSAncHV0X3Vz
ZXInIGJlbG93IHRvIHJlcGxhY2UgdGhlIGNoZWNrICdhY2Nlc3Nfb2snLgoKZm9yIChwZWIgPSBy
ZXEuc3RhcnQ7IHBlYiA8IGVuZF9wZWI7IGkrKywgcGViKyspIHsKCWludCBlYyA9IFVCSV9VTktO
T1dOOwoKCWlmICghdWJpX2lvX2lzX2JhZCh1YmksIHBlYikpIHsKCQlzcGluX2xvY2soJnViaS0+
d2xfbG9jayk7CgkJd2wgPSB1YmktPmxvb2t1cHRibFtwZWJdOwoJCWlmICh3bCkKCQkJZWMgPSB3
bC0+ZWM7CgkJZWxzZQoJCQllYyA9IFVCSV9VTktOT1dOOwoJCXNwaW5fdW5sb2NrKCZ1YmktPnds
X2xvY2spOwoJfQoKCWlmICh1bmxpa2VseShwdXRfdXNlcihlYywgdXJlcS0+ZXJhc2VfY291bnRl
cnMraSkpKQoJCXJldHVybiAtRUZBVUxUOwp9Cgo+ICsKPiArCS8qIEZpbGwgZXJhc2UgY291bnRl
ciBhcnJheSAqLwo+ICsJaSA9IDA7Cj4gKwlmb3IgKHBlYiA9IHJlcS5zdGFydDsgcGViIDwgZW5k
X3BlYjsgaSsrLCBwZWIrKykgewo+ICsJCWludCBlYzsKPiArCj4gKwkJaWYgKHViaV9pb19pc19i
YWQodWJpLCBwZWIpKSB7Cj4gKwkJCWlmIChfX3B1dF91c2VyKFVCSV9VTktOT1dOLCB1cmVxLT5l
cmFzZV9jb3VudGVycytpKSkKPiArCQkJCXJldHVybiAtRUZBVUxUOwo+ICsKPiArCQkJY29udGlu
dWU7Cj4gKwkJfQo+ICsKPiArCQlzcGluX2xvY2soJnViaS0+d2xfbG9jayk7Cj4gKwo+ICsJCXds
ID0gdWJpLT5sb29rdXB0YmxbcGViXTsKPiArCQlpZiAod2wpCj4gKwkJCWVjID0gd2wtPmVjOwo+
ICsJCWVsc2UKPiArCQkJZWMgPSBVQklfVU5LTk9XTjsKPiArCj4gKwkJc3Bpbl91bmxvY2soJnVi
aS0+d2xfbG9jayk7Cj4gKwo+ICsJCWlmIChfX3B1dF91c2VyKGVjLCB1cmVxLT5lcmFzZV9jb3Vu
dGVycytpKSkKPiArCQkJcmV0dXJuIC1FRkFVTFQ7Cj4gKwo+ICsJfQoKCj4gKwo+ICsJLyogUmV0
dXJuIGFjdHVhbCByZWFkIGxlbmd0aCAqLwo+ICsJcmVxLnJlYWRfbGVuZ3RoID0gaTsKPiArCj4g
KwkvKiBDb3B5IGV2ZXJ5dGhpbmcgZXhjZXB0IGVyYXNlIGNvdW50ZXIgYXJyYXkgKi8KPiArCWlm
IChjb3B5X3RvX3VzZXIodXJlcSwgJnJlcSwgc2l6ZW9mKHN0cnVjdCB1YmlfZWNpbmZvX3JlcSkp
KQo+ICsJCXJldHVybiAtRUZBVUxUOwoKaWYgKHVubGlrZWx5KC4uLgo+ICsKPiArCXJldHVybiAw
Owo+ICt9Cj4gKwo+ICAgc3RhdGljIGxvbmcgdWJpX2NkZXZfaW9jdGwoc3RydWN0IGZpbGUgKmZp
bGUsIHVuc2lnbmVkIGludCBjbWQsCj4gICAJCQkgICB1bnNpZ25lZCBsb25nIGFyZykKPiAgIHsK
PiBAQCAtOTkxLDYgKzEwNTcsMTIgQEAgc3RhdGljIGxvbmcgdWJpX2NkZXZfaW9jdGwoc3RydWN0
IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCj4gICAJCWJyZWFrOwo+ICAgCX0KPiAgIAo+
ICsJY2FzZSBVQklfSU9DRUNORk86Cj4gKwl7Cj4gKwkJZXJyID0gdWJpX2dldF9lY19pbmZvKHVi
aSwgYXJncCk7Cj4gKwkJYnJlYWs7Cj4gKwl9Cj4gKwo+ICAgCWRlZmF1bHQ6Cj4gICAJCWVyciA9
IC1FTk9UVFk7Cj4gICAJCWJyZWFrOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
