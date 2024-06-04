Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC36AC25B75
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 01:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=io3Xw+GFsXB+BCgjBM7Fa+XTx8JD9ohpUd7gAIrpfJg=; b=yJ/FTu2sohLSTAUm25W7PHakWS
	9Ue1Iif2D7IUiEbO4TVJAvlmqW8WSCvHvZqMtgBDE5uVWemVGus0+WBLkLJtsnUwASRd780IzGaro
	KPRoq+l7xm4okPpOC9F3Sodd+ykRRxEz+wo12wHZqNOtU++3ZwV05Bn6YPovXNj8ssTqWKCfteXqF
	fbQ/DuyYYtV0Eun4jv9kBHqdDzNQyMBuI5tCt7OFk4K95roc1OmUOp8Hp0ZK5CKOf1KPzpEzd8AjT
	aSV2nUNRgHwqorgGnmbunAha3/+JVIhW+XGnKTFXMqHXQ7XO7RIzCzCcdNJbyvDx5AH4+gF0e2YN9
	43d4x/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJB9-00000000qDm-1HfK;
	Tue, 04 Jun 2024 01:41:35 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJB5-00000000qDI-0zJH
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 01:41:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VtYB03FfYz1S8yc;
	Tue,  4 Jun 2024 09:37:28 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 18A33180069;
	Tue,  4 Jun 2024 09:41:23 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 09:41:22 +0800
Subject: Re: Lots of fastmap writes
To: Rickard x Andersson <rickaran@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <rickard314.andersson@gmail.com>
References: <f59e5ae3-8193-43f3-604c-9a846d6e8ead@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <95a9872f-77b2-e9a0-f5dc-a376964bc93e@huawei.com>
Date: Tue, 4 Jun 2024 09:41:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f59e5ae3-8193-43f3-604c-9a846d6e8ead@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_184131_639639_7FAC972E 
X-CRM114-Status: GOOD (  16.70  )
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

