Return-Path: <SRS0=rWZ+=XP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BD1C49ED7
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 14:14:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8871220644
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 14:14:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NGQqH//h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8871220644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9KSbz+drbQzzPvVp36HGZRoe/qeD/fqaRJfN9KRwy0=; b=NGQqH//hZzxGjG
	MLfufxea1njE/zTmy4HHX0RJncmeUm4hEEUdamHa2nINAXpz54sEW3eeHbSqg4lJnE3AQ6R9vLQUl
	J7avJbx2+mgnNTir2i6kTDd/2KFlDma1iD5DRSb/dTffBJay9xwFFInIBVF9gQjSKZ6g06t7MVTld
	VwDpo03eo1zCRWBTCu//XWmlp7I4rcRbsTL9bo0l/mrqEIIbqZ+8n0TQ2OW7MP5Ny9TXwlx+5NzDC
	4YxBoV2DxXi+9QzLBctgXr2+MXac9UJQNIDEgTsj2DifuzeSpWxmtgsSRoYJrZm3HLdkGb3AtsiEb
	5/dMhB9KGtf/xN5eFBfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBJfo-0007ag-9u; Fri, 20 Sep 2019 14:14:12 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBJfl-0007ZC-6B
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2019 14:14:11 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 325F7AD5DC0900924C3E;
 Fri, 20 Sep 2019 22:14:01 +0800 (CST)
Received: from [127.0.0.1] (10.57.88.168) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Sep 2019
 22:13:53 +0800
Subject: Re: [PATCH] jffs2:freely allocate memory when parameters are invalid
To: Al Viro <viro@zeniv.linux.org.uk>
References: <1568962478-126260-1-git-send-email-nixiaoming@huawei.com>
 <20190920114336.GM1131@ZenIV.linux.org.uk>
 <206f8d57-dad9-26c3-6bf6-1d000f5698d4@huawei.com>
 <20190920124532.GN1131@ZenIV.linux.org.uk>
 <20190920125442.GA20754@ZenIV.linux.org.uk>
