Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D83E8B39A
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 04:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPncT42ZFzglTDyJm+mo7HlVFy1qHDPGhXbJXgOa/wc=; b=VU/UR8eMhsJLg6cWiGBmMN4Xyb
	K5ID+P08E2xcKUHuBXDAmK3J/Zom//2bhIcVbvaFvNc8lpP4fuEDTpxgDrZ62khe/odAjh1AgrVuC
	sB0Tfz8eGiskMBY3WdfMlmc6guABm1mMKM7b+p0mkRTXJ5ZlR0h2AduovQuuM/PwGpdeIGvZ97SIm
	4xwUkQpZ1SD76XFkcnb6MAZD4ccKlDrQCKCcd7JOiNAOSni6nkwwE9pD66xSgImBxPuxDvr9wD0qs
	6Ky5aonHzPGd6lYGZUXcvvXwpIV4y0pq/I4/hnkl+/5++AOcJJaaHWYAnUjVh0HkcXPJCkFda8XcS
	9mHBrFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnUuR-00000007ugv-2Z8u;
	Wed, 04 Feb 2026 04:54:35 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnUuN-00000007ufq-0JFf
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 04:54:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3GmyHO2lHU8wFu2UWyNUQVrs9xRyQvS7L3TFyuiJ3n0=;
	b=1kQyXgl417q5eLbBHShQp5ZLG0S8/s7ZNqi39zwKMG4D87n//A6qevlKIm0ujoOPmuKYzQ0mv
	SmoPe7h07plKJmnrBOvLMxxLWHc42+RmEl4Sj6H57Pb1FiNm4v2KFAxm+k/O0O3/NqB9tZuJMvi
	KA1mbQKnvB1Gx2CbMzwvCxk=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4f5SZ05xnHz1cyPh;
	Wed,  4 Feb 2026 12:49:28 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 8EB8840565;
	Wed,  4 Feb 2026 12:54:02 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Feb 2026 12:54:02 +0800
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
To: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
 <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
Date: Wed, 4 Feb 2026 12:54:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_205432_500057_0281AA03 
X-CRM114-Status: GOOD (  22.26  )
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