5ZyoIDIwMjQvNi8zIDE2OjU1LCBSaWNrYXJkIHggQW5kZXJzc29uIOWGmemBkzoKPiBIaSwKPiAK
PiBJIGhhdmUgYSBzeXN0ZW0gcnVubmluZyBMaW51eCA1LjEwIHdoaWNoIGxvZ3MgcXVpdGUgYSBs
b3QgdG8gYSBkYXRhYmFzZS4gCj4gVGhlIHN5c3RlbSBoYXMgYmVlbiBydW5uaW5nIE9LIHNpbmNl
IGJlZm9yZSBDaHJpc3RtYXMgYnV0IG5vdyBpdCB1c3VhbGx5IAo+IGZhaWxzIGFmdGVyIGEgZmV3
IGhvdXJzIHdpdGggZXJyb3JzIGxpa2UgdGhlc2U6Cj4gCj4gTWF5wqAgNiAyMjoyOTo1OCAxNzIu
MjYuMjAzLjkwwqDCoCB3YXJuaW5nIHViaTIgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIAo+
IC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDU4IGJ5dGVzIGZyb20gUEVCIDE6MjMwODcy
LCByZWFkIG9ubHkgNTggCj4gYnl0ZXMsIHJldHJ5Cj4gTWF5wqAgNyAwMDoxMTowOCAxNzIuMjYu
MjAzLjkwwqDCoCB3YXJuaW5nIHViaTIgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIAo+IC03
NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDU4IGJ5dGVzIGZyb20gUEVCIDQwOjIzOTc1Miwg
cmVhZCBvbmx5IDU4IAo+IGJ5dGVzLCByZXRyeQo+IE1hecKgIDcgMDA6MTE6MDggMTcyLjI2LjIw
My45MMKgwqAgZXJywqDCoMKgwqAgdWJpMiBlcnJvcjogdWJpX2lvX3JlYWQ6IGVycm9yIAo+IC03
NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDU4IGJ5dGVzIGZyb20gUEVCIDQwOjIzOTc1Miwg
cmVhZCA1OCBieXRlcwo+IAo+IEZhc3RtYXAgaXMgdXNlZCBvbiB0aGlzIHN5c3RlbS4gVGhlIEVD
QyBlcnJvcnMgYXJlIHVzdWFsbHkgaW4gdGhlIAo+IGZhc3RtYXAgYXJlYSwgZXJhc2UgYmxvY2tz
IDAtIDYzLgo+IAo+IFdoZW4gbG9va2luZyBtb3JlIGNsb3NlbHkgYXQgdGhlIGVyYXNlIGNvdW50
ZXJzIHRoZXkgbG9vayBzb21ldGhpbmcgbGlrZSAKPiB0aGlzOgo+IAo+IDAgLSA2MzogMjk2MDAK
PiA2NCAtIDIwNDM6IDIyMDAKClRyeSB0aGlzIHNlcmllcyBvZiBwYXRjaGVzIApodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMzA4MTIwODAwMDUuMzE2MjEyNS0yLWNoZW5nemhp
aGFvMUBodWF3ZWkuY29tL1QvCj4gCj4gSXQgc2VlbXMgbGlrZSAzMCAlIG9mIHRoZSB3cml0ZXMg
YXJlIHdyaXRlcyB0byB0aGUgZmFzdG1hcCBhcmVhLiBBbnkgCj4gaWRlYXMgb2Ygd2hhdCBjYW4g
Y2F1c2UgdGhpcyBtYW55IHdyaXRlcyB0byB0aGUgZmFzdG1hcCBhcmVhPyBIZWF2eSBsb2FkPwo+
IAo+IEFueSBpZGVhcyBhcmUgd2VsY29tZS4KPiAKPiBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVm
YWN0dXJlciBJRDogMHg5OCwgQ2hpcCBJRDogMHhkYwo+IG5hbmQ6IFRvc2hpYmEgVEM1OE5WRzJT
MEggNEcgMy4zViA4LWJpdAo+IG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMjU2IEtp
QiwgcGFnZSBzaXplOiA0MDk2LCBPT0Igc2l6ZTogMjU2Cj4gbmFuZDogMiBjaGlwcyBkZXRlY3Rl
ZAo+IAo+IFVCSUZTICh1YmkyOjApOiBNb3VudGluZyBpbiBhdXRoZW50aWNhdGVkIG1vZGUKPiBV
QklGUyAodWJpMjowKTogYmFja2dyb3VuZCB0aHJlYWQgInViaWZzX2JndDJfMCIgc3RhcnRlZCwg
UElEIDE4Nwo+IFVCSUZTICh1YmkyOjApOiBVQklGUzogbW91bnRlZCBVQkkgZGV2aWNlIDIsIHZv
bHVtZSAwLCBuYW1lICJkYXRhX3ZvbHVtZSIKPiBVQklGUyAodWJpMjowKTogTEVCIHNpemU6IDI1
Mzk1MiBieXRlcyAoMjQ4IEtpQiksIG1pbi4vbWF4LiBJL08gdW5pdCAKPiBzaXplczogNDA5NiBi
eXRlcy80MDk2IGJ5dGVzCj4gVUJJRlMgKHViaTI6MCk6IEZTIHNpemU6IDUwNTExMDUyOCBieXRl
cyAoNDgxIE1pQiwgMTk4OSBMRUJzKSwgam91cm5hbCAKPiBzaXplIDI1Mzk1MjAwIGJ5dGVzICgy
NCBNaUIsIDEwMCBMRUJzKQo+IFVCSUZTICh1YmkyOjApOiByZXNlcnZlZCBmb3Igcm9vdDogNDY3
NjU3NSBieXRlcyAoNDU2NiBLaUIpCj4gVUJJRlMgKHViaTI6MCk6IG1lZGlhIGZvcm1hdDogdzUv
cjAgKGxhdGVzdCBpcyB3NS9yMCksIFVVSUQgCj4gOTkwQTQ2MEQtQTU1RS00QjU4LUFDQUQtMDFG
RUJDN0FGODM5LCBzbWFsbCBMUFQgbW9kZWwKPiAKPiB1YmkyOiBkZWZhdWx0IGZhc3RtYXAgcG9v
bCBzaXplOiAxMDAKPiB1YmkyOiBkZWZhdWx0IGZhc3RtYXAgV0wgcG9vbCBzaXplOiA1MAo+IHVi
aTI6IGF0dGFjaGluZyBtdGQ1Cj4gdWJpMjogYXR0YWNoZWQgYnkgZmFzdG1hcAo+IHViaTI6IGZh
c3RtYXAgcG9vbCBzaXplOiAxMDAKPiB1YmkyOiBmYXN0bWFwIFdMIHBvb2wgc2l6ZTogNTAKPiB1
YmkyOiBhdHRhY2hlZCBtdGQ1IChuYW1lICJkYXRhIiwgc2l6ZSA1MTIgTWlCKQo+IHViaTI6IFBF
QiBzaXplOiAyNjIxNDQgYnl0ZXMgKDI1NiBLaUIpLCBMRUIgc2l6ZTogMjUzOTUyIGJ5dGVzCj4g
dWJpMjogbWluLi9tYXguIEkvTyB1bml0IHNpemVzOiA0MDk2LzQwOTYsIHN1Yi1wYWdlIHNpemUg
NDA5Ngo+IHViaTI6IFZJRCBoZWFkZXIgb2Zmc2V0OiA0MDk2IChhbGlnbmVkIDQwOTYpLCBkYXRh
IG9mZnNldDogODE5Mgo+IHViaTI6IGdvb2QgUEVCczogMjA0MCwgYmFkIFBFQnM6IDgsIGNvcnJ1
cHRlZCBQRUJzOiAwCj4gdWJpMjogdXNlciB2b2x1bWU6IDEsIGludGVybmFsIHZvbHVtZXM6IDEs
IG1heC4gdm9sdW1lcyBjb3VudDogMTI4Cj4gdWJpMjogbWF4L21lYW4gZXJhc2UgY291bnRlcjog
Mjk2ODUvMzEwNywgV0wgdGhyZXNob2xkOiA0MDk2LCBpbWFnZSAKPiBzZXF1ZW5jZSBudW1iZXI6
IDQwNjAyODAyMDkKPiB1YmkyOiBhdmFpbGFibGUgUEVCczogMCwgdG90YWwgcmVzZXJ2ZWQgUEVC
czogMjA0MCwgUEVCcyByZXNlcnZlZCBmb3IgCj4gYmFkIFBFQiBoYW5kbGluZzogMzIKPiB1Ymky
OiBiYWNrZ3JvdW5kIHRocmVhZCAidWJpX2JndDJkIiBzdGFydGVkLCBQSUQgMTg2Cj4gCj4gQmVz
dCByZWdhcmRzLAo+IFJpY2thcmQgQW5kZXJzc29uCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCj4gLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
