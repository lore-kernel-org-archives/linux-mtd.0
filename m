Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B561AC021BE
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2025 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7UIL7hEvCAlvM4nq4QhGZIhyEnhXBIqeKa0xd7XvbA=; b=PksRBirNG+IMbRZQnkIEh9F/a7
	DoYjNQuu09L04SBf97+3GFukM/bkEDdtaI4QCHD9jfOzsAjQfUj6s5QqrKu/dBCOLT8q9QgpOOs35
	CZ8fZ4JWfP7D7qDPuVnRksxNFsGhZWPB8jpR0Gtyiswxncy9W4jCTfjgvggORcFW3uB4iadKfEaPy
	rcYMtaJjSIpi7jaL4p/rXx0jJ4OFRU6TOv1L41OxdthxDpJlnXcA86FuaAbaqqhXKLKAvkU1koNUQ
	rNrdmmSg1NLx1JbsniQkUdDABwS7u9G193nRnsiu7V5seN5WlC+caI3Ng8LTwhGJw+2gSeqFNqLQW
	v0hsC6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXqm-00000006Vb2-0Q36;
	Thu, 27 Feb 2025 06:58:28 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXqi-00000006Vad-3lns
	for linux-mtd@lists.infradead.org;
	Thu, 27 Feb 2025 06:58:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Z3MVx1xn3z1GBwM;
	Thu, 27 Feb 2025 14:53:29 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F2E6140132;
	Thu, 27 Feb 2025 14:58:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 27 Feb 2025 14:58:14 +0800
Subject: Re: [PATCH v4 mtd-utils 3/4] configure.ac: Add a check for execinfo
 and backtrace
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <Ross.Burton@arm.com>
CC: Fabio Estevam <festevam@gmail.com>, "david.oberhollenzer@sigma-star.at"
	<david.oberhollenzer@sigma-star.at>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
References: <20250219130244.2119582-1-festevam@gmail.com>
 <20250219130244.2119582-3-festevam@gmail.com>
 <DF926CA1-3E9E-4823-A3BB-EFC15511B46F@arm.com>
 <CAMKF1sqvWfsuvvTosGekvL50nfjauNFJLRBuqiFd_sp-08GxuQ@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ee3c75c7-bf51-9fc2-4435-f904ae95037c@huawei.com>
Date: Thu, 27 Feb 2025 14:58:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqvWfsuvvTosGekvL50nfjauNFJLRBuqiFd_sp-08GxuQ@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_225825_305174_DACC8417 
X-CRM114-Status: GOOD (  19.44  )
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

