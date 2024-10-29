Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1445CD74941
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpoz1yt1VOkJ49wiTqvTCmOKifVSFCtmUCtn4GlPz68=; b=N3RkOf5M4UAPk0
	5gzBcC2G3fgKKrxbLYwbDxMaEqPMN2S2ZjkaRDkSJg+aW9Jsme5m+UWq08q4k4HLpuzidk5RhgXoR
	seBlL+0bnvvN4oIKD29yJvCoSfyV4LSG2Rq8RDeT262pHH9Ro3RN+gy7xNOkAOOeZ3OFhR859/Rsq
	SYHz6o+bb+Br/ukfqLePMFGWlgMUsZb4AiZ2R469Q6/PuaP4xQ1cJyUp8A2zrnMlDorvMgxznRd4F
	ahtx/A39iMI1vYcCpLBvzw9+2E8dGGP/UPPPA/+9AtK24n6jxHg2Fxb8eZugP0C7PMTHccEVnnAY6
	M11ELb9ZboOjalaBOKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tXJ-0000000FvSR-179f;
	Tue, 29 Oct 2024 21:13:57 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tXF-0000000FvRQ-3FXk
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 21:13:55 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 862932C0117;
	Wed, 30 Oct 2024 10:13:45 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730236425;
	bh=uo/toYeCSKCj5aGUF+L/LlnhwQQw9+cmfQ4mmMv8Q1I=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=2cFtcmxsG32Pmo7RUg3YMhwhCdv57h/SY+1qDwrgj6rFYfopLCKSst3P0Jp/Jxvkl
	 lqJ44aNYAph/lCy5f6mYmYxxMEIHiDuJOnLcHO2b1OmjS1uLo5/ETcOlUvYRacTJxl
	 sVLhLKh5XnUtFFIAVjIiGyv7bfxLeA+NyCJFKuqPJl4MbE4Fa9wQH2HumzxsW0kTlf
	 J5IhrZakAC9UZdl8oxy3sWr9qs1C+SWNJzgvWLThXYSszBkH9ye1wL2qlKuWwI16Kv
	 B+E8spDI0DJIZsWvVA6Mmi+NnYGHiva4oFaan14E5Ou4X5yYLD4LsCr2F4U/tqLMQV
	 K0FAEPgVxHHYw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B672150090000>; Wed, 30 Oct 2024 10:13:45 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4397013ED6B;
	Wed, 30 Oct 2024 10:13:45 +1300 (NZDT)
Message-ID: <94ffb58b-3242-4ab4-b09a-686116ced781@alliedtelesis.co.nz>
Date: Wed, 30 Oct 2024 10:13:45 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: ubifs_recover_master_node: failed to recover master node
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <826c4456-461c-424b-88de-a36e77fd7475@alliedtelesis.co.nz>
Content-Language: en-US
In-Reply-To: <826c4456-461c-424b-88de-a36e77fd7475@alliedtelesis.co.nz>
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67215009 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=ZsQRNL2YhwNOoF4Hqy8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_141354_318881_8C2E8DF9 
X-CRM114-Status: GOOD (  16.99  )
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