5ZyoIDIwMjYvMi8zIDE3OjEyLCBUb21hcyBBbHZhcmV6IFZhbm9saSDlhpnpgZM6Cj4+IEhpLAo+
PiBXaGF0IGlzIHRoZSB0eXBlIG9mIHZvbHVtZSB1YmkxOjAsIHJvIG9yIHJ3Pwo+IAo+IHJvb3RA
a21jZW50Mjp+IyB1YmluZm8gLWQgMSAtTiBjZmcKPiBWb2x1bWUgSUQ6ICAgMCAob24gdWJpMSkK
PiBUeXBlOiAgICAgICAgZHluYW1pYwo+IEFsaWdubWVudDogICAxCj4gU2l6ZTogICAgICAgIDEw
NTggTEVCcyAoMTM0MzQwNjA4IGJ5dGVzLCAxMjguMSBNaUIpCj4gU3RhdGU6ICAgICAgIE9LCj4g
TmFtZTogICAgICAgIGNmZwo+IENoYXJhY3RlciBkZXZpY2UgbWFqb3IvbWlub3I6IDI0NjoxCj4g
Cj4+IFlvdSBjb3VsZCBkdW1wIHRoZSBtdGQgaW1hZ2UgZm9yICd1YmkxJyBieSB0aGUgY29tbWFu
ZCAnZGQgaWY9L2Rldi9tdGQxMAo+PiBvZj1tdGRfaW1hZ2UgYnM9MU0nLCBhbmQgc2VuZCB0aGUg
ZmlsZSAnbXRkX2ltYWdlJyB0byB1cyBieSBlbWFpbCwgbWF5YmUKPj4gd2UgY291bGQgZ2V0IG1v
cmUgaW5mb3JtYXRpb24gZnJvbSB0aGUgaW1hZ2UuCj4gCj4gSSBzdGFydGVkIHNvbWUgY29uc3Vs
dGF0aW9uIHdpdGggdGhlIGN5YmVyc2VjdXJpdHkgZGVwYXJ0bWVudC4gVW5mb3J0dW5hdGVseSwK
PiB0aGUgbmFuZCBpbWFnZSBjb250YWlucyBvdXIgZnVsbCBhcHBsaWNhdGlvbiBzb2Z0d2FyZSBh
bmQgdGhpcmQgcGFydGllcycKPiBwcm9wcmlldGFyeSBzb2Z0d2FyZSBzbyBpdCBtaWdodCBub3Qg
YmUgcG9zc2libGUuCj4gCj4gQXJlIHRoZXJlIGFueSBhbmFseXNpcyB0b29scyB5b3UnZCByZWNv
bW1lbmQgbG9va2luZyBpbnRvPwoKVHJ5ICdmc2NrLnViaWZzIC1nMyAteSAvZGV2L3ViaTBfMScu
CkF0dGVudGlvbiwgZnNjayB3aWxsIGNoYW5nZSB0aGUgdWJpZnMgaW1hZ2UgY29udGVudCwgeW91
IGNvdWxkIGR1bXAgdGhlIAptdGQgaW1hZ2UgdG8gYW5vdGhlciBkZXZpY2Uob3IgdmlydHVhbCBt
YWNoaW5lKSBhbmQgcnVuIGZzY2sgb24gaXQuCmh0dHBzOi8vd3d3LmxpbnV4LW10ZC5pbmZyYWRl
YWQub3JnLz9wPW10ZC11dGlscy5naXQ7YT1zdW1tYXJ5Cgo+IAo+PiBCVFcsIGFyZSB0aGVyZSBh
bnkgYWJub3JtYWwgaGlzdG9yeSBsb2dzIGFib3V0IHViaTEgYmVmb3JlIHRoZSBlcnJvciBtZXNz
YWdlPwo+IAo+IE5vdCByZWFsbHksIGluIHRoZSBhcHBsaWNhdGlvbiB3aGVyZSB0aGUgZXJyb3Ig
aGFwcGVucywgd2l0aCBrZXJuZWwgNi4xMiwKPiBldmVyeXRoaW5nIGxvb2tzIGdvb2QgdW50aWwg
dGhlIHBhbmljIGhhcHBlbnMuCj4gCj4gV2UgYWxzbyBoYXZlICJrbm93bi1nb29kIHN0YWJsZSBh
cHBsaWNhdGlvbiIgdGhhdCBib290cyB3aGVuIG5vIG90aGVyCj4gYXBwbGljYXRpb24gZXhpc3Rz
IChoZXJlIEkgcmVmZXIgdG8ga2VybmVsICsgcm9vdGZzIGFzIGFwcGxpY2F0aW9uKSwgd2hpY2gK
PiBydW5zIGtlcm5lbCA0LjE0LjIwIGFuZCB0aGVyZSBJIHNlZSB0aGlzIChiZWZvcmUgNi4xMi54
IGhhcyBldmVyIHJhbiBvbiB0aGUKPiBib2FyZCk6Cj4gCj4gVUJJRlM6IHBhcnNlIHN5bmMKPiBV
QklGUyAodWJpMTowKTogYmFja2dyb3VuZCB0aHJlYWQgInViaWZzX2JndDFfMCIgc3RhcnRlZCwg
UElEIDEwNgo+IFVCSUZTICh1YmkxOjApOiByZWNvdmVyeSBuZWVkZWQKPiBVQklGUyAodWJpMTow
KTogcmVjb3ZlcnkgY29tcGxldGVkCj4gVUJJRlMgKHViaTE6MCk6IFVCSUZTOiBtb3VudGVkIFVC
SSBkZXZpY2UgMSwgdm9sdW1lIDAsIG5hbWUgImNmZyIKPiBVQklGUyAodWJpMTowKTogTEVCIHNp
emU6IDEyNjk3NiBieXRlcyAoMTI0IEtpQiksIG1pbi4vbWF4LiBJL08gdW5pdCBzaXplczoKPiAy
MDQ4IGJ5dGVzLzIwNDggYnl0ZXMKPiBVQklGUyAodWJpMTowKTogRlMgc2l6ZTogMTMyOTQzODcy
IGJ5dGVzICgxMjYgTWlCLCAxMDQ3IExFQnMpLCBqb3VybmFsIHNpemUKPiA2NjAyNzUyIGJ5dGVz
ICg2IE1pQiwgNTIgTEVCcykKPiBVQklGUyAodWJpMTowKTogcmVzZXJ2ZWQgZm9yIHJvb3Q6IDQ5
NTI2ODMgYnl0ZXMgKDQ4MzYgS2lCKQo+IFVCSUZTICh1YmkxOjApOiBtZWRpYSBmb3JtYXQ6IHc1
L3IwIChsYXRlc3QgaXMgdzUvcjApLCBVVUlECj4gREM3RUM5NjktMUY0RC00NjY5LTlEMzEtMTZD
NTdFQUI5NkRBLCBzbWFsbCBMUFQgbW9kZWwKPiAKPiBUaGUgcGFydCB3aGVyZSBpdCBzYXlzIHJl
Y292ZXJ5IG5lZWRlZC9jb21wbGV0ZWQgbG9va3Mgc3RyYW5nZSBidXQgaXQgZG9lcyBub3QKPiBj
b21wbGFpbiBhYm91dCBhbnkgZXJyb3JzIGFueXdheS4KClRoZSAncmVjb3ZlcnknIG1lc3NhZ2Ug
bWVhbnMgdGhhdCB1YmlmcyBoYXMgZXhwZXJpZW5jZWQgYW4gdW5jbGVhbiAKcmVib290LiBJdCBp
cyBhIG5vcm1hbCBtZXNzYWdlLgo+IAo+PiBUcnkgZm9sbG93aW5nIGNvbW1hbmRzPwo+PiBuYW5k
ZHVtcCAtbiAtbyAtZiBmbGFzaF9pbWFnZSAvZGV2L210ZFgKPj4gbmFuZHdyaXRlIC1vIC1uIC9k
ZXYvbXRkWSBmbGFzaF9pbWFnZQo+IAoKbmFuZGR1bXAgLW8gKC1uKSAtZiBmbGFzaF9pbWFnZSAv
ZGV2L210ZFgKZmxhc2hfZXJhc2VhbGwgL2Rldi9tdGQwCm5hbmR3cml0ZSAtbyAoLW4pIC9kZXYv
bXRkWSBmbGFzaF9pbWFnZQpvcgpkZCBvZj1mbGFzaF9pbWFnZSBpZj0vZGV2L210ZFggYnM9MU0K
Zmxhc2hfZXJhc2VhbGwgL2Rldi9tdGRZCmRkIGlmPWZsYXNoX2ltYWdlIG9mPS9kZXYvbXRkWSBi
cz0xTQoKPiBUaGlzIHJlc3VsdHMgaW4gYSBmbG9vZGluZyBvZiBFQ0MgZXJyb3JzIGxpa2UgdGhp
cyBvbmU6Cj4gdWJpMSBlcnJvcjogdWJpX2lvX3JlYWQ6IGVycm9yIC03NCAoRUNDIGVycm9yKSB3
aGlsZSByZWFkaW5nIDY0IGJ5dGVzIGZyb20gUEVCCj4gMjk6MCwgcmVhZCA2NCBieXRlcwo+IAo+
IEkgaGF2ZSB0byBlcmFzZSB0aGUgbmFuZCBmcm9tIHUtYm9vdCB0byByZWNvdmVyIGl0Lgo+IE5B
TkQgY2hpcHMgb24gYm90aCBib2FyZHMgYXJlIHRoZSBzYW1lLCBmcm9tIGJvb3QgbG9nczoKPiBu
YW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHgwMSwgQ2hpcCBJRDogMHhhYwo+
IG5hbmQ6IEFNRC9TcGFuc2lvbiBTMzRNUzA0RzIKPiBuYW5kOiA1MTIgTWlCLCBTTEMsIGVyYXNl
IHNpemU6IDEyOCBLaUIsIHBhZ2Ugc2l6ZTogMjA0OCwgT09CIHNpemU6IDEyOAo+IEJhZCBibG9j
ayB0YWJsZSBmb3VuZCBhdCBwYWdlIDI2MjA4MCwgdmVyc2lvbiAweDAxCj4gQmFkIGJsb2NrIHRh
YmxlIGZvdW5kIGF0IHBhZ2UgMjYyMDE2LCB2ZXJzaW9uIDB4MDEKPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gVG9tYXMgQWx2YXJleiBWYW5vbGkKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
