Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5210CC36018
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Apr 2025 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NyrRiF3A0JobbXn5fSkI6PmFX16ys+Gf9OeLt33K40=; b=De4rsnL6ojjowsUf452ubl03iD
	bPbLX/3xiDM8j22KohDHldeNgE5RnvG+YlDXgtc2GJ27+ZPs3CcQE3eC6F7/44QU8Fcf/yA5VNWz0
	GOOrX7IOAtBX1XbBaKpUgXEufWCdDkCkWc1d8BvQ57AHXu3Gwy40w9cIzSemQ0QfLNYWAIfc1OvR3
	a0VfIDe6soAeNr/1xoN/eneKFl/CHeGLMPXQBLwi1slOCe9I1F0HlN9UvqYPwVG7fEC7SpOMYuBac
	d5mXor9s6SCcVZ3GlfjPaXXq8iIrAttBJB0DEw3qr36qGxMx6nmGh2Yu0zUJMtqCyIr4KVtHCm0aM
	woPYMGIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYco-00000002azk-2hrx;
	Tue, 01 Apr 2025 10:13:42 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYGW-00000002Ws3-02Kd
	for linux-mtd@lists.infradead.org;
	Tue, 01 Apr 2025 09:50:42 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZRjpB0k5cz2CdGV;
	Tue,  1 Apr 2025 17:47:14 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B77B01400F4;
	Tue,  1 Apr 2025 17:50:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Apr 2025 17:50:33 +0800
Subject: Re: [bug report] UBI: Unsorted Block Images
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "Artem B. Bityutskiy" <dedekind@linutronix.de>,
	<linux-mtd@lists.infradead.org>
References: <b2e341b8-519a-4136-9717-9aa00c90efb1@stanley.mountain>
 <4518b0db-deab-15d5-7824-74db77d3682b@huawei.com>
 <2d283e0e-9d53-4160-a098-33907de08ef6@stanley.mountain>
 <c121ca20-4d65-2b7e-a434-71b1ecd4ffea@huawei.com>
 <d13c5c32-b094-45c8-a5bb-fa32d0222d16@stanley.mountain>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <367ac10c-8b80-98ed-4c8d-59192f037c2e@huawei.com>
Date: Tue, 1 Apr 2025 17:50:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d13c5c32-b094-45c8-a5bb-fa32d0222d16@stanley.mountain>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_025040_376317_BE1ABDE0 
X-CRM114-Status: GOOD (  14.38  )
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