5ZyoIDIwMjUvMi8yNyA0OjEzLCBLaGVtIFJhaiDlhpnpgZM6Cj4gT24gV2VkLCBGZWIgMjYsIDIw
MjUgYXQgMTA6MjPigK9BTSBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6
Cj4+Cj4+IE9uIDE5IEZlYiAyMDI1LCBhdCAxMzowMiwgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPiB3cm90ZToKPj4+Cj4+PiBtdXNsIHJlbGllcyBvbiBhbiBleHRlcm5hbCBleGVj
aW5mbyBsaWJyYXJ5IHRvIHByb3ZpZGUgYmFja3RyYWNlCj4+PiBmdW5jdGlvbmFsaXR5LiBJZiBt
dXNsIGNhbm5vdCBsaW5rIHRvIGxpYmV4ZWNpbmZvLCB0aGUgZm9sbG93aW5nIGxpbmsKPj4+IGVy
cm9yIGhhcHBlbnM6Cj4+Pgo+Pj4gRml4IHRoZSBwcm9ibGVtIGJ5IGNoZWNraW5nIGZvciBiYWNr
dHJhY2Ugc3VwcG9ydCBpbiBsaWJjIGZpcnN0IGFuZCBpZiBub3QKPj4+IGZvdW5kLCB0aGVuIGNo
ZWNrIGZvciBiYWNrdHJhY2Ugc3VwcG9ydCBpbiB0aGUgZXh0ZXJuYWwgbGliZXhlY2luZm8uCj4+
Cj4+IElmIHRoaXMgaXMgdGhlIHJpZ2h0IHNvbHV0aW9uLCBpdOKAmXMgbm90IGNvbXBsZXRlLgo+
Pgo+PiBtdGQtdXRpbHMgYWxyZWFkeSBjaGVja3MgZm9yIHRoZSBwcmVzZW5jZSBvZiBleGVjaW5m
by5oIGFuZCB1c2VzIHRoYXQgd2hlbiBjcmVhdGluZyBsaWIvbGlibWlzc2luZy5hLCB3aGljaCBp
ZiBleGVjaW5mby5oIGlzbuKAmXQgcHJlc2VudCB3aWxsIGNvbnRhaW4gYSBzdHViIGJhY2t0cmFj
ZSgpIGltcGxlbWVudGF0aW9uIHRoYXQgc2ltcGx5IHJldHVybnMgMC4gIFRoZSB0ZXN0IHN1aXRl
IGFscmVhZHkgdXNlcyB0aGlzIHNvIGl0IGNhbiBidWlsZCBvbiBzeXN0ZW1zIHdpdGhvdXQgbXVz
bCwgYnV0IHByZXN1bWFibHkgbm9ib2R5IHRlc3RlZCBtdGQtdXRpbHMgb24gbXVzbCBhZnRlciAi
dWJpZnMtdXRpbHM6IEFkZCBpbXBsZW1lbnRhdGlvbnMgZm9yIGxpbnV4IGtlcm5lbCBwcmludGlu
ZyBmdW5jdGlvbnPigJ0gbGFuZGVkLCB3aGljaCBhZGRlZCBtb3JlIHVzZXJzIG9mIGJhY2t0cmFj
ZSgpLgo+Pgo+PiBJIHRoaW5rIGVpdGhlciBtdGQtdXRpbHMgc2hvdWxkIGhhcmQtZGVwZW5kIG9u
IF9zb21ldGhpbmdfIHByb3ZpZGluZyBiYWNrdHJhY2UoKSwgYmUgaXQgdGhlIGxpYmMgb3IgYSBk
cm9wLWluIGxpYnJhcnksIG9yIGl0IHNob3VsZCB1c2UgYmFja3RyYWNlKCkgaWYgcHJlc2VudCBh
bmQgZ3JhY2VmdWxseSBmYWxsYmFjayBvdGhlcndpc2UgKGFzIGl04oCZcyBhIGNvbnZlbmllbmNl
IGZlYXR1cmUpLiAgTm90IGJvdGgsIHdoaWNoIGlzIHdoYXQgdGhpcyBwYXRjaCBhY2hpZXZlcy4K
Pj4KClRoYXQgc291bmRzIHBsYXVzaWJsZSwgdGhhdCdzIHBvc3NpYmx5IHdoYXQgY29tbWl0IAoz
NTE2YjhiNzU1OGE2OWRmZCgiQWRkIGxpYm1pc3NpbmciKSB3YW50ZWQgdG8gZG8uCj4+IEnigJls
bCBzZW5kIGFuIGFsdGVybmF0aXZlIHBhdGNoIGluIGEgbW9tZW50IHdoaWNoIHVzZXMgbGlibWlz
c2luZy5hIGluc3RlYWQgb2YgcmVseWluZyBvbiBhbiBleHRlcm5hbCBsaWJleGVjaW5mby4KPj4K
PiAKPiBJIHRoaW5rIGxvb2tpbmcgZm9yIGxpYmV4ZWNpbmZvIGlzIHBlcmhhcHMgZmluZSwgaXRz
IHRoYXQgd2hlbgo+IGJhY2t0cmFjZSBpcyBub3QgZm91bmQgaW4gbGliYyBhbmQgaW4gbGliZXhl
Y2luZm8sIGl0IHNob3VsZCBzdGlsbAo+IHdvcmsgYnkgZmFsbGluZyBiYWNrIHRvIHN0dWIuCj4g
CgpIaSwgS2hlbS4gSU1IT++8jG1heWJlIGNvcHlpbmcgJ2V4ZWNpbmZvLmgnIGludG8gbXVzbCBp
cyBhIGhhY2sgd2F5LCB0aGVuIAp1c2VycyBjb3VsZCBtb2RpZnkgbXRkLXV0aWxzKGVnLiBsaW5r
IGV4dGVybmFsIGxpYmV4ZWNpbmZvKSBhY2NvcmRpbmcgdG8gCnRoZSBzcGVjaWZpYyBjb21waWxl
ciwgYnV0IHRoYXQncyBub3QgYSBjb21tb24gd2F5IGZvciBhbGwgY29tcGlsZXJzLiAKV2hhdCBp
ZiB0aGUgbGlicmFyeSBjb250YWlucyAnYmFja3RyYWNlJyBmdW5jdGlvbiBpcyBub3QgbmFtZWQg
YXMgCidsaWJleGVjaW5mbyc/Cj4+IE5vdGUgdGhhdCB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIGlz
IGdvb2QsIHRoaXMgaXMgdGhlIG9ubHkgY2hhbmdlIEkgaGF2ZSBjb21tZW50cyBvbi4KPj4KPj4g
Um9zcwo+PiBJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQg
YW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVn
ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0
byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBj
b3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuCj4gLgo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
