Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3422FD7879C
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Dec 2025 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hG3Kov/G+lG2mJT4FXRAPDNrm3nSYENUp39nxa8puNI=; b=vtBharMGjLy9XE
	VCQrM8CsFwk7Pq+hDHdNB1oahgFPt6r7CSf79x9JagrA0KtyGGJMFrebuOPzAciLovR7yRbSbY8ex
	1JSLaUIsJ4rAiHMEhMpYQEXg5BC2nec85JR7TmYxSVZkDfei08ybUQtT+jYKRB+zI1wdMxUmT1FxM
	xdCcrjDASZ0UCdxJqFOttPRveDz2CL4KslfiAHwsYeeWQk5keXBuNaE4mydJiLUIQNgXwQXTElUhn
	tokZaPcJXWXEff5P9b20GB++wUIvnNrw5yNzA9VEJdfCwatGn2DCGk44Z6xTleyEUAoxk8kCk857C
	mLb0p6pHdQqRONySyerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWe3B-0000000Ah9V-1D8L;
	Fri, 19 Dec 2025 17:13:57 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWe35-0000000Ah7E-0rUp
	for linux-mtd@lists.infradead.org;
	Fri, 19 Dec 2025 17:13:56 +0000
X-QQ-mid: esmtpgz14t1766164375tca03f23a
X-QQ-Originating-IP: 1NThptYv0cdjx87UuVbG5BmE8Z4pYgEZ69+woiMOAWQ=
Received: from [192.168.0.160] ( [120.40.108.137])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 20 Dec 2025 01:12:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17256322654305126495
EX-QQ-RecipientCnt: 11
Message-ID: <4AB2F6CA8EF1ED90+cd685c52-a4c2-492d-9445-b081d4d857f7@radxa.com>
Date: Sat, 20 Dec 2025 01:12:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: devices: Add Qualcomm SCM storage driver
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, Junhao Xie <bigfoot@radxa.com>
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
 <b14c51a0-7e87-4eb2-ae52-caf90f1bf545@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <b14c51a0-7e87-4eb2-ae52-caf90f1bf545@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NJvWNRsNVoV4A8qnmFYQ7s1K9vZ+WQmXfw1K/qCNOa+0U9TzfMSefAa4
	/Z7dGGr5ocjTUyc+mgM0Hi2rAqzpoYo7ozH+VHd3ZdrAMUGqgi92VQAA6Ln/dxiiL/mPo5v
	IyFe/uqgAjJ7zQRGU49EJEfUTFRFv7JG9cQl+UOxo8dVdU3GDJMe/2mhcB9E1rInu+sRDo4
	knXcJVIiVCUCH+H2dNXjkAieVNcR5fRZKPu5gtqQPKsJIwTIpcqHAXwG+ux2/aUBqclq2X2
	7wuWozCi8xGy0wmHu884QK1VQ5bQTeZDkboe8CzBO9q4z4YjUGNpCyoLgS7pjVipQ6P730R
	twyhBllSlyYdR9NXGhh+u6MAWYNs0GzkRKWFDywBuBrynAsOVjuJNuFUUXzgtlczewp1uA1
	6HRz+Qv6BaK3woBuJ8DE4MA67bJFhzCdKPVVJ+KUYrEqF+AbBlSsGPgCYkqi1w+HjgPwNjt
	K0S5CZ/Kr0vzLPRboHHKNmvLaTYNjQ9pAYZ19yfdgNSMTYckZ+Px19LvrtS+Nkv/nUQcjsm
	F/iZhvcrBPGY9jKUcBMCU7j2slH7JH6lixeg+Ef/ysk3scwwvYpVIZ79ulzW82+VbVaxhMP
	gArp4wFJHgS8j4O7NbdFmLs+P95GjmwLvrZ3BaLXC+WTwIEFegX/TqR51FHirb/PdyOgXE4
	eH3YiP0CWmo6K5Z2wBv1kphBfHp1UrhmpG+ZCF5mKmEId10KmNwDbBrtLOpNSLZ1C2kt51I
	2I7wWTazFkPTo7Jadg0B3HsxtNNHcjFZAgkt4LuasjT3FKFZoPiTbN12ms42R6epg4fjXWe
	LGE4EWGT/p1ZvRcWRvNZd4lrxI8cEebmDXjD3P2W3Ryw4LSwRwfmflEo9BSdhLNA5jXzfhv
	LxJbx2aqqT11Dtl0hgnLcBU3xy/royoBv2sb4qSdHLOpyz8Pe+4HWKLGgikyW5NBSy4kTfB
	BKcbBJ0cDMjq02OUNu+B9uB+pmpbaqcDhU907VHwFWzybVcl+nyxP0aoMlfyu+Iov1wk=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_091352_038381_231D38B5 