5ZyoIDIwMjUvNC8xIDE2OjExLCBEYW4gQ2FycGVudGVyIOWGmemBkzoKPiBPbiBUdWUsIEFwciAw
MSwgMjAyNSBhdCAwMjo0NjozNVBNICswODAwLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4+IOWcqCAy
MDI1LzMvMzEgMjM6MTQsIERhbiBDYXJwZW50ZXIg5YaZ6YGTOgo+Pj4gT24gTW9uLCBNYXIgMzEs
IDIwMjUgYXQgMDg6NDM6NTVQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+Pj4+IOWcqCAy
MDI1LzMvMzEgMTc6NDYsIERhbiBDYXJwZW50ZXIg5YaZ6YGTOgo+Pj4+IEhpIERhbiwKPj4+Pj4g
SGVsbG8gQXJ0ZW0gQi4gQml0eXV0c2tpeSwKPj4+Pj4KPj4+Pj4gQ29tbWl0IDgwMWMxMzVjZTcz
ZCAoIlVCSTogVW5zb3J0ZWQgQmxvY2sgSW1hZ2VzIikgZnJvbSBKdW4gMjcsIDIwMDYKPj4+Pj4g
KGxpbnV4LW5leHQpLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMgY2hlY2tl
ciB3YXJuaW5nOgo+Pj4+Pgo+Pj4+PiAJZHJpdmVycy9tdGQvdWJpL3Z0YmwuYzo4NDQgdWJpX3Jl
YWRfdm9sdW1lX3RhYmxlKCkKPj4+Pj4gCXdhcm46ICd1YmktPnZ0YmwnIGNhbiBhbHNvIGJlIE5V
TEwKPj4+Pj4KPj4+PiBbLi4uXQo+Pj4+PiAgICAgICA0MzEgICAgICAgICAgaWYgKCFsZWJfY29y
cnVwdGVkWzBdKSB7Cj4+Pj4+ICAgICAgIDQzMiAgICAgICAgICAgICAgICAgIC8qIExFQiAwIGlz
IE9LICovCj4+Pj4+ICAgICAgIDQzMyAgICAgICAgICAgICAgICAgIGlmIChsZWJbMV0pCj4+Pj4+
ICAgICAgIDQzNCAgICAgICAgICAgICAgICAgICAgICAgICAgbGViX2NvcnJ1cHRlZFsxXSA9IG1l
bWNtcChsZWJbMF0sIGxlYlsxXSwKPj4+Pj4gICAgICAgNDM1ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHViaS0+dnRibF9zaXplKTsKPj4+Pj4gICAg
ICAgNDM2ICAgICAgICAgICAgICAgICAgaWYgKGxlYl9jb3JydXB0ZWRbMV0pIHsKPj4+Pj4gICAg
ICAgNDM3ICAgICAgICAgICAgICAgICAgICAgICAgICB1Ymlfd2Fybih1YmksICJ2b2x1bWUgdGFi
bGUgY29weSAjMiBpcyBjb3JydXB0ZWQiKTsKPj4+Pj4gICAgICAgNDM4ICAgICAgICAgICAgICAg
ICAgICAgICAgICBlcnIgPSBjcmVhdGVfdnRibCh1YmksIGFpLCAxLCBsZWJbMF0pOwo+Pj4+PiAg
ICAgICA0MzkgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChlcnIpCj4+Pj4+ICAgICAgIDQ0
MCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9mcmVlOwo+Pj4+PiAg
ICAgICA0NDEgICAgICAgICAgICAgICAgICAgICAgICAgIHViaV9tc2codWJpLCAidm9sdW1lIHRh
YmxlIHdhcyByZXN0b3JlZCIpOwo+Pj4+PiAgICAgICA0NDIgICAgICAgICAgICAgICAgICB9Cj4+
Pj4+ICAgICAgIDQ0Mwo+Pj4+PiAgICAgICA0NDQgICAgICAgICAgICAgICAgICAvKiBCb3RoIExF
QiAxIGFuZCBMRUIgMiBhcmUgT0sgYW5kIGNvbnNpc3RlbnQgKi8KPj4+Pj4gICAgICAgNDQ1ICAg
ICAgICAgICAgICAgICAgdmZyZWUobGViWzFdKTsKPj4+Pj4gICAgICAgNDQ2ICAgICAgICAgICAg
ICAgICAgcmV0dXJuIGxlYlswXTsKPj4+Pj4gICAgICAgNDQ3ICAgICAgICAgIH0gZWxzZSB7Cj4+
Pj4+ICAgICAgIDQ0OCAgICAgICAgICAgICAgICAgIC8qIExFQiAwIGlzIGNvcnJ1cHRlZCBvciBk
b2VzIG5vdCBleGlzdCAqLwo+Pj4+PiAgICAgICA0NDkgICAgICAgICAgICAgICAgICBpZiAobGVi
WzFdKSB7Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl4KPj4+Pj4g
SXMgdGhpcyBOVUxMIGNoZWNrIHJlcXVpcmVkPwo+Pj4+Cj4+Pj4gWWVzLCBsZWIgMSBjb3VsZCBi
ZSBjb3JydXB0ZWQoZWcuIGJhZCBlYyBoZWFkZXIpLCB0aGVuIHRoZSBsZWIgMSB3b24ndCBiZQo+
Pj4+IHNjYW5uZWQgZHVyaW5nIGF0dGFjaGluZywgd2hpY2ggbWVhbnMgJ2xlYlsxXScgd29uJ3Qg
YmUgaW5pdGlhbGl6ZWQgYnkKPj4+PiBwcm9jZXNzX2x2b2woKS4KPj4+Pj4KPj4+Pj4gICAgICAg
NDUwICAgICAgICAgICAgICAgICAgICAgICAgICBsZWJfY29ycnVwdGVkWzFdID0gdnRibF9jaGVj
ayh1YmksIGxlYlsxXSk7Cj4+Pj4+ICAgICAgIDQ1MSAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKGxlYl9jb3JydXB0ZWRbMV0gPCAwKQo+Pj4+PiAgICAgICA0NTIgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBvdXRfZnJlZTsKPj4+Pj4gICAgICAgNDUzICAgICAgICAg
ICAgICAgICAgfQo+Pj4+PiAgICAgICA0NTQgICAgICAgICAgICAgICAgICBpZiAobGViX2NvcnJ1
cHRlZFsxXSkgewo+Pj4+PiAgICAgICA0NTUgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEJv
dGggTEVCIDAgYW5kIExFQiAxIGFyZSBjb3JydXB0ZWQgKi8KPj4+Pj4gICAgICAgNDU2ICAgICAg
ICAgICAgICAgICAgICAgICAgICB1YmlfZXJyKHViaSwgImJvdGggdm9sdW1lIHRhYmxlcyBhcmUg
Y29ycnVwdGVkIik7Cj4+Pj4+ICAgICAgIDQ1NyAgICAgICAgICAgICAgICAgICAgICAgICAgZ290
byBvdXRfZnJlZTsKPj4+Pj4gICAgICAgNDU4ICAgICAgICAgICAgICAgICAgfQo+Pj4+PiAgICAg
ICA0NTkKPj4+Pj4gICAgICAgNDYwICAgICAgICAgICAgICAgICAgdWJpX3dhcm4odWJpLCAidm9s
dW1lIHRhYmxlIGNvcHkgIzEgaXMgY29ycnVwdGVkIik7Cj4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eCj4+Pj4+IFRoaXMg
c2hvdWxkIHNheSAjMCBJIHRoaW5rPwo+Pj4+Cj4+Pj4gSSBndWVzcyB0aGF0ICcjMScgcmVmZXJz
IHRvIGxlYiAwIGFuZCAnIzInIHJlZmVycyB0byBsZWIgMS4KPj4+Pj4KPj4+Pj4gICAgICAgNDYx
ICAgICAgICAgICAgICAgICAgZXJyID0gY3JlYXRlX3Z0YmwodWJpLCBhaSwgMCwgbGViWzFdKTsK
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXl5eXl5eCj4+Pj4+ICAgICAgIDQ2MiAgICAgICAgICAgICAgICAgIGlmIChlcnIpCj4+
Pj4+ICAgICAgIDQ2MyAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXRfZnJlZTsKPj4+
Pj4gICAgICAgNDY0ICAgICAgICAgICAgICAgICAgdWJpX21zZyh1YmksICJ2b2x1bWUgdGFibGUg
d2FzIHJlc3RvcmVkIik7Cj4+Pj4+ICAgICAgIDQ2NQo+Pj4+PiAgICAgICA0NjYgICAgICAgICAg
ICAgICAgICB2ZnJlZShsZWJbMF0pOwo+Pj4+PiAgICAgICA0NjcgICAgICAgICAgICAgICAgICBy
ZXR1cm4gbGViWzFdOwo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5e
Xl5eCj4+Pj4+IFRoZSBOVUxMIGNoZWNrIG9uIGxpbmUgNDQ5IG1ha2VzIFNtYXRjaCB0aGluayB0
aGlzIGNhbiBiZSBOVUxMLgo+Pj4+Cj4+Pj4gSW4gdGhlb3J5LCB0aGUgJ05VTEwnIHdvbid0IGJl
IGEgcmV0dXJuIHZhbHVlLCB0aGVzZSBjYXNlcyBhcmUgYXZvaWRlZCBieQo+Pj4+IGxlYl9jb3Jy
dXB0ZWQgY2hlY2tpbmcgYnJhbmNoZXMuCj4+Pgo+Pj4gTm8sIHRoYXQgZG9lc24ndCBmb2xsb3cu
ICBJZiBsZWJbMV0gaXMgTlVMTCB0aGVuIHdlIGtub3cgdGhhdAo+Pj4gbGViX2NvcnJ1cHRlZFsx
XSBpcyB6ZXJvLiAgSXQncyBvbmx5IHNldCB3aGVuIGxlYlsxXSBpcyBub24tTlVMTC4KPj4+Cj4+
Cj4+IEhpIERhbi4gVGhlIGxlYl9jb3JydXB0ZWQgYXJyYXkgaXMgaW5pdGlhbGl6ZWQgYXMgJzEn
IGluIGxpbmUgMzY5Ogo+PiAzNjkgICAgICAgICBpbnQgbGViX2NvcnJ1cHRlZFtVQklfTEFZT1VU
X1ZPTFVNRV9FQlNdID0gezEsIDF9Owo+Pgo+PiBJZiBsZWJbMV0gaXMgTlVMTC4gdGhlIGxlYl9j
b3JydXB0ZWRbMV0gaXMgbm9uLXplcm8sIHRoZW4gdGhlIGZ1bmN0aW9uIHdpbGwKPj4gZXhpdCBp
biBmb2xsb3dpbmcgYnJhbmNoOgo+PiAgIDQ1NCAgICAgICAgICAgICAgICAgaWYgKGxlYl9jb3Jy
dXB0ZWRbMV0pIHsKPj4gICA0NTUgICAgICAgICAgICAgICAgICAgICAgICAgLyogQm90aCBMRUIg
MCBhbmQgTEVCIDEgYXJlIGNvcnJ1cHRlZCAqLwo+PiAgIDQ1NiAgICAgICAgICAgICAgICAgICAg
ICAgICB1YmlfZXJyKHViaSwgImJvdGggdm9sdW1lIHRhYmxlcyBhcmUKPj4gY29ycnVwdGVkIik7
Cj4+ICAgNDU3ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZyZWU7Cj4+ICAgNDU4
ICAgICAgICAgICAgICAgICB9Cj4+Cj4+IEFtIGkgbWlzc2luZyBzb21ldGhpbmc/Cj4+Cj4gCj4g
U29ycnksIHllYWguICBJIGdvdCBtaXhlZCB1cCB3aXRoIHRoZSBsaW5lIGJlZm9yZS4gIEkgYXBv
bG9naXplIGZvciB0aGF0Lgo+IAoKSXQncyBva2F577yMYW55b25lIGNvdWxkIHJlYWQgdGhlIGNv
ZGUgd3JvbmcuIDotKQo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgo+IAo+IC4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