Ck9uIDI5LzEwLzI0IDEzOjM4LCBDaHJpcyBQYWNraGFtIHdyb3RlOgo+IChyZXNlbmQgYXMgcGxh
aW50ZXh0KQo+Cj4gSGksCj4KPiBJIHJlY2VudGx5IGFkZGVkIHN1cHBvcnQgZm9yIHRoZSBTUEkt
TkFORCBjb250cm9sbGVyIG9uIHRoZSBSVEw5MzAyQyAKPiBTb0NbMV0uIEkgZGlkIG1vc3Qgb2Yg
dGhlIHdvcmsgYWdhaW5zdCBMaW51eCA2LjExIGFuZCBpdCdzIHdvcmtpbmcgCj4gZmluZSB0aGVy
ZS4gSSByZWNlbnRseSByZWJhc2VkIGFnYWluc3QgdGhlIHRpcCBvZiBMaW51cydzIHRyZWUgCj4g
KDYuMTItcmM1KSBhbmQgZm91bmQgSSB3YXMgZ2V0dGluZyB1YmlmcyBlcnJvcnMgd2hlbiBtb3Vu
dGluZzoKPgo+IFvCoMKgwqAgMS4yNTUxOTFdIHNwaS1uYW5kIHNwaTEuMDogTWFjcm9uaXggU1BJ
IE5BTkQgd2FzIGZvdW5kLgo+IFvCoMKgwqAgMS4yNjEyODNdIHNwaS1uYW5kIHNwaTEuMDogMjU2
IE1pQiwgYmxvY2sgc2l6ZTogMTI4IEtpQiwgcGFnZSAKPiBzaXplOiAyMDQ4LCBPT0Igc2l6ZTog
NjQKPiBbwqDCoMKgIDEuMjcxMTM0XSAyIGZpeGVkLXBhcnRpdGlvbnMgcGFydGl0aW9ucyBmb3Vu
ZCBvbiBNVEQgZGV2aWNlIHNwaTEuMAo+IFvCoMKgwqAgMS4yNzgyNDddIENyZWF0aW5nIDIgTVRE
IHBhcnRpdGlvbnMgb24gInNwaTEuMCI6Cj4gW8KgwqDCoCAxLjI4MzYzMV0gMHgwMDAwMDAwMDAw
MDAtMHgwMDAwMGYwMDAwMDAgOiAidXNlciIKPiBbwqDCoCAyMC40ODExMDhdIDB4MDAwMDBmMDAw
MDAwLTB4MDAwMDEwMDAwMDAwIDogIlJlc2VydmVkIgo+IFvCoMKgIDcyLjI0MDM0N10gdWJpMDog
c2Nhbm5pbmcgaXMgZmluaXNoZWQKPiBbwqDCoCA3Mi4yNzA1NzddIHViaTA6IGF0dGFjaGVkIG10
ZDMgKG5hbWUgInVzZXIiLCBzaXplIDI0MCBNaUIpCj4gW8KgwqAgNzIuMjc2ODE1XSB1YmkwOiBQ
RUIgc2l6ZTogMTMxMDcyIGJ5dGVzICgxMjggS2lCKSwgTEVCIHNpemU6IAo+IDEyNjk3NiBieXRl
cwo+IFvCoMKgIDcyLjI4NDUzN10gdWJpMDogbWluLi9tYXguIEkvTyB1bml0IHNpemVzOiAyMDQ4
LzIwNDgsIHN1Yi1wYWdlIAo+IHNpemUgMjA0OAo+IFvCoMKgIDcyLjI5MjEzMl0gdWJpMDogVklE
IGhlYWRlciBvZmZzZXQ6IDIwNDggKGFsaWduZWQgMjA0OCksIGRhdGEgCj4gb2Zmc2V0OiA0MDk2
Cj4gW8KgwqAgNzIuMjk5ODg1XSB1YmkwOiBnb29kIFBFQnM6IDE5MjAsIGJhZCBQRUJzOiAwLCBj
b3JydXB0ZWQgUEVCczogMAo+IFvCoMKgIDcyLjMwNjY4OV0gdWJpMDogdXNlciB2b2x1bWU6IDEs
IGludGVybmFsIHZvbHVtZXM6IDEsIG1heC4gdm9sdW1lcyAKPiBjb3VudDogMTI4Cj4gW8KgwqAg
NzIuMzE0NzQ3XSB1YmkwOiBtYXgvbWVhbiBlcmFzZSBjb3VudGVyOiAxLzAsIFdMIHRocmVzaG9s
ZDogNDA5NiwgCj4gaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyOiAyNTI2NDIyMzAKPiBbwqDCoCA3Mi4z
MjQ4NTBdIHViaTA6IGF2YWlsYWJsZSBQRUJzOiAwLCB0b3RhbCByZXNlcnZlZCBQRUJzOiAxOTIw
LCAKPiBQRUJzIHJlc2VydmVkIGZvciBiYWQgUEVCIGhhbmRsaW5nOiA0MAo+IFvCoMKgIDcyLjM3
MDEyM10gdWJpMDogYmFja2dyb3VuZCB0aHJlYWQgInViaV9iZ3QwZCIgc3RhcnRlZCwgUElEIDE0
MQo+IFvCoMKgIDcyLjQ3MDc0MF0gVUJJRlMgKHViaTA6MCk6IE1vdW50aW5nIGluIHVuYXV0aGVu
dGljYXRlZCBtb2RlCj4gW8KgwqAgNzIuNDkwMjQ2XSBVQklGUyAodWJpMDowKTogYmFja2dyb3Vu
ZCB0aHJlYWQgInViaWZzX2JndDBfMCIgCj4gc3RhcnRlZCwgUElEIDE0NAo+IFvCoMKgIDcyLjUy
ODI3Ml0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMTQzKTogCj4gdWJpZnNfcmVjb3Zlcl9tYXN0
ZXJfbm9kZTogZmFpbGVkIHRvIHJlY292ZXIgbWFzdGVyIG5vZGUKPiBbwqDCoCA3Mi41NTAxMjJd
IFVCSUZTICh1YmkwOjApOiBiYWNrZ3JvdW5kIHRocmVhZCAidWJpZnNfYmd0MF8wIiBzdG9wcwo+
IFvCoMKgIDcyLjcxMDcyMF0gVUJJRlMgKHViaTA6MCk6IE1vdW50aW5nIGluIHVuYXV0aGVudGlj
YXRlZCBtb2RlCj4gW8KgwqAgNzIuNzE3NDQ3XSBVQklGUyAodWJpMDowKTogYmFja2dyb3VuZCB0
aHJlYWQgInViaWZzX2JndDBfMCIgCj4gc3RhcnRlZCwgUElEIDE0OQo+IFvCoMKgIDcyLjc3NzYw
Ml0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMTQ4KTogCj4gdWJpZnNfcmVjb3Zlcl9tYXN0ZXJf
bm9kZTogZmFpbGVkIHRvIHJlY292ZXIgbWFzdGVyIG5vZGUKPiBbwqDCoCA3Mi43ODc3OTJdIFVC
SUZTICh1YmkwOjApOiBiYWNrZ3JvdW5kIHRocmVhZCAidWJpZnNfYmd0MF8wIiBzdG9wcwo+Cj4g
RnVsbCBkbWVzZyBvdXRwdXQgaXMgYXRbMl0KPgo+IGdpdCBiaXNlY3QgbGVhZCBtZSB0byBjb21t
aXQgMTE4MTM4NTc4NjRmICgibXRkOiBzcGktbmFuZDogbWFjcm9uaXg6IAo+IENvbnRpbnVvdXMg
cmVhZCBzdXBwb3J0IikuIFJldmVydGluZyB0aGUgYmxhbWVkIGNvbW1pdCBmcm9tIDYuMTItcmM1
IAo+IHNlZW1zIHRvIGF2b2lkIHRoZSBwcm9ibGVtLiBUaGUgZmxhc2ggY2hpcCBvbiBteSBib2Fy
ZCBpcyBhIAo+IE1YMzBMRjJHMjhBRC1USS4gSSdtIG5vdCBzdXJlIGlmIHRoZXJlIGlzIGEgcHJv
YmxlbSB3aXRoIDExODEzODU3ODY0ZiAKPiBvciB3aXRoIG15IHNwaS1tZW0gZHJpdmVyIHRoYXQg
aXMgZXhwb3NlZCBhZnRlciBzdXBwb3J0IGZvciBjb250aW51b3VzIAo+IHJlYWQgaXMgZW5hYmxl
ZC4KPgpBIGJpdCBvZiBhbiB1cGRhdGUuIFRoZSB1YmlmcyBmYWlsdXJlIGlzIGZyb20gdGhlIGlz
X2VtcHR5KCkgY2hlY2sgaW4gCmdldF9tYXN0ZXJfbm9kZSgpLiBJdCBsb29rcyBsaWtlIHBvcnRp
b25zIG9mIHRoZSBMRUIgYXJlIDAgaW5zdGVhZCBvZiAKMHhmZi4gSSd2ZSBhbHNvIGZvdW5kIGlm
IEkgYXZvaWQgdXNlIHRoZSBub24tRE1BIHBhdGggaW4gbXkgZHJpdmVyIEkgCmRvbid0IGhhdmUg
c3VjaCBhIHByb2JsZW0uIEkgdGhpbmsgdGhlcmUgaXMgYXQgbGVhc3Qgb25lIHByb2JsZW0gaW4g
bXkgCmRyaXZlciBiZWNhdXNlIEkgZG9uJ3QgaGFuZGxlIERNQWluZyBtb3JlIHRoYW4gMHhmZmZm
IGJ5dGVzLgoKCj4gVGhhbmtzLAo+IENocmlzCj4KPiAtLSAKPgo+IFsxXSAtIAo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTAxNTIyNTQzNC4zOTcwMzYwLTEtY2hyaXMucGFja2hh
bUBhbGxpZWR0ZWxlc2lzLmNvLm56Lwo+IFsyXSAtIAo+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29t
L2NwYWNraGFtLWF0bG56LzY2YTA4NDMzNjJlOGY4ZWIyYzRmNWM3ZWQwMWM1ZWZlCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