X-CRM114-Status: GOOD (  15.51  )
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

T24gMjAyNS8xMi8xOSAyMDowNSwgS29ucmFkIER5YmNpbyB3cm90ZToKPiBPbiAxMi8xOC8yNSA3
OjAyIFBNLCBKdW5oYW8gWGllIHdyb3RlOgo+PiBBZGQgTVREIGRyaXZlciBmb3IgYWNjZXNzaW5n
IHN0b3JhZ2UgZGV2aWNlcyBtYW5hZ2VkIGJ5IFF1YWxjb21tJ3MKPj4gVHJ1c3Rab25lIGZpcm13
YXJlLiBPbiBzb21lIHBsYXRmb3JtcywgQklPUy9maXJtd2FyZSBzdG9yYWdlICh0eXBpY2FsbHkK
Pj4gU1BJIE5PUiBmbGFzaCkgaXMgbm90IGRpcmVjdGx5IGFjY2Vzc2libGUgZnJvbSB0aGUgbm9u
LXNlY3VyZSB3b3JsZCBhbmQKPj4gYWxsIG9wZXJhdGlvbnMgbXVzdCBnbyB0aHJvdWdoIFNDTSAo
U2VjdXJlIENoYW5uZWwgTWFuYWdlcikgY2FsbHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bmhh
byBYaWUgPGJpZ2Zvb3RAcmFkeGEuY29tPgo+PiBUZXN0ZWQtYnk6IFhpbGluIFd1IDxzb3Bob25A
cmFkeGEuY29tPgo+PiAtLS0KPiBbLi4uXQo+Cj4+ICtzdHJ1Y3QgcWNvbV9zY21fc3RvcmFnZSB7
Cj4+ICsJc3RydWN0IGRldmljZSAqZGV2Owo+PiArCXN0cnVjdCBtdXRleCBsb2NrOwkvKiBQcm90
ZWN0cyBTQ00gc3RvcmFnZSBvcGVyYXRpb25zICovCj4+ICsJc3RydWN0IG10ZF9pbmZvIG10ZDsK
Pj4gKwlzdHJ1Y3QgcWNvbV9zY21fc3RvcmFnZV9pbmZvIGluZm87Cj4+ICsJc2l6ZV90IGJ1ZmZl
cl9zaXplOwo+PiArCXU4ICpidWZmZXI7Cj4+ICt9Owo+PiArCj4+ICtzdGF0aWMgaW50IHFjb21f
c2NtX3N0b3JhZ2VfZXJhc2Uoc3RydWN0IG10ZF9pbmZvICptdGQsCj4+ICsJCQkJICBzdHJ1Y3Qg
ZXJhc2VfaW5mbyAqaW5zdHIpCj4+ICt7Cj4+ICsJc3RydWN0IHFjb21fc2NtX3N0b3JhZ2UgKmhv
c3QgPQo+PiArCQljb250YWluZXJfb2YobXRkLCBzdHJ1Y3QgcWNvbV9zY21fc3RvcmFnZSwgbXRk
KTsKPj4gKwo+PiArCWlmIChpbnN0ci0+YWRkciAlIGhvc3QtPmluZm8uYmxvY2tfc2l6ZSB8fAo+
PiArCSAgICBpbnN0ci0+bGVuICUgaG9zdC0+aW5mby5ibG9ja19zaXplKQo+IFdoaWxlIGl0J3Mg
dGhlIHNhbWUgdmFsdWUsIGl0IHNlZW1zIGxpa2UgbXRkLT5lcmFzZXNpemUgd291bGQgYmUKPiAi
aWRpb21hdGljIiBoZXJlCgpJIHdpbGwgY2hhbmdlIHRvIHVzZSBob3N0LT5tdGQuZXJhc2VzaXpl
IGhlcmUuCgo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiArCWd1YXJkKG11dGV4KSgmaG9z
dC0+bG9jayk7Cj4+ICsKPj4gKwlyZXR1cm4gcWNvbV9zY21fc3RvcmFnZV9zZW5kX2NtZChRQ09N
X1NDTV9TVE9SQUdFX1NQSU5PUiwKPj4gKwkJCQkJIFFDT01fU0NNX1NUT1JBR0VfRVJBU0UsCj4+
ICsJCQkJCSBpbnN0ci0+YWRkciAvIGhvc3QtPmluZm8uYmxvY2tfc2l6ZSwKPj4gKwkJCQkJIDAs
IGluc3RyLT5sZW4pOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IHFjb21fc2NtX3N0b3JhZ2Vf
cmVhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPj4gKwkJCQkgbG9mZl90IGZyb20sIHNpemVfdCBs
ZW4sCj4+ICsJCQkJIHNpemVfdCAqcmV0bGVuLCB1X2NoYXIgKmJ1ZikKPj4gK3sKPj4gKwlzdHJ1
Y3QgcWNvbV9zY21fc3RvcmFnZSAqaG9zdCA9Cj4+ICsJCWNvbnRhaW5lcl9vZihtdGQsIHN0cnVj
dCBxY29tX3NjbV9zdG9yYWdlLCBtdGQpOwo+IEZlZWwgZnJlZSB0byB1bndyYXAgdGhpcyBsaW5l
CgpJIHdpbGwgdW53cmFwIGl0IHRvIGEgc2luZ2xlIGxpbmUuCgo+PiArCXNpemVfdCBibG9ja19z
aXplID0gaG9zdC0+aW5mby5ibG9ja19zaXplOwo+PiArCWxvZmZfdCBibG9ja19zdGFydCwgYmxv
Y2tfb2ZmLCBsYmE7Cj4+ICsJc2l6ZV90IGNodW5rLCB0b19yZWFkOwo+PiArCWludCByZXQgPSAw
Owo+IFRoaXMgaW5pdGlhbGl6YXRpb24gc2VlbXMgdW5uZWNlc3NhcnkKClllcywgSSB3aWxsIHJl
bW92ZSB0aGlzIHVubmVjZXNzYXJ5IGluaXRpYWxpemF0aW9uLgoKPiBbLi4uXQo+PiArc3RhdGlj
IGludCBxY29tX3NjbV9zdG9yYWdlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4+ICt7Cj4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPj4gKwlzdHJ1Y3Qg
cWNvbV9zY21fc3RvcmFnZSAqaG9zdDsKPj4gKwlpbnQgcmV0Owo+PiArCj4+ICsJaG9zdCA9IGRl
dm1fa3phbGxvYyhkZXYsIHNpemVvZigqaG9zdCksIEdGUF9LRVJORUwpOwo+PiArCWlmICghaG9z
dCkKPj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4+ICsKPj4gKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShw
ZGV2LCBob3N0KTsKPj4gKwlob3N0LT5kZXYgPSBkZXY7Cj4+ICsKPj4gKwlyZXQgPSBkZXZtX211
dGV4X2luaXQoZGV2LCAmaG9zdC0+bG9jayk7Cj4+ICsJaWYgKHJldCkKPj4gKwkJcmV0dXJuIHJl
dDsKPj4gKwo+PiArCWhvc3QtPmJ1ZmZlcl9zaXplID0gU1pfMjU2SzsKPiBTaG91bGQgdGhpcyBq
dXN0IGJlID0gaG9zdC0+aW5mby0+cGFnZV9zaXplPwoKVGhlIHZhbHVlIG9mIHBhZ2Vfc2l6ZSBp
cyBzbWFsbGVyIHRoYW4gd2hhdCB3ZSB3YW50IGZvcgpidWZmZXJpbmcgU0NNIHRyYW5zZmVycy4g
VGhlIGJ1ZmZlciBpcyBpbnRlbmRlZCBmb3IgYmF0Y2hpbmcKbGFyZ2VyIG9wZXJhdGlvbnMsIHNv
IGEgbGFyZ2VyIGZpeGVkIHNpemUgaXMgdXNlZCBoZXJlLgoKc3RydWN0IHFjb21fc2NtX3N0b3Jh
Z2VfaW5mbzoKwqAgdG90YWxfYmxvY2tzID0gODE5MgrCoCBibG9ja19zaXplID0gNDA5NgrCoCBw
YWdlX3NpemUgPSAyNTYKwqAgbnVtX3BoeXNpY2FsID0gMArCoCBtYW51ZmFjdHVyZXJfaWQgPSAw
CsKgIHNlcmlhbF9udW0gPSAxNjYzMjE1CsKgIGZ3X3ZlcnNpb24gPcKgCsKgIG1lbW9yeV90eXBl
ID0gTk9SCgo+IFsuLi5dCj4KPj4gKwlkZXZfaW5mbyhkZXYsICJzY20gc3RvcmFnZSAweCVsbHgg
cmVnaXN0ZXJlZCB3aXRoIHNpemUgJWxsdSBieXRlc1xuIiwKPj4gKwkJIGhvc3QtPmluZm8uc2Vy
aWFsX251bSwgaG9zdC0+bXRkLnNpemUpOwo+IGRldl9kYmcoKT8KCkkgd2lsbCBjaGFuZ2UgdG8g
dXNlIGRldl9kYmcuCgo+IEtvbnJhZAo+CgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcsIEkgd2ls
bCBpbmNvcnBvcmF0ZSB0aGVzZSBjaGFuZ2VzIGluIHYyLgoKQmVzdCByZWdhcmRzLApKdW5oYW8g
WGllCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