From: Xiaoming Ni <nixiaoming@huawei.com>
Message-ID: <eb679ad2-4020-951c-e4d1-60cb059a5ca8@huawei.com>
Date: Fri, 20 Sep 2019 22:13:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920125442.GA20754@ZenIV.linux.org.uk>
X-Originating-IP: [10.57.88.168]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_071409_398207_7B05647E 
X-CRM114-Status: GOOD (  14.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, dilinger@queued.net,
 linux-kernel@vger.kernel.org, daniel.santos@pobox.com,
 linux-mtd@lists.infradead.org, houtao1@huawei.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAxOS85LzIwIDIwOjU0LCBBbCBWaXJvIHdyb3RlOgo+IE9uIEZyaSwgU2VwIDIwLCAyMDE5
IGF0IDAxOjQ1OjMzUE0gKzAxMDAsIEFsIFZpcm8gd3JvdGU6Cj4+IE9uIEZyaSwgU2VwIDIwLCAy
MDE5IGF0IDA4OjIxOjUzUE0gKzA4MDAsIFhpYW9taW5nIE5pIHdyb3RlOgo+Pj4KPj4+Cj4+PiBP
biAyMDE5LzkvMjAgMTk6NDMsIEFsIFZpcm8gd3JvdGU6Cj4+Pj4gT24gRnJpLCBTZXAgMjAsIDIw
MTkgYXQgMDI6NTQ6MzhQTSArMDgwMCwgWGlhb21pbmcgTmkgd3JvdGU6Cj4+Pj4+IFVzZSBremFs
bG9jKCkgdG8gYWxsb2NhdGUgbWVtb3J5IGluIGpmZnMyX2ZpbGxfc3VwZXIoKS4KPj4+Pj4gRnJl
ZWluZyBtZW1vcnkgd2hlbiBqZmZzMl9wYXJzZV9vcHRpb25zKCkgZmFpbHMgd2lsbCBjYXVzZQo+
Pj4+PiB1c2UtYWZ0ZXItZnJlZSBhbmQgZG91YmxlLWZyZWUgaW4gamZmczJfa2lsbF9zYigpCj4+
Pj4KPj4+PiAuLi4gc28gd2UgYXJlIG5vdCBmcmVlaW5nIGl0IHRoZXJlLiAgV2hhdCdzIHRoZSBw
cm9ibGVtPwo+Pj4KPj4+IE5vIGNvZGUgbG9naWMgaXNzdWVzLCBubyBtZW1vcnkgbGVha3MKPj4+
Cj4+PiBCdXQgdGhlcmUgaXMgdG9vIG11Y2ggY29kZSBsb2dpYyBiZXR3ZWVuIG1lbW9yeSBhbGxv
Y2F0aW9uIGFuZCBmcmVlLAo+Pj4gd2hpY2ggaXMgZGlmZmljdWx0IHRvIHVuZGVyc3RhbmQuCj4+
Cj4+IEVyPyAgQW4gaW5zdGFuY2Ugb2YgamZmczIgc3VwZXJibG9jayBtaWdodCBoYXZlIGEgcmVs
YXRlZCBvYmplY3QKPj4gYXR0YWNoZWQgdG8gaXQ7IGl0IGlzIGNyZWF0ZWQgaW4gamZmczIgc3Vw
ZXJibG9jayBjb25zdHJ1Y3RvciBhbmQKPj4gZnJlZWQgaW4gZGVzdHJ1Y3Rvci4KPj4KPj4+IFRo
ZSBtb2RpZmllZCBjb2RlIGlzIGVhc2llciB0byB1bmRlcnN0YW5kLgo+Pgo+PiBZb3UgYXJlIG1h
a2luZyB0aGUgY2xlYW51cCBsb2dpY3MgaGFyZGVyIHRvIGZvbGxvdy4KPiAKPiBQUzogdGhlIHdo
b2xlIHBvaW50IG9mIC0+a2lsbF9zYigpIGlzIHRoYXQgaXQncyBhbHdheXMgY2FsbGVkIG9uCj4g
c3VwZXJibG9jayBkZXN0cnVjdGlvbiwgd2hldGhlciB0aGF0IGluc3RhbmNlIGhhZCBiZWVuIGZ1
bGx5IHNldAo+IHVwIG9mIGZhaWxlZCBoYWxmd2F5IHRocm91Z2guCj4gCj4gSW4gcGFydGljdWxh
ciwgYW55dGhpbmcgbGlrZSBmb29mc19maWxsX3N1cGVyKCkgKndpbGwqIGJlIGZvbGxvd2VkCj4g
YnkgLT5raWxsX3NiKCkuICBBbHdheXMuICBXaGljaCBhbGxvd3MgZm9yIHNpbXBsZXIgbG9naWNz
IGluCj4gZmFpbHVyZSBleGl0cy4gIEFuZCB0aGUgbWFpbiB0aGluZyBhYm91dCB0aG9zZSBpcyB0
aGF0IHRoZXkgYXJlCj4gYWx3YXlzIHRoZSBiaXRyb3QgaG90IHNwb3RzIC0gdGhleSBhcmUgc3lz
dGVtYXRpY2FsbHkgdW5kZXJ0ZXN0ZWQsCj4gc28gdGhhdCdzIHRoZSBsYXN0IHBsYWNlIHdoZXJl
IHlvdSB3YW50IHNvbWV0aGluZyBub24tdHJpdmlhbC4KPiAKPiBBcyBmb3IgInRvbyBtdWNoIGNv
ZGUgYmV0d2VlbiIuLi4gIEh1aD8gIFdlIGZhaWwgamZmczJfZmlsbF9zdXBlcigpCj4gaW1tZWRp
YXRlbHksIHdoaWNoIGhhcyBnZXRfdHJlZV9tdGQoKSAob3IgbW91bnRfbXRkKCkgaW4gc2xpZ2h0
bHkKPiBlYXJsaWVyIGtlcm5lbHMpIGRlc3Ryb3kgdGhlIHN1cGVyYmxvY2sgdGhlcmUgYW5kIHRo
ZW4uLi4KPiAKCkN1cnJlbnRseSByZWxlYXNpbmcgamZmczJfc2JfaW5mbyBpbiBqZmZzMl9raWxs
X3NiKCksClRoZW4gdGhlIGN1cnJlbnQgY29kZSBwYXRoIGlzCjEuIGRyaXZlcnMvbXRkL210ZHN1
cGVyLmMKbW91bnRfbXRkX2F1eCgpIHsKLi4uLgrCoMKgwqAvKiBqZmZzMl9zYl9pbmZvIGlzIGFs
bG9jYXRlZCBpbiBqZmZzMl9maWxsX3N1cGVyLCAqLwrCoMKgwqAgcmV0ID0gZmlsbF9zdXBlcihz
YiwgZGF0YSwgZmxhZ3MgJiBTQl9TSUxFTlQgPyAxIDogMCk7CsKgwqDCoCBpZiAocmV0IDwgMCkg
ewrCoMKgwqDCoMKgwqDCoCBkZWFjdGl2YXRlX2xvY2tlZF9zdXBlcihzYik7IC8qIElmIHRoZSBw
YXJhbWV0ZXIgaXMgd3JvbmcsIHJlbGVhc2UgaXQgaGVyZSovCsKgwqDCoMKgwqDCoMKgIHJldHVy
biBFUlJfUFRSKHJldCk7CsKgwqDCoMKgfQouLi4KfQoKMi4gZnMvc3VwZXIuYwpkZWFjdGl2YXRl
X2xvY2tlZF9zdXBlcigpCi0tLT4gZnMtPmtpbGxfc2Iocyk7CgozLiBmcy9qZmZzMi9zdXBlci5j
CsKgamZmczJfa2lsbF9zYigpCsKgwqDCoCBrZnJlZShjKTsgLypyZWxlYXNlIGpmZnMyX3NiX2lu
Zm8gYWxsb2NhdGVkIGJ5IGpmZnMyX2ZpbGxfc3VwZXIgaGVyZQoKSGVyZSBtZW1vcnkgYWxsb2Nh
dGlvbiBhbmQgcmVsZWFzZSwKZXhwZXJpZW5jZWQgdGhlIGZ1bmN0aW9uIG9mIG1vdW50X210ZF9h
dXgvZGVhY3RpdmF0ZV9sb2NrZWRfc3VwZXIvamZmczJfa2lsbF9zYiB0aHJlZSBkaWZmZXJlbnQg
ZmlsZXMsCnRoZSBwYXRoIGlzIHJlbGF0aXZlbHkgbG9uZywKaWYgYW55IG9mIHRoZSB0aHJlZSBm
dW5jdGlvbnMgYmV0d2VlbiB0aGUgZXJyb3JzLAppdCB3aWxsIGNhdXNlIHByb2JsZW1zIChzdWNo
IGFzIG1lbW9yeSBsZWFrcykKCkFuYWx5emUgdGhlIGNvZGUgb2YgamZmczJfa2lsbF9zYjoKc3Rh
dGljIHZvaWQgamZmczJfa2lsbF9zYihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQp7CsKgwqDCoCBz
dHJ1Y3QgamZmczJfc2JfaW5mbyAqYyA9IEpGRlMyX1NCX0lORk8oc2IpOwrCoMKgwqAgaWYgKGMg
JiYgIXNiX3Jkb25seShzYikpCgkJLyogSWYgc2IgaXMgbm90IHJlYWQgb25seSwKCQkgKiB0aGVu
IGpmZnMyX3N0b3BfZ2FyYmFnZV9jb2xsZWN0X3RocmVhZCgpIHdpbGwgYmUgZXhlY3V0ZWQKCQkg
KiB3aGVuIHRoZSBqZmZzMl9maWxsX3N1cGVyIHBhcmFtZXRlciBpcyBpbnZhbGlkLgoJCSAqLwrC
oMKgwqDCoMKgwqDCoCBqZmZzMl9zdG9wX2dhcmJhZ2VfY29sbGVjdF90aHJlYWQoYyk7CsKgwqDC
oCBraWxsX210ZF9zdXBlcihzYik7CsKgwqDCoCBrZnJlZShjKTsKfQoKdm9pZCBqZmZzMl9zdG9w
X2dhcmJhZ2VfY29sbGVjdF90aHJlYWQoc3RydWN0IGpmZnMyX3NiX2luZm8gKmMpCnsKwqDCoMKg
IGludCB3YWl0ID0gMDsKCS8qIFdoZW4gdGhlIGpmZnMyX2ZpbGxfc3VwZXIgcGFyYW1ldGVyIGlz
IGludmFsaWQsCgkgKiB0aGlzIGxvY2sgaXMgbm90IGluaXRpYWxpemVkLgoJICogSXMgdGhpcyBh
IGNvZGUgcHJvYmxlbSA/CgkgKi8KwqDCoMKgIHNwaW5fbG9jaygmYy0+ZXJhc2VfY29tcGxldGlv
bl9sb2NrKTsKLi4uLi4KCkkgc3RpbGwgdGhpbmsgdGhpcyBpcyBlYXNpZXIgdG8gdW5kZXJzdGFu
ZDoKIEZyZWUgdGhlIG1lbW9yeSBhbGxvY2F0ZWQgYnkgdGhlIGN1cnJlbnQgZnVuY3Rpb24gaW4g
dGhlIGZhaWxlZCBicmFuY2gKCnRoYW5rcwpYaWFvbWluZyBOaQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
